#

# DO NOT DELETE THESE LINES!

#

# Your subnet ID is:

#

#     subnet-9e15f8f6

#

# Your security group ID is:

#

#     sg-dca200b4

#

# Your AMI ID is:

#

#     ami-74ee001b

#

# Your Identity is:

#

#     totaljobs-a87ff679a2f3e71d9181a67b7542122c

#

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "eu-central-1"
}

provider "aws" {
  #access_key = "AKIAJMR2WFA4GCAXVEAA"
  access_key = "${var.aws_access_key}"

  #secret_key = "FiHPBlBd7OdudJNSjaOj6BCI0CyKC6kFM5ImLYAl"
  secret_key = "${var.aws_secret_key}"

  #region     = "eu-central-1"
  region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count                  = "2"
  ami                    = "ami-74ee001b"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-9e15f8f6"
  vpc_security_group_ids = ["sg-dca200b4"]

  tags {
    Identity = "totaljobs-a87ff679a2f3e71d9181a67b7542122c"
    Foo      = "bar"
    Zip      = "zap"
  }
}

output "public_ip" {
  value = "${join(", ", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
  value = "${join(", ", aws_instance.web.*.public_dns)}"
}
