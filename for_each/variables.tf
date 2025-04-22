variable "instances" {
  type = map(any)
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }

}

variable "zone_id" {
  default = "Z03305811UUCA5JI657E2"

}

variable "domain_name" {
  default = "daws81.com"

}

