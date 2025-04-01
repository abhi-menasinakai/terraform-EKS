# terraform-EKS
EKS cluster creation using terraform
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Module EKS:
creates EKS cluster using official terraform EKS module.
This module also assigns dynamic name for the cluster using local variable.
uses variable to set kubernetes version & Allows access to EKS API from internet
Enables IAM Roles for Service Accounts (IRSA) for fine-grained AWS access control in Kubernetes.
Also gives terraform user full access to the cluster
Specifies that EKS cluster will use private subnet from VPC module
Ensure worker nodes will not be exposed to public internet. Also links EKS cluster to the VPC created by terraform module.
Enables fargate profile for EKS.

Module VPC:
Generates a unique name for the EKS cluster by appending a random string suffix.
Create a VPC using terraform VPC module with defined IP range.
Gets the availability zone from data.tf file. Also private and public subnets are defined.
Private subnets are used for EKS worker nodes and public subnets used for external services.
Enables a NAT Gateway to allow private subnet instances to access the internet without exposing them directly.
Allows instances to resolve hostnames to private IPs. Enables DNS resolution within the VPC.
TAGS Marks the VPC as a shared resource for Kubernetes clusters. Marks public subnets for Kubernetes Load Balancers.
Marks private subnets for Kubernetes Internal Load Balancers.

Providers:
Ensures Terraform v0.12 or newer is used.
Uses AWS provider to manage AWS infrastructure.
Uses Kubernetes provider to manage Kubernetes clusters.
Uses Random provider to generate random strings.
Uses Local provider to manage files locally.
Uses Null provider for executing commands.
Uses CloudInit provider for bootstrapping VM instances.

Security Groups:
defines an AWS Security Group and associated ingress and egress rules for Amazon Elastic Kubernetes Service (EKS) worker nodes.
It ties security group to the VPC being created. Allows inbound traffic from private IP ranges.
Allows outbound traffic to any IP address on the internet meaning the worker nodes can communicate with any external services.

Variables:
Defines variable which are used in EKS and VPC modules. such as AWS region, VPC CIDR and Kubernetes version.

Outputs:
Retrieves the cluster ID from the EKS module & security group ID attached to the EKS control plane. 
Also Outputs the AWS region where the EKS cluster is deployed and retrieves the OIDC provider ARN from EKS module.




