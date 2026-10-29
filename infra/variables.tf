# Change these values to produce a non-empty plan without touching any real infrastructure.

variable "message" {
  description = "Any string. Changing it replaces terraform_data.example."
  type        = string
  default     = "hello policy world 2!!"
}

variable "pet_length" {
  description = "Number of words in the random pet name. Changing it replaces random_pet.name."
  type        = number
  default     = 3
}
