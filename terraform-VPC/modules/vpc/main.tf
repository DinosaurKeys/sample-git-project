#VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my_vpc"
  }
}

#2 Subnet

resource "aws_subnet" "my_subnets" {
  count  = length(var.my_subnet_cidr)
  vpc_id = aws_vpc.my_vpc.id
  # This is the CIDR block for the subnet.
  # The count.index is used to create multiple subnets based on the length of the my_subnet_cidr variable.  
  # Refer to the variables.tf file for more details.
  # The count.index will increment for each subnet created.
  cidr_block = var.my_subnet_cidr[count.index]
  # This is the availability zone for the subnet.
  availability_zone = data.aws_availability_zones.available.names[count.index]
  # This subnet maps public IP on launch
  map_public_ip_on_launch = true

  # Tags for the subnet incremented with count.index
  tags = {
    Name = var.my_subnet_name[count.index]
  }
}

#Internet Gateway

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_internet_gateway"
  }
}

#Route Table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    # This route allows outbound traffic to the internet.
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my_route_table"
  }
}


#Route Table Association

resource "aws_route_table_association" "my_route_table_association" {
  # This associates the route table with the subnets created above.
  count          = length(var.my_subnet_cidr)
  subnet_id      = aws_subnet.my_subnets[count.index].id
  route_table_id = aws_route_table.my_route_table.id
}
