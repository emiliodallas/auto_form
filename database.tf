
resource "aws_db_instance" "databasename" {
  count = 1
  engine = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = 5
  availability_zone = "us-east-1a"
  db_name = "database${count.index+1}"
  username = "admin"
  password = "password"
  apply_immediately         = true
  skip_final_snapshot       = true
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]

}


resource "aws_db_instance" "databasename_2" {
  count = 1
  engine = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = 5
  availability_zone = "us-east-1b"
  db_name = "database${count.index+1}"
  username = "admin"
  password = "password"
  apply_immediately         = true
  skip_final_snapshot       = true
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]

}