resource "aws_security_group" "all_worker_mgmt" {
  name        = "all_worker_management"
  description = "Security group for EKS worker nodes"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "all_worker_management"
  }
}

resource "aws_security_group_rule" "all_worker_mgmt_ingress" {
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "ingress"
  description       = "Allow inbound traffic from EKS"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

resource "aws_security_group_rule" "all_worker_mgmt_egress" {
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "egress"
  description       = "Allow all outbound traffic"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
