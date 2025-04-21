variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]

}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = "true"
  }
}

variable "zone_id" {
  default = "Z03305811UUCA5JI657E2"

}

variable "domain_name" {
  default = "daws81.com"

}
