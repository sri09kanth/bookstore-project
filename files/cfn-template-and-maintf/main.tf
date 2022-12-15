terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "template_file" "yamlfile" {
  template = file("${abspath(path.module)}/bookstore.yaml")
  vars = {
    key = var.key
  }
}

data "aws_cloudformation_export" "output" {
  
  name = "Bookstore"
  depends_on = [
    aws_cloudformation_stack.docker-compose
  ]

}

resource "aws_cloudformation_stack" "docker-compose" {
    template_body = data.template_file.yamlfile.rendered
    name = "bookstore"
    tags = {
      "Name" = "docker-bookstore-project"
    }
    on_failure = "ROLLBACK" 
}


output "public-ip" {
  value = data.aws_cloudformation_export.output.value
  
}