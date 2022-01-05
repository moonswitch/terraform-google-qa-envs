resource "random_pet" "qa-env" {
  for_each = toset(var.qa_environments)

  keepers = {
    doc_id = each.key
  }
}

resource "google_firestore_document" "qa-env" {
  for_each = random_pet.qa-env

  project     = var.project
  database    = var.database
  collection  = var.collection
  document_id = each.value.keepers.doc_id
  fields = jsonencode({
    url    = "${each.key}.${var.base_domain}"
    in_use = false
    pr     = nil
  })
}