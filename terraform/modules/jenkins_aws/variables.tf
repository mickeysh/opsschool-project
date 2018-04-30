variable vpc_id {
  description = "AWS VPC id"
}

variable master_image {
  type        = "map"
  description = "Jenkins Master AWS AMI"

  default = {
    "name"     = "jenkins-master"
    "tagowner" = "Jenkins"
    "tagname"  = "Jenkins"
  }
}

variable slave_image {
  type        = "map"
  description = "Jenkins Slave AWS AMI"

  default = {
    "name"     = "jenkins-slave"
    "tagowner" = "Jenkins"
    "tagname"  = "Jenkins"
  }
}

variable user {
  description = "EC2 Linux instance user"
  default     = "ubuntu"
}

variable default_keypair_name {
  description = "Name of the KeyPair used for all nodes"
}

variable instance_type {
  description = "AWS Instance type"
  default     = "t2.medium"
}

variable jenkins_slaves {
  description = "Number of Jenkins slave servers"
  default     = "1"
}

variable owner {
  description = "Owner of Jenkins servers"
  default     = "Jenkins"
}
