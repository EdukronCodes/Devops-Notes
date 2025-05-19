**Course Title: Azure DevOps Engineer Mastery with Jenkins & SonarQube**

**Course Description:**
This comprehensive course is designed for aspiring and existing IT professionals who want to master Azure DevOps, CI/CD principles, and integrate powerful tools like Jenkins and SonarQube into their workflows. You will learn to build, test, secure, and deploy applications efficiently using industry best practices. The course combines theoretical knowledge with extensive hands-on labs to ensure practical skill development, preparing you for real-world Azure DevOps engineering roles.

**Prerequisites:**
*   Basic understanding of software development lifecycle (SDLC).
*   Familiarity with at least one programming language (e.g., Java, .NET, Node.js, Python).
*   Basic knowledge of cloud computing concepts (Azure fundamentals are a plus).
*   Comfort with command-line interfaces.

**Course Duration:** (Suggest ~40-60 hours of instruction + labs, depending on depth)

**Learning Objectives:**
Upon successful completion of this course, students will be able to:
*   Understand and implement DevOps principles and practices.
*   Proficiently use Azure DevOps services (Boards, Repos, Pipelines, Test Plans, Artifacts).
*   Manage source code effectively using Git and Azure Repos, including branching and PRs.
*   Design, build, and manage CI/CD pipelines using both YAML and Classic editors in Azure Pipelines.
*   Integrate Jenkins with Azure DevOps for extended CI capabilities.
*   Integrate SonarQube for static code analysis and quality gate enforcement.
*   Implement end-to-end CI/CD pipelines for various application types.
*   Secure pipelines using Azure Key Vault and implement RBAC.
*   Monitor and troubleshoot CI/CD processes.
*   Understand advanced topics like containerization, Kubernetes, IaC, and deployment strategies.
*   Prepare for Azure DevOps related job interviews.

---

## 📚 Course Syllabus: Detailed Breakdown

---

### 📌 **Module 1: Introduction to DevOps & Azure DevOps**
**Learning Objectives:**
*   Define DevOps and articulate its core principles, benefits, and cultural implications.
*   Describe the DevOps lifecycle stages and their interconnections.
*   Introduce Azure DevOps as a platform and understand its market position.
*   Identify and explain the purpose of each core Azure DevOps service.
*   Understand how Azure DevOps organizations, projects, and teams are structured.
*   Successfully create and configure an Azure DevOps account and organization.

**Topics Covered:**
1.  **What is DevOps?**
    *   Definition, Goals, and Business Value
    *   The Three Ways of DevOps (Flow, Feedback, Continuous Learning & Experimentation)
    *   CALMS Framework (Culture, Automation, Lean, Measurement, Sharing)
    *   DevOps vs. Agile vs. Traditional SDLC
2.  **DevOps Lifecycle:**
    *   Plan: Agile Planning, Work Item Tracking
    *   Code: Version Control, Code Quality
    *   Build: Continuous Integration
    *   Test: Continuous Testing (Unit, Integration, etc.)
    *   Release: Release Management, Continuous Delivery
    *   Deploy: Continuous Deployment, Infrastructure as Code
    *   Operate: Application Performance Monitoring
    *   Monitor: Feedback Loops, Infrastructure Monitoring
3.  **Introduction to Azure DevOps:**
    *   History and Evolution (VSTS to Azure DevOps)
    *   Azure DevOps vs. other platforms (e.g., GitHub, GitLab, Jenkins)
    *   Overview of Azure DevOps Services
4.  **Azure DevOps Services Deep Dive:**
    *   **Azure Boards:** Agile planning, work item tracking (Epics, Features, User Stories, Tasks, Bugs), sprint planning, backlogs, Kanban boards.
    *   **Azure Repos:** Source control management (Git, TFVC), branching, pull requests, code reviews.
    *   **Azure Pipelines:** CI/CD automation, build and release definitions, YAML and Classic pipelines.
    *   **Azure Test Plans:** Test planning, manual testing, exploratory testing, automated test integration.
    *   **Azure Artifacts:** Package management (NuGet, npm, Maven, Python), universal packages, upstream sources.
5.  **Understanding Azure DevOps Project Structure:**
    *   Organizations: Purpose, managing multiple projects.
    *   Projects: Public vs. Private, selecting process templates (Basic, Agile, Scrum, CMMI).
    *   Teams: Configuring teams within projects.
6.  **Setting Up Azure DevOps Account and Organization:**
    *   Creating a Microsoft Account.
    *   Signing up for Azure DevOps.
    *   Creating your first Organization and Project.
    *   Navigating the Azure DevOps portal.
    *   User management and basic permissions.

**Hands-On/Demos:**
*   Create an Azure DevOps organization and a new project.
*   Explore Azure Boards: create work items, manage a backlog, and set up a Kanban board.
*   Briefly navigate through Repos, Pipelines, Test Plans, and Artifacts sections.

---

### 🔁 **Module 2: Version Control with Git and Azure Repos**
**Learning Objectives:**
*   Master fundamental Git commands for local repository management.
*   Understand the differences and use cases for Git and TFVC within Azure Repos.
*   Implement and manage common branching strategies.
*   Effectively use Pull Requests for code review and collaboration.
*   Configure repository permissions and branch policies for quality and security.

**Topics Covered:**
1.  **Git Basics:**
    *   What is Version Control? Centralized vs. Distributed.
    *   Installing and configuring Git.
    *   Core Git Concepts: Repository, Working Directory, Staging Area, Commit History.
    *   Essential Git Commands:
        *   `git init`, `git clone`
        *   `git status`, `git add`, `git commit -m "message"`
        *   `git log`, `git diff`
        *   `git branch`, `git checkout`, `git switch`
        *   `git merge` (fast-forward, three-way merge, merge conflicts)
        *   `git pull`, `git fetch`, `git push`
        *   `git remote -v`, `git remote add/remove`
        *   `git tag`
        *   `git rebase` (interactive rebase, caution)
        *   `.gitignore` files
2.  **Azure Repos:**
    *   Creating and importing Git repositories in Azure Repos.
    *   Git vs. TFVC (Team Foundation Version Control): Overview, pros & cons, when to choose which (focus on Git for modern DevOps).
    *   Connecting to Azure Repos from IDEs (VS Code, Visual Studio) and command line.
3.  **Branching Strategies:**
    *   Importance of branching.
    *   **GitFlow:** Feature branches, develop, release, main/master, hotfix branches. Pros and Cons.
    *   **Trunk-Based Development:** Single `main` branch, short-lived feature branches, feature flags. Pros and Cons.
    *   **Feature Branching:** Simple model, common in many projects.
    *   Release Flow, GitHub Flow (brief comparison).
    *   Choosing the right strategy for your team.
4.  **Pull Requests (PRs) and Code Review Process:**
    *   Purpose of Pull Requests.
    *   Creating PRs in Azure Repos.
    *   Linking work items to PRs.
    *   Conducting code reviews: providing feedback, approving changes.
    *   Merge strategies: merge (no fast-forward), squash merge, rebase and fast-forward.
    *   Resolving merge conflicts during PRs.
5.  **Repository Permissions and Policies:**
    *   Repository-level security: contributors, readers, administrators.
    *   Branch Policies:
        *   Requiring a minimum number of reviewers.
        *   Checking for linked work items.
        *   Enforcing comment resolution.
        *   Build validation (PR builds).
        *   Status checks from external services.
        *   Automatically included reviewers.
    *   Forking repositories (briefly).

**Hands-On/Demos:**
*   Initialize a local Git repository and push it to Azure Repos.
*   Practice Git commands: clone, add, commit, push, pull, branch, merge.
*   Simulate a feature development workflow using a chosen branching strategy.
*   Create and review Pull Requests in Azure Repos.
*   Set up branch policies on the `main` branch.

---

### ⚙️ **Module 3: CI/CD Pipeline Basics**
**Learning Objectives:**
*   Grasp core CI/CD concepts, benefits, and best practices.
*   Differentiate between YAML and Classic (UI-based) pipelines and know when to use each.
*   Create and configure build pipelines (CI) to compile code and run tests.
*   Create and configure release pipelines (CD) to deploy applications.
*   Integrate unit testing frameworks into CI pipelines.
*   Manage pipeline variables, triggers, and understand multi-stage pipeline concepts.

**Topics Covered:**
1.  **CI/CD Concepts and Best Practices:**
    *   Continuous Integration (CI): Definition, benefits, key practices (commit often, automate build, automate tests).
    *   Continuous Delivery (CD): Definition, benefits, extending CI to automated release to environments.
    *   Continuous Deployment (CDP): Automating deployment to production.
    *   The CI/CD Pipeline: Stages, jobs, tasks.
    *   Best Practices: Small, frequent changes; fast feedback; automate everything; version control for pipeline definitions.
2.  **YAML vs. Classic Pipelines:**
    *   **Classic Pipelines (UI Editor):** Visual designer, task-based, easier for beginners.
        *   Build Definitions
        *   Release Definitions
    *   **YAML Pipelines:** Pipelines-as-code, versioned with your code, better for complex scenarios, reusability.
        *   Key YAML syntax: `trigger`, `pool`, `variables`, `stages`, `jobs`, `steps`, `tasks`, `resources`.
    *   Pros and Cons of each, converting Classic to YAML.
3.  **Creating Build Pipelines (CI):**
    *   Purpose: Compile code, run tests, package application, publish artifacts.
    *   Using Azure-hosted vs. Self-hosted agents.
    *   Agent pools and capabilities.
    *   Common build tasks (e.g., .NET Core CLI, Maven, npm, Ant, Gradle).
    *   Publishing build artifacts.
4.  **Creating Release Pipelines (CD) (Primarily Classic for this introduction):**
    *   Purpose: Deploy build artifacts to different environments.
    *   Stages, jobs, and tasks in release pipelines.
    *   Linking build artifacts.
    *   Deployment groups and agent-based deployments.
    *   Service connections for Azure and other services.
5.  **Integrating Unit Testing in Pipelines:**
    *   Importance of automated testing.
    *   Integrating test runner tasks (e.g., VSTest, JUnit, NUnit, Mocha, Jest).
    *   Publishing test results and code coverage.
    *   Failing builds on test failures.
6.  **Environment Variables, Pipeline Triggers:**
    *   **Variables:**
        *   Predefined variables.
        *   User-defined variables (pipeline, stage, job scope).
        *   Variable groups (for shared variables, linking to Azure Key Vault).
        *   Secret variables.
    *   **Triggers:**
        *   Continuous Integration (CI) triggers (branch filters, path filters).
        *   Pull Request (PR) triggers (build validation).
        *   Scheduled triggers.
        *   Gated check-ins (TFVC).
7.  **Multi-stage Pipelines with Environments and Approvals:**
    *   Defining stages in YAML (e.g., Build, Dev, QA, Prod).
    *   Defining stages in Classic Release Pipelines.
    *   **Environments in Azure DevOps:** Logical targets for deployment (e.g., Kubernetes, VMs, App Services).
    *   Deployment strategies within environments (runOnce, rolling, canary - introduction).
    *   **Approvals and Gates:**
        *   Manual approvals before or after a stage.
        *   Gates: Automated checks (e.g., Azure Monitor alerts, Azure Policy compliance, invoke REST API, query work items).

**Hands-On/Demos:**
*   Create a YAML build pipeline for a sample application (.NET, Node.js, or Java).
*   Integrate unit tests into the build pipeline and publish results.
*   Create a Classic release pipeline to deploy the application artifact to a (simulated) environment.
*   Configure CI and PR triggers.
*   Use pipeline variables and variable groups.
*   Set up a multi-stage YAML pipeline with a manual approval.

---

### 🔍 **Module 4: Jenkins Integration with Azure DevOps**
**Learning Objectives:**
*   Understand Jenkins' role in the CI/CD landscape and its common use cases.
*   Install and configure a Jenkins server on an Azure Virtual Machine.
*   Create and manage Jenkins jobs using both Freestyle and Pipeline (scripted/declarative) approaches.
*   Integrate Jenkins with Azure Repos for source code checkout.
*   Trigger Jenkins jobs from Azure Pipelines and vice-versa.
*   Utilize Jenkins Shared Libraries for reusable pipeline code.
*   Configure Jenkins notifications and post-build actions.

**Topics Covered:**
1.  **Introduction to Jenkins:**
    *   What is Jenkins? History and community.
    *   Jenkins architecture: Master, Agents (Nodes/Slaves).
    *   Why use Jenkins? (Extensive plugin ecosystem, existing investment).
    *   Jenkins vs. Azure Pipelines (when to use which or both).
2.  **Installing and Configuring Jenkins on Azure VM:**
    *   Provisioning an Azure VM (Linux recommended, e.g., Ubuntu).
    *   Installing Java (OpenJDK/Oracle JDK).
    *   Installing Jenkins (via package manager or .war file).
    *   Initial Jenkins setup: unlocking, installing suggested plugins, creating admin user.
    *   Managing Jenkins: Plugins, security, system configuration.
    *   Configuring Jenkins agents.
3.  **Creating Jenkins Jobs:**
    *   **Freestyle Projects:** UI-driven configuration, simple build steps, SCM integration, triggers, post-build actions.
    *   **Pipeline Projects:**
        *   Jenkinsfile (pipeline-as-code).
        *   Declarative Pipeline syntax (easier, more structured).
        *   Scripted Pipeline syntax (Groovy-based, more flexible).
        *   Key concepts: `agent`, `stages`, `stage`, `steps`, `post`, `environment`, `parameters`.
4.  **Integrating Jenkins with Azure Repos:**
    *   Using the Git plugin in Jenkins.
    *   Authenticating Jenkins to Azure Repos:
        *   SSH keys.
        *   Personal Access Tokens (PATs).
        *   Service Principals (more secure for automation).
    *   Configuring SCM polling or webhooks from Azure Repos to trigger Jenkins jobs.
5.  **Trigger Jenkins Jobs from Azure Pipelines:**
    *   Using the "Jenkins" service connection in Azure DevOps.
    *   The "Jenkins Download Artifacts" and "Jenkins Queue Job" tasks in Azure Pipelines.
    *   Use cases: Azure Pipelines for orchestration, Jenkins for specific build/test tasks.
    *   Triggering Azure Pipelines from Jenkins (e.g., using Azure DevOps REST API).
6.  **Jenkins Shared Libraries:**
    *   Purpose: Reusing pipeline code across multiple Jenkinsfiles.
    *   Structure of a Shared Library (vars, src, resources).
    *   Creating and configuring a Global Shared Library in Jenkins.
    *   Using Shared Libraries in Jenkinsfiles.
7.  **Jenkins Notifications & Post-build Actions:**
    *   Email notifications (Email Extension Plugin).
    *   Slack/Teams integration.
    *   Archiving build artifacts.
    *   Triggering downstream jobs.

**Hands-On/Demos:**
*   Install Jenkins on an Azure VM.
*   Create a Freestyle Jenkins job that checks out code from Azure Repos and runs a simple build command.
*   Create a Declarative Pipeline Jenkins job (Jenkinsfile) for the same purpose.
*   Set up webhook integration from Azure Repos to trigger a Jenkins job.
*   Create an Azure Pipeline that triggers a Jenkins job.
*   (Optional) Create and use a simple Jenkins Shared Library.

---

### ✅ **Module 5: SonarQube Integration for Code Quality**
**Learning Objectives:**
*   Understand the importance of static code analysis and SonarQube's role.
*   Install and configure a SonarQube server.
*   Understand how SonarQube scanners and plugins work.
*   Integrate SonarQube analysis into Jenkins pipelines.
*   Integrate SonarQube analysis into Azure DevOps Pipelines.
*   Define and use Quality Gates to enforce code quality standards.
*   Interpret SonarQube reports and identify areas for improvement.

**Topics Covered:**
1.  **Introduction to SonarQube:**
    *   What is Static Code Analysis?
    *   Benefits: Early bug detection, code smell identification, security vulnerability discovery, maintainability improvement.
    *   SonarQube overview: Server, Scanners, Database.
    *   Key metrics: Bugs, Vulnerabilities, Code Smells, Duplications, Code Coverage, Technical Debt.
    *   SonarQube editions (Community, Developer, Enterprise, Data Center).
2.  **Installing SonarQube Server:**
    *   Prerequisites (Java, Database - e.g., PostgreSQL).
    *   Downloading and setting up SonarQube (e.g., using Docker for simplicity or manual install).
    *   Initial configuration, admin access, installing language analyzers.
3.  **SonarQube Scanner and Plugins:**
    *   How SonarScanners work (MSBuild, Maven, Gradle, CLI, Ant).
    *   Language-specific analyzers and plugins (Java, C#, JS/TS, Python, etc.).
    *   Installing and managing plugins in SonarQube.
4.  **Integrating SonarQube with Jenkins:**
    *   SonarQube Scanner for Jenkins plugin.
    *   Configuring SonarQube server connection in Jenkins.
    *   Adding SonarQube analysis steps to Jenkins jobs (Freestyle and Pipeline).
        *   `withSonarQubeEnv()` block in Jenkinsfile.
        *   `waitForQualityGate()` step.
    *   Viewing SonarQube results link from Jenkins.
5.  **SonarQube Integration with Azure DevOps Pipelines:**
    *   SonarQube extension for Azure DevOps (from Marketplace).
    *   Creating a SonarQube service connection in Azure DevOps.
    *   Adding SonarQube tasks to YAML/Classic pipelines:
        *   `SonarQubePrepare` (Prepare Analysis Configuration)
        *   Build task (e.g., `Maven`, `DotNetCoreCLI@2` with SonarQube parameters)
        *   `SonarQubeAnalyze` (Run Code Analysis)
        *   `SonarQubePublish` (Publish Quality Gate Result)
    *   Breaking the build if Quality Gate fails.
6.  **Quality Gates and Static Code Analysis:**
    *   What are Quality Gates? Conditions based on project metrics.
    *   Default Quality Gate (Sonar way).
    *   Creating custom Quality Gates (e.g., Coverage > 80%, No new Blocker issues).
    *   Applying Quality Gates to projects.
    *   Understanding analysis scope (new code vs. overall code).
7.  **Visualizing Reports and Fixing Issues:**
    *   Navigating the SonarQube dashboard: Project overview, Issues, Measures, Activity.
    *   Understanding issue types, severity, and assignment.
    *   Drilling down into code to see specific problems.
    *   Marking issues (False Positive, Won't Fix).
    *   Tracking technical debt and code quality evolution.

**Hands-On/Demos:**
*   Install SonarQube (e.g., using Docker).
*   Analyze a sample project (Java or .NET) with SonarQube scanner CLI.
*   Integrate SonarQube analysis into a Jenkins pipeline.
*   Integrate SonarQube analysis into an Azure DevOps build pipeline.
*   Configure a Quality Gate and observe its effect on the pipeline.
*   Review SonarQube reports and identify an issue to fix.

---

### 🔄 **Module 6: Complete CI/CD Pipeline (End-to-End Project)**
**Learning Objectives:**
*   Apply learned concepts to build a comprehensive CI/CD pipeline from source to deployment.
*   Integrate SCM, build, testing, quality scanning, and artifact management.
*   Implement release pipelines with approvals, gates, and multi-environment deployments.
*   Understand and implement artifact versioning and basic rollback strategies.
*   Configure notifications for pipeline status.
*   Securely manage secrets using Azure Key Vault.

**Topics Covered:**
1.  **Source Code Management (Git + Azure Repos):**
    *   Recap: Setting up the repository, branching strategy for the project.
2.  **Build Pipeline Creation (YAML focus):**
    *   Defining triggers (CI, PR).
    *   Agent selection and configuration.
    *   **Compile Code:** Language-specific compilation (e.g., `dotnet build`, `mvn compile`, `npm run build`).
    *   **Run Unit Tests:** Integrating test execution and publishing results.
    *   **SonarQube Quality Scan:** Integrating SonarQube tasks as per Module 5.
    *   **Publish Artifacts:**
        *   Packaging the application (e.g., .zip, .jar, Docker image).
        *   Using `PublishBuildArtifacts` task (pipeline artifacts).
        *   Publishing to Azure Artifacts feeds.
3.  **Release Pipeline Creation (YAML multi-stage or Classic Release):**
    *   **Approvals and Gates:**
        *   Pre-deployment and post-deployment manual approvals.
        *   Automated gates (e.g., invoke Azure Function, query Azure Monitor alerts).
    *   **Deploy to Dev/Test/Prod Environments:**
        *   Defining stages for each environment.
        *   Using Environment-specific variables/configurations.
        *   **Azure App Service Deployments:** Web Deploy, Zip Deploy, Run From Package, Docker container.
        *   **Azure Kubernetes Service (AKS) Deployments:** `kubectl apply`, Helm charts (introduction).
        *   **Azure VM Deployments:** Using deployment groups, running scripts.
4.  **Artifact Versioning and Rollback Strategy:**
    *   Semantic Versioning (Major.Minor.Patch).
    *   Versioning build artifacts (e.g., using build number).
    *   Strategies for rollback:
        *   Redeploying a previous successful artifact version.
        *   Manual rollback procedures.
        *   Automated rollback (more advanced, brief mention).
5.  **Notifications via Email / Teams / Slack:**
    *   Azure DevOps built-in notification settings (subscriptions).
    *   Integrating with Microsoft Teams or Slack for pipeline status updates (via service hooks or marketplace extensions).
6.  **Integration with Azure Key Vault for Secrets:**
    *   Storing sensitive information (API keys, connection strings, passwords).
    *   Creating an Azure Key Vault.
    *   Granting pipeline access to Key Vault (Service Principal, Managed Identity).
    *   Using Variable Groups linked to Azure Key Vault.
    *   Accessing secrets in pipeline tasks.

**Hands-On/Demos:**
*   Choose a sample application (e.g., a .NET web app or Node.js API).
*   Set up the full CI pipeline: checkout, build, test, SonarQube scan, publish artifact.
*   Set up a multi-stage CD pipeline deploying to Azure App Service (Dev, QA environments).
*   Implement a manual approval before QA deployment.
*   Configure pipeline notifications to email.
*   Store a database connection string in Azure Key Vault and use it in the deployment pipeline.

---

### 🔒 **Module 7: Security, Compliance, and Monitoring**
**Learning Objectives:**
*   Implement Role-Based Access Control (RBAC) in Azure DevOps and Azure.
*   Understand and apply principles of DevSecOps, including tools like AzSK (or Microsoft Defender for DevOps).
*   Securely manage secrets and configurations using Azure Key Vault in pipelines.
*   Monitor CI/CD pipeline health, performance, and logs.
*   Utilize Azure Monitor, Log Analytics, and Application Insights for comprehensive monitoring.
*   Understand compliance aspects and audit trails in Azure DevOps.

**Topics Covered:**
1.  **Role-Based Access Control (RBAC):**
    *   **Azure DevOps:**
        *   Security groups (Project Valid Users, Contributors, Readers, Project Administrators).
        *   Custom security groups.
        *   Permissions at Organization, Project, Repo, Pipeline, Artifact feed levels.
        *   Securing service connections.
    *   **Azure RBAC:**
        *   Built-in roles (Owner, Contributor, Reader).
        *   Custom roles.
        *   Assigning roles to service principals used by pipelines.
        *   Principle of Least Privilege.
2.  **Secure DevOps Kit for Azure (AzSK) / Microsoft Defender for DevOps:**
    *   (Note: AzSK is being superseded by Microsoft Defender for DevOps. Focus on the latter if possible, or discuss AzSK as a foundational tool).
    *   Purpose: Scanning Azure resources, subscriptions, and CI/CD pipelines for security misconfigurations.
    *   Key security controls covered.
    *   Integrating security scans into CI/CD pipelines.
    *   SAST, DAST, IAST, and SCA (Software Composition Analysis) concepts.
3.  **Integrating Azure Key Vault in Pipelines (Advanced):**
    *   Recap of Key Vault integration (Variable Groups).
    *   Using Managed Identities for Azure resources with Azure Pipelines for Key Vault access (preferred method).
    *   Auditing Key Vault access.
    *   Key Vault access policies and RBAC.
4.  **Monitoring CI/CD Pipelines:**
    *   Azure Pipelines analytics: success rates, duration, failure trends.
    *   Agent pool health and utilization.
    *   Reviewing pipeline logs for troubleshooting.
    *   Setting up alerts for pipeline failures.
5.  **Using Azure Monitor, Log Analytics, and Application Insights:**
    *   **Azure Monitor:** Centralized monitoring service for Azure resources.
        *   Metrics and Logs.
        *   Alerts based on metrics or log queries.
    *   **Log Analytics:**
        *   Collecting and analyzing logs from Azure DevOps pipelines (via diagnostics settings).
        *   Kusto Query Language (KQL) basics for querying pipeline logs.
    *   **Application Insights:**
        *   APM for deployed applications.
        *   Tracking availability, performance, exceptions from your application.
        *   Integrating deployment markers from release pipelines.
6.  **Compliance and Audit Trails:**
    *   Azure DevOps auditing: Access logs, changes to pipelines, approvals.
    *   Retention policies for builds and releases.
    *   Ensuring pipeline changes are version controlled (YAML).
    *   Meeting industry compliance standards (e.g., SOC, ISO) with Azure DevOps features.

**Hands-On/Demos:**
*   Configure specific permissions for a user/group on an Azure Repo and a Pipeline.
*   Set up a service connection using a Service Principal with least privilege Azure RBAC role to deploy resources.
*   Integrate Azure Key Vault using Managed Identity for the Azure DevOps agent/service connection.
*   Explore pipeline analytics in Azure DevOps.
*   (Optional) Send pipeline diagnostic logs to Log Analytics and run basic queries.
*   Set up an alert in Azure Monitor for a failed pipeline run.

---

### 📦 **Module 8: Advanced Topics**
**Learning Objectives:**
*   Understand containerization concepts and build Docker images.
*   Implement CI/CD pipelines for applications deployed to Azure Kubernetes Service (AKS).
*   Use Helm charts for packaging and deploying applications on Kubernetes.
*   Learn about advanced deployment strategies like Blue-Green and Canary.
*   Get an introduction to Infrastructure as Code (IaC) with Terraform or ARM Templates.
*   Understand how Azure DevOps can integrate with GitHub Actions.

**Topics Covered:**
1.  **Containerization with Docker:**
    *   Introduction to containers: VMs vs. Containers.
    *   Docker concepts: Dockerfile, Images, Containers, Docker Hub, Azure Container Registry (ACR).
    *   Writing Dockerfiles for sample applications.
    *   Building Docker images and pushing them to ACR.
    *   Running Docker containers locally.
2.  **Kubernetes CI/CD using Azure Kubernetes Service (AKS):**
    *   Introduction to Kubernetes (K8s): Pods, Services, Deployments, Ingress, Namespaces.
    *   Overview of Azure Kubernetes Service (AKS).
    *   CI/CD for K8s:
        *   Building Docker images in pipeline (using Docker task or ACR Tasks).
        *   Pushing images to ACR.
        *   Deploying to AKS using `kubectl` task in Azure Pipelines (applying manifest files).
        *   Service connection to AKS.
3.  **Helm Charts and Helm Deployments:**
    *   What is Helm? The package manager for Kubernetes.
    *   Helm Charts: Structure, templates, values.
    *   Using Helm tasks in Azure Pipelines (`helm install`, `helm upgrade`).
    *   Managing application releases with Helm.
4.  **Blue-Green and Canary Deployments:**
    *   **Blue-Green Deployments:**
        *   Concept: Two identical environments (Blue/Live, Green/New).
        *   Implementation with Azure App Service Deployment Slots.
        *   Implementation in AKS (e.g., using Ingress controllers and service selectors).
    *   **Canary Deployments:**
        *   Concept: Gradually rolling out new version to a subset of users.
        *   Implementation in AKS (e.g., using Istio or other service meshes, or weighted routing with Ingress).
        *   Monitoring during canary release.
5.  **Infrastructure as Code (IaC) with Terraform or ARM Templates:**
    *   What is IaC? Benefits (consistency, repeatability, versioning).
    *   **Azure Resource Manager (ARM) Templates:**
        *   JSON-based, native to Azure.
        *   Structure: parameters, variables, resources, outputs.
        *   Deploying ARM Templates via Azure Pipelines.
    *   **(Optional) Terraform:**
        *   Open-source, multi-cloud.
        *   HashiCorp Configuration Language (HCL).
        *   Providers, Resources, State management (Azure Blob Storage for remote state).
        *   Terraform CLI (`init`, `plan`, `apply`, `destroy`).
        *   Integrating Terraform into Azure Pipelines.
6.  **Azure DevOps with GitHub Actions:**
    *   Introduction to GitHub Actions: Workflows, events, runners, actions.
    *   Comparing Azure Pipelines and GitHub Actions.
    *   Use cases for integration:
        *   GitHub for SCM and Actions for CI, Azure Pipelines for CD.
        *   Triggering Azure Pipelines from GitHub Actions (and vice-versa).
        *   Azure Login action in GitHub Actions.

**Hands-On/Demos:**
*   Write a Dockerfile for a simple application, build the image, and push to ACR.
*   Create an Azure Pipeline to build a Docker image and deploy it to AKS using `kubectl`.
*   (Optional) Deploy an application to AKS using a Helm chart via Azure Pipelines.
*   Demonstrate Blue-Green deployment using Azure App Service slots.
*   Deploy an Azure resource (e.g., Storage Account) using an ARM Template from Azure Pipelines.
*   (Optional) Set up a GitHub Actions workflow that triggers an Azure Pipeline.

---

### 🧪 **Hands-On Projects**
These projects aim to consolidate learning from all modules.

1.  **Project 1: CI/CD for a Monolithic Web App to Azure App Service**
    *   **Application:** Java Spring Boot / .NET Core MVC / Node.js Express web application.
    *   **Source Control:** Azure Repos with GitFlow branching.
    *   **CI Pipeline (YAML):**
        *   Trigger on pushes to `develop` and `main`, and PRs to `main`.
        *   Compile code.
        *   Run unit tests and publish results.
        *   SonarQube analysis with Quality Gate.
        *   Package application (e.g., .war, .zip).
        *   Publish artifact.
        *   (Optional) Build Docker image and push to ACR.
    *   **CD Pipeline (YAML Multi-stage or Classic Release):**
        *   Trigger on CI build completion from `develop` branch for Dev deployment.
        *   Trigger on CI build completion from `main` branch (or tag) for QA/Prod deployment.
        *   **Dev Environment:** Deploy to Azure App Service (Dev slot or separate App Service).
        *   **QA Environment:**
            *   Pre-deployment manual approval.
            *   Deploy to Azure App Service (QA slot or separate App Service).
            *   (Optional) Run automated UI/Integration tests.
        *   **Prod Environment:**
            *   Pre-deployment manual approval from stakeholders.
            *   Deploy to Azure App Service (Prod slot, then swap or direct deploy).
        *   Use Azure Key Vault for connection strings/secrets.
        *   Notifications for deployment status.

2.  **Project 2: CI/CD for a Microservices App on AKS**
    *   **Application:** 2-3 simple microservices (e.g., REST APIs in Python/Go/Node.js). Each in its own repo or a monorepo.
    *   **Source Control:** Azure Repos.
    *   **Containerization:** Dockerfiles for each microservice. Azure Container Registry for images.
    *   **CI Pipeline (YAML) - for each microservice:**
        *   Trigger on code changes.
        *   Run unit tests.
        *   SonarQube analysis.
        *   Build Docker image, tag it (e.g., with build ID or Git commit SHA).
        *   Push Docker image to ACR.
        *   Publish Kubernetes manifest files / Helm chart as artifact.
    *   **CD Pipeline (YAML Multi-stage or Classic Release):**
        *   Trigger on CI completion.
        *   **Dev Environment (AKS Namespace):**
            *   Deploy using `kubectl apply -f <manifests>` or `helm install/upgrade`.
        *   **Staging Environment (AKS Namespace):**
            *   Manual approval.
            *   Deploy using `kubectl` or `helm`.
            *   Run integration tests.
        *   **Prod Environment (AKS Namespace):**
            *   Manual approval.
            *   Deploy using `kubectl` or `helm`.
            *   Implement a deployment strategy (e.g., rolling update, basic Blue-Green with service updates).
        *   Use Azure Key Vault for secrets (e.g., mounted into K8s pods or via CSI driver).

3.  **Project 3: Jenkins + SonarQube + Azure DevOps Full Integration Project**
    *   **Scenario:** An organization has existing Jenkins jobs for building a legacy Java application and wants to integrate this into their Azure DevOps workflow for release management and SonarQube for quality.
    *   **Source Control:** Azure Repos.
    *   **Jenkins:**
        *   Configure Jenkins job (Freestyle or Pipeline) to:
            *   Checkout code from Azure Repos.
            *   Build the Java application (e.g., using Maven).
            *   Run SonarQube analysis and check Quality Gate.
            *   Archive build artifact (.jar/.war).
    *   **Azure DevOps Pipelines (Release):**
        *   Triggered after successful Jenkins job completion (via webhook or polling, or Jenkins task in ADO).
        *   Download artifact from Jenkins.
        *   Deploy the artifact to an Azure App Service or Azure VM.
        *   Manage approvals and notifications via Azure DevOps.
    *   **Key Focus:** Seamless handoff between Jenkins (build & SonarQube) and Azure DevOps (release orchestration & SCM).

---

### 📁 **Tools Covered**
*   **Azure DevOps:** Boards, Repos, Pipelines (YAML & Classic), Test Plans (overview), Artifacts.
*   **Jenkins:** Installation, Configuration, Freestyle jobs, Pipeline jobs (Jenkinsfile), Shared Libraries.
*   **SonarQube:** Installation, Configuration, Scanners, Quality Gates, Reporting.
*   **Git & Azure Repos:** Core commands, branching, PRs, policies.
*   **Docker & Kubernetes (AKS):** Dockerfiles, Images, ACR, `kubectl` basics, Helm basics.
*   **Azure CLI & Azure Key Vault:** Command-line management, secure secret storage.
*   **Terraform or ARM Templates (Optional/Introduction):** Infrastructure as Code.
*   **IDE:** VS Code or Visual Studio (recommended for local development and Git interaction).

---

### 🧠 **Interview Preparation**
*   **Conceptual Questions:**
    *   Explain DevOps principles.
    *   Differences between CI, Continuous Delivery, Continuous Deployment.
    *   Pros and cons of different branching strategies.
    *   Benefits of pipeline-as-code.
    *   How Quality Gates improve software development.
    *   When would you use Jenkins over Azure Pipelines, or vice-versa?
*   **50+ Azure DevOps Scenario-based Questions:**
    *   "How would you design a CI/CD pipeline for a microservices application deploying to AKS?"
    *   "A build is failing only in the pipeline but works locally. How would you troubleshoot?"
    *   "How do you handle database schema changes in a CI/CD pipeline?"
    *   "Describe a secure way to manage API keys needed for deployment."
    *   "How would you implement a Blue-Green deployment strategy for an App Service?"
    *   "Your team wants to reduce build times. What are some strategies?"
    *   "How do you ensure only quality code gets to production?"
*   **Jenkins & SonarQube Troubleshooting Scenarios:**
    *   Jenkins agent offline: diagnosis and resolution.
    *   SonarQube analysis fails: common causes (scanner misconfiguration, connectivity).
    *   Quality Gate failing unexpectedly.
    *   Slow Jenkins builds: identifying bottlenecks.
*   **YAML and Pipeline Debugging Exercises:**
    *   Given a broken YAML pipeline, identify and fix the error.
    *   Optimize a pipeline for speed or readability.
    *   Add a new stage or job with specific dependencies.
*   **Mock Interviews:** Practice answering common questions and scenarios.
*   **Resume Building Tips:** Highlighting Azure DevOps skills and projects.

---

**Conclusion & Next Steps:**
This course provides a solid foundation and practical experience in Azure DevOps, Jenkins, and SonarQube. Upon completion, students are encouraged to pursue Azure certifications (e.g., AZ-400: Designing and Implementing Microsoft DevOps Solutions), contribute to open-source projects, and apply their skills in real-world scenarios to continue their learning journey.

---
