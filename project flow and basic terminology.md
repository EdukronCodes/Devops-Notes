
# Azure DevOps Terminology Guide

## 1️⃣ **Azure DevOps Services**
Azure DevOps is a cloud-based platform that provides DevOps services for collaboration, automation, and CI/CD.

### 🔹 **Azure Repos**
- Version control system supporting **Git** and **Team Foundation Version Control (TFVC)**.
- Used for managing source code.

### 🔹 **Azure Boards**
- Agile project management tool.
- Includes **work items**, **epics**, **features**, **user stories**, **tasks**, and **bugs**.
- Used for **Kanban**, **Scrum**, and **SAFe** methodologies.

### 🔹 **Azure Pipelines**
- CI/CD automation tool for **building, testing, and deploying** applications.
- Supports **YAML pipelines** and **Classic Editor**.
- Works with **multiple environments (Dev, QA, Prod)**.

### 🔹 **Azure Artifacts**
- Package management system for **NuGet, npm, Maven, and Python**.
- Helps in storing and sharing build artifacts.

### 🔹 **Azure Test Plans**
- Provides manual and automated testing.
- Used for **test case management** and **test execution tracking**.

---

## 2️⃣ **Key DevOps Concepts**
### 🔹 **Work Items**
- Items tracked in **Azure Boards** (Epics, Features, User Stories, Tasks, Bugs).

### 🔹 **Pull Request (PR)**
- A request to merge code from one branch to another.
- Includes **code reviews**, **approvals**, and **build validations**.

### 🔹 **Branching Strategy**
- **Main Branch (Master/Main)** – Production-ready code.
- **Develop Branch** – Ongoing development.
- **Feature Branches** – Individual feature work.
- **Hotfix Branches** – Quick fixes for production issues.

### 🔹 **CI/CD (Continuous Integration & Continuous Deployment)**
- **Continuous Integration (CI)**: Automatically build and test code upon commits.
- **Continuous Deployment (CD)**: Automates software releases to different environments.

### 🔹 **Pipeline Agents**
- **Microsoft-Hosted Agents**: Provided by Azure DevOps.
- **Self-Hosted Agents**: Configured and managed manually.

### 🔹 **Environment**
- A stage where applications are deployed, such as **Development (Dev)**, **Testing (QA)**, and **Production (Prod)**.

### 🔹 **Artifacts**
- Packages or compiled code that are used for deployments.
- Stored in **Azure Artifacts** or other storage locations.

### 🔹 **Release Gates**
- Approval mechanisms before deploying to the next environment.

### 🔹 **Infrastructure as Code (IaC)**
- Managing infrastructure using code with **Terraform**, **Bicep**, or **ARM templates**.

---

## 3️⃣ **Security & Compliance**
### 🔹 **RBAC (Role-Based Access Control)**
- Controls permissions using **Reader, Contributor, Owner** roles.

### 🔹 **Branch Policies**
- Enforces rules such as **code reviews**, **work item linking**, and **build validation** before merging.

### 🔹 **Pipeline Security**
- Uses **service connections**, **secure variables**, and **Azure Key Vault**.

### 🔹 **SonarQube & Security Scanning**
- Helps detect **code vulnerabilities** in Azure Pipelines.

---

## 4️⃣ **Monitoring & Reporting**
### 🔹 **Azure Monitor & Application Insights**
- Tracks **application performance**, **logs**, and **alerts**.

### 🔹 **Dashboards & Reports**
- Provides real-time visibility into DevOps activities.

### 🔹 **Log Analytics**
- Used for **querying logs** from pipelines, applications, and infrastructure.

---

## 5️⃣ **Integration & Extensibility**
### 🔹 **Third-Party Integrations**
- Supports integrations with **JIRA, GitHub, Jenkins, Slack, ServiceNow**, etc.

### 🔹 **APIs & Webhooks**
- Allows automation and integration using **REST APIs**.

---

> **💡 Best Practices**
> - Use **YAML-based pipelines** for version control.
> - Implement **branch policies** to maintain code quality.
> - Secure secrets using **Azure Key Vault**.
> - Optimize pipelines by **caching dependencies**.
> - Monitor pipeline execution with **Azure Monitor**.

