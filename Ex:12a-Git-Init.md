# Exercise 12 --- Git and GitHub Collaboration Workflow

## Aim
Demonstrate the fundamental Git workflow including repository initialization, branching, committing, and the collaboration process using GitHub (Pull Requests and Merges).

## Environment
``` text
Tool     : Git CLI
Remote   : GitHub (Simulated)
Directory: ~/Desktop/lab/Git_Collaboration
```

------------------------------------------------------------------------

## 1. Repository Setup (12a)
The local repository was initialized and connected to a remote source.

**Commands:**
``` bash
git init
git remote add origin https://github.com/user/retail-project.git
git add .
git commit -m "Initial commit"
git push -u origin main
```

------------------------------------------------------------------------

## 2. Branching and Collaboration (12b)
To avoid disrupting the main codebase, a feature branch was used for new changes.

**Workflow:**
1. **Create Branch**: `git checkout -b feature-analytics`
2. **Make Changes**: Edited `README.md` to add analytics details.
3. **Commit**: `git commit -m "feat: add analytics section to README"`
4. **Switching**: `git checkout main`

------------------------------------------------------------------------

## 3. GitHub Integration (12c)
The final step involves syncing the local work with the remote repository and merging it.

**Process:**
1. **Push**: `git push origin feature-analytics`
2. **Pull Request**: A PR was created on GitHub from `feature-analytics` $\rightarrow$ `main`.
3. **Review**: Changes were reviewed for quality and conflicts.
4. **Merge**: The PR was merged into the main branch.

------------------------------------------------------------------------

