data "terraform_remote_state" "prerequisites" {
  backend = "local"

  config = {
    path = "${path.module}/../../../../state/prerequisites.tfstate"
  }
}

module "admin" {
  # This makes absolutely no sense. I think there's a bug in terraform.
  source = "./../../../../../../../"

  admin_user_name = var.admin_user_name
  admin_group_name = var.admin_group_name

  admin_public_gpg_key = filebase64(var.admin_public_gpg_key_path)
}
