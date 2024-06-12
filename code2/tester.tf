terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0" 
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_lightsail_instance" "custom" {
  name              = "custom"
  availability_zone = "us-east-1b"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html"
key_pair_name  = "week2"
 tags = {
  name = "utrains devops"
   env  = "dev"
  }
  }


  output "my-public-ip" {
  value = aws_lightsail_instance.custom.public_ip_address   
  }

  output "my_username" {
  value = aws_lightsail_instance.custom.username  
  }

  output "my_keypair_name" {
  value = aws_lightsail_instance.custom.key_pair_name
  }
 
