resource "random_pet" "qa-env" {
  for_each = toset(var.qa_environments)

  keepers = {
    qa_env = each.key
  }
}

resource "google_firestore_document" "qa-env" {
  for_each = random_pet.qa-env

  project     = var.project
  database    = var.database
  collection  = var.collection
  document_id = each.value.id
  fields = jsonencode({
    url    = { stringValue = "${each.value.keepers.qa_env}.${var.base_domain}" }
    in_use = { booleanValue = false }
    pr     = { stringValue = "" }
  })

  lifecycle {
    ignore_changes = [fields]
  }
}