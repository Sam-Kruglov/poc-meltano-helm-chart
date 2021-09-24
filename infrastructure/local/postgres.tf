resource "helm_release" "postgres" {
  name        = "postgresql"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "postgresql"
  namespace   = "meltano"
  version     = "10.5.3"
  wait        = true
  count = "${var.include_postgres == true ? 1 : 0}

  set {
    name  = "postgresqlDatabase"
    value = "postgres"
  }

  set {
    name  = "postgresqlUsername"
    value = "postgres"
  }

  set {
    name  = "postgresqlPassword"
    value = "postgres"
  }

  set {
    name = "persistence.storageClass"
    value = "standard"
  }

  set {
    name = "initdbScripts.init\\.sql"
    value = <<EOF
  CREATE DATABASE meltano OWNER postgres;
  CREATE DATABASE airflow OWNER postgres;
  EOF
  }

}