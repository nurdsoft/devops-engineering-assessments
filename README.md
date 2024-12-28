# DevOps Engineering Assessments

Welcome to the **DevOps Engineering Assessments** repository! This repository contains a collection of take-home assignments designed to evaluate your skills in DevOps and Systems Engineering.

---

## Repository Structure

```sh
.
├── Makefile                       # Centralized task runner for testing and validation
├── README.md                      # Overview of the repository
├── assignments                    # Root directory for all assignments
│   └── public-cloud               # Category for public cloud-related assignments
│       └── aws                    # Subcategory for AWS-specific assessments
│           ├── compute            # Group for compute-related tasks
│           │   └── ec2-instance   # Assignment: EC2 instance setup
│           └── networking         # Group for networking-related tasks
│               └── site2site-vpn  # Assignment: Site-to-Site VPN setup
└── slack_notify.sh                # Optional script for Slack notifications
```

---

## Assessments

### 1. [EC2 Instance Setup](assignments/public-cloud/aws/compute/ec2-instance/README.md)
Objective: Provision an AWS EC2 instance with a Linux-based OS, accessible via SSH.

### 2. [Site-to-Site VPN Setup](assignments/public-cloud/aws/networking/site2site-vpn/README.md)
Objective: Configure a secure Site-to-Site VPN connection between AWS and an on-premises data center.

Each assignment contains a detailed `README.md` file with objectives, inputs, outputs, and instructions.

---

## Getting Started

1. Clone the repository.
2. Navigate to the desired assignment directory.
3. Follow the instructions provided in the assignment-specific `README.md`.

---

## Contribution

We welcome contributions to improve this repository! If you'd like to suggest changes or add new assignments:
1. Fork the repository.
2. Create a branch for your changes.
3. Submit a pull request to the `main` branch.

For detailed guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Contact

If you have questions or need assistance, please contact us at [devops@nurdsoft.co](mailto:devops@nurdsoft.co).