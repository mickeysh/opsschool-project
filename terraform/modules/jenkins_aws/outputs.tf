output "jenkins_master_server_public_ip" {
  value = "${join(",", aws_instance.jenkins_master.*.public_ip)}"
}

output "jenkins_slaves_server_public_ip" {
  value = "${join(",", aws_instance.jenkins_slaves.*.public_ip)}"
}
