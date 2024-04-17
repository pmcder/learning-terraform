#variable "instance_type" {
#  description = "Type of EC2 instance to provision"
#  default     = "t3.nano"
#}

variable "instance_types" {
  type = map(string)
  default = {
    "bootstrap"  = "i3.large"
    "worker"  = "t3a.xlarge"
    "master"   = "t3a.xlarge"
    "test" = "t3.nano"
  }
}

variable "instance_names" {
  type = list(string)
  default = ["Worker 1","Worker 2","Worker 3"]
}
