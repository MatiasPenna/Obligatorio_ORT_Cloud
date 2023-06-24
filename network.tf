# Crear una VPC
resource "aws_vpc" "vpc_obl" {
  cidr_block = "${var.cidr_block}0.0/16"
  tags = {
    Name = "vpc_obl"
  }
}

# Crear dos subnets privadas en la VPC
resource "aws_subnet" "subnet_obl_01" {
  vpc_id                  = aws_vpc.vpc_obl.id
  cidr_block              = "${var.cidr_block}1.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_obl_01"
  }
}

resource "aws_subnet" "subnet_obl_02" {
  vpc_id                  = aws_vpc.vpc_obl.id
  cidr_block              = "${var.cidr_block}2.0/24" 
  availability_zone       = "${var.region}b"  
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_obl_02"
  }
}

# Crear un Security Group en la VPC creada anteriormente
resource "aws_security_group" "sg_obl" {
  name        = "sg_obl"
  description = "SG para el obligatorio"

  vpc_id = aws_vpc.vpc_obl.id

   ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_obl"
  }
}

#Crea la route table

resource "aws_route_table" "rt_obl" {
  vpc_id = aws_vpc.vpc_obl.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_obl.id
  }
}

#Asociamos la route table a las subnets
resource "aws_route_table_association" "rt_association_subnet01_obl" {
  subnet_id = aws_subnet.subnet_obl_01.id
  route_table_id = aws_route_table.rt_obl.id
}

resource "aws_route_table_association" "rt_association_subnet02_obl" {
  subnet_id = aws_subnet.subnet_obl_02.id
  route_table_id = aws_route_table.rt_obl.id
}

# Creamos el Internet Gateway
resource "aws_internet_gateway" "ig_obl" {
  vpc_id = aws_vpc.vpc_obl.id

  tags = {
    Name = "ig_obl"
  }
}