output "public_ip" {
    value = aws_instance.terraforminstance.public_ip
    sensitive = false
    description = "this is pulic ip of instance created"
  
}