variable "project" {
  type        = string
  description = "The project ID to create the application under. ~>NOTE: GCP only accepts project ID, not project number. If you are using number, you may get a 'Permission denied' error."
}

variable "database" {
  type        = string
  description = "The Firestore database id. Defaults to (default)."
  default     = "(default)"
}

variable "collection" {
  type        = string
  default     = "qa-envs"
  description = "The name of the collection to store QA environment info in."
}

variable "base_domain" {
  type        = string
  description = "The base domain to use for the QA environment urls. This will be combined with the entries in the `qa_environments` varible to create sub-domains in the form of `qa_environment.base_domain` (like `qa1.example.com`)"
}

variable "qa_environments" {
  type        = list(string)
  description = "The names of the QA environments. These must be in valid sub-domain format. Ex: [qa1, qa2, qa3]"
}
