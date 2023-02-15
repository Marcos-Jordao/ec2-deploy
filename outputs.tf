output "region" {
 description = "Deploy Region"
  value       = module.my-ec2.region
}

output "account_id" {
  value = module.my-ec2.account_id
}
