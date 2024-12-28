# Networking and Hybrid Cloud VPN Assignment

## Objective

Design and implement a secure and scalable Site-to-Site VPN connection between an AWS Virtual Private Cloud (VPC) and an on-premises data center using **Terraform**.

---

## Requirements

### Inputs

To complete this assignment, use the following inputs:

- **Region**: AWS region where the resources will be deployed.
- **VpcId**: The ID of the AWS VPC to connect to the on-premises data center.
- **CustomerGatewayIp**: The public IP address of the on-premises VPN gateway.
- **BgpAsn**: Border Gateway Protocol (BGP) Autonomous System Number for the AWS side.
- **SubnetId**: The ID of the subnet within the VPC for VPN traffic.
- **TunnelInsideCidr**: Inside CIDR block for VPN tunnels (e.g., `169.254.x.x/30`).

### Outputs

Your Terraform configuration should output the following:

1. **VpnConnectionId**: The ID of the VPN connection.
2. **VpnTunnelIps**: Public IPs of the VPN tunnels.

---

## Instructions

1. **Write the Terraform Configuration**:
   - Create a Terraform configuration to:
     - Define a **Customer Gateway**.
     - Create a **Virtual Private Gateway** and attach it to the VPC.
     - Establish a **VPN Connection** with at least two tunnels (high availability).
     - Configure routing between the on-premises network and AWS.

2. **Test Your Configuration**:
   Run the following commands to test your work:

   ```bash
   # Initialize Terraform
   terraform init

   # Validate the Terraform configuration
   terraform validate

   # Plan the Terraform execution
   terraform plan \
       -var region=<region> \
       -var vpc_id=<vpc_id> \
       -var customer_gateway_ip=<customer_gateway_ip> \
       -var bgp_asn=<bgp_asn> \
       -var subnet_id=<subnet_id> \
       -var tunnel_inside_cidr='["<cidr1>", "<cidr2>"]'

   # Apply the Terraform configuration
   terraform apply -auto-approve
   ```

   Replace `<variables>` with appropriate values.

3. **Verify the VPN Connection**:
   - Confirm the VPN connection is active in the AWS Management Console.
   - Verify tunnel IPs and routes.

---

## Deliverables

Submit the following:

1. **Terraform Configuration Files**:
   - `main.tf`, `variables.tf`, and `outputs.tf`.

2. **Outputs**:
   - Include the `VpnConnectionId` and `VpnTunnelIps` in your submission.

3. **Verification Screenshots**:
   - Provide screenshots showing:
     - VPN connection status in AWS.
     - Tunnel IPs.

4. **Submission**:
   - Create a pull request to the repository with your Terraform code and outputs.

---

## Hints and Best Practices

- Use **BGP** for dynamic routing to simplify route management between AWS and on-premises networks.
- Make use of Terraform's modular approach for better readability and reuse.
- Configure detailed logging for the VPN using AWS CloudWatch to monitor connectivity.

---

## Testing

1. Check the VPN connection status using the AWS CLI:
   ```bash
   aws ec2 describe-vpn-connections --vpn-connection-ids <VpnConnectionId>
   ```
2. Verify routes in the VPC route table to ensure traffic is routed through the VPN.

---

## Grading Criteria

Your submission will be evaluated based on the following:

1. **Correctness**:
   - Does the Terraform configuration meet the requirements?
   - Are the VPN tunnels correctly configured?

2. **Code Quality**:
   - Is the code modular, readable, and adherent to Terraform best practices?

3. **Documentation**:
   - Are the instructions in your submission clear and complete?
   - Have you included screenshots or logs to verify your work?

4. **Testing**:
   - Have you validated and tested your Terraform code?

---

## Notes

This assignment tests your ability to configure hybrid cloud networking solutions using Terraform. If you have any questions, please reach out to [devops@nurdsoft.co](mailto:devops@nurdsoft.co).

Good luck!