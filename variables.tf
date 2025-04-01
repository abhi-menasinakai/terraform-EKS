variable "aws-region" {
  description = "aws region for eks"
  default     = "us-east-1"
  type        = string
}

variable "kubernetes-version" {
  default     = "1.30"
  description = "Kubernetes cluster version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR block for k8 cluster"
}

