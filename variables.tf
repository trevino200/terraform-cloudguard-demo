variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.

Example: ~/.ssh/terraform.pub
DESCRIPTION
}

variable "key_name" {
  description = "Desired name of AWS key pair"
}
variable "aws_vpc_cidr" {
}
variable "aws_external1_subnet_cidr" {
}
variable "aws_external2_subnet_cidr" {
}
variable "aws_webserver1_subnet_cidr" {
}
variable "aws_webserver2_subnet_cidr" {
}
variable "my_user_data" {
}
variable "ubuntu_user_data" {
}
variable "externaldnshost" {
}
variable "r53zone" {
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-2"
}
variable "primary_az" {
  description = "primary AZ"
  default     = "ap-southeast-2a"
}
variable "secondary_az" {
  description = "secondary AZ"
  default     = "ap-southeast-2b"
}
# Check Point R80 BYOL
data "aws_ami" "chkp_ami" {
  most_recent      = true
  filter {
    name   = "name"
    values = ["Check Point vSEC BYOL R80.10-*"]
  }
  owners = ["679593333241"]
}
variable "aws_amis_vsec" {
  default = {
    ap-southeast-2 = "${data.aws_ami.chkp_ami.id}"
  }
}
# Ubuntu Image
data "aws_ami" "ubuntu_ami" {
  most_recent      = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}
variable "aws_amis_web" {
  default = {
    ap-southeast-2 = "${data.aws_ami.ubuntu_ami.id}"
  }
}



