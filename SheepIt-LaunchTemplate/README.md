This AWS CloudFormation template contains an EC2 Launch Template, that deploys EC2 instances with the [SheepIt](https://www.sheepit-renderfarm.com/) render farm [open source Java client](https://github.com/laurent-clouet/sheepit-client/) installed. You will need to have a SheepIt account and public key to pass into the `UserData` script, so that the SheepIt client can perform work and credit your account.

[PowerShell](https://github.com/PowerShell/PowerShell/) is open source and cross-platform. Install the appropriate package for your operating system (Linux, Mac, Windows).

## Usage

To deploy this AWS CloudFormation template:

1. Install the AWS PowerShell module and set up your AWS credentials
1. Create a VPC and Subnet with internet access (use Internet Gateway with public IP or NAT instance with private IPs)
1. Change the `SubnetId` in the `deploy.ps1` script
1. Change the `SHEEPIT_USERNAME` and `SHEEPIT_PUBLIC_KEY` in the `cloudformation.yml` file
1. Run `./deploy.ps1` in PowerShell
1. After the Launch Template has been deployed, create an Auto Scaling Group, using the Launch Template

🚨 If you want to deploy to a different AWS region (default is `us-west-2`, you must change the AMI ID in `cloudformation.yml`. 🚨

Notes
-----------

* You need a VPC with an Internet Gateway and a public SubnetId
* There is no IAM Role (EC2 Instance Profile) associated with the
* You need to specify an AWS Security Group Id to associate
* You need to update the `UserData` script to include your SheepIt account details
* There is no SSH public key associated with the EC2 instance (you can't log into it remotely)

