#require -Module AWS.Tools.CloudFormation

# Create a CloudFormation parameter
$SubnetId = [Amazon.CloudFormation.Model.Parameter]::new()
$SubnetId.ParameterKey = 'SubnetId'
$SubnetId.ParameterValue = 'subnet-06ade40b63ab5df35'

# Set input parameters for CloudFormation Stack creation API
$Stack = @{
    TemplateBody = Get-Content -Path $PSScriptRoot/cloudformation.yml -Raw
    StackName = 'sheepit-template'
    Region = 'us-west-2'
    Parameter = @(
        $SubnetId
    )
}

# Delete the CloudFormation stack if it exists
if (Get-CFNStack -StackName $Stack.StackName -ErrorAction Ignore) {
    Remove-CFNStack -StackName $Stack.StackName -Force
    Wait-CFNStack -StackName $Stack.StackName -Status DELETE_COMPLETE
}

# Deploy the CloudFormation stack
New-CFNStack @Stack