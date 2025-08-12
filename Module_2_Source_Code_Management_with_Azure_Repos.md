# Module 2: Source Code Management with Azure Repos

## 2.1 Git Fundamentals

### 2.1.1 Git Architecture Deep Dive

#### Working Directory, Staging Area, and Repository
**What it means:** Git uses a three-stage architecture to manage changes in your codebase.

**Three Areas:**
1. **Working Directory:** Where you edit files (your project folder)
2. **Staging Area:** Where you prepare changes for commit
3. **Repository:** Where Git stores committed changes permanently

**Visual Representation:**
```
Working Directory    Staging Area        Repository
     (Files)           (Index)         (.git folder)
        │                  │                │
        │                  │                │
   Modified files    Staged changes    Committed history
        │                  │                │
        │                  │                │
   git add ──────────────→│                │
        │                  │                │
        │                  │git commit ────→│
        │                  │                │
        │                  │                │
   git checkout ──────────│                │
        │                  │                │
        │                  │                │
   git reset HEAD ────────│                │
```

**Practical Example:**
```bash
# Working Directory - You edit a file
echo "New feature added" >> feature.txt

# Staging Area - Add changes to staging
git add feature.txt

# Repository - Commit staged changes
git commit -m "Add new feature"

# Check status at each stage
git status
# Shows: modified: feature.txt (staged)

git commit -m "Add new feature"
# Shows: [main abc1234] Add new feature

git status
# Shows: working tree clean
```

#### Git Objects (Blobs, Trees, Commits, Tags)
**Git Object Types:**

1. **Blobs:** Store file content
2. **Trees:** Store directory structure and file references
3. **Commits:** Store metadata about changes
4. **Tags:** Store references to specific commits

**Object Relationships:**
```
Commit Object
├── Tree Object (root directory)
│   ├── Blob Object (file1.txt content)
│   ├── Blob Object (file2.txt content)
│   └── Tree Object (subdirectory)
│       ├── Blob Object (file3.txt content)
│       └── Blob Object (file4.txt content)
└── Parent Commit (previous commit)
```

**Example - Git Object Inspection:**
```bash
# Create a simple repository
mkdir git-demo && cd git-demo
git init
echo "Hello World" > hello.txt
git add hello.txt
git commit -m "Initial commit"

# View commit object
git show --pretty=raw HEAD
# Shows commit metadata and tree reference

# View tree object
git ls-tree HEAD
# Shows directory structure

# View blob object
git show HEAD:hello.txt
# Shows file content
```

#### Git References and HEAD
**References:**
- **HEAD:** Points to current branch or commit
- **Branches:** Named references to commits
- **Tags:** Named references to specific commits
- **Remote References:** References to remote branches

**HEAD Movement:**
```bash
# HEAD points to main branch
git branch
# Shows: * main

# HEAD points to specific commit (detached HEAD)
git checkout abc1234
# HEAD now points to commit abc1234

# HEAD points back to main branch
git checkout main
# HEAD points to main branch again

# HEAD moves with new commits
echo "New content" >> hello.txt
git add hello.txt
git commit -m "Update hello.txt"
# HEAD now points to new commit
```

**Reference Examples:**
```bash
# View all references
git show-ref

# View HEAD reference
cat .git/HEAD
# Shows: ref: refs/heads/main

# View branch reference
cat .git/refs/heads/main
# Shows: abc1234... (commit hash)

# View remote reference
cat .git/refs/remotes/origin/main
# Shows: def5678... (remote commit hash)
```

### 2.1.2 Advanced Git Commands

#### Interactive Rebasing
**What it means:** Interactively rewriting commit history by combining, editing, or reordering commits.

**Use Cases:**
- Clean up commit history before merging
- Combine multiple small commits
- Reorder commits for better flow
- Edit commit messages

**Example - Interactive Rebase:**
```bash
# Start interactive rebase for last 3 commits
git rebase -i HEAD~3

# Git opens editor with:
pick abc1234 First commit
pick def5678 Second commit
pick ghi9012 Third commit

# Change to:
pick abc1234 First commit
squash def5678 Second commit
squash ghi9012 Third commit

# Result: 3 commits combined into 1
```

**Interactive Rebase Options:**
```
pick   - Use commit as-is
reword - Edit commit message
edit   - Stop for amending
squash - Combine with previous commit
fixup  - Combine with previous commit, discard message
drop   - Remove commit
```

**Real-world Scenario:**
```bash
# Before: Messy commit history
git log --oneline
# abc1234 Add user authentication
# def5678 Fix typo in README
# ghi9012 Add password validation
# jkl3456 Fix another typo
# mno6789 Add email verification

# Interactive rebase to clean up
git rebase -i HEAD~5

# After: Clean commit history
git log --oneline
# abc1234 Add user authentication system
# ghi9012 Add email verification
```

#### Cherry-picking and Reverting
**Cherry-picking:** Apply specific commits from one branch to another.

**Example - Cherry-pick:**
```bash
# Create feature branch
git checkout -b feature-branch

# Make some commits
echo "Feature A" > feature-a.txt
git add feature-a.txt
git commit -m "Add feature A"

echo "Feature B" > feature-b.txt
git add feature-b.txt
git commit -m "Add feature B"

# Switch to main branch
git checkout main

# Cherry-pick only feature A
git cherry-pick abc1234
# Applies only the "Add feature A" commit

# Check result
git log --oneline
# Shows: feature A commit added to main
```

**Reverting:** Create new commits that undo previous changes.

**Example - Revert:**
```bash
# Make a commit
echo "Important change" >> important.txt
git add important.txt
git commit -m "Add important change"

# Later, decide to revert this change
git revert HEAD
# Creates new commit that undoes the change

# Check result
git log --oneline
# Shows: revert commit added
cat important.txt
# Shows: original content (change was undone)
```

**Cherry-pick vs Revert:**
```
Cherry-pick:
- Applies specific commits to current branch
- Useful for backporting fixes
- Preserves commit history
- Can cause conflicts

Revert:
- Undoes specific commits
- Safe for shared branches
- Preserves commit history
- Creates new commit
```

#### Stashing and Cleaning
**Stashing:** Temporarily save uncommitted changes.

**Example - Stash:**
```bash
# Make changes but not ready to commit
echo "Work in progress" >> work.txt
git add work.txt

# Need to switch branches urgently
git stash push -m "WIP: user authentication"

# Switch to another branch
git checkout hotfix-branch

# Fix urgent issue
echo "Critical fix" >> fix.txt
git add fix.txt
git commit -m "Fix critical issue"

# Return to original branch
git checkout feature-branch

# Restore stashed changes
git stash pop
# Changes are restored to working directory
```

**Stash Options:**
```bash
# Stash with message
git stash push -m "Descriptive message"

# Stash specific files
git stash push -m "WIP" file1.txt file2.txt

# List stashes
git stash list

# Apply specific stash
git stash apply stash@{1}

# Drop specific stash
git stash drop stash@{1}

# Clear all stashes
git stash clear
```

**Cleaning:** Remove untracked files and directories.

**Example - Clean:**
```bash
# See what would be cleaned
git clean -n
# Shows: Would remove temp.txt, build/

# Clean untracked files
git clean -f
# Removes untracked files

# Clean untracked files and directories
git clean -fd
# Removes untracked files and directories

# Interactive cleaning
git clean -i
# Interactive mode to choose what to remove
```

### 2.1.3 Git Workflow Patterns

#### Centralized Workflow
**What it means:** Single central repository where all developers push and pull changes.

**Characteristics:**
- Single remote repository
- All developers work on main branch
- Simple but can cause conflicts
- Good for small teams

**Example - Centralized Workflow:**
```bash
# Clone central repository
git clone https://dev.azure.com/company/project/_git/repo

# Make changes
echo "New feature" >> feature.txt
git add feature.txt
git commit -m "Add new feature"

# Push to central repository
git push origin main

# Other developers pull changes
git pull origin main
```

**Pros and Cons:**
```
Pros:
- Simple to understand
- Easy to manage
- Clear history

Cons:
- Can cause conflicts
- No feature isolation
- Difficult to experiment
```

#### Feature Branch Workflow
**What it means:** Create separate branches for each feature or fix.

**Characteristics:**
- Main branch always contains production-ready code
- Feature branches for development
- Pull requests for code review
- Merge when feature is complete

**Example - Feature Branch Workflow:**
```bash
# Start from main branch
git checkout main
git pull origin main

# Create feature branch
git checkout -b feature/user-authentication

# Make changes
echo "User login form" >> login.html
git add login.html
git commit -m "Add user login form"

echo "Authentication logic" >> auth.js
git add auth.js
git commit -m "Add authentication logic"

# Push feature branch
git push origin feature/user-authentication

# Create pull request in Azure DevOps
# After review and approval, merge to main
```

**Branch Naming Conventions:**
```
feature/user-authentication
feature/shopping-cart
bugfix/login-error
hotfix/security-patch
release/v2.0.0
```

#### GitFlow Workflow
**What it means:** Strict branching model with multiple branch types and release management.

**Branch Types:**
- **main:** Production code
- **develop:** Development integration
- **feature:** Individual features
- **release:** Release preparation
- **hotfix:** Production fixes

**Example - GitFlow Workflow:**
```bash
# Start feature from develop
git checkout develop
git pull origin develop
git checkout -b feature/user-profile

# Work on feature
echo "User profile page" >> profile.html
git add profile.html
git commit -m "Add user profile page"

# Complete feature
git checkout develop
git pull origin develop
git merge feature/user-profile
git push origin develop

# Create release branch
git checkout -b release/v1.2.0
# Make release-specific changes
git commit -m "Update version to 1.2.0"

# Merge to main and develop
git checkout main
git merge release/v1.2.0
git tag v1.2.0

git checkout develop
git merge release/v1.2.0

# Delete release branch
git branch -d release/v1.2.0
```

**GitFlow Diagram:**
```
main     ●────────●────────●────────●
         │        │        │        │
develop  ●────────●────────●────────●
         │        │        │        │
feature  ●────────●        │        │
         │                 │        │
release  │        ●────────●        │
         │        │                 │
hotfix   │        │        ●────────●
```

#### Trunk-Based Development
**What it means:** All developers work on the main branch (trunk) with short-lived feature branches.

**Characteristics:**
- Main branch is always deployable
- Short-lived feature branches
- Continuous integration
- Frequent small commits

**Example - Trunk-Based Development:**
```bash
# Start from main
git checkout main
git pull origin main

# Create short-lived feature branch
git checkout -b feature/quick-fix

# Make small, focused changes
echo "Fix typo" >> README.md
git add README.md
git commit -m "Fix typo in README"

# Push and create pull request
git push origin feature/quick-fix

# Merge quickly after review
git checkout main
git pull origin main
git merge feature/quick-fix
git push origin main

# Delete feature branch
git branch -d feature/quick-fix
```

**Benefits:**
```
- Faster integration
- Reduced merge conflicts
- Continuous deployment ready
- Simpler branch management
```

## 2.2 Azure Repos

### 2.2.1 Repository Management

#### Repository Templates and Initialization
**What it means:** Using predefined templates to quickly set up new repositories with common structure and files.

**Built-in Templates:**
- **Basic:** Empty repository
- **ASP.NET Core:** .NET web application template
- **Node.js:** Node.js application template
- **Python:** Python application template
- **React:** React frontend template

**Example - Repository Template:**
```bash
# Create repository from ASP.NET Core template
# Template includes:
├── .gitignore
├── README.md
├── src/
│   ├── ProjectName/
│   │   ├── Controllers/
│   │   ├── Models/
│   │   ├── Views/
│   │   └── Program.cs
├── tests/
│   └── ProjectName.Tests/
├── ProjectName.sln
└── ProjectName.csproj
```

**Custom Template Creation:**
```yaml
# Template definition file
name: "Custom Web App Template"
description: "Template for custom web applications"
files:
  - path: ".gitignore"
    content: |
      # Dependencies
      node_modules/
      .pnp
      .pnp.js
      
      # Production builds
      build/
      dist/
      
      # Environment variables
      .env
      .env.local
      
      # IDE files
      .vscode/
      .idea/
      
      # OS files
      .DS_Store
      Thumbs.db

  - path: "README.md"
    content: |
      # Project Name
      
      ## Description
      Brief description of the project
      
      ## Getting Started
      Instructions for setup and development
      
      ## Contributing
      Guidelines for contributing to the project

  - path: "src/"
    type: "directory"
    
  - path: "tests/"
    type: "directory"
    
  - path: "docs/"
    type: "directory"
```

#### Repository Settings and Configuration
**What it means:** Configuring repository behavior, policies, and integrations.

**Repository Settings:**
```yaml
# Repository configuration
name: "web-application"
description: "Main web application for the company"
defaultBranch: "main"
allowForking: true
allowSquashMerge: true
allowRebaseMerge: true
allowAutoMerge: false

# Branch policies
branchPolicies:
  main:
    requiredReviewers: 2
    requiredStatusChecks:
      - "Build"
      - "Unit Tests"
      - "Security Scan"
    restrictions:
      - "No force push"
      - "No deletion"

# Integrations
integrations:
  - type: "Azure Pipelines"
    enabled: true
  - type: "SonarQube"
    enabled: true
  - type: "Dependabot"
    enabled: true
```

**Security Settings:**
```yaml
# Security configuration
security:
  # Access control
  permissions:
    - group: "Developers"
      permission: "Contribute"
    - group: "Reviewers"
      permission: "Contribute + Review"
    - group: "Administrators"
      permission: "Full"
  
  # Branch protection
  branchProtection:
    main:
      requirePullRequestReviews: true
      requiredApprovingReviewCount: 2
      dismissStaleApprovals: true
      requireCodeOwnerReviews: true
      requireLastPushApproval: true
      
  # Vulnerability scanning
  vulnerabilityScanning:
    enabled: true
    schedule: "daily"
    severityThreshold: "medium"
```

#### Repository Permissions and Security
**What it means:** Controlling who can access and modify repository content.

**Permission Levels:**
```
Read: View code, download, clone
Contribute: Read + create branches, submit PRs
Contribute + Review: Contribute + approve PRs
Full: All permissions including delete
```

**Example - Permission Matrix:**
```yaml
# Permission configuration
permissions:
  # Project Administrators
  - group: "Project Administrators"
    permission: "Full"
    
  # Development Team
  - group: "Developers"
    permission: "Contribute"
    
  # Quality Assurance Team
  - group: "QA Engineers"
    permission: "Contribute + Review"
    
  # External Contractors
  - group: "Contractors"
    permission: "Read"
    expiration: "2024-12-31"
    
  # Security Team
  - group: "Security Engineers"
    permission: "Full"
    scope: "security-related files only"
```

**Security Policies:**
```yaml
# Security policies
securityPolicies:
  # Code signing
  requireSignedCommits: true
  allowedSigners:
    - "company-certificate"
    - "verified-developers"
    
  # Dependency scanning
  dependencyScanning:
    enabled: true
    failOnHighVulnerability: true
    autoUpdate: false
    
  # Secret scanning
  secretScanning:
    enabled: true
    patterns:
      - "AWS_ACCESS_KEY_ID"
      - "AZURE_CLIENT_SECRET"
      - "GOOGLE_API_KEY"
      - "DATABASE_PASSWORD"
      
  # Branch protection
  branchProtection:
    requireLinearHistory: true
    requireSignedCommits: true
    requireStatusChecks: true
    requireConversationResolution: true
```

#### Repository Backup and Recovery
**What it means:** Ensuring repository data is safely backed up and can be recovered if needed.

**Backup Strategies:**
```yaml
# Backup configuration
backup:
  # Local backup
  local:
    enabled: true
    location: "/backup/repositories"
    schedule: "daily"
    retention: "30 days"
    
  # Azure Storage backup
  azure:
    enabled: true
    storageAccount: "company-backup"
    container: "repository-backups"
    schedule: "daily"
    retention: "1 year"
    
  # Cross-region replication
  replication:
    enabled: true
    regions:
      - "East US"
      - "West Europe"
      - "Southeast Asia"
    schedule: "hourly"
```

**Recovery Procedures:**
```bash
# Repository recovery process
# 1. Stop all access to repository
git remote remove origin

# 2. Restore from backup
git clone --mirror /backup/repositories/project.git
cd project.git

# 3. Verify backup integrity
git fsck --full

# 4. Restore to Azure DevOps
git push --mirror https://dev.azure.com/company/project/_git/project

# 5. Verify restoration
git clone https://dev.azure.com/company/project/_git/project
cd project
git log --oneline
```

**Backup Verification:**
```bash
# Verify backup integrity
git verify-pack -v .git/objects/pack/*.idx

# Check for corrupted objects
git fsck --full

# Verify commit history
git log --oneline --all

# Test clone from backup
git clone --mirror /backup/repositories/project.git test-restore
cd test-restore
git log --oneline
```

### 2.2.2 Advanced Branch Management

#### Branch Policies and Protection Rules
**What it means:** Setting rules that govern how branches can be modified and merged.

**Branch Policy Types:**
```yaml
# Branch policy configuration
branchPolicies:
  main:
    # Required reviewers
    requiredReviewers:
      count: 2
      groups:
        - "Senior Developers"
        - "Architecture Team"
      users:
        - "tech-lead@company.com"
        
    # Required status checks
    requiredStatusChecks:
      - name: "Build"
        source: "Azure Pipelines"
      - name: "Unit Tests"
        source: "Azure Pipelines"
      - name: "Security Scan"
        source: "SonarQube"
      - name: "Code Coverage"
        source: "Azure Pipelines"
        threshold: 80
        
    # Work item linking
    workItemLinking:
      required: true
      types:
        - "User Story"
        - "Bug"
        - "Task"
        
    # Comment requirements
    commentRequirements:
      required: true
      minimumLength: 10
```

**Protection Rules:**
```yaml
# Branch protection rules
protectionRules:
  main:
    # Prevent force push
    allowForcePush: false
    
    # Prevent deletion
    allowDeletion: false
    
    # Require up-to-date branches
    requireUpToDate: true
    
    # Require linear history
    requireLinearHistory: true
    
    # Require signed commits
    requireSignedCommits: true
    
    # Require conversation resolution
    requireConversationResolution: true
    
    # Require merge queue
    requireMergeQueue: true
```

**Example - Policy Implementation:**
```bash
# Check branch protection status
git push origin feature/new-feature
# Fails if branch policies not met

# View required status checks
git status
# Shows: Branch is 2 commits behind 'origin/main'

# Update branch
git pull origin main
git push origin feature/new-feature

# Create pull request
# System checks:
# - Build passes ✅
# - Tests pass ✅
# - Security scan passes ✅
# - Code coverage > 80% ✅
# - 2 reviewers approve ✅
# - Work item linked ✅

# Merge allowed
```

#### Required Reviewers and Approvers
**What it means:** Specifying who must review and approve changes before they can be merged.

**Reviewer Configuration:**
```yaml
# Reviewer configuration
reviewers:
  # Required reviewers
  required:
    count: 2
    groups:
      - "Senior Developers"
      - "Architecture Team"
    users:
      - "tech-lead@company.com"
      - "security-engineer@company.com"
      
  # Optional reviewers
  optional:
    groups:
      - "QA Team"
      - "DevOps Team"
    users:
      - "product-manager@company.com"
      
  # Code owners
  codeOwners:
    - path: "src/security/"
      owners:
        - "security-team@company.com"
        - "security-lead@company.com"
        
    - path: "src/database/"
      owners:
        - "database-team@company.com"
        
    - path: "docs/"
      owners:
        - "technical-writers@company.com"
```

**Approval Process:**
```yaml
# Approval process
approvalProcess:
  # Minimum approvals
  minimumApprovals: 2
  
  # Required approvers
  requiredApprovers:
    - group: "Senior Developers"
      count: 1
    - group: "Architecture Team"
      count: 1
      
  # Approval rules
  rules:
    - name: "Security Changes"
      condition: "path contains 'security/'"
      requiredApprovers:
        - "security-lead@company.com"
        
    - name: "Database Changes"
      condition: "path contains 'database/'"
      requiredApprovers:
        - "database-lead@company.com"
        
    - name: "Breaking Changes"
      condition: "title contains 'BREAKING'"
      requiredApprovers:
        - "tech-lead@company.com"
        - "product-manager@company.com"
```

**Review Workflow:**
```bash
# Pull request review process
# 1. Developer creates pull request
git push origin feature/new-feature
# Create PR in Azure DevOps

# 2. System assigns required reviewers
# - Senior Developer: john.doe@company.com
# - Architecture Team: arch-team@company.com

# 3. Reviewers receive notifications
# - Email notification
# - Azure DevOps notification
# - Team chat notification

# 4. Review process
# - Code review
# - Comments and suggestions
# - Request changes if needed

# 5. Approval
# - Both required reviewers approve
# - All status checks pass
# - Merge button becomes available

# 6. Merge
# - Squash and merge
# - Delete feature branch
# - Update work items
```

#### Build Validation Requirements
**What it means:** Requiring that automated builds and tests pass before code can be merged.

**Build Validation Types:**
```yaml
# Build validation configuration
buildValidation:
  # Required builds
  required:
    - name: "CI Build"
      source: "Azure Pipelines"
      branch: "main"
      path: "azure-pipelines-ci.yml"
      
    - name: "Security Scan"
      source: "SonarQube"
      branch: "main"
      
    - name: "Dependency Check"
      source: "OWASP Dependency Check"
      branch: "main"
      
  # Optional builds
  optional:
    - name: "Performance Tests"
      source: "Azure Pipelines"
      branch: "main"
      path: "azure-pipelines-perf.yml"
      
    - name: "Integration Tests"
      source: "Azure Pipelines"
      branch: "main"
      path: "azure-pipelines-integration.yml"
```

**Build Pipeline Integration:**
```yaml
# Azure Pipeline for build validation
trigger:
- main
- feature/*

pool:
  vmImage: 'ubuntu-latest'

variables:
  solution: '**/*.sln'
  buildPlatform: 'Any CPU'
  buildConfiguration: 'Release'

stages:
- stage: Build
  displayName: 'Build and Test'
  jobs:
  - job: Build
    steps:
    - task: DotNetCoreCLI@2
      inputs:
        command: 'restore'
        projects: '$(solution)'
        
    - task: DotNetCoreCLI@2
      inputs:
        command: 'build'
        projects: '$(solution)'
        arguments: '--configuration $(buildConfiguration)'
        
    - task: DotNetCoreCLI@2
      inputs:
        command: 'test'
        projects: '**/*Tests/*.csproj'
        arguments: '--configuration $(buildConfiguration) --collect:"XPlat Code Coverage"'
        
    - task: PublishTestResults@2
      inputs:
        testResultsFormat: 'VSTest'
        testResultsFiles: '**/*.trx'
        
    - task: PublishCodeCoverageResults@1
      inputs:
        codeCoverageTool: 'Cobertura'
        summaryFileLocation: '**/coverage.cobertura.xml'
```

**Status Check Integration:**
```bash
# Status check workflow
# 1. Developer pushes changes
git push origin feature/new-feature

# 2. Azure DevOps triggers builds
# - CI Build starts
# - Security Scan starts
# - Dependency Check starts

# 3. Builds run and report status
# - CI Build: ✅ Passed
# - Security Scan: ✅ Passed
# - Dependency Check: ❌ Failed

# 4. Developer fixes dependency issue
# - Update vulnerable package
# - Commit fix
# - Push changes

# 5. Builds run again
# - CI Build: ✅ Passed
# - Security Scan: ✅ Passed
# - Dependency Check: ✅ Passed

# 6. All status checks pass
# - Pull request can be merged
```

#### Status Checks and Quality Gates
**What it means:** Automated checks that must pass before code can be merged.

**Quality Gate Types:**
```yaml
# Quality gates configuration
qualityGates:
  # Code quality
  codeQuality:
    - name: "SonarQube Quality Gate"
      source: "SonarQube"
      status: "Passed"
      
  # Security
  security:
    - name: "Vulnerability Scan"
      source: "OWASP Dependency Check"
      maxVulnerabilities: 0
      
    - name: "Secret Detection"
      source: "GitGuardian"
      status: "Clean"
      
  # Performance
  performance:
    - name: "Performance Tests"
      source: "Azure Pipelines"
      maxResponseTime: "2 seconds"
      
  # Coverage
  coverage:
    - name: "Code Coverage"
      source: "Azure Pipelines"
      minCoverage: 80
      
  # Documentation
  documentation:
    - name: "API Documentation"
      source: "Swagger"
      status: "Up to date"
```

**Quality Gate Implementation:**
```yaml
# SonarQube quality gate
sonarQube:
  qualityGate:
    conditions:
      - metric: "reliability_rating"
        operator: "LESS_THAN"
        value: "A"
        
      - metric: "security_rating"
        operator: "LESS_THAN"
        value: "A"
        
      - metric: "maintainability_rating"
        operator: "LESS_THAN"
        value: "A"
        
      - metric: "coverage"
        operator: "GREATER_THAN"
        value: "80"
        
      - metric: "duplicated_lines_density"
        operator: "LESS_THAN"
        value: "3"
        
      - metric: "technical_debt_ratio"
        operator: "LESS_THAN"
        value: "5"
```

**Status Check Workflow:**
```bash
# Quality gate workflow
# 1. Code changes trigger quality checks
git push origin feature/new-feature

# 2. Quality gates run
# - SonarQube analysis
# - Security scan
# - Performance tests
# - Coverage analysis

# 3. Results reported
# - Quality gate: ✅ Passed
# - Security: ✅ Clean
# - Performance: ✅ Within limits
# - Coverage: ✅ 85% (above 80% threshold)

# 4. All gates pass
# - Pull request can be merged
# - Quality badge displayed

# 5. If any gate fails
# - Pull request blocked
# - Developer must fix issues
# - Re-run quality checks
```

---

## Summary

This module covers comprehensive source code management with Azure Repos and Git. Key takeaways include:

1. **Git architecture** provides a robust foundation for version control with its three-stage model and object-based storage.

2. **Advanced Git commands** like interactive rebasing, cherry-picking, and stashing enable sophisticated workflow management.

3. **Azure Repos** extends Git with enterprise features including repository templates, advanced branch policies, and integrated quality gates.

4. **Branch management** with policies and protection rules ensures code quality and security while maintaining development velocity.

The examples and detailed explanations demonstrate practical applications of these concepts in real-world development scenarios.
