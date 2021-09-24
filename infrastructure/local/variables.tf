variable "include_prometheus" {
    description = "Deploy prometheus for resource monitoring?"
    type = bool
    default = true
}
variable "include_postgres" {
    description = "Deploy postgres database (will use localhost otherwise)?"
    type = bool
    default = true
}
