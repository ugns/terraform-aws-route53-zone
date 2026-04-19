resource "aws_route53_zone" "this" {
  name          = var.domain_name
  comment       = var.comment
  force_destroy = false

  lifecycle {
    ignore_changes = [vpc]
  }
}

module "website" {
  source  = "cloudposse/s3-website/aws"
  version = "0.17.11"

  hostname           = format("www.%s", aws_route53_zone.this.name)
  encryption_enabled = true
  parent_zone_id     = aws_route53_zone.this.id
  context            = module.this.context
}

module "www-website" {
  source  = "cloudposse/s3-website/aws"
  version = "0.17.11"

  hostname                 = aws_route53_zone.this.name
  redirect_all_requests_to = module.website.hostname
  encryption_enabled       = true
  parent_zone_id           = aws_route53_zone.this.id
  context                  = module.this.context
}

module "caa_record" {
  source  = "UGNS/route53-caa/aws"
  version = "0.1.1"

  zone_id              = aws_route53_zone.this.id
  caa_issuers          = var.caa_issuers
  caa_report_recipient = local.caa_report_recipient
  context              = module.this.context
}

module "mta_sts" {
  source  = "ugns/route53-mta-sts/aws"
  version = "0.1.0"

  zone_id              = aws_route53_zone.this.id
  tls_report_recipient = local.tls_report_recipient
  mx_records           = var.mx_records
  sts_policy_mode      = var.mta_sts_mode
  additional_tags      = var.additional_tags
  context              = module.this.context
}

module "ses" {
  source  = "ugns/route53-ses/aws"
  version = "0.1.0"

  zone_id   = aws_route53_zone.this.id
  topic_arn = aws_sns_topic.sns.arn
  context   = module.this.context
}
