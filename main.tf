
module "boundary-enterprise-worker-hvd" {
  source  = "./terraform-aws-boundary-enterprise-worker-hvd/"
  #source  = "hashicorp/boundary-enterprise-worker-hvd/aws"
  #version = "0.2.0"

  friendly_name_prefix = var.prefix
  vpc_id = var.vpc_id
  worker_subnet_ids = var.subnet_ids

  additional_package_names = ["jq", "unzip"]

  asg_max_size = 8

  boundary_version = "1.0.0+ent"
  boundary_worker_iam_role_name = var.worker_iam_role_name
  #boundary_dir_home = "/opt/boundary"
  # bsr_s3_bucket_arn = 

  cidr_allow_ingress_ec2_ssh = ["0.0.0.0/0"]
  common_tags = { app = "boundary", role = "worker"}

  create_boundary_worker_role = false

  custom_install_template = basename("${path.cwd}/templates/install-and-register.userdata")
  custom_install_template_params = {
      disable_vault_integration = var.disable_vault_integration,
      vault_url = var.vault_url,
      vault_aws_auth_path = var.vault_aws_auth_path,
      vault_auth_role_name = var.vault_auth_role_name,
      vault_secret_path = var.vault_secret_path,
      vault_namespace = var.vault_namespace,
      boundary_url = local.boundary_url,
      boundary_auth_method_id = var.boundary_auth_method_id,
      boundary_username = var.boundary_username,
      boundary_password = var.boundary_password,
      boundary_dir_home = var.boundary_dir_home,
      }

  ec2_allow_ssm = true
  # ec2_ami_id = 
  ec2_ssh_key_pair = var.keypair

  enable_session_recording = true
  hcp_boundary_cluster_id = var.hcp_boundary_cluster_id

  #worker_is_internal = true
  worker_is_internal = false
  worker_tags = {cloud = "aws", type = "egress", environment = "sandbox"}

  }

