variable "public_subnet_cidrs"{
    type = list(string)
    description = "Public Subnet CIDR values"
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

resource "aws_subnet" "public_subnets"{
    count = length(var.public_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.public_subnet_cidrs, count.index)

    tags = {
        Name = "Public Subnet ${count.index+1}"
    }
}