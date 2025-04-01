module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name                   = local.cluster_name
  cluster_version                = var.kubernetes-version
  cluster_endpoint_public_access = true
  enable_irsa                    = true
  enable_cluster_creator_admin_permissions = true

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  fargate_profiles = {
    default = {
      name = "fargate-profile"

      selectors = [
        {
          namespace = "default"  # All pods in this namespace will run on Fargate
        },
        {
          namespace = "kube-system"
          labels    = { k8s-app = "kube-dns" }  # Ensures CoreDNS runs on Fargate
        }
      ]
    }
  }

  tags = {
    cluster = "demo"
  }
}