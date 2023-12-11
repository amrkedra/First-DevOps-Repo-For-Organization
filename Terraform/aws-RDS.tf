provider "aws" {
  profile = "default"
}


resource "aws_db_instance" "RDS-instance" {
    identifier = "first-DB-instance"
    allocated_storage = 5
    db_name = "mydb"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t3.micro"
    username = "amrkedra"
    password = var.password
    parameter_group_name = "default.mysql15.7"
    skip_final_snapshot = true
    vpc_security_group_ids = var.vpc_security_group_ids
    publicly_accessible = true
  
}


output "endpoint" {
    value = aws_db_instance.RDS-instance.endpoint 
    description = "value"
    sensitive = false
    
  
}
output "db_name" {
    value = "aws_db_instance.RDS-instance.db_name - + is created"
  
}