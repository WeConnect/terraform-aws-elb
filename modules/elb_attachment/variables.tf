variable "create_elb" {
  description = "If set to false, module will not create ELB resources"
  default     = true
}

variable "number_of_instances" {
  description = "Number of instances ID to place in the ELB pool"
}

variable "elb" {
  description = "The name of the ELB"
}

variable "instances" {
  description = "List of instances ID to place in the ELB pool"
  type        = "list"
}
