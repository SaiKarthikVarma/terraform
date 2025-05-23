resource "aws_instance" "expense" {
    count = length(var.instance_names)

    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

#     tags = {
#     Name = var.instance_names[count.index]
#   }

    tags = merge(

        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )

  
}

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

   tags = merge(

        var.common_tags,
        {
            Name = "allow_sssh"
        }
    )


  
}
