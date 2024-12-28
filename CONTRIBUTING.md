# Contributing to DevOps Engineering Assessments

Thank you for considering contributing to the **DevOps Engineering Assessments** repository! We welcome contributions to improve the quality and scope of the assignments. Please follow the guidelines below to ensure a smooth contribution process.

---

## How to Contribute

### 1. Fork the Repository
Fork the repository to your own GitHub account by clicking the **Fork** button on the top-right corner of the repository page.

### 2. Clone Your Fork
Clone your forked repository to your local machine:
```bash
git clone https://github.com/<your-username>/devops-engineering-assessments.git
cd devops-engineering-assessments
```

### 3. Create a New Branch
Create a new branch for your contribution:
```bash
git checkout -b feature/<your-feature-name>
```

### 4. Make Your Changes
- Add your new assignment or update an existing one.
- Ensure your changes align with the repository structure and existing format.

### 5. Test Your Changes
- Validate any Terraform configuration using the steps outlined in the assignment-specific `README.md`.
- Run any included test scripts to ensure your changes work as intended.

### 6. Commit Your Changes
Commit your changes with a clear and concise message:
```bash
git add .
git commit -m "Add <description of your change>"
```

### 7. Push Your Changes
Push your changes to your forked repository:
```bash
git push origin feature/<your-feature-name>
```

### 8. Open a Pull Request
Submit a pull request (PR) to the `main` branch of the original repository:
1. Navigate to your fork on GitHub.
2. Click on the **Pull Request** tab.
3. Select **New Pull Request**.
4. Provide a detailed description of your changes in the PR.

---

## Contribution Guidelines

### General Guidelines
- Follow the existing folder and file structure.
- Ensure your code adheres to best practices, including proper formatting and modularization.
- Include comments in your code to explain any non-trivial logic.

### New Assignments
If adding a new assignment:
1. Place it in the appropriate directory under `assignments/`.
2. Include a `README.md` file with the following sections:
   - Objective
   - Inputs
   - Outputs
   - Instructions
   - Testing
   - Submission Requirements

### Documentation
- Ensure all new or updated documentation is clear, concise, and follows the repository's tone.
- Update the main repository `README.md` if necessary to reflect your changes.

### Testing
- Validate your Terraform configuration using `terraform validate`.
- Ensure all outputs specified in the assignment are correctly generated.

---

## Code of Conduct

Please adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) in all interactions. Respectful collaboration is essential to our community.

---

## Contact

If you have any questions or need clarification about contributing, feel free to reach out to [devops@nurdsoft.co](mailto:devops@nurdsoft.co).

We appreciate your contributions!