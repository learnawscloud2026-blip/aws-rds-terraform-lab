# resource "aws_db_instance" "restore_db" {

#   identifier = "employee-db-restored"

#   snapshot_identifier = aws_db_snapshot.manual_snapshot.db_snapshot_identifier

#   instance_class = "db.t3.micro"

#   publicly_accessible = true

#   skip_final_snapshot = true
# }