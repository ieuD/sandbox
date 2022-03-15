resource "aws_organizations_organizational_unit" "non-prod" {
  name = var.org_name
  parent_id = data.aws_organizations_organization.root_org.roots[0].id

  #parent_id = aws_organizations_organization.myorg.roots[0].id
  depends_on = [
    data.aws_organizations_organization.root_org
  ]
  tags = {
    env = var.environment
  }
}

resource "aws_organizations_account" "sre-aws" {
  name = var.org-account-name
  email = var.sre-aws-email

  iam_user_access_to_billing = "ALLOW" 

  parent_id = aws_organizations_organizational_unit.non-prod.id 

  tags = {
    env = var.environment
  }
}
