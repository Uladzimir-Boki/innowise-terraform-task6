terraform {
  backend "s3" {
    bucket = "trainee-project-uladzimir-boki-tfstate"
    key = "terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "trainee-uladzimir-boki-terraform-locks"
    encrypt = true
    profile = "trainee"
  }
}