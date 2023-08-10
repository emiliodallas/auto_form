# auto_form

*AWS infrastructure with Terraform and Jenkins*

Simple AWS infrastructure using terraform and jenkins for automation.

Jenkins is hosted on one of the four web servers on EC2 and will update the infra as soons as there is a push to this respository.

It creates two MySQL databases on RDS (5Gb each) in two private subnets. The four EC2 instance use two public subnets and can access the databases and the internet, through a gateway.

The inbound and outbound rules are defined in the _securitygroup.tf_ file. 

The EC2 instances and the databases are hosted on two different availability zones to guarantee reliability. 

Also used SNS to notify the user (per e-mail) if any of the EC2 instances surpass 70% CPU usage. 

