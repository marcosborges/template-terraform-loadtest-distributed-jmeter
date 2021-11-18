terraform {
  backend "s3" {
    #bucket = "tfstate-example-update-here" # Defined by pipeline 
    key    = "path/to/my/terraform.tfstate"
    region = "us-east-1"
  }
}