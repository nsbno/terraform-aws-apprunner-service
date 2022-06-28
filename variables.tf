variable "name_prefix" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "cpu" {
  description = "The number of CPU units available to the application (1024|2048)"
  type        = string
  default     = "1024"
}

variable "memory" {
  description = "The amount of memory in MB available to the application (2048|3072|4096)"
  type        = string
  default     = "2048"
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

variable "domain_name" {
  description = "A map containing a domain and name of the associated hosted zone."
  type        = map(string)
}
