# No cloud credentials needed: everything here lives only in Terraform state.

resource "random_pet" "name" {
  length = var.pet_length
}

resource "random_integer" "port" {
  min = 1024
  max = 65535

  keepers = {
    pet = random_pet.name.id
  }
}

resource "terraform_data" "example" {
  triggers_replace = [var.message]

  input = {
    message = var.message
    pet     = random_pet.name.id
    port    = random_integer.port.result
  }
}
