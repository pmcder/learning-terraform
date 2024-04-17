#variable "instance_type" {
#  description = "Type of EC2 instance to provision"
#  default     = "t3.nano"
#}

variable "instance_types" {
  type = map(string)
  default = {
    "bootstrap"  = "t3.nano"
    "worker"  = "t3.nano"
    "master"   = "t3.nano"
  }
}

variable "instance_names" {
  type = list(string)
  default = ["Worker 1","Worker 2","Worker 3"]
}

variable "user_data_scripts" {
  type = map(string)
  default = {
    "bootstrap" = "#!/bin/bash\n# bootstrap..."
    "worker" = "#!/bin/bash\n# worker..."
    "master"  = "#!/bin/bash\n# master..."
  }
}
