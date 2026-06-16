resource "aws_db_parameter_group" "mysql_pg" {
  name   = "terraform-mysql-pg"
  family = "mysql8.0"

  parameter {
    name  = "max_connections"
    value = "200"
  }

  tags = {
    Name = "terraform-mysql-pg"
  }
}