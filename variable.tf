variable "region" {
	type = string
	default = "us-east-1"
	
}

variable "ami" {
        type = string
        default = "ami-084568db4383264d4"           

}


variable "instance_type" {
        type = string
        default = "t2.micro" 

}

variable "key_name" {
        type = string
	default = "EC2-Multi-Env-TF"                                                           

}

variable "vpc_id" {
	type = string
	default = "vpc-08152430856eccab0"
}

variable "subnet_id" {
	type = string
	default = "subnet-00716f25b285ff2e1"
}
