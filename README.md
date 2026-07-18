# terraform-google-service-accounts

Terraform module that manages [Google Cloud](https://cloud.google.com/)
service accounts (`google_service_account`). It creates one or more accounts
from a map, optionally issues keys, and grants project-level roles.

## Usage

```hcl
module "service_accounts" {
  source = "github.com/cybercapybara/terraform-google-service-accounts"

  project_id = var.project_id

  accounts = {
    "ci" = {
      display_name = "CI deployer"
      create_key   = true
    }
  }

  project_roles = {
    "ci|roles/run.admin" = "roles/run.admin"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name            | Description                                              | Type          | Default | Required |
|-----------------|----------------------------------------------------------|---------------|---------|:--------:|
| `project_id`    | ID of the project in which to create the accounts.       | `string`      | n/a     |   yes    |
| `accounts`      | Service accounts keyed by account id.                    | `map(object)` | `{}`    |    no    |
| `project_roles` | Project roles keyed by `<account_id>\|<role>`.           | `map(string)` | `{}`    |    no    |

## Outputs

| Name           | Description                                       |
|----------------|---------------------------------------------------|
| `emails`       | Email addresses of the created accounts.          |
| `ids`          | Identifiers of the created accounts.              |
| `private_keys` | Base64 private keys for accounts with keys.       |

## License

[MIT](LICENSE)
