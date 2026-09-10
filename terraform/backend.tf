terraform {
  backend "s3" {
    bucket       = "assignment05-terraform-state"
    key          = "terraform/state.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
