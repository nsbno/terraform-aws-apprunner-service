variable "name_prefix" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "min_instances" {
  description = "Minimum number of instances"
  type        = number
  default     = 1
}

variable "max_instances" {
  description = "Maximum number of instances"
  type        = number
  default     = 2
}

variable "max_concurrency" {
  description = "Maximum number of concurrent requests. Exceeding this limit scales up the service"
  type        = number
  default     = 100
}

variable "application_port" {
  description = "The application port number"
  type        = number
  default     = 8000
}

variable "environment_variables" {
  description = "Environment variables that is passed to the container"
  type        = map(string)
  default     = {}
}

variable "ecr_arn" {
  description = "The ARN of the ECR containing the application images"
  type        = string
}

variable "ecr_url" {
  description = "The URL of the ECR containing the application images"
  type        = string
}

variable "image_tag" {
  description = "The tag of the application image to deploy"
  type        = string
  default     = "latest"
}

variable "auto_deployment" {
  description = "Automatically deploy when a new image version is pushed to ECR"
  type        = bool
  default     = false
}

variable "hosted_zone_name" {
  description = "The domain name of the hosted zone to set up the custom domain name in"
  type        = string
}

variable "host_name" {
  description = "The name of the application -- used together with name_prefix to name application-specific resources."
  type        = string
}
