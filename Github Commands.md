# Github Commands

# 🔧 Setup & Configuration

Essential commands for setting up Git and getting started with version control.

```bash
git config --global user.name "Your Name"
```

Sets your username globally for all Git repositories on your machine. This should match your GitHub username.

```bash
git config --global user.email "you@example.com"
```

Configures the email address associated with your Git commits. Should match your GitHub email.

```bash
git config --list
```

Displays all your Git configuration settings. Useful for verifying your setup.

```bash
git init
```

Creates a new Git repository in your current directory. This adds a hidden .git folder to track changes.

```bash
git clone <repo-url>
```

Downloads a complete copy of a remote repository, including all branches and commit history.

## Workflow: Setting up a new project

1. Create a new directory for your project: `mkdir my-project`
2. Navigate to the project directory: `cd my-project`
3. Initialize Git: `git init`
4. Configure your identity:
    
    ```bash
    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"
    ```
    
5. Create your first file: `touch README.md`
6. Stage and commit:
    
    ```bash
    git add README.md
    git commit -m "Initial commit"
    ```
    

# 📂 Staging & Committing

Commands for tracking changes and creating commits in your repository.

```bash
git status
```

Shows the current state of your working directory - which files are modified, staged, or untracked.

```bash
git add <file>
```

Stages specific files for commit. You can specify multiple files or use patterns.

```bash
git add .
```

Stages all modified and new files in the current directory and subdirectories.

```bash
git commit -m "message"
```

Creates a new commit with all staged changes and a descriptive message.

```bash
git commit -am "message"
```

Combines git add and git commit for already tracked files (won't include new files).

## Workflow: Making changes and committing

1. Check status to see what's changed: `git status`
2. Review your changes: `git diff`
3. Stage specific files or all changes:
    
    ```bash
    git add specific-file.txt    # For specific files
    git add .                  # For all changes
    ```
    
4. Commit with a meaningful message:
    
    ```bash
    git commit -m "Add user authentication feature"
    ```
    

# 🔄 Branching

Commands for creating and managing different lines of development.

```bash
git branch
```

Lists all local branches. The current branch is marked with an asterisk.

```bash
git branch <branch-name>
```

Creates a new branch from your current HEAD position.

```bash
git checkout <branch-name>
```

Switches to the specified branch and updates your working directory.

```bash
git checkout -b <branch-name>
```

Creates a new branch and switches to it immediately - combines branch and checkout commands.

```bash
git branch -d <branch-name>
```

Deletes a branch after its changes have been merged.

## Workflow: Feature branch development

1. Create and switch to a feature branch:
    
    ```bash
    git checkout -b feature/user-login
    ```
    
2. Make changes and commit them:
    
    ```bash
    git add .
    git commit -m "Implement user login form"
    ```
    
3. Push branch to remote:
    
    ```bash
    git push -u origin feature/user-login
    ```
    
4. Switch back to main branch when done:
    
    ```bash
    git checkout main
    ```
    
5. Delete branch after merging:
    
    ```bash
    git branch -d feature/user-login
    ```
    

# 🚀 Pushing & Pulling

Commands for synchronizing your local repository with a remote repository.

```bash
git push origin <branch>
```

Uploads your local branch commits to the remote repository.

```bash
git push -u origin <branch>
```

Pushes and sets up tracking between local and remote branches.

```bash
git pull
```

Downloads changes from the remote repository and merges them into your current branch.

```bash
git fetch
```

Downloads changes from remote but doesn't merge them - allows you to review changes first.

## Workflow: Collaborating with a team

1. Get latest changes from remote:
    
    ```bash
    git pull origin main
    ```
    
2. Create a feature branch:
    
    ```bash
    git checkout -b feature/new-feature
    ```
    
3. Make and commit changes:
    
    ```bash
    git add .
    git commit -m "Add new feature"
    ```
    
4. Push changes to remote:
    
    ```bash
    git push -u origin feature/new-feature
    ```
    

# 🔁 Merging & Rebasing

Commands for integrating changes from different branches.

```bash
git merge <branch>
```

Combines changes from specified branch into current branch.

```bash
git rebase <branch>
```

Reapplies commits on top of another base tip - creates a linear history.

```bash
git rebase -i HEAD~3
```

Interactive rebase for editing, squashing, or dropping recent commits.

```bash
git cherry-pick <commit>
```

Applies changes from a specific commit to your current branch.

## Workflow: Clean up feature branch before merging

1. Update main branch:
    
    ```bash
    git checkout main
    git pull origin main
    ```
    
2. Rebase feature branch:
    
    ```bash
    git checkout feature/new-feature
    git rebase main
    ```
    
3. Squash commits if needed:
    
    ```bash
    git rebase -i HEAD~3
    ```
    
4. Merge into main:
    
    ```bash
    git checkout main
    git merge feature/new-feature
    ```
    

# 🧼 Undoing Changes

Commands for correcting mistakes and reverting changes.

```bash
git reset <file>
```

Unstages a file while preserving its contents.

```bash
git reset --hard
```

Resets working directory to last commit. WARNING: Discards all local changes!

```bash
git revert <commit>
```

Creates a new commit that undoes changes from a specific commit.

## Workflow: Fixing mistakes

1. For unstaged changes:
    
    ```bash
    git checkout -- <file>
    ```
    
2. For staged changes:
    
    ```bash
    git reset <file>
    git checkout -- <file>
    ```
    
3. For committed changes:
    
    ```bash
    git revert <commit-hash>
    ```
    

# 🔍 Logs & History

Commands for viewing and analyzing repository history.

```bash
git log
```

Shows commit history with details like author, date, and message.

```bash
git log --oneline
```

Displays condensed commit history, one line per commit.

```bash
git diff
```

Shows changes between working directory and last commit.

# 🌐 Remote Repositories

Commands for managing connections to remote repositories.

```bash
git remote -v
```

Lists all remote repositories and their URLs.

```bash
git remote add origin <url>
```

Adds a new remote repository connection.

## Workflow: Setting up remote repository

1. Create GitHub repository
2. Add remote to local repo:
    
    ```bash
    git remote add origin <repository-url>
    ```
    
3. Push existing code:
    
    ```bash
    git push -u origin main
    ```
    

# ✅ Advanced Workflow

Advanced Git commands for specific scenarios.

```bash
git tag <tagname>
```

Creates a lightweight tag for marking specific points in history.

```bash
git bisect
```

Helps find which commit introduced a bug using binary search.

## Workflow: Creating a release

1. Create and annotate a tag:
    
    ```bash
    git tag -a v1.0.0 -m "Version 1.0.0 release"
    ```
    
2. Push tag to remote:
    
    ```bash
    git push origin v1.0.0
    ```
    
3. Push all tags:
    
    ```bash
    git push origin --tags
    ```
    

# 🔒 Security Best Practices

Essential security commands and practices for protecting your Git repository.

```bash
git config --global credential.helper store
```

Securely stores your credentials to avoid typing them repeatedly.

```bash
git secret
```

A tool for encrypting sensitive files in your repository.

## Workflow: Managing sensitive data

1. Create a .gitignore file to exclude sensitive files:
    
    ```bash
    # Add patterns for sensitive files
    *.env
    secrets/
    credentials.json
    ```
    
2. Use environment variables for sensitive data:
    
    ```bash
    export API_KEY="your-secret-key"
    echo "API_KEY=$API_KEY" >> .env
    ```
    
3. Verify sensitive files are ignored:
    
    ```bash
    git status
    git check-ignore sensitive-file.txt
    ```
    

# 🤝 Contributing Guidelines

Best practices for contributing to Git repositories and working with teams.

```bash
git fork
```

Creates a personal copy of someone else's repository on GitHub.

```bash
git clone &lt;forked-repo-url&gt;
```

Downloads your forked repository to work on locally.

## Workflow: Contributing to open source

1. Fork the repository on GitHub
2. Clone your fork locally:
    
    ```bash
    git clone https://github.com/yourusername/repository.git
    ```
    
3. Create a feature branch:
    
    ```bash
    git checkout -b feature/new-contribution
    ```
    
4. Make changes and commit them:
    
    ```bash
    git add .
    git commit -m "Add new feature"
    ```
    
5. Push changes to your fork:
    
    ```bash
    git push origin feature/new-contribution
    ```
    
6. Create a pull request on GitHub

# 🎯 Final Tips

Remember to always keep your Git commands handy and practice them regularly. The more you use version control, the more natural it becomes as part of your development workflow. Start with the basic commands and gradually incorporate more advanced features as you become comfortable.