module "vpc_cni_irsa" {
    source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
    version = "~> 5.0"

    role_name_prefix = "VPC-CNI-IRSA"
    attach_vpc_cni-policy = true
    vpc_cni_enable_ipv4 = true

    oidc_providers = {
        main = {
            provider_arn = module.eks.oidc_provider_arn
            namespace_service_accounts = ["kube-system:aws-node"]
        }
    }
}