terraform {
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_string" "random" {
  length  = 5
  special = true
}

data "archive_file" "arquivozip" {
  # Configuration options
  type        = "zip"
  source_dir  = "data_backup"
  output_path = "${random_string}.zip"
}

output "arquivozip" {
  value = data.archive_file.arquivozip.output_size

}

output "random_string" {
  value = random_string.random.result
}