# Configure AWS Provider
provider "aws" {
  region = "${var.aws_region}"
}

# Run the cassandra modules
module "jenkins_aws" {
  source = "./modules/jenkins_aws"

  providers = {
    aws = "aws"
  }

  default_keypair_name = "Opsschool-1"  # Default EC2 pem key 
  jenkins_slaves       = "1"            # number of cassandra datacenters
  vpc_id               = "vpc-584d6e20" # AWS VPC 

  master_image = {
    "name"     = "jenkins-master"
    "tagowner" = "Opsschool"
    "tagname"  = "Jenkins-Master"
  }

  slave_image = {
    "name"     = "jenkins-slave"
    "tagowner" = "Opsschool"
    "tagname"  = "Jenkins-Slave"
  }
}

output "master_public_ip" {
  value = "${module.jenkins_aws.jenkins_master_server_public_ip}"
}

output "slaves_public_ip" {
  value = "${module.jenkins_aws.jenkins_slaves_server_public_ip}"
}
