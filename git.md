# Git Masterclass - Complete YouTube Video Script

## "Git from Zero to Hero: The Only Video You'll Ever Need"

**Target Audience:** Freshers, Developers, DevOps Engineers, SREs, QA, anyone in software
**Estimated Duration:** 3.5 - 4 hours (can split into parts)
**Style:** Screen recording + terminal demos + diagrams + interview tips sprinkled throughout

---

# TABLE OF CONTENTS (What We'll Cover)

```
PART 1: FOUNDATION (Freshers Start Here)
  Chapter 1:  What is Git & Why it Exists (History + Mental Model)
  Chapter 2:  Installation & First-Time Setup
  Chapter 3:  Your First Repository (init, add, commit, status)
  Chapter 4:  Understanding the 3 Areas (Working Dir, Staging, Repository)
  Chapter 5:  Viewing History (log, diff, show)

PART 2: BRANCHING & COLLABORATION (Day-to-Day Work)
  Chapter 6:  Branches - The Killer Feature
  Chapter 7:  Merging & Merge Conflicts (with real examples)
  Chapter 8:  Remote Repositories (GitHub/GitLab/Bitbucket)
  Chapter 9:  Pull Requests / Merge Requests (team workflow)
  Chapter 10: Git Fetch vs Pull vs Push (the confusion killer)

PART 3: INTERMEDIATE (Becoming Productive)
  Chapter 11: Stashing - Save Work Without Committing
  Chapter 12: Git Ignore & Keeping Repos Clean
  Chapter 13: Tagging & Releases
  Chapter 14: Aliases & Productivity Hacks
  Chapter 15: Undoing Things (restore, reset, revert - when to use what)

PART 4: ADVANCED (Senior/Lead Level)
  Chapter 16: Rebase - The Scary One Made Simple
  Chapter 17: Interactive Rebase - Rewriting History
  Chapter 18: Cherry-Pick - Surgical Commits
  Chapter 19: Reflog - Git's Safety Net (recover anything)
  Chapter 20: Bisect - Find Bugs Like a Detective
  Chapter 21: Worktrees - Multiple Branches Simultaneously
  Chapter 22: Submodules & Subtrees

PART 5: DevOps & CI/CD (DevOps Engineers Focus Here)
  Chapter 23: Git Hooks (pre-commit, pre-push, commit-msg)
  Chapter 24: Git in CI/CD Pipelines (GitHub Actions, GitLab CI)
  Chapter 25: Branching Strategies (GitFlow, Trunk-Based, GitHub Flow)
  Chapter 26: Monorepo vs Polyrepo
  Chapter 27: Signed Commits & Security
  Chapter 28: Git LFS (Large File Storage)

PART 6: TROUBLESHOOTING & REAL-WORLD (Interview + Job)
  Chapter 29: Common Disasters & How to Fix Them
  Chapter 30: Performance - Handling Large Repos
  Chapter 31: Git Internals (blobs, trees, commits, refs)
  Chapter 32: Top 30 Interview Questions (with answers)
  Chapter 33: Day-to-Day Cheat Sheet
```

---

# PART 1: FOUNDATION

---

## Chapter 1: What is Git & Why it Exists

### SCRIPT:

**[HOOK - First 30 seconds]**

"Have you ever accidentally deleted code and wished you could go back? Have you ever worked on a feature and your teammate overwrites your changes? Or maybe you're preparing for an interview and someone asks 'what is rebase vs merge' and you freeze?

This video fixes ALL of that. We're going from zero — literally installing Git — all the way to advanced topics that senior engineers and DevOps leads use daily. Timestamps are in the description. Let's go."

**[Topic Start]**

"Before we type a single command, let's understand WHY Git exists. Because if you understand the WHY, the commands will make sense forever.

**The Problem (show a diagram):**

- In 2005, Linus Torvalds — yes, the Linux guy — needed a tool to manage Linux kernel development
- Thousands of developers, millions of lines of code
- The tool they were using (BitKeeper) revoked their free license
- So Linus built Git in about 2 weeks. Yes, two weeks.

**What Git Actually Is:**

- A distributed version control system (DVCS)
- Every developer has a FULL copy of the entire history — not just the latest files
- You can work offline, commit locally, and sync later
- It tracks CHANGES, not files

**Mental Model (show diagram):**
Think of Git like a video game with save points:

- You can save your progress anytime (commit)
- You can go back to any save point (checkout)
- You can create parallel timelines (branches)
- You can merge those timelines together (merge)
- And if anything goes wrong, there's almost always a way to recover

This mental model will carry you through the entire video."

**[INTERVIEW TIP #1]**

> "If someone asks 'What is Git?' in an interview, don't just say 'version control.' Say:
> 'Git is a distributed version control system where every developer has a complete copy of the repository including its full history. It was created by Linus Torvalds in 2005 for Linux kernel development. It's distributed, meaning you can work offline and sync later, unlike centralized systems like SVN.'"

---

## Chapter 2: Installation & First-Time Setup

### SCRIPT:

"Let's get Git on your machine. I'll show all 3 operating systems."

**[SCREEN RECORDING]**

```bash
# ===== LINUX (Ubuntu/Debian) =====
sudo apt update
sudo apt install git -y

# ===== LINUX (RHEL/CentOS/Fedora) =====
sudo yum install git -y
# or
sudo dnf install git -y

# ===== macOS =====
# Option 1: Xcode Command Line Tools (easiest)
xcode-select --install

# Option 2: Homebrew
brew install git

# ===== Windows =====
# Download from https://git-scm.com/download/win
# OR use winget:
winget install Git.Git

# ===== Verify Installation =====
git --version
# Output: git version 2.44.0 (or similar)
```

**"Now the CRITICAL first-time setup that most tutorials skip:"**

```bash
# These are REQUIRED - Git won't let you commit without them
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Set default branch name to 'main' (modern standard)
git config --global init.defaultBranch main

# Set default editor (choose one)
git config --global core.editor "vim"       # Linux/Mac power users
git config --global core.editor "nano"      # Beginners (easier)
git config --global core.editor "code --wait"  # VS Code users

# Enable colored output (makes life easier)
git config --global color.ui auto

# Set pull behavior (avoids annoying warnings later)
git config --global pull.rebase false

# View all your config
git config --list

# Config is stored in ~/.gitconfig (global) - let's see it
cat ~/.gitconfig
```

**"There are 3 levels of Git config:"**

```
Level           File Location              Scope
─────────────────────────────────────────────────────────
--system        /etc/gitconfig             All users on machine
--global        ~/.gitconfig               Your user account (most common)
--local         .git/config                This specific repo only (highest priority)
```

"Local overrides global, global overrides system. This is important when you use different email addresses for work vs personal projects."

```bash
# Example: Use different email for work repos
cd ~/work/company-project
git config --local user.email "you@company.com"
```

---

## Chapter 3: Your First Repository

### SCRIPT:

"Time to create your first repo. Follow along — open your terminal."

**[SCREEN RECORDING]**

```bash
# Create a project folder
mkdir my-first-repo
cd my-first-repo

# Initialize Git - this is where the magic starts
git init
# Output: Initialized empty Git repository in /path/my-first-repo/.git/

# What just happened? A hidden .git folder was created
ls -la
# You'll see a .git/ directory — this IS your repository
# Your project files are the "working directory"
# The .git folder contains ALL the version history

# Let's create our first file
echo "Hello, Git!" > hello.txt

# Check the status — you'll use this command 100 times a day
git status
# Output:
# Untracked files:
#   hello.txt
# "Untracked" means Git sees the file but isn't tracking it yet

# Stage the file (add it to the "staging area")
git add hello.txt

# Check status again — notice the difference
git status
# Output:
# Changes to be committed:
#   new file: hello.txt
# Now it's "staged" — ready to be committed

# Commit — take a snapshot
git commit -m "Add hello.txt with greeting"
# Output:
# [main (root-commit) a1b2c3d] Add hello.txt with greeting
#  1 file changed, 1 insertion(+)
#  create mode 100644 hello.txt

# Verify with log
git log
# You'll see your commit with hash, author, date, and message
```

**"Let's do a few more commits to build history:"**

```bash
# Modify the file
echo "This is my first Git project" >> hello.txt

# Create another file
echo "# My First Repo" > README.md

# Stage everything at once
git add .

# Commit
git commit -m "Add README and update hello.txt"

# Create one more
echo "node_modules/" > .gitignore
git add .gitignore
git commit -m "Add .gitignore file"

# Now see the history
git log --oneline
# Output:
# c3d4e5f Add .gitignore file
# b2c3d4e Add README and update hello.txt
# a1b2c3d Add hello.txt with greeting
```

**[INTERVIEW TIP #2]**

> "Common interview question: 'What is the difference between git add and git commit?'
> Answer: 'git add stages changes — it moves them to the staging area, which is like a preparation zone. git commit takes everything in the staging area and saves it as a permanent snapshot in the repository. This two-step process lets you selectively choose which changes go into each commit.'"

---

## Chapter 4: Understanding the 3 Areas (The Most Important Concept)

### SCRIPT:

"This is THE most important concept in Git. If you understand this, everything else clicks."

**[SHOW DIAGRAM]**

```
┌──────────────────┐    git add     ┌──────────────────┐   git commit   ┌──────────────────┐
│                  │  ──────────>   │                  │  ──────────>   │                  │
│  WORKING         │                │  STAGING AREA    │                │  REPOSITORY      │
│  DIRECTORY       │                │  (Index)         │                │  (.git)          │
│                  │   <──────────  │                  │                │                  │
│  (Your files     │   git restore  │  (Preview of     │                │  (Permanent      │
│   as you see     │                │   next commit)   │                │   history)       │
│   them)          │                │                  │                │                  │
└──────────────────┘                └──────────────────┘                └──────────────────┘
```

"Let me explain each:

**Working Directory:** These are the actual files you see and edit. When you open your code in VS Code, you're looking at the working directory.

**Staging Area (Index):** This is the 'preparation zone.' When you run `git add`, you're saying 'I want this change in my next commit.' You can stage some files and leave others out. This is powerful — it lets you make clean, logical commits.

**Repository (.git):** When you run `git commit`, everything in staging gets saved permanently. It gets a unique hash (like a fingerprint), and you can always come back to it."

**[PRACTICAL DEMO]**

```bash
# Let's see this in action
echo "Line 1" > demo.txt
echo "Line 2" > demo2.txt

# Both files are in Working Directory only
git status
# Both show as "Untracked"

# Stage only one file
git add demo.txt

git status
# demo.txt  -> Staged (green)
# demo2.txt -> Untracked (red)

# Commit only the staged file
git commit -m "Add demo.txt only"

# demo2.txt is still untracked — it was NOT committed
git status
# demo2.txt -> Untracked

# THIS is the power of staging — selective commits
```

**"Why does staging exist? Real-world example:"**

```bash
# You're working and you fix a bug AND add a feature in the same session
# Good practice: separate commits

git add bugfix-file.py
git commit -m "Fix: null pointer in user login"

git add feature-file.py new-component.jsx
git commit -m "Feat: add user profile page"

# Clean history! Each commit does ONE thing.
# Your teammates and future-you will thank you.
```

---

## Chapter 5: Viewing History (log, diff, show)

### SCRIPT:

"Now that we have commits, let's learn to explore them. These commands are your daily drivers."

**[SCREEN RECORDING]**

```bash
# ===== GIT LOG - View commit history =====

# Basic log
git log

# Compact one-line view (most used)
git log --oneline

# With graph visualization (see branches visually)
git log --oneline --graph --all

# Last N commits
git log -5

# Log for a specific file
git log -- README.md

# Log with patch (show actual changes)
git log -p

# Log with stats (files changed, insertions, deletions)
git log --stat

# Search commits by message
git log --grep="fix"

# Search commits by author
git log --author="Nagacharan"

# Commits in a date range
git log --after="2024-01-01" --before="2024-12-31"

# The PRETTIEST log (save this as an alias later)
git log --oneline --graph --all --decorate
```

```bash
# ===== GIT DIFF - See what changed =====

# Changes in working directory (not yet staged)
git diff

# Changes that are staged (ready to commit)
git diff --staged
# (same as: git diff --cached)

# Diff between two commits
git diff abc1234 def5678

# Diff between branches
git diff main feature-branch

# Diff for a specific file
git diff -- README.md

# Just show file names that changed
git diff --name-only

# Show stats (summary)
git diff --stat
```

```bash
# ===== GIT SHOW - Inspect a specific commit =====

# Show the latest commit details + patch
git show

# Show a specific commit
git show abc1234

# Show a file at a specific commit
git show abc1234:README.md

# Show only the files changed (no patch)
git show --stat abc1234
```

```bash
# ===== GIT BLAME - Who wrote this line? =====

# Show who last modified each line
git blame README.md

# Blame a specific line range
git blame -L 10,20 README.md

# Ignore whitespace changes
git blame -w README.md
```

**[INTERVIEW TIP #3]**

> "Interview question: 'How do you find which commit introduced a bug?'
> Answer: 'I'd start with git log to narrow down the timeframe, use git blame on the specific file to see who last changed the suspicious lines, and if the bug is harder to trace, I'd use git bisect to binary-search through commits — I'll cover that in the advanced section.'"

---

# PART 2: BRANCHING & COLLABORATION

---

## Chapter 6: Branches - The Killer Feature

### SCRIPT:

"Branches are what make Git special. This is where Git goes from 'a save tool' to 'a collaboration powerhouse.'"

**[SHOW DIAGRAM]**

```
              feature-A
             /          \
main: ──●──●──●──●──●──●──●──●──  (production-ready code)
                   \      /
                    ●──●
                   fix-bug-123
```

"A branch is simply a pointer to a commit. That's it. Creating a branch doesn't copy files — it just creates a new pointer. This is why branches in Git are lightning fast."

**[SCREEN RECORDING]**

```bash
# ===== CREATING BRANCHES =====

# See all branches
git branch
# * main    <- the asterisk shows your current branch

# Create a new branch
git branch feature-login

# See all branches again
git branch
#   feature-login
# * main

# Switch to the new branch
git checkout feature-login
# OR (modern way, Git 2.23+)
git switch feature-login

# Create AND switch in one command
git checkout -b feature-signup
# OR
git switch -c feature-signup

# ===== WORKING ON A BRANCH =====

# You're now on feature-signup
echo "Signup form code" > signup.py
git add signup.py
git commit -m "Add signup form"

echo "Signup validation" >> signup.py
git add signup.py
git commit -m "Add signup validation"

# These commits exist ONLY on feature-signup
# main doesn't have them

# Switch back to main
git switch main

# signup.py doesn't exist here!
ls signup.py
# No such file — it's on the other branch

# ===== LISTING & DELETING BRANCHES =====

# List all local branches
git branch

# List all branches (local + remote)
git branch -a

# List with last commit info
git branch -v

# Delete a merged branch
git branch -d feature-login

# Force delete unmerged branch (careful!)
git branch -D experimental-branch

# Rename a branch
git branch -m old-name new-name

# Rename current branch
git branch -m new-name
```

**"When to create a branch — real-world rules:"**

```
SCENARIO                           BRANCH NAME CONVENTION
─────────────────────────────────────────────────────────
New feature                        feature/user-auth
                                   feat/payment-gateway
Bug fix                            fix/login-crash
                                   bugfix/null-pointer
Hotfix (urgent prod fix)           hotfix/security-patch
Release preparation                release/v2.1.0
Experiment                         experiment/new-db-driver
Chore (maintenance)                chore/update-dependencies
```

---

## Chapter 7: Merging & Merge Conflicts

### SCRIPT:

"Merging brings branches together. And merge conflicts are the #1 thing that scares beginners. Let's demystify both."

**[SCREEN RECORDING]**

```bash
# ===== FAST-FORWARD MERGE =====
# When main hasn't moved since the branch was created

git switch main
git merge feature-signup
# Output: Fast-forward
# Git just moves the main pointer forward — no merge commit needed

# Visualize:
# BEFORE:  main──●──●        feature──●──●
# AFTER:   main──●──●──●──●  (main caught up to feature)
```

```bash
# ===== THREE-WAY MERGE =====
# When both branches have new commits

# Setup: create a branch, make changes on both
git switch -c feature-dashboard

echo "Dashboard code" > dashboard.py
git add . && git commit -m "Add dashboard"

# Go back to main and make a different change
git switch main
echo "Homepage update" > home.py
git add . && git commit -m "Update homepage"

# Now merge — both branches have diverged
git merge feature-dashboard
# Git creates a MERGE COMMIT
# This has TWO parents (one from each branch)

git log --oneline --graph
# *   5a6b7c8 Merge branch 'feature-dashboard'
# |\
# | * 3c4d5e6 Add dashboard
# * | 2b3c4d5 Update homepage
# |/
# * 1a2b3c4 Previous commit
```

**"Now the scary part — MERGE CONFLICTS:"**

```bash
# ===== CREATING A CONFLICT (on purpose) =====

# Create a branch
git switch -c branch-a
echo "Hello from Branch A" > greeting.txt
git add . && git commit -m "Branch A greeting"

git switch main
git switch -c branch-b
echo "Hello from Branch B" > greeting.txt
git add . && git commit -m "Branch B greeting"

# Merge branch-a into branch-b
git merge branch-a
# CONFLICT (add/add): Merge conflict in greeting.txt
# Automatic merge failed; fix conflicts and then commit the result.
```

```bash
# ===== UNDERSTANDING THE CONFLICT MARKERS =====

cat greeting.txt
# <<<<<<< HEAD
# Hello from Branch B
# =======
# Hello from Branch A
# >>>>>>> branch-a

# <<<<<<< HEAD         = Your current branch (branch-b)
# =======              = Separator
# >>>>>>> branch-a     = The incoming branch
```

```bash
# ===== RESOLVING THE CONFLICT =====

# Option 1: Manual edit — keep what you want
# Edit greeting.txt to:
echo "Hello from both Branch A and Branch B" > greeting.txt

# Option 2: Keep ours (current branch)
git checkout --ours greeting.txt

# Option 3: Keep theirs (incoming branch)
git checkout --theirs greeting.txt

# After resolving:
git add greeting.txt
git commit -m "Merge branch-a: resolve greeting conflict"

# ===== PRO TIP: Use a merge tool =====
git mergetool
# Opens your configured visual merge tool (VS Code, vimdiff, etc.)

# Configure VS Code as merge tool:
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait --merge $REMOTE $LOCAL $BASE $MERGED'
```

**"Conflict prevention tips (from real-world experience):"**

- Pull from main frequently into your feature branch
- Keep branches short-lived (merge within 1-2 days ideally)
- Communicate with your team about which files you're editing
- Use `git diff main` before merging to preview changes

**[INTERVIEW TIP #4]**

> "Interview question: 'How do you resolve a merge conflict?'
> Answer: 'When a conflict occurs, Git marks the conflicting sections in the file with conflict markers. I open the file, understand both changes, decide what the correct resolution is — sometimes keeping one side, sometimes combining both. Then I stage the resolved file with git add and complete the merge with git commit. For complex conflicts, I use VS Code's built-in merge editor which shows a 3-way diff.'"

---

## Chapter 8: Remote Repositories (GitHub/GitLab/Bitbucket)

### SCRIPT:

"So far everything has been local. Now let's connect to the world."

**[SHOW DIAGRAM]**

```
YOUR MACHINE                           REMOTE (GitHub/GitLab)
┌─────────────┐                        ┌─────────────────┐
│ Working Dir │                        │                 │
│ Staging     │   git push ──────>     │  Remote Repo    │
│ Local Repo  │   <────── git fetch    │  (origin)       │
│             │   <────── git pull     │                 │
└─────────────┘                        └─────────────────┘
```

**[SCREEN RECORDING]**

```bash
# ===== SCENARIO 1: Start local, push to remote =====

# You already have a local repo
# Create a repo on GitHub (show UI briefly)
# Then connect:

git remote add origin https://github.com/username/my-repo.git

# Verify
git remote -v
# origin  https://github.com/username/my-repo.git (fetch)
# origin  https://github.com/username/my-repo.git (push)

# Push for the first time (-u sets upstream tracking)
git push -u origin main

# After -u, future pushes are just:
git push
```

```bash
# ===== SCENARIO 2: Clone an existing remote repo =====

# Clone via HTTPS
git clone https://github.com/username/repo.git

# Clone via SSH (recommended - no password prompts)
git clone git@github.com:username/repo.git

# Clone into a specific folder
git clone https://github.com/username/repo.git my-folder

# Clone only a specific branch
git clone -b develop https://github.com/username/repo.git

# Shallow clone (only latest commit — fast for large repos)
git clone --depth 1 https://github.com/username/repo.git
```

```bash
# ===== SSH SETUP (do this once, never enter password again) =====

# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"
# Press Enter for default location, set a passphrase (optional)

# Start SSH agent
eval "$(ssh-agent -s)"

# Add your key
ssh-add ~/.ssh/id_ed25519

# Copy public key to clipboard
# macOS:
cat ~/.ssh/id_ed25519.pub | pbcopy
# Linux:
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
# Windows:
cat ~/.ssh/id_ed25519.pub | clip

# Add this key to GitHub: Settings > SSH Keys > New SSH Key

# Test connection
ssh -T git@github.com
# "Hi username! You've successfully authenticated"
```

```bash
# ===== WORKING WITH REMOTES =====

# List remotes
git remote -v

# Add another remote (e.g., upstream for forks)
git remote add upstream https://github.com/original/repo.git

# Remove a remote
git remote remove upstream

# Rename a remote
git remote rename origin github

# Change remote URL (HTTPS to SSH)
git remote set-url origin git@github.com:username/repo.git

# Show detailed remote info
git remote show origin
```

---

## Chapter 9: Pull Requests / Merge Requests

### SCRIPT:

"PRs are NOT a Git feature — they're a platform feature (GitHub, GitLab, Bitbucket). But they're central to how teams work."

**[SHOW WORKFLOW DIAGRAM]**

```
1. Create branch  ──>  2. Make commits  ──>  3. Push branch  ──>  4. Open PR
                                                                      │
7. Delete branch  <──  6. Merge PR  <──  5. Code Review + Discussion  ┘
```

**[SCREEN RECORDING]**

```bash
# Step 1: Create and switch to a feature branch
git switch -c feature/add-search

# Step 2: Make your changes and commit
echo "search functionality" > search.py
git add search.py
git commit -m "Add search functionality"

# Step 3: Push the branch to remote
git push -u origin feature/add-search
# Git will output a URL to create a PR — click it!

# Or create PR from command line with GitHub CLI:
gh pr create --title "Add search functionality" --body "Implements search with filters"
```

**"PR best practices (from real team experience):"**

```
DO:                                    DON'T:
─────────────────────────────────────────────────────
Small, focused PRs (< 400 lines)      Giant PRs with 50 files changed
Clear title and description            "Fix stuff" as PR title
Link to issue/ticket                   Leave reviewers guessing WHY
Add screenshots for UI changes         Merge without review
Respond to review comments             Take feedback personally
Self-review before requesting review   Push and immediately request review
```

```bash
# Useful GitHub CLI commands for PRs
gh pr list                          # List open PRs
gh pr view 42                       # View PR #42
gh pr checkout 42                   # Checkout PR locally to test
gh pr review 42 --approve           # Approve a PR
gh pr merge 42 --squash             # Squash merge a PR
gh pr diff 42                       # See PR diff
```

---

## Chapter 10: Git Fetch vs Pull vs Push

### SCRIPT:

"This confuses EVERYONE. Let me clear it up once and for all."

**[SHOW DIAGRAM]**

```
                    git fetch              git merge
REMOTE REPO  ────────────────>  REMOTE     ──────────>  LOCAL
                               TRACKING                 BRANCH
                               BRANCH
                               (origin/main)            (main)

                         git pull = git fetch + git merge

                    git push
LOCAL BRANCH ────────────────>  REMOTE REPO
```

```bash
# ===== GIT FETCH =====
# Downloads changes but does NOT modify your working files
# Safe — it never changes your code

git fetch origin
# Now origin/main is updated, but YOUR main is untouched

# See what changed on remote
git log main..origin/main --oneline

# ===== GIT PULL =====
# Fetch + Merge in one command
# DOES modify your working files

git pull origin main
# This fetches AND merges remote changes into your current branch

# Pull with rebase (cleaner history — more on this later)
git pull --rebase origin main

# ===== GIT PUSH =====
# Upload your local commits to remote

git push origin main

# Push a new branch
git push -u origin feature/new-stuff

# Push all branches
git push --all

# Push tags
git push --tags

# ===== TRACKING BRANCHES =====
# After git push -u, your branch "tracks" the remote
# Then you can just use:
git push    # pushes to tracked remote
git pull    # pulls from tracked remote
```

**"When to use what:"**

```
SITUATION                                      COMMAND
──────────────────────────────────────────────────────────
"I want to check if there are remote changes    git fetch
 without changing my code"

"I want to get remote changes AND update         git pull
 my working code"

"I want a cleaner history when pulling"          git pull --rebase

"I want to upload my commits to remote"          git push

"I want to see the diff between my code          git fetch
 and remote before merging"                      git diff main origin/main
```

**[INTERVIEW TIP #5]**

> "Interview question: 'What is the difference between git fetch and git pull?'
> Answer: 'git fetch downloads changes from the remote repository and updates the remote tracking branches (like origin/main), but it does NOT modify your working directory or local branches. git pull is essentially git fetch followed by git merge — it downloads AND integrates changes. I often use fetch first to review changes before merging, especially on shared branches.'"

---

# PART 3: INTERMEDIATE

---

## Chapter 11: Stashing

### SCRIPT:

"You're working on a feature, and suddenly your boss says 'drop everything, fix this production bug.' You're not ready to commit. What do you do? Stash."

**[SCREEN RECORDING]**

```bash
# You're in the middle of work
echo "work in progress..." >> feature.py
git status
# modified: feature.py

# Save work temporarily
git stash
# Saved working directory and index state WIP on main: abc1234 Last commit

# Your working directory is now clean!
git status
# nothing to commit, working tree clean

# Fix the production bug...
git switch -c hotfix/critical
# ... fix, commit, merge ...
git switch main

# Bring your work back
git stash pop
# Your changes are restored!

# ===== STASH WITH A MESSAGE =====
git stash push -m "WIP: login page redesign"

# ===== STASH SPECIFIC FILES =====
git stash push -m "just the CSS" styles.css layout.css

# ===== LIST ALL STASHES =====
git stash list
# stash@{0}: On main: WIP: login page redesign
# stash@{1}: WIP on main: previous stash

# ===== APPLY WITHOUT REMOVING FROM STASH =====
git stash apply stash@{0}
# (vs pop which applies AND removes)

# ===== VIEW STASH CONTENTS =====
git stash show stash@{0}        # summary
git stash show -p stash@{0}     # full diff

# ===== DROP A SPECIFIC STASH =====
git stash drop stash@{1}

# ===== CLEAR ALL STASHES =====
git stash clear

# ===== STASH INCLUDING UNTRACKED FILES =====
git stash -u
# or
git stash --include-untracked

# ===== CREATE A BRANCH FROM STASH =====
git stash branch new-branch-name stash@{0}
# Creates branch, checks it out, applies stash, drops it
```

---

## Chapter 12: Git Ignore

### SCRIPT:

"Some files should NEVER be in Git — node_modules, .env files, build outputs, IDE configs. That's what .gitignore is for."

**[SCREEN RECORDING]**

```bash
# Create .gitignore in repo root
cat > .gitignore << 'EOF'
# ===== DEPENDENCIES =====
node_modules/
vendor/
.venv/
__pycache__/
*.pyc

# ===== ENVIRONMENT & SECRETS =====
.env
.env.local
.env.*.local
*.pem
*.key
credentials.json

# ===== BUILD OUTPUT =====
dist/
build/
out/
*.o
*.class
*.jar

# ===== IDE & EDITOR =====
.idea/
.vscode/
*.swp
*.swo
*~
.DS_Store
Thumbs.db

# ===== LOGS =====
*.log
logs/

# ===== OS FILES =====
.DS_Store
Thumbs.db
desktop.ini

# ===== TERRAFORM (DevOps specific) =====
.terraform/
*.tfstate
*.tfstate.backup
*.tfvars
!example.tfvars

# ===== DOCKER =====
docker-compose.override.yml
EOF

git add .gitignore
git commit -m "Add comprehensive .gitignore"
```

```bash
# ===== GITIGNORE PATTERNS =====

# Pattern          Matches
# ─────────────────────────────────────
# *.log            Any .log file
# !important.log   EXCEPT important.log (negation)
# /TODO            Only root TODO file
# build/           Any directory named build
# doc/*.txt         doc/notes.txt but NOT doc/sub/notes.txt
# doc/**/*.txt     doc/notes.txt AND doc/sub/notes.txt
# **/logs          logs directory anywhere

# ===== ALREADY TRACKED FILE? =====
# .gitignore only works for UNTRACKED files
# If a file is already tracked, you need to untrack it first:

git rm --cached .env
# Removes from Git tracking but keeps the file on disk
git commit -m "Remove .env from tracking"

# For a whole directory:
git rm -r --cached node_modules/
git commit -m "Remove node_modules from tracking"

# ===== GLOBAL GITIGNORE (for your machine) =====
git config --global core.excludesfile ~/.gitignore_global

# Add OS/editor files you NEVER want tracked
echo ".DS_Store" >> ~/.gitignore_global
echo ".idea/" >> ~/.gitignore_global
echo "*.swp" >> ~/.gitignore_global

# ===== CHECK IF A FILE IS IGNORED =====
git check-ignore -v filename
# Shows which rule is ignoring it

# ===== TEMPLATE =====
# Use gitignore.io or github/gitignore for templates
# https://github.com/github/gitignore
```

---

## Chapter 13: Tagging & Releases

### SCRIPT:

"Tags mark specific points in history — usually releases. If branches are moving pointers, tags are permanent bookmarks."

```bash
# ===== LIGHTWEIGHT TAGS =====
# Just a name pointing to a commit
git tag v1.0.0

# ===== ANNOTATED TAGS (recommended) =====
# Includes tagger info, date, and message
git tag -a v1.0.0 -m "First stable release"

# Tag a specific past commit
git tag -a v0.9.0 -m "Beta release" abc1234

# ===== LIST TAGS =====
git tag
git tag -l "v1.*"    # Filter with pattern

# ===== VIEW TAG DETAILS =====
git show v1.0.0

# ===== PUSH TAGS TO REMOTE =====
# Tags are NOT pushed by default!
git push origin v1.0.0         # Push specific tag
git push origin --tags         # Push all tags

# ===== DELETE TAGS =====
git tag -d v1.0.0                        # Delete local
git push origin --delete v1.0.0          # Delete remote

# ===== CHECKOUT A TAG =====
git checkout v1.0.0
# Warning: "detached HEAD" — you're not on a branch
# To make changes, create a branch from the tag:
git checkout -b hotfix-v1.0.0 v1.0.0
```

**"Semantic Versioning (SemVer) — the industry standard:"**

```
v MAJOR . MINOR . PATCH
v 1     . 4     . 2

MAJOR: Breaking changes (users must update their code)
MINOR: New features (backwards compatible)
PATCH: Bug fixes (backwards compatible)

Examples:
v1.0.0 → v1.0.1  (bug fix)
v1.0.1 → v1.1.0  (new feature)
v1.1.0 → v2.0.0  (breaking change)
```

---

## Chapter 14: Aliases & Productivity Hacks

### SCRIPT:

"Let's make you 10x faster with Git. These are aliases and tricks I use daily."

```bash
# ===== MUST-HAVE ALIASES =====

git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.ci "commit"
git config --global alias.sw "switch"

# Short log
git config --global alias.lg "log --oneline --graph --all --decorate"

# Last commit
git config --global alias.last "log -1 HEAD --stat"

# Unstage a file
git config --global alias.unstage "restore --staged"

# Amend without changing message
git config --global alias.oops "commit --amend --no-edit"

# Show branches sorted by last commit
git config --global alias.recent "branch --sort=-committerdate --format='%(committerdate:relative) %(refname:short)'"

# Diff stat
git config --global alias.ds "diff --stat"

# ===== NOW USE THEM =====
git st             # instead of git status
git co main        # instead of git checkout main
git lg             # beautiful log
git last           # last commit info
git recent         # branches by recent activity
```

```bash
# ===== BASH/ZSH ALIASES (even faster) =====
# Add to ~/.bashrc or ~/.zshrc:

alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gco="git checkout"
alias gsw="git switch"
alias gb="git branch"
alias glg="git log --oneline --graph --all"

# Usage:
# gs          → git status
# ga .        → git add .
# gc "msg"    → git commit -m "msg"
# gp          → git push
```

```bash
# ===== OTHER PRODUCTIVITY TRICKS =====

# Auto-correct typos (Git suggests corrections)
git config --global help.autocorrect 20
# Now "git stauts" auto-corrects to "git status" after 2 seconds

# Default push behavior
git config --global push.default current
# 'git push' pushes current branch to same-named remote branch

# Reuse recorded resolution (rerere)
git config --global rerere.enabled true
# Git remembers how you resolved conflicts and auto-applies next time!

# Show diff in commit message editor
git config --global commit.verbose true
# Shows the diff while you're writing the commit message

# Better diff algorithm
git config --global diff.algorithm histogram
```

---

## Chapter 15: Undoing Things (The Safety Net Chapter)

### SCRIPT:

"Everyone makes mistakes. Git has multiple ways to undo things, and choosing the right one matters. This is the chapter that'll save your career at some point."

**[SHOW DECISION DIAGRAM]**

```
WHAT DO YOU WANT TO UNDO?
│
├── "I want to undo changes in my WORKING DIRECTORY"
│   └── git restore <file>              (discard local changes)
│
├── "I want to UNSTAGE a file (undo git add)"
│   └── git restore --staged <file>     (unstage, keep changes)
│
├── "I want to undo my LAST COMMIT but keep changes"
│   └── git reset --soft HEAD~1         (commit undone, changes staged)
│
├── "I want to undo my LAST COMMIT and unstage"
│   └── git reset HEAD~1               (commit undone, changes in working dir)
│   └── (same as: git reset --mixed HEAD~1)
│
├── "I want to COMPLETELY UNDO last commit and all changes"
│   └── git reset --hard HEAD~1         (⚠️ DESTRUCTIVE — changes gone)
│
├── "I want to undo a commit that's ALREADY PUSHED"
│   └── git revert <commit-hash>        (creates a NEW commit that undoes it)
│
└── "I want to fix my last COMMIT MESSAGE"
    └── git commit --amend -m "new msg" (rewrites last commit)
```

**[SCREEN RECORDING]**

```bash
# ===== 1. DISCARD WORKING DIRECTORY CHANGES =====
echo "bad code" >> app.py
git diff   # see the damage

git restore app.py
# Changes gone! File reverted to last committed state

# Discard ALL working directory changes
git restore .

# ===== 2. UNSTAGE FILES =====
git add .   # oops, staged everything
git restore --staged secret.env    # unstage just one file
git restore --staged .             # unstage everything

# ===== 3. GIT RESET — UNDO COMMITS =====

# --soft: undo commit, keep changes STAGED
git reset --soft HEAD~1
# Great for: "I want to add more changes to that commit"

# --mixed (default): undo commit, keep changes UNSTAGED
git reset HEAD~1
# Great for: "I want to recommit differently"

# --hard: undo commit, DELETE all changes
git reset --hard HEAD~1
# ⚠️ CAREFUL: Changes are GONE (but recoverable via reflog)

# Reset to a specific commit
git reset --hard abc1234

# ===== 4. GIT REVERT — SAFE UNDO FOR PUSHED COMMITS =====

# This creates a NEW commit that undoes a previous one
git revert abc1234
# Opens editor for commit message
# Result: a new commit that reverses the changes

# Revert without auto-committing (review first)
git revert --no-commit abc1234

# Revert a merge commit
git revert -m 1 abc1234
# -m 1 means "keep the mainline parent"

# ===== 5. AMEND LAST COMMIT =====

# Fix the commit message
git commit --amend -m "Better commit message"

# Add forgotten files to last commit
git add forgotten-file.py
git commit --amend --no-edit
# Adds the file to the previous commit without changing the message
# ⚠️ Only do this for commits that haven't been pushed!
```

**"The Golden Rule:"**

```
PUSHED to remote?
├── YES → Use git revert (safe, creates new commit)
└── NO  → Use git reset (rewrites history, that's fine locally)

NEVER use git reset --hard on pushed commits shared with others.
You'll rewrite shared history and your team will hate you.
```

**[INTERVIEW TIP #6]**

> "Interview question: 'What is the difference between git reset and git revert?'
> Answer: 'git reset moves the branch pointer backward, effectively removing commits from history. It's for local, unpushed changes. git revert creates a new commit that undoes a previous commit's changes — history is preserved. Use revert for changes already pushed to a shared branch, because it doesn't rewrite history that others may have based their work on.'"

---

# PART 4: ADVANCED

---

## Chapter 16: Rebase - The Scary One Made Simple

### SCRIPT:

"Rebase is the most misunderstood Git command. But once you get it, you'll use it daily. Let me demystify it."

**[SHOW DIAGRAM]**

```
BEFORE REBASE:
main:    A ── B ── C ── D         (main moved forward)
                \
feature:         E ── F           (your branch is behind)

AFTER git rebase main (from feature branch):
main:    A ── B ── C ── D
                         \
feature:                  E' ── F'   (replayed ON TOP of main)

Note: E' and F' are NEW commits (new hashes) with the same changes
```

"Rebase means: 'Take my changes, and replay them on top of another branch.' The result is a LINEAR history — no merge commits."

**[SCREEN RECORDING]**

```bash
# ===== BASIC REBASE =====

# You're on feature branch, main has new commits
git switch feature-branch

# Rebase onto main
git rebase main

# If there are conflicts:
# 1. Fix the conflict in the file
# 2. Stage the fix
git add resolved-file.py
# 3. Continue the rebase
git rebase --continue

# To abort and go back to before the rebase:
git rebase --abort

# ===== REBASE vs MERGE (comparison) =====

# MERGE approach:
git switch main
git merge feature
# Creates: A──B──C──D──M  (M is merge commit with two parents)
#               \     /
#                E──F

# REBASE approach:
git switch feature
git rebase main
git switch main
git merge feature   # fast-forward!
# Creates: A──B──C──D──E'──F'  (linear history, no merge commit)
```

**"When to use rebase vs merge:"**

```
USE REBASE WHEN:                        USE MERGE WHEN:
───────────────────────────────────────────────────────────
Updating feature branch with              Integrating feature into main
latest main changes                       (the final merge)

You want clean, linear history            You want to preserve the exact
                                          history of when things happened

Working on YOUR branch that               Working on a SHARED branch
nobody else is using                      (never rebase shared branches!)

Before creating a PR (clean up            Recording that a parallel
your commits)                             effort was merged
```

**"THE GOLDEN RULE OF REBASE:"**

```
╔══════════════════════════════════════════════════════════╗
║  NEVER rebase commits that have been pushed to a        ║
║  shared/public branch. Only rebase YOUR local work.     ║
║                                                         ║
║  Rebase rewrites history (new commit hashes).           ║
║  If others based work on the old commits, you'll        ║
║  create parallel histories and a world of pain.         ║
╚══════════════════════════════════════════════════════════╝
```

---

## Chapter 17: Interactive Rebase

### SCRIPT:

"Interactive rebase is a power tool. It lets you edit, squash, reorder, and rewrite your commit history before sharing it."

```bash
# ===== INTERACTIVE REBASE =====

# Rebase last 4 commits interactively
git rebase -i HEAD~4

# This opens your editor with something like:
# pick a1b2c3d Add user model
# pick b2c3d4e Add user controller
# pick c3d4e5f Fix typo in controller
# pick d4e5f6g Add user routes

# COMMANDS YOU CAN USE:
# pick   (p) = keep the commit as-is
# reword (r) = keep commit but edit the message
# edit   (e) = pause at this commit to amend it
# squash (s) = meld into previous commit (combine messages)
# fixup  (f) = meld into previous commit (discard this message)
# drop   (d) = remove the commit entirely
# reorder    = change the line order to reorder commits

# ===== EXAMPLE: Squash messy commits into one clean commit =====

# Before:
# pick a1b2c3d Add user feature
# pick b2c3d4e Fix bug in user feature
# pick c3d4e5f More fixes
# pick d4e5f6g Final fix for real this time

# Change to:
# pick a1b2c3d Add user feature
# fixup b2c3d4e Fix bug in user feature
# fixup c3d4e5f More fixes
# fixup d4e5f6g Final fix for real this time

# Result: ONE clean commit with all changes combined

# ===== EXAMPLE: Reorder commits =====
# Just change the line order:
# pick d4e5f6g Add user routes      ← moved up
# pick a1b2c3d Add user model
# pick b2c3d4e Add user controller

# ===== EXAMPLE: Split a commit =====
# Change 'pick' to 'edit' for the commit you want to split
# When rebase pauses at that commit:
git reset HEAD~1                   # undo the commit, keep changes
git add model.py
git commit -m "Add user model"
git add controller.py
git commit -m "Add user controller"
git rebase --continue
```

**"Real-world workflow: clean up before PR"**

```bash
# You've been working all day with messy commits:
# "wip", "fix", "more wip", "actually fix", "tests pass now"

# Before creating PR, clean up:
git rebase -i HEAD~5

# Squash all the WIP commits, reword for clarity
# Your PR now has 2-3 clean, logical commits
# Reviewers love you.
```

---

## Chapter 18: Cherry-Pick

### SCRIPT:

"Cherry-pick lets you grab a specific commit from one branch and apply it to another. Surgical precision."

```bash
# ===== BASIC CHERRY-PICK =====

# You're on main, you want ONE commit from feature branch
git switch main

# Find the commit hash you want
git log feature-branch --oneline
# a1b2c3d The commit you want
# b2c3d4e Don't want this
# c3d4e5f Don't want this either

# Cherry-pick it
git cherry-pick a1b2c3d
# Creates a NEW commit on main with the same changes

# ===== CHERRY-PICK WITHOUT COMMITTING =====
git cherry-pick --no-commit a1b2c3d
# Applies changes to working dir without committing
# Useful when you want to modify before committing

# ===== CHERRY-PICK MULTIPLE COMMITS =====
git cherry-pick a1b2c3d b2c3d4e c3d4e5f

# Cherry-pick a range
git cherry-pick a1b2c3d..c3d4e5f
# Note: this EXCLUDES a1b2c3d, includes everything after it up to c3d4e5f

# Include the first commit too:
git cherry-pick a1b2c3d^..c3d4e5f

# ===== HANDLING CONFLICTS =====
# If there's a conflict during cherry-pick:
# 1. Resolve the conflict
# 2. Stage the file
git add resolved-file.py
# 3. Continue
git cherry-pick --continue

# Or abort
git cherry-pick --abort
```

**"When to use cherry-pick:"**

```
GOOD USE CASES:
- Backporting a bug fix from develop to a release branch
- Pulling one specific feature from a long-lived branch
- Applying a hotfix to multiple release branches

AVOID:
- Cherry-picking lots of commits (just merge/rebase instead)
- Cherry-picking between branches that will eventually merge
  (can cause duplicate commits)
```

---

## Chapter 19: Reflog - Git's Safety Net

### SCRIPT:

"This is the command that makes 'I accidentally deleted everything' a solvable problem. Reflog records EVERY move of HEAD."

```bash
# ===== VIEW REFLOG =====
git reflog
# Output:
# a1b2c3d HEAD@{0}: commit: Latest commit
# b2c3d4e HEAD@{1}: checkout: moving from feature to main
# c3d4e5f HEAD@{2}: commit: Feature work
# d4e5f6g HEAD@{3}: reset: moving to HEAD~3   ← you did a hard reset!
# e5f6g7h HEAD@{4}: commit: The commit you lost

# ===== RECOVER A "LOST" COMMIT =====

# You accidentally did git reset --hard HEAD~3
# Your commits seem gone — but they're in the reflog!

git reflog
# Find the commit hash before the reset

git reset --hard e5f6g7h
# Your commits are back!

# Or create a branch from the lost commit:
git branch recovered-work e5f6g7h

# ===== RECOVER A DELETED BRANCH =====

# You deleted a branch by accident
git branch -D feature-important
# Oh no!

git reflog
# Find the last commit that was on that branch

git branch feature-important abc1234
# Branch is back with all its commits!

# ===== RECOVER FROM BAD REBASE =====

# You rebased and everything went wrong
git reflog
# Find the entry BEFORE the rebase started
# It'll say something like "rebase (start)"

git reset --hard HEAD@{5}
# Back to pre-rebase state!
```

**"Reflog entries expire after 90 days (30 for unreachable commits). So recover soon."**

**[INTERVIEW TIP #7]**

> "Interview question: 'You accidentally did git reset --hard and lost commits. How do you recover?'
> Answer: 'I would use git reflog, which records every HEAD movement. I'd find the commit hash from before the reset and either git reset --hard back to it or create a new branch pointing to it. Reflog is local only and entries expire after 90 days, but it's Git's ultimate safety net.'"

---

## Chapter 20: Git Bisect

### SCRIPT:

"Bisect uses binary search to find which commit introduced a bug. If you have 1000 commits, it finds the bad one in about 10 steps."

```bash
# ===== BASIC BISECT =====

# Start bisecting
git bisect start

# Mark current commit as bad (has the bug)
git bisect bad

# Mark a known good commit (before the bug)
git bisect good v1.0.0
# or
git bisect good abc1234

# Git checks out a commit in the middle
# Test it — does the bug exist?

# If this commit is good:
git bisect good

# If this commit has the bug:
git bisect bad

# Git narrows down and checks out another middle commit
# Repeat until:
# "abc1234 is the first bad commit"

# Done! Reset back to where you were:
git bisect reset

# ===== AUTOMATED BISECT =====
# If you have a test script that exits 0 for good, 1 for bad:

git bisect start HEAD v1.0.0
git bisect run python test_login.py
# or
git bisect run npm test
# or
git bisect run ./my-test-script.sh

# Git runs the test automatically for each step
# Finds the bad commit without any manual intervention!
```

---

## Chapter 21: Worktrees

### SCRIPT:

"Ever wanted to work on two branches simultaneously without stashing or committing? Worktrees let you check out multiple branches at once, each in its own directory."

```bash
# ===== ADD A WORKTREE =====

# You're on main, need to fix a bug on release branch
git worktree add ../hotfix-workdir release/v2.0
# Creates a new directory ../hotfix-workdir with release/v2.0 checked out

# Now you have:
# ~/project/         ← main branch (keep working here)
# ~/hotfix-workdir/  ← release/v2.0 branch (fix the bug here)

# Both share the same .git — changes in one are visible to the other

# ===== CREATE NEW BRANCH IN WORKTREE =====
git worktree add -b hotfix/urgent ../urgent-fix main
# Creates new branch 'hotfix/urgent' from main in ../urgent-fix

# ===== LIST WORKTREES =====
git worktree list
# /home/user/project         abc1234 [main]
# /home/user/hotfix-workdir  def5678 [release/v2.0]

# ===== REMOVE WORKTREE =====
# First delete the directory
rm -rf ../hotfix-workdir
# Then prune
git worktree prune

# Or in one step (Git 2.17+):
git worktree remove ../hotfix-workdir
```

---

## Chapter 22: Submodules & Subtrees

### SCRIPT:

"When your project depends on another Git repo, you have two options: submodules and subtrees."

```bash
# ===== GIT SUBMODULES =====

# Add a submodule
git submodule add https://github.com/user/library.git libs/library
git commit -m "Add library as submodule"

# When you clone a repo with submodules:
git clone --recurse-submodules https://github.com/user/project.git

# Or if you already cloned:
git submodule init
git submodule update

# Update submodule to latest
cd libs/library
git pull origin main
cd ../..
git add libs/library
git commit -m "Update library submodule"

# Update all submodules
git submodule update --remote

# ===== GIT SUBTREES (simpler alternative) =====

# Add a subtree
git subtree add --prefix=libs/library https://github.com/user/library.git main --squash

# Pull updates
git subtree pull --prefix=libs/library https://github.com/user/library.git main --squash

# Push changes back to the library repo
git subtree push --prefix=libs/library https://github.com/user/library.git main
```

```
SUBMODULES vs SUBTREES:
─────────────────────────────────────────────────────────────
SUBMODULES                              SUBTREES
─────────────────────────────────────────────────────────────
Pointer to external repo               Full copy in your repo
Requires extra steps when cloning       Works with normal clone
History stays separate                  History merged into yours
Better for large dependencies           Better for small libraries
More complex, more control              Simpler, less flexible
Used by: large monorepos, OS projects   Used by: smaller teams
```

---

# PART 5: DevOps & CI/CD

---

## Chapter 23: Git Hooks

### SCRIPT:

"Git hooks are scripts that run automatically when certain Git events happen. They're the backbone of code quality automation."

```bash
# Hooks live in .git/hooks/
ls .git/hooks/
# pre-commit.sample  commit-msg.sample  pre-push.sample  etc.

# To activate a hook, remove .sample and make it executable
```

```bash
# ===== PRE-COMMIT HOOK =====
# Runs BEFORE a commit is created
# Use for: linting, formatting, running quick tests

cat > .git/hooks/pre-commit << 'HOOK'
#!/bin/bash
echo "Running pre-commit checks..."

# Check for debug statements
if git diff --cached --name-only | xargs grep -l "console.log\|debugger\|import pdb" 2>/dev/null; then
    echo "ERROR: Debug statements found. Remove them before committing."
    exit 1
fi

# Run linter
npm run lint --quiet
if [ $? -ne 0 ]; then
    echo "ERROR: Linting failed. Fix errors before committing."
    exit 1
fi

echo "Pre-commit checks passed!"
HOOK
chmod +x .git/hooks/pre-commit
```

```bash
# ===== COMMIT-MSG HOOK =====
# Validates commit message format

cat > .git/hooks/commit-msg << 'HOOK'
#!/bin/bash
commit_msg=$(cat "$1")

# Enforce conventional commits format
pattern="^(feat|fix|docs|style|refactor|test|chore|ci|perf)(\(.+\))?: .{1,72}$"
if ! echo "$commit_msg" | head -1 | grep -qE "$pattern"; then
    echo "ERROR: Commit message doesn't follow conventional commits format."
    echo "Expected: type(scope): description"
    echo "Examples:"
    echo "  feat(auth): add login with Google"
    echo "  fix(api): handle null response from payment gateway"
    echo "  docs: update API documentation"
    exit 1
fi
HOOK
chmod +x .git/hooks/commit-msg
```

```bash
# ===== PRE-PUSH HOOK =====
# Runs before push — last line of defense

cat > .git/hooks/pre-push << 'HOOK'
#!/bin/bash
echo "Running tests before push..."
npm test
if [ $? -ne 0 ]; then
    echo "ERROR: Tests failed. Fix them before pushing."
    exit 1
fi

# Prevent direct push to main
current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
if [ "$current_branch" = "main" ] || [ "$current_branch" = "master" ]; then
    echo "ERROR: Direct push to $current_branch is not allowed. Use a PR."
    exit 1
fi
HOOK
chmod +x .git/hooks/pre-push
```

```bash
# ===== SHARING HOOKS WITH THE TEAM =====

# Problem: .git/hooks/ is NOT tracked by Git
# Solution 1: Use a hooks directory in your repo

mkdir .githooks
# Create hooks in .githooks/
# Configure Git to use this directory:
git config core.hooksPath .githooks

# Solution 2: Use Husky (Node.js projects)
npm install husky --save-dev
npx husky init
# Creates .husky/ directory with hook files that ARE committed

# Solution 3: Use pre-commit framework (Python)
pip install pre-commit
# Create .pre-commit-config.yaml
# pre-commit install
```

---

## Chapter 24: Git in CI/CD Pipelines

### SCRIPT:

"In DevOps, Git isn't just for developers — it drives your entire CI/CD pipeline. Every push, every PR, every tag can trigger automated workflows."

```yaml
# ===== GITHUB ACTIONS EXAMPLE =====
# .github/workflows/ci.yml

name: CI Pipeline
on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]
  release:
    types: [published]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0    # Full history (needed for some tools)

      - name: Run tests
        run: npm test

      - name: Run linter
        run: npm run lint

  build:
    needs: test    # Only build if tests pass
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Build
        run: npm run build

      - name: Build Docker image
        run: |
          docker build -t myapp:${{ github.sha }} .
          # Using git SHA as image tag — traceable!

  deploy:
    needs: build
    if: github.ref == 'refs/heads/main'    # Only deploy from main
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to production
        run: |
          echo "Deploying commit ${{ github.sha }}"
```

```yaml
# ===== GITLAB CI EXAMPLE =====
# .gitlab-ci.yml

stages:
  - test
  - build
  - deploy

test:
  stage: test
  script:
    - npm install
    - npm test
  only:
    - merge_requests
    - main

build:
  stage: build
  script:
    - docker build -t myapp:${CI_COMMIT_SHA} .
  only:
    - main
    - tags

deploy_staging:
  stage: deploy
  script:
    - kubectl set image deployment/myapp myapp=myapp:${CI_COMMIT_SHA}
  only:
    - develop

deploy_production:
  stage: deploy
  script:
    - kubectl set image deployment/myapp myapp=myapp:${CI_COMMIT_SHA}
  only:
    - tags    # Deploy to prod only on tagged releases
  when: manual  # Require manual approval
```

**"Git-driven DevOps patterns:"**

```
PATTERN                  HOW IT WORKS
────────────────────────────────────────────────────────────
GitOps                   Infrastructure defined in Git
                         Changes to Git → auto-deploy
                         (ArgoCD, Flux)

Trunk-Based + CI         Every commit to main triggers CI
                         Feature flags control rollout

Tag-Based Deploy         git tag v2.1.0 → triggers production deploy
                         Predictable, auditable releases

PR-Based Environments    Each PR gets a preview environment
                         Review on real infra before merge
```

---

## Chapter 25: Branching Strategies

### SCRIPT:

"Choosing the right branching strategy is a DevOps/engineering decision that affects your whole team. Let me show the three most common ones."

**[SHOW DIAGRAM FOR EACH]**

### Strategy 1: Git Flow

```
hotfix:          ──●─────────────────────●──
                  / \                   / \
main:    ──●──●──●───●──────────────●──●───●──  (production)
            \        \             /  /
release:     \        ──●──●──●──●  /
              \          /         /
develop:  ──●──●──●──●──●──●──●──●──●──●──     (integration)
               \      /    \       /
feature:        ●──●──       ●──●──
```

```
BRANCHES:
- main:     Production code. Tagged with versions.
- develop:  Integration branch. Features merge here.
- feature/*: One per feature, branches from develop.
- release/*: Prepare release. Bug fixes only.
- hotfix/*:  Emergency fixes from main.

GOOD FOR: Projects with scheduled releases, mobile apps.
BAD FOR:  Projects needing continuous deployment.
```

### Strategy 2: GitHub Flow (Simple)

```
main:    ──●──●──●──●──●──●──●──●──  (always deployable)
              \      /    \    /
feature:       ●──●──       ●──
              (PR + review)
```

```
RULES:
1. main is always deployable
2. Create a branch for any change
3. Open a PR for review
4. Merge to main after approval
5. Deploy immediately after merge

GOOD FOR: Web apps, SaaS, continuous deployment.
BAD FOR:  When you need multiple release versions.
```

### Strategy 3: Trunk-Based Development

```
main:    ──●──●──●──●──●──●──●──●──●──●──  (everyone commits here)
              \  /         \  /
short-lived:   ●─            ●─        (< 1 day branches)
              (or direct commits to main)
```

```
RULES:
1. Everyone works on main (trunk)
2. Branches live < 1 day (or commit directly)
3. Feature flags control what's active
4. CI runs on every commit
5. Always ready to deploy

GOOD FOR: High-performing teams, Google/Facebook-style.
REQUIRES: Strong CI, feature flags, good testing.
```

**"My recommendation:"**

```
TEAM SIZE / CONTEXT             STRATEGY
──────────────────────────────────────────
Solo / small team (2-5)         GitHub Flow
Medium team (5-15)              GitHub Flow or Trunk-Based
Large team (15+)                Trunk-Based with feature flags
Mobile apps / scheduled          Git Flow
releases
Open source projects            GitHub Flow (fork-based)
```

---

## Chapter 26: Monorepo vs Polyrepo

### SCRIPT:

"Should you put everything in one repo or many repos? This is a real debate in the industry."

```
MONOREPO                                POLYREPO
──────────────────────────────────────────────────────────
One repo, all services                  Separate repo per service

my-company/                             my-company/frontend/
├── frontend/                           my-company/backend/
├── backend/                            my-company/infra/
├── mobile/                             my-company/mobile/
├── infra/
└── shared-libs/

Used by: Google, Meta, Uber             Used by: Netflix, Amazon

PROS:                                   PROS:
+ Atomic changes across services        + Independent deployments
+ Shared code is easy                   + Smaller repo = faster clone
+ Single CI/CD pipeline                 + Team autonomy
+ Easy refactoring                      + Independent versioning

CONS:                                   CONS:
- Needs special tooling (Nx, Bazel)     - Cross-service changes = multiple PRs
- CI must be smart (only test changes)  - Shared code needs packages/registries
- Permissions are harder                - Dependency management complexity
- Large repo can be slow                - Harder to refactor across services
```

```bash
# ===== MONOREPO TOOLS =====
# Nx (JavaScript/TypeScript)
# Bazel (Google's build system — any language)
# Turborepo (Vercel — JavaScript)
# Lerna (JavaScript — deprecated in favor of Nx)

# ===== GIT SPARSE CHECKOUT (for large monorepos) =====
# Clone only the parts you need

git clone --filter=blob:none --sparse https://github.com/company/monorepo.git
cd monorepo
git sparse-checkout set frontend/ shared-libs/
# Now you only have frontend/ and shared-libs/ — everything else is excluded
```

---

## Chapter 27: Signed Commits & Security

### SCRIPT:

"In security-conscious teams and open source, signed commits prove that YOU actually made that commit."

```bash
# ===== GPG SIGNED COMMITS =====

# Generate GPG key
gpg --full-generate-key
# Choose RSA, 4096 bits, your Git email

# List your keys
gpg --list-secret-keys --keyid-format=long
# sec   rsa4096/ABC1234567890DEF 2024-01-01
#       Key fingerprint = ...
# uid   Your Name <your@email.com>

# Tell Git to use this key
git config --global user.signingkey ABC1234567890DEF

# Sign a commit
git commit -S -m "Signed commit"

# Auto-sign all commits
git config --global commit.gpgsign true

# Verify signatures
git log --show-signature

# ===== SSH SIGNED COMMITS (easier, Git 2.34+) =====
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global commit.gpgsign true

# Add your SSH key to GitHub for signing verification
# GitHub Settings > SSH Keys > New SSH Key > Signing Key
```

```bash
# ===== SECURITY BEST PRACTICES =====

# 1. Never commit secrets
# Use .gitignore + tools like git-secrets
brew install git-secrets   # or pip install detect-secrets
git secrets --install
git secrets --register-aws

# 2. Remove accidentally committed secrets
# If you committed a secret, just deleting it in a new commit is NOT enough!
# The secret is still in git history.

# Use BFG Repo Cleaner:
bfg --replace-text passwords.txt repo.git
# OR git filter-repo:
git filter-repo --invert-paths --path secret.env

# 3. Protected branches (GitHub/GitLab settings)
# Require PR reviews before merge
# Require status checks to pass
# Require signed commits
# Restrict who can push
```

---

## Chapter 28: Git LFS (Large File Storage)

### SCRIPT:

"Git wasn't designed for large binary files. LFS solves this by storing pointers in Git and files on a separate server."

```bash
# ===== INSTALL GIT LFS =====
# macOS
brew install git-lfs
# Linux
sudo apt install git-lfs
# Windows: included with Git for Windows

# Initialize in your repo
git lfs install

# ===== TRACK LARGE FILES =====
git lfs track "*.psd"
git lfs track "*.zip"
git lfs track "*.mp4"
git lfs track "assets/models/**"

# This creates/updates .gitattributes
cat .gitattributes
# *.psd filter=lfs diff=lfs merge=lfs -text
# *.zip filter=lfs diff=lfs merge=lfs -text

# Commit the tracking rules
git add .gitattributes
git commit -m "Track large files with Git LFS"

# Now use Git normally — LFS handles the rest
git add design.psd
git commit -m "Add design file"
git push

# ===== USEFUL LFS COMMANDS =====
git lfs ls-files           # List tracked files
git lfs status             # Show LFS file status
git lfs fetch --all        # Download all LFS files
git lfs prune              # Remove old LFS files locally
```

---

# PART 6: TROUBLESHOOTING & REAL-WORLD

---

## Chapter 29: Common Disasters & How to Fix Them

### SCRIPT:

"Here are the most common Git disasters and their fixes. Bookmark this section."

```bash
# ===== DISASTER 1: "I committed to the wrong branch" =====

# Move the last commit to the correct branch
git switch correct-branch
git cherry-pick wrong-branch       # brings the commit here
git switch wrong-branch
git reset --hard HEAD~1            # removes it from wrong branch

# ===== DISASTER 2: "I need to undo a pushed commit" =====

git revert abc1234
git push
# Creates a new commit that undoes the changes — safe!

# ===== DISASTER 3: "Merge conflict from hell" =====

# Abort the merge and start fresh
git merge --abort

# Or if you want to accept ALL of one side:
git checkout --theirs .    # accept all incoming changes
git checkout --ours .      # keep all current changes
git add .
git commit

# ===== DISASTER 4: "I deleted a branch with important work" =====

git reflog                         # find the commit
git branch recovered abc1234       # recreate the branch

# ===== DISASTER 5: "I need to remove a file from ALL of history" =====

# Install git-filter-repo (preferred over filter-branch)
pip install git-filter-repo

git filter-repo --invert-paths --path secrets.env
# File is now removed from every commit in history

# ===== DISASTER 6: "Detached HEAD — what?" =====

# You checked out a commit directly instead of a branch
# Your changes won't be on any branch!

# Fix: create a branch from current position
git switch -c save-my-work

# ===== DISASTER 7: "My push was rejected" =====

# "Updates were rejected because the remote contains work that you don't have"

# Fetch and merge (or rebase) first:
git pull --rebase origin main
git push

# ===== DISASTER 8: "I want to completely undo everything since last push" =====

git reset --hard origin/main
# ⚠️ This discards ALL local commits and changes

# ===== DISASTER 9: "Too many merge conflicts on rebase" =====

# Abort the rebase
git rebase --abort

# Consider merge instead (fewer conflicts to resolve at once)
git merge main

# ===== DISASTER 10: "Git says my repo is corrupted" =====

git fsck --full                    # Check for issues
git gc --aggressive --prune=now    # Clean up
# If really corrupted: re-clone from remote
```

---

## Chapter 30: Performance - Handling Large Repos

### SCRIPT:

```bash
# ===== SHALLOW CLONE =====
git clone --depth 1 https://github.com/large/repo.git
# Only download the latest commit — much faster

# Deepen later if needed:
git fetch --deepen=100

# ===== PARTIAL CLONE =====
# Don't download blobs until needed
git clone --filter=blob:none https://github.com/large/repo.git
# Files are downloaded on demand when you checkout

# ===== SPARSE CHECKOUT =====
git sparse-checkout init --cone
git sparse-checkout set src/ docs/
# Only these directories are in your working tree

# ===== SPEED UP GIT STATUS =====
# For huge repos, enable filesystem monitor:
git config core.fsmonitor true
git config core.untrackedcache true

# ===== GIT MAINTENANCE =====
# Run periodic optimization
git maintenance start
# This schedules: prefetch, commit-graph, loose-objects, incremental-repack

# Manual optimization
git gc                             # Garbage collect
git gc --aggressive                # Thorough garbage collect
git prune                          # Remove unreachable objects
```

---

## Chapter 31: Git Internals (How Git Actually Works)

### SCRIPT:

"Understanding internals makes you dangerous. Let's peek under the hood."

**[SHOW DIAGRAM]**

```
THE 4 GIT OBJECTS:

1. BLOB     → File contents (no name, just data + SHA hash)
2. TREE     → Directory listing (names → blobs/trees)
3. COMMIT   → Snapshot (tree + parent + author + message)
4. TAG      → Named pointer to a commit (annotated tags)

commit: abc123
├── tree: def456
│   ├── blob: 789aaa  →  README.md
│   ├── blob: 789bbb  →  app.py
│   └── tree: 789ccc  →  src/
│       ├── blob: 789ddd  →  main.py
│       └── blob: 789eee  →  utils.py
├── parent: previous-commit-hash
├── author: Name <email> timestamp
└── message: "Add feature X"
```

```bash
# ===== EXPLORE GIT OBJECTS =====

# Every object has a SHA-1 hash (40 characters)
# Shortened to 7+ characters for display

# See what type an object is
git cat-file -t abc1234
# Output: commit, tree, blob, or tag

# See the content of an object
git cat-file -p abc1234

# Example: inspect a commit
git cat-file -p HEAD
# tree d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3
# parent a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0
# author Name <email> 1709000000 +0530
# committer Name <email> 1709000000 +0530
#
# Commit message here

# ===== UNDERSTAND REFS =====

# Branches are just files containing a commit hash
cat .git/refs/heads/main
# abc1234567890...

# HEAD points to current branch
cat .git/HEAD
# ref: refs/heads/main

# When HEAD points directly to a commit → "detached HEAD"
# When HEAD points to a branch → normal operation

# ===== THE INDEX (STAGING AREA) =====
git ls-files --stage
# Shows all files in the index with their blob hashes
```

**[INTERVIEW TIP #8]**

> "Interview question: 'How does Git store data internally?'
> Answer: 'Git uses a content-addressable filesystem with four object types: blobs store file contents, trees represent directories (mapping names to blobs/trees), commits point to a tree and contain metadata like author, message, and parent commit, and tags are named pointers to commits. Everything is identified by a SHA-1 hash of its content. Branches are simply files containing a commit hash, making them extremely lightweight.'"

---

## Chapter 32: Top 30 Interview Questions

### SCRIPT:

"Let's rapid-fire through the most common Git interview questions. I'll give you concise, impressive answers."

```
Q1: What is Git?
A: Distributed version control system created by Linus Torvalds in 2005.
   Every developer has a complete copy of the repository including full history.

Q2: Git vs GitHub?
A: Git is the tool (runs locally). GitHub is a hosting platform for Git repos
   that adds collaboration features (PRs, Issues, Actions).

Q3: What is a repository?
A: A directory tracked by Git, containing your project files and a .git folder
   that stores the complete version history.

Q4: git fetch vs git pull?
A: fetch downloads remote changes without modifying your working directory.
   pull = fetch + merge (downloads AND integrates changes).

Q5: git merge vs git rebase?
A: merge creates a merge commit preserving branch history.
   rebase replays commits on top of another branch for linear history.
   Use rebase to update feature branches, merge to integrate into main.

Q6: What is a merge conflict?
A: When two branches modify the same lines in the same file and Git can't
   auto-resolve. You manually edit the file, choosing what to keep.

Q7: git reset vs git revert?
A: reset moves the branch pointer back, removing commits from history (local use).
   revert creates a new commit that undoes changes (safe for shared branches).

Q8: What are the 3 states in Git?
A: Working Directory (your files), Staging Area/Index (git add),
   Repository (git commit).

Q9: What is HEAD?
A: A pointer to the current commit you're on. Usually points to a branch,
   which in turn points to a commit.

Q10: What is a detached HEAD?
A: When HEAD points directly to a commit instead of a branch. Commits made
    in this state aren't on any branch and may be garbage collected.

Q11: How do you undo the last commit?
A: git reset --soft HEAD~1 (keeps changes staged)
   git reset HEAD~1 (keeps changes unstaged)
   git reset --hard HEAD~1 (discards changes - careful!)

Q12: What is git stash?
A: Temporarily saves uncommitted changes so you can switch branches,
   then restore them later with git stash pop.

Q13: What is cherry-pick?
A: Applying a specific commit from one branch to another. It creates
   a new commit with the same changes but a different hash.

Q14: What is git bisect?
A: A binary search tool to find which commit introduced a bug.
   You mark good/bad commits and Git narrows down automatically.

Q15: What is a bare repository?
A: A repo with no working directory — only the .git contents. Used for
   central/remote repos (like what GitHub hosts). Created with git init --bare.

Q16: What is git reflog?
A: A log of all HEAD movements (commits, checkouts, resets, rebases).
   Local only, used to recover lost commits.

Q17: What are Git hooks?
A: Scripts that run automatically on Git events (pre-commit, pre-push,
   commit-msg). Used for linting, testing, enforcing conventions.

Q18: .gitignore not working?
A: The file was already tracked before adding to .gitignore.
   Fix: git rm --cached <file>, then commit.

Q19: How to rename a branch?
A: git branch -m old-name new-name (local)
   git push origin --delete old-name && git push -u origin new-name (remote)

Q20: What is git squash?
A: Combining multiple commits into one. Done via interactive rebase
   (git rebase -i) or squash merge (git merge --squash).

Q21: Fast-forward vs 3-way merge?
A: Fast-forward: target branch hasn't diverged, pointer just moves forward.
   3-way: both branches have new commits, creates a merge commit.

Q22: What is upstream tracking?
A: The link between a local branch and its remote counterpart.
   Set with git push -u origin branch-name.

Q23: How to find who changed a specific line?
A: git blame <file> shows the last commit that modified each line.

Q24: What is git tag?
A: A permanent label on a commit, typically used for releases (v1.0.0).
   Lightweight tags are just pointers; annotated tags store metadata.

Q25: How to revert a merge commit?
A: git revert -m 1 <merge-commit-hash>
   -m 1 specifies to keep the mainline parent.

Q26: What is git submodule?
A: A way to include one Git repo inside another. The parent repo stores
   a pointer to a specific commit in the child repo.

Q27: git clone --depth 1?
A: Shallow clone — only downloads the latest commit, not full history.
   Faster for CI/CD or when you don't need history.

Q28: What is GitOps?
A: Using Git as the single source of truth for infrastructure and deployments.
   Changes to Git trigger automated deployment (tools: ArgoCD, Flux).

Q29: How to clean untracked files?
A: git clean -fd (force, directories). Add -n for dry run first.

Q30: Branching strategy for your team?
A: "For continuous deployment I prefer trunk-based development with
   short-lived branches and feature flags. For scheduled releases,
   Git Flow with develop and release branches. For small teams,
   GitHub Flow with PRs is simple and effective."
```

---

## Chapter 33: Day-to-Day Cheat Sheet

### SCRIPT:

"Here's the cheat sheet you'll screenshot and keep forever."

```
╔══════════════════════════════════════════════════════════════════╗
║                    GIT DAILY CHEAT SHEET                        ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  SETUP                                                           ║
║  git config --global user.name "Name"                            ║
║  git config --global user.email "email"                          ║
║  git init                    Create new repo                     ║
║  git clone <url>             Clone existing repo                 ║
║                                                                  ║
║  DAILY WORKFLOW                                                  ║
║  git status                  Check what's changed                ║
║  git add <file>              Stage changes                       ║
║  git add .                   Stage all changes                   ║
║  git commit -m "msg"         Commit staged changes               ║
║  git push                    Push to remote                      ║
║  git pull                    Get latest from remote               ║
║                                                                  ║
║  BRANCHES                                                        ║
║  git branch                  List branches                       ║
║  git switch -c <name>        Create + switch to branch           ║
║  git switch <name>           Switch to branch                    ║
║  git merge <branch>          Merge branch into current           ║
║  git branch -d <name>        Delete merged branch                ║
║                                                                  ║
║  INSPECT                                                         ║
║  git log --oneline           Compact history                     ║
║  git diff                    Unstaged changes                    ║
║  git diff --staged           Staged changes                      ║
║  git blame <file>            Who changed each line               ║
║                                                                  ║
║  UNDO                                                            ║
║  git restore <file>          Discard working changes             ║
║  git restore --staged <file> Unstage file                        ║
║  git reset --soft HEAD~1     Undo commit, keep staged            ║
║  git revert <hash>           Undo pushed commit (safe)           ║
║                                                                  ║
║  STASH                                                           ║
║  git stash                   Save changes temporarily            ║
║  git stash pop               Restore saved changes               ║
║  git stash list              List all stashes                    ║
║                                                                  ║
║  REMOTE                                                          ║
║  git remote -v               List remotes                        ║
║  git fetch                   Download without merging            ║
║  git push -u origin <branch> Push new branch                    ║
║                                                                  ║
║  CLEANUP                                                         ║
║  git clean -fd               Remove untracked files              ║
║  git gc                      Garbage collect                     ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

---

# OUTRO

### SCRIPT:

"And that's Git — from zero to hero. Let me leave you with the 5 habits of developers who never have Git problems:

1. **Commit often, commit small** — each commit should do ONE thing
2. **Write meaningful commit messages** — your future self will thank you
3. **Pull before you push** — always sync before pushing
4. **Branch for everything** — never work directly on main
5. **When in doubt, git stash** — save your work, figure it out, come back

If this video helped you, smash that like button. If you think someone else needs this, share it. And subscribe for more deep-dive DevOps and developer content.

See you in the next one."

---

# VIDEO PRODUCTION NOTES

```
TIMESTAMPS FOR DESCRIPTION:
0:00  Introduction
0:30  Chapter 1: What is Git
X:XX  Chapter 2: Installation & Setup
X:XX  Chapter 3: First Repository
X:XX  Chapter 4: The 3 Areas (MOST IMPORTANT)
X:XX  Chapter 5: Viewing History
...   (add actual timestamps during editing)

THUMBNAIL IDEAS:
- "Git MASTERCLASS" with terminal background
- Split: "Beginner → Expert" with arrow
- "Everything about Git in One Video"

DESCRIPTION TEMPLATE:
Git complete tutorial from installation to advanced.
Covers: basics, branches, merge conflicts, rebase, cherry-pick,
reflog, hooks, CI/CD, branching strategies, internals,
and 30 interview questions with answers.

#git #devops #programming #tutorial #github

TAGS:
git tutorial, git for beginners, advanced git, git rebase,
git merge conflicts, git interview questions, devops git,
git branching strategy, git hooks, git internals
```
