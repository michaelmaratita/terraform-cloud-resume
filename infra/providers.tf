terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }

  }
  cloud {
    organization = "mmaratita-org"

    workspaces {
      name = "michaelmaratita-github-actions"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

data "aws_caller_identity" "current" {}