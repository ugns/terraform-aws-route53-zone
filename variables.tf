variable "domain_name" {
  description = "Hosted Zone domain name"
  type        = string
}

variable "comment" {
  description = "Hosted Zone comment"
  type        = string
}

variable "caa_report_recipient" {
  description = "Recipient of CAA reports"
  type        = string
  default     = "hostmaster"
}

variable "caa_issuers" {
  description = "List of Certificate authories authorized to issue certificates"
  type        = list(string)
  default     = ["amazon.com"]
}

variable "tls_report_recipient" {
  description = "Recipient of SMTP TLS Reports"
  type        = string
  default     = "smtp-tls-reports"
}

variable "mx_records" {
  description = "List of MX Records"
  type        = list(string)
  default     = []
}

variable "mta_sts_mode" {
  description = "MTA Strict Transport Security mode, defaults to testing"
  type        = string
  default     = "testing"
}

variable "dmarc_version" {
  description = "SMTP DMARC Reporting version, defaults to DMARC1"
  type        = string
  default     = ""
}

variable "dmarc_mailbox" {
  description = "SMTP DMARC Reporting mailbox, defaults to noreply-dmarc-support"
  type        = string
  default     = ""
}

variable "dmarc_domain" {
  description = "SMTP DMARC Reporting domain, defaults to current domain"
  type        = string
  default     = ""
}

variable "dmarc_additional_rua" {
  description = "SMTP DMARC Reporting additional RUA"
  type        = string
  default     = ""
}

variable "additional_dkim" {
  description = "Additional DKIM TXT records to add"
  type        = map(string)
  default     = {}
}

locals {
  caa_report_recipient = can(regex("@", var.caa_report_recipient)) ? var.caa_report_recipient : "${var.caa_report_recipient}@${aws_route53_zone.this.name}"
  tls_report_recipient = can(regex("@", var.tls_report_recipient)) ? var.tls_report_recipient : "${var.tls_report_recipient}@${aws_route53_zone.this.name}"
}
