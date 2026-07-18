output "emails" {
  description = "Email addresses of the created service accounts, keyed by account id."
  value       = { for k, sa in google_service_account.this : k => sa.email }
}

output "ids" {
  description = "Fully-qualified identifiers of the created service accounts."
  value       = { for k, sa in google_service_account.this : k => sa.id }
}

output "private_keys" {
  description = "Base64-encoded private keys for accounts with create_key set."
  value       = { for k, key in google_service_account_key.this : k => key.private_key }
  sensitive   = true
}
