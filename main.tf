resource "aws_instance" "ec2-ebs-instance" {
	ami = var.ami
	instance_type = var.instance_type
	key_name = var.key_name
	associate_public_ip_address = true
        subnet_id = var.subnet_id
	vpc_security_group_ids = [aws_security_group.ec2_sg.id]

	tags = {

	Name = "ec2-ebs-instance"
}
}

resource "aws_ebs_volume" "ebs_volume" {
	availability_zone = "us-east-1a"
	size = 8
	type = "gp2"

	tags = {
	
	Name = "ebs volume for ec2"
}
}

resource "aws_security_group" "ec2_sg" {
	name = "ec2_sg"
	description = "Allow SSH & HTTP"
	vpc_id = var.vpc_id

ingress {
	description = "Allow SSH"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]

}

ingress {
        description = "Allow HTTP"
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
}
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 

}
}
