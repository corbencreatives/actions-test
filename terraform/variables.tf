variable "environment" {
  description = "Name of the environment"
  type    = string
  default = "test"
}

variable "arm_subscription_id" {
  description = "Azure Subscription ID"
  type = string
  sensitive = true
}

# variable "kube_config" {
#   type        = string
#   description = "The kubernetes config"
# }
