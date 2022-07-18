module "servers" { 
  source = "./servers"
  servers = 1 
  instance_key = "Linux-AWS"
  vpc_cidr = "178.0.0.0/16"
  public_subnet_cidr = "178.0.10.0/24"
}

output "ip_address" {
  value = module.servers.ip_address
}