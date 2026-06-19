resource "aws_security_group" "rds_sg" {

  name        = "rds-security-group"
  description = "Allow MySQL Access"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {

  identifier = "terraform-mysql-db"

  apply_immediately = true

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  backup_retention_period = 1

  backup_window = "03:00-04:00"

  publicly_accessible = true

  multi_az = false

  deletion_protection = true

  skip_final_snapshot = false

  final_snapshot_identifier = "terraform-final-snapshot"

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]
  parameter_group_name = aws_db_parameter_group.mysql_pg.name
}

# resource "aws_db_instance" "read_replica" {

#   identifier          = "terraform-mysql-replica"
#   replicate_source_db = aws_db_instance.mysql.identifier

#   instance_class = "db.t3.micro"

#   publicly_accessible = true

#   skip_final_snapshot = true
# }

resource "aws_db_snapshot" "manual_snapshot" {
  db_instance_identifier = aws_db_instance.mysql.identifier
  db_snapshot_identifier = "employee-db-snapshot"
}