### Cloud-Based Web Application with PostgreSQL Backend, Django, and React, Hosted on Azure DevOps

#### Overview
This project involves the development of a full-stack web application with PostgreSQL as the backend, Django as the server-side framework, and React for the front-end interface. The entire project is hosted and managed through Azure DevOps, leveraging its CI/CD pipelines and cloud infrastructure to ensure a scalable and reliable deployment process.

#### DevOps Engineer Responsibilities (3 Years)

- **Cloud Infrastructure Setup:**
  - Designed and set up cloud infrastructure using Azure services like Azure Web Apps for hosting Django and React.
  - Configured **Azure PostgreSQL** for data storage.
  
- **Version Control & Collaboration:**
  - Configured **Azure DevOps Repos** (integrated with GitHub) for version control, enabling seamless collaboration between development teams.

- **CI/CD Pipeline Setup:**
  - Set up **Azure Pipelines** to automate the build, test, and deployment processes for both frontend and backend components.
  - Enabled **Continuous Integration (CI)** to automate the merging and validation of code from different developers.

- **Multi-Stage Pipelines:**
  - Built and configured **multi-stage pipelines** for environment-specific deployments (development, staging, and production).

- **Automated Testing Integration:**
  - Integrated automated testing into the pipelines to ensure high-quality code releases and minimize downtime during deployments.

- **Infrastructure as Code (IaC):**
  - Implemented **Infrastructure as Code (IaC)** using **Terraform templates** to manage infrastructure efficiently, allowing version control and environment reproducibility.

- **Scaling and Monitoring:**
  - Upskilled on scaling and monitoring applications using **Azure Monitor**, **Application Insights**, and **Log Analytics** to track performance, identify bottlenecks, and troubleshoot real-time issues.

- **Individual Contributor and Team Player:**
  - Worked as both an individual contributor and team player, handling different user stories directly while collaborating with the team on various tasks.


### Cloud-Based Web Application with PostgreSQL Backend, Django, and React, Hosted on Azure DevOps


# Hosting POS Sales System Using React and Django on Azure DevOps

This guide outlines the steps for hosting a Point of Sale (POS) system built with a React frontend and Django backend using Azure DevOps.

---

## 1. Setting Up Azure Resources

### Azure Web App for Django Backend:
- Log in to the Azure portal and create an **Azure Web App** for the Django backend.
- Choose the appropriate **Runtime Stack** (e.g., Python 3.x).
- Configure the **App Service Plan** based on the performance and scaling needs.
- Create a **PostgreSQL Database** (if applicable) in Azure, and connect it with your Django app.

### Azure Web App for React Frontend:
- Create another **Azure Web App** service for the React frontend.
- Choose the **Runtime Stack** as Node.js (if applicable) for React hosting.
- Configure the **App Service Plan** and ensure both frontend and backend apps use the same region for performance.

---

## 2. Setting Up Azure DevOps Repositories

- Log in to **Azure DevOps** and create a new project for your POS system.
- Create separate **Git repositories** for the React frontend and Django backend in Azure Repos, or use **GitHub** integration with Azure DevOps.
- Push your code for both the React and Django projects to their respective repositories.

---

## 3. Building CI/CD Pipelines in Azure DevOps

# Hosting POS Sales System Using React and Django on Azure DevOps


---

## 1. Setting Up Azure Resources

### Azure Web App for Django Backend:
- Log in to the Azure portal and create an **Azure Web App** for the Django backend.
- Choose the appropriate **Runtime Stack** (e.g., Python 3.x).
- Configure the **App Service Plan** based on the performance and scaling needs.
- Create a **PostgreSQL Database** (if applicable) in Azure, and connect it with your Django app.

### Azure Web App for React Frontend:
- Create another **Azure Web App** service for the React frontend.
- Choose the **Runtime Stack** as Node.js (if applicable) for React hosting.
- Configure the **App Service Plan** and ensure both frontend and backend apps use the same region for performance.

---

## 2. Setting Up Azure DevOps Repositories

- Log in to **Azure DevOps** and create a new project for your POS system.
- Create separate **Git repositories** for the React frontend and Django backend in Azure Repos, or use **GitHub** integration with Azure DevOps.
- Push your code for both the React and Django projects to their respective repositories.

---

## 3. Building CI/CD Pipelines in Azure DevOps

### CI/CD Pipeline for Django Backend:
1. In Azure DevOps, go to **Pipelines** and create a new pipeline for the Django backend.
2. Choose your repository and configure the pipeline using the YAML file or the classic editor.
3. Define the pipeline steps:
   - Install dependencies (`pip install -r requirements.txt`).
   - Run Django unit tests.
   - Build the Django application.
   - Deploy the application to the Azure Web App.
   - Connect to the PostgreSQL database.
4. Set up the deployment environment using the following example YAML code:

   ```yaml
   pool:
     vmImage: 'ubuntu-latest'

   steps:
   - task: UsePythonVersion@0
     inputs:
       versionSpec: '3.x'
   - script: |
       pip install -r requirements.txt
       python manage.py migrate
       python manage.py collectstatic --noinput
   - task: AzureWebApp@1
     inputs:
       azureSubscription: 'Your Azure Subscription'
       appName: 'Your Django Web App'
       package: $(System.DefaultWorkingDirectory)/<path to package>


   CI/CD Pipeline for React Frontend:
In Azure DevOps, create a new pipeline for the React frontend.

Configure the pipeline with the following steps:

Install Node.js and React dependencies.
Run React unit tests.
Build the React application.
Deploy the static files to the Azure Web App service.
Example YAML code for the React frontend pipeline:


pool:
  vmImage: 'ubuntu-latest'

steps:
- task: NodeTool@0
  inputs:
    versionSpec: '14.x'
- script: |
    npm install
    npm run build
- task: AzureRmWebAppDeployment@4
  inputs:
    azureSubscription: 'Your Azure Subscription'
    WebAppName: 'Your React Web App'
    packageForLinux: '$(System.DefaultWorkingDirectory)/build'


  
Here’s the process for hosting a POS sales system using React and Django in Azure DevOps, written in markdown:

markdown
Copy code
# Hosting POS Sales System Using React and Django on Azure DevOps

This guide outlines the steps for hosting a Point of Sale (POS) system built with a React frontend and Django backend using Azure DevOps.

---

## 1. Setting Up Azure Resources

### Azure Web App for Django Backend:
- Log in to the Azure portal and create an **Azure Web App** for the Django backend.
- Choose the appropriate **Runtime Stack** (e.g., Python 3.x).
- Configure the **App Service Plan** based on the performance and scaling needs.
- Create a **PostgreSQL Database** (if applicable) in Azure, and connect it with your Django app.

### Azure Web App for React Frontend:
- Create another **Azure Web App** service for the React frontend.
- Choose the **Runtime Stack** as Node.js (if applicable) for React hosting.
- Configure the **App Service Plan** and ensure both frontend and backend apps use the same region for performance.

---

## 2. Setting Up Azure DevOps Repositories

- Log in to **Azure DevOps** and create a new project for your POS system.
- Create separate **Git repositories** for the React frontend and Django backend in Azure Repos, or use **GitHub** integration with Azure DevOps.
- Push your code for both the React and Django projects to their respective repositories.

---

# 3. Building CI/CD Pipelines in Azure DevOps

### CI/CD Pipeline for Django Backend:
1. In Azure DevOps, go to **Pipelines** and create a new pipeline for the Django backend.
2. Choose your repository and configure the pipeline using the YAML file or the classic editor.
3. Define the pipeline steps:
   - Install dependencies (`pip install -r requirements.txt`).
   - Run Django unit tests.
   - Build the Django application.
   - Deploy the application to the Azure Web App.
   - Connect to the PostgreSQL database.
4. Set up the deployment environment using the following example YAML code:

   ```yaml
   pool:
     vmImage: 'ubuntu-latest'

   steps:
   - task: UsePythonVersion@0
     inputs:
       versionSpec: '3.x'
   - script: |
       pip install -r requirements.txt
       python manage.py migrate
       python manage.py collectstatic --noinput
   - task: AzureWebApp@1
     inputs:
       azureSubscription: 'Your Azure Subscription'
       appName: 'Your Django Web App'
       package: $(System.DefaultWorkingDirectory)/<path to package>
CI/CD Pipeline for React Frontend:
In Azure DevOps, create a new pipeline for the React frontend.

Configure the pipeline with the following steps:

Install Node.js and React dependencies.
Run React unit tests.
Build the React application.
Deploy the static files to the Azure Web App service.
Example YAML code for the React frontend pipeline:

yaml
Copy code
pool:
  vmImage: 'ubuntu-latest'

steps:
- task: NodeTool@0
  inputs:
    versionSpec: '14.x'
- script: |
    npm install
    npm run build
- task: AzureRmWebAppDeployment@4
  inputs:
    azureSubscription: 'Your Azure Subscription'
    WebAppName: 'Your React Web App'
    packageForLinux: '$(System.DefaultWorkingDirectory)/build'
4. Database Connection and Environment Variables
In Azure Web App service for Django, configure environment variables for database connection, secret keys, and other configuration settings.
Ensure that the React frontend has the correct API endpoint for the Django backend.
5. Running and Monitoring the Application
After deploying, use Azure Monitor, Application Insights, and Log Analytics to track the performance of both frontend and backend services.
Set up alerts for downtime, errors, or performance degradation.
Scale the apps by adjusting the App Service Plan settings based on traffic.

Here’s the markdown format for pushing changes from different developer repositories to a single main branch and triggering a build using Azure DevOps:

markdown
Copy code
# How to Push Latest Changes from Developer Repositories to Main Branch and Trigger a Build in Azure DevOps

---

## 1. Ensure Each Developer Branch is Up-to-Date

Before merging, ensure that each developer's branch has the latest changes from the main branch.

### Steps for Developers:
1. **Pull Latest Changes from Main Branch:**
   ```bash
   git checkout <developer-branch>
   git pull origin main
Resolve Merge Conflicts (if any) in the local branch.
Push the Updated Developer Branch to Remote:
bash
Copy code
git push origin <developer-branch>
2. Merge Developer Branches to Main
After all developer branches are up-to-date, merge them into the main branch.

Using Azure DevOps Pull Requests:
In Azure DevOps, navigate to Repos > Pull Requests.
Create a new pull request:
Select the developer branch as the source and main branch as the target.
Add reviewers and required comments.
Review and approve the pull request to merge the changes into the main branch.
Resolve any merge conflicts (if any) within the Azure DevOps UI or locally and update the pull request.
Alternatively, merge manually via Git:

Manual Merge Process:
Checkout Main Branch Locally:
bash
Copy code
git checkout main
Merge Developer Branch into Main:
bash
Copy code
git merge <developer-branch>
Push the Updated Main Branch:
bash
Copy code
git push origin main
3. Set Up CI Pipeline for Automated Build
Ensure you have an Azure DevOps pipeline configured to trigger automatically when changes are pushed to the main branch.

Create/Modify CI Pipeline:
Navigate to Azure DevOps > Pipelines.
Set up a new pipeline or modify an existing pipeline to run on the main branch:
Go to the Triggers section.
Enable the option for Continuous Integration.
Select the main branch as the trigger.
Example YAML code to trigger a build when changes are pushed to main:

yaml
Copy code
trigger:
  branches:
    include:
      - main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: NodeTool@0
  inputs:
    versionSpec: '14.x'
- script: |
    npm install
    npm run build
- task: CopyFiles@2
  inputs:
    SourceFolder: 'build'
    Contents: '**'
    TargetFolder: '$(Build.ArtifactStagingDirectory)'
- task: PublishBuildArtifacts@1
  inputs:
    pathToPublish: '$(Build.ArtifactStagingDirectory)'
    artifactName: 'drop'
4. Trigger the Build After Merging
Once the pull requests are merged into the main branch, Azure DevOps will automatically trigger the CI pipeline based on the above configuration.

To Manually Trigger the Build:
Go to Pipelines in Azure DevOps.
Select the pipeline for your project.
Click Run Pipeline and select the main branch to build the latest version.
5. Monitor Build and Deployment
Monitor the build status in Azure DevOps > Pipelines > Runs.
Check for any build errors or warnings in the pipeline logs.
Once the build succeeds, proceed with the deployment to the appropriate environment.
