data "aws_organizations_organization" "root_org" {}

output "account_ids" {
  value = data.aws_organizations_organization.root_org.roots[0].name
}