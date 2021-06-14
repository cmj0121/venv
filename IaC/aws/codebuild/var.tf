variable "runtime" {
  type        = string
  description = "lambda runtime environment"
  default     = "python3.8"
}

variable "github" {
  description = "the setting of the GitHub"
  type        = object({
    project_name  = string
    location      = string
  })

  default = {
    project_name  = "demo-codebuild"
    location      = "https://github.com/cmj0121/venv.git"
  }
}

# vim: set tabstop=2 sw=2 expandtab:
# vim: set ft=terraform:
