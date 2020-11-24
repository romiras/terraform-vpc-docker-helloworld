# terraform-vpc-docker-helloworld

VPC with 3 AZs with a public/private for each AZs

3 containers in private subnets behind a Application Load Balancer (ALB)

A Terraform configuration to launch a cluster of EC2 instances.  Each EC2 instance runs a single nginx Docker container (based on the latest official nginx Docker image).  One EC2 instance is launched in each availability zone of the current region (see Regions below).  The load balancer and EC2 instances are launched in a **custom VPC**, and use custom security groups.

Applying the configuration takes about 30 seconds (in US West Oregon), and another two or three minutes for the EC2 instances to become healthy and for the load balancer DNS record to propagate.

## Files
+ `provider.tf` - AWS Provider.
+ `ec2.tf` - Launches EC2 instances, during initialization each instance installs Docker and the nginx Docker image.
+ `alb.tf` - Launches application load balancer for EC2 instances running nginx.
+ `vars.tf` - Used by other files, sets default AWS region, calculates availability zones, etc.
+ `vpc.tf` - Launches VPC, subnets, route tables, etc.

## Command Line Examples

To setup provisioner
```
$ terraform init
```

To launch the EC2 demo cluster:
```
$ terraform plan -out=aws.tfplan
$ terraform apply aws.tfplan
```

To teardown the EC2 demo cluster:
```
$ terraform destroy
```

## Regions

The default AWS region is US East Virginia (us-east-1).  However, we can specify an alternate US region on the command line by passing in an extra `aws_region` argument. Legal values are `us-east-1`, `us-east-2`, `us-west-1`, and `us-west-2` (default).  For example:
```
$ terraform plan -out=aws.tfplan -var "aws_region=us-east-2"
$ terraform apply aws.tfplan
$ terraform destroy -var "aws_region=us-east-2"
```

## Public URL

Applying this Terraform configuration returns the load balancer's public URL on the last line of output.  This URL can be used to view the default nginx homepage.

## Credits

* Author @Einsteinish
