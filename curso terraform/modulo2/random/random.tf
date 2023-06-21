terraform {
    required_providers {
        random = {
        source = "hashicorp/random"
        version = "3.5.1"
        }
    }
}

resource "random_string" "random" {
    length = 15
    special = true
}