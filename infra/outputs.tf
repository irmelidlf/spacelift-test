output "pet_name" {
  value = random_pet.name.id
}

output "port" {
  value = random_integer.port.result
}

output "message" {
  value = terraform_data.example.output.message
}
