resource "google_service_account" "this" {
  for_each = var.accounts

  project      = var.project_id
  account_id   = each.key
  display_name = each.value.display_name
  description  = each.value.description
}

resource "google_service_account_key" "this" {
  for_each = { for k, v in var.accounts : k => v if v.create_key }

  service_account_id = google_service_account.this[each.key].name
}

resource "google_project_iam_member" "this" {
  for_each = var.project_roles

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.this[split("|", each.key)[0]].email}"
}
