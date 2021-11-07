module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.21"
  subnets         = module.vpc.private_subnets
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  vpc_id          = module.vpc.vpc_id
  fargate_subnets = [module.vpc.private_subnets[2]]

  tags = {
    Environment = "dev"
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t3a.small"
      additional_userdata           = "small instance"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.all_worker_mgmt.id]
    },
    {
      name                          = "worker-group-2"
      instance_type                 = "t3a.medium"
      additional_userdata           = "very medium instance"
      additional_security_group_ids = [aws_security_group.all_worker_mgmt.id]
      asg_desired_capacity          = 2
    },
     {
      name                          = "GDAL instance"
      instance_type                 = "t3a.large"
      additional_userdata           = "more cores is more fun"
      additional_security_group_ids = [aws_security_group.all_worker_mgmt.id]
      asg_desired_capacity          = 2
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
