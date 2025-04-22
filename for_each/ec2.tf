resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sssh"
  description = "Allow port number 22 for SSH access"


  #usually we allow evrything in egress(egress is nothing but the outgoing traffic)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_sssh"
  }


}


resource "aws_instance" "terraform" {
  for_each = var.instances #this variable is map
  #for_each will give a special variable with name "each"
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = each.key
  }


}
