variable "create_elb" {
  description = "If set to false, module will not create ELB resources"
  default     = true
}

variable "name" {
  description = "The name of the ELB"
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the ELB"
  type        = "list"
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the ELB"
  type        = "list"
}

variable "internal" {
  description = "If true, ELB will be an internal ELB"
}

variable "proxy_protocol" {
  description = "If true, proxy protocol will be utilized for provided instance ports."
  default     = false
}

variable "proxy_protocol_instance_ports" {
  type        = "list"
  description = "A list of instance ports to forward Proxy Protocol information."
  default     = []
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  default     = true
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  default     = 60
}

variable "connection_draining" {
  description = "Boolean to enable connection draining"
  default     = false
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  default     = 300
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

# Listener
variable "listener" {
  description = "A list of listener blocks"
  type        = "list"
}

# Access logs
variable "access_logs" {
  description = "An access logs block"
  type        = "list"
  default     = []
}

# Health check
variable "health_check" {
  description = "A health check block"
  type        = "list"
}

########################
# ELB Attachments Vars #
########################

variable "number_of_instances" {
  description = "Number of instances ID to place in the ELB pool"
}

variable "instances" {
  description = "List of instances ID to place in the ELB pool"
  type        = "list"
}

########################
#  S3 Access Logs Vars #
########################

variable s3_access_logs_bucket {
  type        = "string"
  description = "Name of the S3 bucket to put Access Logs. If not provided, this feature is disabled."
  default     = ""
}

variable s3_access_logs_prefix {
  type        = "string"
  description = "The S3 bucket prefix. Logs are stored in the root of the bucket if not configured."
  default     = ""
}

variable s3_access_logs_interval {
  type        = "string"
  description = "The publishing interval of logs in minutes."
  default     = "60"
}
