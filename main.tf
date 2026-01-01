module "eks"{
  source = "./modules/eks"
  env    = var.env
}