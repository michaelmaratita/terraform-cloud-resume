terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
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