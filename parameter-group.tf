resource "aws_db_parameter_group" "mysql_pg" {

  name   = "terraform-mysql-pg"
  family = "mysql8.0"

  parameter {
    name  = "max_connections"
    value = "200"
  }

  parameter {
    name  = "slow_query_log"
    value = "1"
  }

  parameter {
    name  = "long_query_time"
    value = "2"
  }

  parameter {
    name  = "log_queries_not_using_indexes"
    value = "1"
  }

  parameter {
    name  = "log_output"
    value = "FILE"
  }

  parameter {
    name  = "event_scheduler"
    value = "ON"
  }
  parameter {
    name  = "general_log"
    value = "1"
  }
}