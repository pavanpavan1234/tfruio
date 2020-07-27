provider "aws" {
  region = var.region
}

module "ec2" {
  source                       = "./ec2"
  ami_id                       = "ami-08f3d892de259504d"
  instance_type                = "t2.micro"
  key_name                     = "efx-tf-cvrs-ivr-dev-key"
  ec2_root_volume_size         = 8
  ec2_ebs_volume_size          = 22
  ec2_subnet                   = ["subnet-0e4da77531eb735d7", "subnet-073cab3eb604f50ee",]
  ec2_security_group           = "xxxxxxxxxxxx"
}