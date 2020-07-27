##Non Prod EC2 Instance
resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  key_name               = var.key_name
  subnet_id              = var.ec2_subnet
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.ec2_security_group]
  
   root_block_device = {
    volume_type = "gp2"
    volume_size = var.ec2_root_volume_size
   }

 ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = var.ec2_ebs_volume_size
    volume_type = "gp2"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
tags = merge(
    {
    Name        = "npe-ec2"
    }
)
}