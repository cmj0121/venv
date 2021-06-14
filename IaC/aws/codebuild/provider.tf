provider "aws" {
  region = "us-east-2"
}

provider "github" {
  token        = var.github.token
  organization = var.github.organization
  base_url     = var.github.base_url
}

# vim: set tabstop=2 sw=2 expandtab:
# vim: set ft=terraform:
