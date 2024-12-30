# EC2 Instance Setup Assignment

## Objective

Create an AWS EC2 instance with a Linux-based operating system that is accessible over the internet via SSH. This assignment tests your ability to use Terraform to provision cloud infrastructure.

---

## Requirements

### Inputs

To ensure the proper functioning of the validation automation, use only the specified variables below:

- **Region**: AWS region where the instance will be deployed.
- **KeyName**: Name of the SSH key to be installed on the instance.
- **InstanceType**: EC2 instance type (e.g., `t2.micro`).
- **SubnetId**: ID of the subnet where the instance will be deployed.
- **VpcId**: ID of the VPC where the instance will be deployed.

**Important**: Using additional variables may result in unintended behavior in our validation process. Adhere strictly to the provided variables.

---

### Outputs

Your Terraform configuration should produce the following outputs:

1. **InstanceId**: The unique ID of the created EC2 instance.
2. **PublicIpAddress**: The publicly accessible IP address of the instance.

---

## Instructions

1. **Write the Terraform Configuration**:
   - Use the provided input variables to create an EC2 instance.
   - Ensure that the instance has a Linux-based OS and is accessible via SSH.

2. **Test Your Configuration**:
   Run the following commands to test your configuration:

   ```bash
   # Reformat Terraform configuration to follow a consistent standard
   terraform fmt -check=true -diff

   # Initialize the Terraform working directory
   terraform init

   # Validate the Terraform configuration
   terraform validate

   # Create a Terraform execution plan
   terraform plan \
       -var region=<AWS_REGION> \
       -var key_name=<AWS_KEY_NAME> \
       -var instance_type=<AWS_INSTANCE_TYPE> \
       -var subnet_id=<AWS_SUBNET_ID> \
       -var vpc_id=<AWS_VPC_ID> \
       -out=plan.tfplan

   # Apply the Terraform configuration
   terraform apply -auto-approve \
       -var region=<AWS_REGION> \
       -var key_name=<AWS_KEY_NAME> \
       -var instance_type=<AWS_INSTANCE_TYPE> \
       -var subnet_id=<AWS_SUBNET_ID> \
       -var vpc_id=<AWS_VPC_ID>
   ```

3. **Verify Outputs**:
   Ensure the instance is created successfully, and the `InstanceId` and `PublicIpAddress` are available.

---

## Deliverables

Submit the following as part of your pull request:

1. **Terraform Configuration Files**:
   - Include `main.tf`, `variables.tf`, and `outputs.tf`.

2. **Outputs**:
   - Include the generated `InstanceId` and `PublicIpAddress` values.

3. **Verification Screenshot**:
   - Provide a screenshot showing the EC2 instance details in the AWS Management Console.

4. **PR Submission**:
   - Fork this repository.
   - Create a branch named `<your_github_username>`.
   - Submit a pull request to the main branch with your solution.

---

## Testing and Validation

Before submitting your work, ensure that you run the validation and testing steps described in the instructions.

- **Automated Validation**:
  Once you open a pull request, our automation will validate your submission. The validation will check:
  - Correctness of the Terraform configuration.
  - Adherence to the input and output requirements.

- **Manual Testing**:
  Use the AWS Management Console to verify the EC2 instance's accessibility via SSH and ensure it has the correct configuration.

---

## Grading Criteria

Your submission will be evaluated based on:

1. **Correctness**:
   - Does the Terraform configuration produce the desired EC2 instance?

2. **Code Quality**:
   - Is the code formatted, modular, and adherent to best practices?

3. **Documentation**:
   - Are the configuration files and PR properly documented?

4. **Validation**:
   - Has the configuration passed automated and manual validation checks?

---

## Notes

This assignment is designed to assess your ability to use Terraform for provisioning cloud resources. If you have any questions, please reach out to [devops@nurdsoft.co](mailto:devops@nurdsoft.co).

Good luck!