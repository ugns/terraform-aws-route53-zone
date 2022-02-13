<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_caa_record"></a> [caa\_record](#module\_caa\_record) | UGNS/route53-caa/aws | 0.1.0 |
| <a name="module_mta_sts"></a> [mta\_sts](#module\_mta\_sts) | ugns/route53-mta-sts/aws | 0.1.0 |
| <a name="module_ses"></a> [ses](#module\_ses) | ugns/route53-ses/aws | 0.1.0 |
| <a name="module_website"></a> [website](#module\_website) | cloudposse/s3-website/aws | 0.17.11 |
| <a name="module_www-website"></a> [www-website](#module\_www-website) | cloudposse/s3-website/aws | 0.17.11 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- markdownlint-restore -->
