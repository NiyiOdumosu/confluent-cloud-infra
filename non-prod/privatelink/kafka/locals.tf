locals {
  environment_id      = var.environment_id == null ? data.terraform_remote_state.environment.outputs.id : var.environment_id
  private_link_cloud  = var.private_link_cloud == null ? data.terraform_remote_state.private-link.outputs.cloud : var.private_link_cloud
  private_link_region = var.private_link_region == null ? data.terraform_remote_state.private-link.outputs.region : var.private_link_region
  private_link_id     = var.private_link_id == null ? data.terraform_remote_state.private-link.outputs.id : var.private_link_id
}