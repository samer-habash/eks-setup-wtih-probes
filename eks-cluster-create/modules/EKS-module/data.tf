data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "subnet_id_us_east_1a" {
  availability_zone = "us-east-1a"
  vpc_id = data.aws_vpc.default.id
}

data "aws_subnet" "subnet_id_us_east_1b" {
  availability_zone = "us-east-1b"
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  name = "default"
}

# Getting your external workstation ip in order to enter it in the eks sg
data "http" "workstation-external-ip" {
  url = "http://ipv4.icanhazip.com/"
}

