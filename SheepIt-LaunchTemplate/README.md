This AWS CloudFormation template contains an EC2 Launch Template, that deploys EC2 instances with the [SheepIt](https://www.sheepit-renderfarm.com/) render farm [open source Java client](https://github.com/laurent-clouet/sheepit-client/) installed. You will need to have a SheepIt account and public key to pass into the `UserData` script, so that the SheepIt client can perform work and credit your account.

Notes
-----------

* You need a VPC with an Internet Gateway and a public SubnetId
* There is no IAM Role (EC2 Instance Profile) associated with the
* You need to specify an AWS Security Group Id to associate
* You need to update the `UserData` script to include your SheepIt account details
* There is no SSH public key associated with the EC2 instance (you can't log into it remotely)

