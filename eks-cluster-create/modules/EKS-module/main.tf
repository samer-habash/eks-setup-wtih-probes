provider "aws" {
   profile    = "default"
   region     = var.region
}

provider "http" {}