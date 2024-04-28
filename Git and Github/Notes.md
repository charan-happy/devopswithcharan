# Git and Github

# what is version control system ? & why we have to use it ?

# Centralised version control vs distributed version control system

# why git ?
#  Git installation
# Difference between git and github
# Git Repository Structure
# initiating a project
# Git Object Model
# Git working tree
	>> cloning a project
	>> making changes/commits
	>> pulling commits
	>> Resolving conflicts
>> Lifecycle of a file in git
# Branching in git
	structure of branch
	Types of branches
	git checkout
# workflow in git
# tags
# cherrypick
# Rebase 
# Remote
# git reflog

For More Surprises, visit last part of these page



### what is version control system ?

- Version control system is a system which involves the process of keep track of modifications of the previous versions of present code.
- VCS is also called as Source Control System (SCS ) is a system that helps you to manages to a file or set of files over a time.
- It allows keep track of all the changes made to a file or set of files. As well as who made changes, when and why . VCS are commonly used in Software development but also used in other type of files such as documents, spreadsheets and images.
    
    **Advantages of VCS :**
    
    - **keep track of changes**
    - **collaboration**
    - **versioning**
    - **Branching and Merging**
    - **Backup**
    
    Version control system is basically divided into 2 types . They are 1. Distributed Version Cotrol system 2. Centralised version control system
    
    | Centralised Version Control System | Distributed Version Control System |
    | --- | --- |
    | It is a single repository | It is a multi repository |
    | Internet connection was always needed | No need of internet connection |
    | Made conflicts between the developers | Doesn't made conflicts between the developers as there is an isolated repository for every individual |
    | It is having high risk of losing data | It has less risk of losing data |
    
    ### GIT vs GITHUB
    
    | GIT | GITHUB |
    | --- | --- |
    | It was developed by linux foundation | It was developed by Microsoft |
    | It was developed in 2005 | It was developed in 2008 |
    | It isa software and CLI | It is a website |
    | It is User independent | It user dependent |
    | It is installed locally on the system | It is hosted in the web |
    | It focuses on code sharing and version controlling | It focuses on the centralised source code hosting |

### Download and installation

> please visit http://git-scm.com/downloads for all the instructions related to installation guide on different OS's.

> EX: To install in Linux/Debian/Ubuntu based system use `sudo apt install git-all`

## what is git ?

- A distributed version control system
- Created by linus Torvalds to work on linux kernel in ~2005
- **Main features**
    
    ```
      > Everyone has complete history
    
     >  Most of the operations are done offline ( branching, diff, log, commits, branchops )
    
     > Distributed, changes can be shared without a server
    
      > lightweight branches, fast context switching (create/merge/release)
    
     > Remember history of branch merges

     > Opensource
    
    > Better features

     > Fully distributed

    > largely Scalable
    ```

### GIT Repository Structure


> `git log --oneline --decorate --graph --all` --> To visualize the logs in graph format.


💡 Key Takeaways
Git uses a key-value store to manage data efficiently.
The key is the SHA-1 hash of the object's content, ensuring uniqueness and integrity.
The value is the actual object, containing the data you added.
Different types of Git objects serve specific purposes, like storing files, representing directories, capturing project snapshots, and annotating commits.
.

**hooks:** This directory contains scripts that Git can run before or after certain actions, such as committing or pushing changes

Overall, the Git repository structure is designed to allow for efficient version control and collaboration on projects, while keeping track of all the changes made to files over time.

### Initiate a project

**Init**
- if we have project in our local system (ex; laptop) to kept it under git we have to initialize git by using `$ git init`

- if we are cloning the repo from remote repository then it will automatically create a `.git` folder

git init is a command in the Git version control system that is used to create a new Git repository. When you run git init in a directory, it creates a new Git repository in that directory, which enables version control of your files. Here's how you can use git init:

1. Open your terminal or command prompt.
2. Navigate to the directory where you want to create your new Git repository.
3. Run the command git init.
4. Git will create a new directory called .git in your current directory. This directory contains all the files and folders needed to manage your repository.
5. You can now start adding files to your repository and using Git commands to manage them.

It's important to note that git init only needs to be run once in a directory to create a Git repository. If you run it again in the same directory, it will overwrite the existing Git repository, which could result in data loss.

Running `git init` command creates a `.git` folder

- under `.git` you have two folders named `objects` and `refs`

## GIT Internals

**Repos**
- A git repository is an on-disk data structure [self-contained directory ]  that stores metadata [the file's name, size, modification date, and content. ] for a set of files and directories.
- This metadata allows Git to track changes and efficiently manage the project's history
- It lives in your `.git/folder` every time you commit data to git. It gets stored here. Inversly .git/ contains every single commit
- It's basic structure like this

   	.git/<br>
    		objects/   refs/
    
Git repository exists entirely in a single ".git" directory

Note: .git is also hidden in Windows (msysgit).
You would have to do a dir /AH to see it.
  		
The Git directory contains several important files and directories, including :

**HEAD:** This file points to the current branch that you are working on. 

**Objects:** This directory contains all the objects that Git uses to store the content of your files, including blobs (file contents) and trees (directory structures). 

**refs:** This directory contains all the references to branches, tags, and other Git objects. config: This file contains configuration information for the repository.

which are points to a single object(usually a commit or a tag object

**References/refs:**

- A reference is a file stored in somewhere else ./git/ref containing hash of commit object.

`$ ls -l .git/refs/heads`

`$ cat .git/refs/heads/master`

`$ git show --oneline master`

`$ git rev-parse master`

### objects
- Git is fundamentally a key-value store. when you add data to git. It builds an object and stores SHA-1 of a hash of the object content as a key. and pointer as a value
- Therefore any content in git is looked up as hash

  `$ git cat-file -p <hash-id>`

  
There are 4 types of objects, Blobs, tags, trees, commit

**HEAD Ref**
- Head is a special ref that always points to the current object
- we can see where it is currently pointing by checking the .git/HEAD file
- cat .git/HEAD you get some value. you can notice that it is known as `detached head` because it does not pointing to any ref instead directly pointing to an object.

### ref
- The ref is essentially a pointer. It's a name that points to an object. ![image](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/62f20acd-6602-4b87-8d0d-7f6f12d074eb)
They are stored in `.git/refs/heads/main`

### commit object
- the `commit` does not directly contain any changed files or data. Rather, it contains mostly metadata and pointers to other objects that contain the actual contents of the commit.
- A commit contains a few things
  	- hash of a tree
  	- hash of a parent commit
  	- author name/email, committer name/email
  	- commit message

  Tree:

  - Tree object stores every file in your project, and it stores whole files, not diffs. This means that each commit contains a snapshot of the entire project.
 
  parent :
- the parent line contains a hash of another `commit` object and can be thought of as a "parent pointer" that points to the "previous commit" This implicitly forms a graph of commits known as the **commit-graph**

**TREE Object**
- A tree basically represents a folder in a traditional filesystem; nested container for files or other folders.

  A tree contains :
  - 0 or more blob objects
  - 0 or more tree objects

- just as you can use ls or dir to list the contents of a folder, you can list the contents of a tree object.
- you can lookup the files in a commit by first finding the hash of the tree in the commit and then looking at that tree.

### Blob Object
- A blob contains arbitrary binary file contents. commonly, it will be raw text such as source code or a blog article. But, it could just as easily be the bytes of a PNG file or anything else.

- if you have the hash of a blob, you can look at its contents

## How git differ from other version control systems out there in the market?
- The only difference between git and other VCs like SVN, perforce, Bazar etc is the way 
they think about data

- Most other VCS store data as a list of file-based changes. these systems think of the information they keep as a set of files and changes made to each file over time.

![image](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/a883f359-047b-4991-b0ff-c411ecf036f1)

- But, git thinks of it as a set of snapshots of a mini file system. Every time you save or commit the state of your project in Git. It basically takes a picture of what all your files look like at the moment and stores a reference to that snapshot.
- To be efficient, if files have not changed, Git doesn’t store the file again—just a link to the previous identical file it has already stored.
  ![image](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/555fc743-eade-4ce6-9d27-8ee901917c62)



**creating new commit**
- the `git commit` command does a few things:
  1. Create blobs and trees to represent your project directory. stored in .git/objects
  2. Create a new commit object with your author information, commit message, and the root tree from step 1 - also stored in .git/objects
  3. updates the HEAD ref in .git/HEAD to the hash of the newly-created `commit`

  - This results in a new snapshot of your project being added to git that is connected to the previous state.

**Moving HEAD**
- when you run `git checkout` on a commit (specially by hash or ref) you are telling git to make your working directory look like how it did when the snapshot was taken
  	1. Update the files in the working directory to match the tree inside the commit
  	2. update HEAD to point to the specified hash or ref

**Moving refs around**
- running `git reset --hard` moves refs to the specified hash/ref

**creating new refs**
  - running `git checkout -b <refname>` will create a new ref that points to the current commit.



  🔑 Understanding Git's Key-Value Store and Its Objects
Git, at its core, operates like a key-value store. When you add data to Git, it creates an object and stores the SHA-1 hash of that object's content as the key. This means:

Key: The key is the SHA-1 hash, a unique identifier generated from the object's content.
Value: The value is the actual object itself, containing the data you added (e.g., file contents, commit message).
This approach ensures data integrity and efficient retrieval.

🔎 Exploring Git Objects
Git objects come in various types, each serving a specific purpose:

Blob: Stores the raw content of files.
Tree: Represents a directory structure, linking together blobs and other trees.
Commit: Captures a snapshot of your project at a specific point in time, referencing a tree and containing metadata like author and commit message.
Tag: Annotates a specific commit with a descriptive name.

💡 Key Takeaways

Git uses a key-value store to manage data efficiently.
The key is the SHA-1 hash of the object's content, ensuring uniqueness and integrity.
The value is the actual object, containing the data you added.
Different types of Git objects serve specific purposes, like storing files, representing directories, capturing project snapshots, and annotating commits.

### GIT Object Model :

Git is a distributed version control system that stores the content of a project as a set of snapshots or commits. The Git object model is the way Git internally represents and stores the content and history of a project.

- The GIT object Model consists of four types of objects.

1. **BLOB :**
- BLOB stands for binary large object.
- It is a binary representation of a file. This is the object type which is used to store the contents of each file in a directory.These are most basic datatypes in git.
1. **Tree objects :**
- These are bit like directories. Tree objects can contain pointers to blobs and any other tree objects.
- It represents the hierarchy of files and directories in a project.
- root tree object is essentially a snapshot of your repository at a given time. When git refers to the tree it means it is root tree object.
  

Git uses a content-addressable storage system, which means that each object is identified by a unique SHA-1 hash of its contents. This allows Git to easily verify the integrity of objects and detect any changes. The Git object model is key to understanding how Git tracks changes in a project and allows users to navigate the history of a project

**Git Working Tree**

The Working Tree in Git refers to the current version of a repository that a user is working on. It is the place where developers make changes to the files in the project and test their code before committing their changes to the repository.

- When you clone or checkout a Git repository, the entire project is downloaded onto your local machine, creating a local copy of the repository in your file system. The files and directories in the repository are stored in the .git directory, and when you make changes to any of the files in your working directory, Git will track those changes and allow you to commit them to the repository.

The working process of git as follows : working area ---> staging area --> local repository ---> remote repository.

- we can initiate a empty git repository anywhere by using `$ git init` command
- The important directories are ./objects where we store all objects and ./refs where we store all references

**Clone**

- `git clone` is a command used in Git, to create a copy of a repository. When you clone a repository, you create a copy of the entire project, including all its files and the full revision history on your local machine. This allows you to work on the project locally, make changes, and then push those changes back to the original repository

Example: git clone <remote repo url>

- By default, git clone will create a local copy of the entire repository. However, you can also specify a particular branch or tag to clone using the -b or --branch option, or clone only a specific directory or subdirectory of the repository using the --depth option.

- ### clone a remote respository

 clone copies entire history commits

- Remote tracking branches are created
- Default branch will be checkout to local dir
- Remote Git repo info will be stored in .git/config [remote] section
- A remote name 'origin' will be assigned to remote git URL by default.
    
    > `git clone [-b defaultCheckoutBranch]`

**Branches :**

- git branch is a Git command used to list, create, or delete branches in a Git repository. In Git, branches are pointers to a specific commit in the repository's history. Each branch represents a line of development, allowing developers to work on multiple features or bug fixes simultaneously and independently.
- By default, when you create a Git repository, it has one branch called "master"/ "Main" which points to the latest commit in the repository's history. However, you can create multiple branches using the git branch command to work on different features or experiment with new ideas without affecting the main codebase.
- git branches is a strong feature. It is lightweight. It is entire clone of the repository. `$ cat .git/HEAD`

`$ git branch </branch-name>`

`$ cat .git/refs/heads/</branch-name>`

`$ cat .git/HEAD`

`$ git checkout </branch-name>`

`$ cat .git/HEAD`

- When run with no arguments, git branch will display a list of all the local branches in the repository, indicating which branch is currently checked out with an asterisk (*).

Some common usage examples of git branch are:

`git branch:` List all local branches

`git branch new-branch:` Create a new branch called "new-branch"

`git branch -d branch-to-delete:` Delete the local branch called "branch�to-delete"

`git branch -m old-branch new-branch:` Rename the branch "old-branch" to "new-branch"

`git branch -a:` List all local and remote branches

`git branch -v:` List all local branches along with the commit message and hash of their most recent commit.

**Commonly used Git branches are:** Master Branch: The primary branch of the repository which represents the main codebase.

**Feature Branch:** A branch created to implement a new feature or work on a specific task. It is typically created off the master branch, and once the feature is complete, it is merged back into the master branch.

**Release Branch:** A branch created when a new release is ready. It is typically created from the master branch and contains only stable and tested code.

**Hotfix Branch:** A branch created to fix critical issues in the codebase. It is created off the release branch and once the fix is complete, it is merged back into both the master and release branches.

**Development Branch:** A branch used for ongoing development work, separate from the master branch. Changes made on this branch are merged into the master branch once they are stable and tested.

### Git Checkout

git checkout is a command in the Git version control system that is used to switch between different branches, create a new branch, or checkout a specific commit or file.

Here are some common uses of git checkout :

1. **Switching branches :** : To switch to an existing branch, use git checkout . This will move your working directory to the latest commit on that branch.
2. **creating a new branch :** To create a new branch and switch to it, use git checkout -b <new-branch�name>. This will create a new branch off the current branch and switch to the new branch.
3. **checking out a specific commit**: : To check out a specific commit, use git checkout . This will move your working directory to the state of the repository at the specified commit.
4. **Checking out a specific file**: To check out a specific file from a branch or commit, use git checkout <branch-name/commit-hash> . This will replace the contents of the file in your working directory with the contents of the file in the specified branch or commit.

It's important to note that git checkout can modify the state of your working directory and potentially overwrite changes that you have made. Therefore, it's important to use it with caution and make sure you understand what you are doing.

  ### Branch synchronization
    
    - Merge flow (fetch + merge + push )
    - Rebase flow (fetch + rebase + push )
    - `git pull = git fetch + git merge`
    - `git pull --rebase = git fetch + git rebase`

- *staging area **
- In Git, the staging area (also known as the "index" or "cache") is a concept that refers to the intermediate step between modifying files and committing those changes to the Git repository.
- When you make changes to files in your Git repository, those changes are initially only tracked in your local working directory. In order to commit those changes to the Git repository, you first need to add them to the staging area.
- The staging area is essentially a snapshot of your working directory at a particular point in time. You can use the "git add" command to add modified files to the staging area. Once a file is in the staging area, you can review the changes and make any necessary modifications before actually committing the changes to the repository using the "git commit" command.
- Using the staging area can be helpful in a number of ways. For example, it allows you to review and selectively add changes before committing them, which can help prevent mistakes and ensure that you only commit changes that are ready to be shared with others.
- Additionally, using the staging area can help you organize and structure your commits more effectively, which can make it easier to track changes over time and collaborate with others.

**add :**

- In Git, the "git add" command is used to add changes to the staging area, which is an intermediate step in the process of committing changes to the Git repository.
- When you make changes to files in your working directory, Git initially tracks those changes but does not automatically add them to the staging area. To add changes to the staging area, you can use the "git add" command followed by the name of the file(s) you want to add. For example: `git add myfile.txt`
- This command adds the changes made to "myfile.txt" to the staging area, where they can be reviewed and modified before being committed to the Git repository using the "git commit" command.
- You can also use the "git add" command with wildcards or patterns to add multiple files at once.

For example: `git add *.txt`

- The "git add" command can also be used to stage file deletions or moves. For example: `git add --all`
- This command adds all changes, including file deletions and moves, to the staging area. Alternatively, you can use the "git rm" command to remove files from both the working directory and the Git repository

**commit :**

- A git commit is a command used in the Git version control system to save changes to a local repository. When you make changes to files within a Git repository, you can stage those changes using the git add command, which adds the changes to the staging area. Once you have staged all the changes you want to include in the commit, you can use the - - git commit command to create a new commit. The git commit command allows you to provide a commit message, which should briefly describe the changes you are committing.
- It's important to write clear and descriptive commit messages, as they help others understand what changes you have made and why.
- A typical git commit command looks like this: git commit -m "Add new feature to web app"
- This command creates a new commit with the commit message "Add new feature to website". The -m option is used to specify the commit message inline with the command.

        - Branch pointer will be automatically updated after commit
        - DO NOT commit when HEAD is not pointing to a branch (no branch will be updated )
        - commit in the middle of an existing branch will create a new commit outside of the original history.

**push**

- git push is a command used in the Git version control system to upload local repository changes to a remote repository. This command is used after making changes to the files in your local repository and committing those changes using the git commit command.
- The basic syntax for the git push command is as follows: `git push <remote> <branch>`

Here, refers to the name of the remote repository you want to push your changes to, and refers to the name of the branch you want to push to the remote repository. For example, to push changes from the local master branch to the origin remote repository, you would use the following command: `git push origin master`

- This command would upload all the changes you have made in your local master branch to the master branch in the origin remote repository.
- It is important to note that you may encounter errors when pushing changes if there are conflicts between the changes made in your local repository and the changes made in the remote repository. In such cases, you may need to resolve the conflicts before pushing your changes.

- Git push will sent the commits from local branch to remote repository
- will also update remote tracking branch
- New commits from local should only append on existing commits from remote. if git found remote branch has different commit history, the push will fail
    
    `git push origin HEAD:master`

**Pull :**

- git pull is a Git command used to fetch and merge changes from a remote repository into your local repository. When you run git pull, Git performs two operations:1.**git fetch**: : This command downloads the latest changes from the remote repository and stores them in a local branch named "origin/branch-name" (where "branch-name" is the name of the remote branch you're tracking).2. **git merge**: This command merges the changes downloaded from the remote repository into your current branch. If there are any conflicts between your local changes and the changes from the remote repository, Git will prompt you to resolve those conflicts before completing the merge.

Here's an example of how to use git pull to update your local repository with the latest changes from the remote repository:

1. Navigate to the local repository directory using the command line
2. Run the following command to fetch the latest changes from the remote repository `git fetch` 3.Run the following command to merge the changes into your current branch: `git merge origin/branch-name` Replace "branch-name" with the name of the remote branch you want to merge.
- Alternatively, you can use the git pull command with the --rebase option to fetch and rebase the changes from the remote repository instead of merging them. This option can be useful for keeping a linear commit history. For example: `git pull --rebase` This will fetch the latest changes from the remote repository and rebase your changes on top of them. If there are any conflicts, Git will prompt you to resolve them before continuing with the rebase.

**Stash :**

- git stash is a command in Git that allows you to temporarily save changes you've made to a working directory and revert it back to the last commit. This is useful when you need to switch to a different branch or work on a different task, but don't want to commit the changes you've made so far. When you run git stash, Git takes all of the changes in your working directory that are not yet committed and stores them in a "stash." You can then switch to a different branch or task and continue working. When you're ready to go back to the changes you stashed, you can run git stash apply to apply the stash back to your working directory. Here are some common git stash commands:
- **git stash** : this command stashes all the changes you've made to the working directory.
- **git stash save "stash message"**: This command allows you to provide a message describing the changes you've stashed.
- **git stash list**: This command shows a list of all the stashes you've created.
- **git stash apply**: This command applies the most recent stash to your working directory.
- *git stash apply stash@{2}: This command applies a specific stash to your working directory.
- **git stash drop**: This command deletes the most recent stash.
- **git stash pop**: This command applies the most recent stash and then deletes it

It's important to note that git stash does not create a commit. so, it's not a replacement t for committing changes. Instead, it's a tool for temporarily saving changes when you need to switch contexts or work on a different task

**Tags:**

- Git tags are markers that are used to create a named reference to a specific commit in a Git repository. They can be used to label specific points in a repository's history, such as release versions or important milestones. There are two types of Git tags: lightweight tags and annotated tags.

A lightweight tag is simply a pointer to a specific commit. It is created by running the following command: `git tag <tag-name> <commit>`

An annotated tag, on the other hand, is a full object in Git, which includes a tagger name, email, and date, along with a message. It is created by running the following command: `git tag -a <tag-name> <commit> -m "tag message"`

Annotated tags are often used to mark release versions, while lightweight tags can be used for other purposes.

Once a tag is created, it can be pushed to a remote repository using the following command: `git push origin <tag-name>`

To list all of the tags in a repository, you can use the following command: `git tag`

You can also view information about a specific tag by running the following command: `git show <tag-name>`

Overall, Git tags are a useful feature for organizing and marking important points in a repository's history.

- There are 2 types of tags in git they are 1. annotated tags and 2. lightweight tag `$ git checkout master` `$ git tag 1.0-lightweight` `$ cat .git/refs/tags/1.0-lightweight` `$ git cat-file -p 1.0-lightweight`
- lightweight tag and commit are the same object. light weight tag is only reference to the commit object
- let's create annotated tag `$ git tag -a -m "taged 1.0" 1.0` we have passed -a(annotated) to git tag to create annotated tag, It is also created a reference tag just like lightweight tag but reference is not pointing to same object as the lightweight tag. `$ git cat-file` to inspect the object

Tag objects can also be signed with GPG keys to prevent commit or email spoofing. `$ cat .git/refs/tags/1.0` `$ git cat-file -p 1.0`

Reasons why we prefer annotated tag rather than lightweight tag :

> GpG keys Owner authorization These are timestamped, Apart from telling when the last commit was made. It also tells us about the last version release date.


**Merging :**

- Merging in git is the process of joining two histories(branches)together.
- let's say you have created new feature branch from master, and done some work on it. `$ git checkout -b </branch-name>` `$ git commit -am "finished the new feature"` `$ git checkout master` At the same time, you need to fix an urgent bug . so you created a hotfix branch from master and do some work in there. Now you want to bring the bug fix into master. so that you can tag it and release it.

`$ git checkout -b hotfix` `$ git commit -am "fixed some wording"`

- Notice how git mentions **fast-forwarding** during the merge. what this means is that all of the commits in hotfix were directly upstream from master. This allows git to simply move the master pointer up the tree to hotfix.

let's try and merge feature-branch into master. `$ git branch hotfix` `$ git merge hotfix` `$ git merge feature-branch` `$ git log --oneline` `$ git show --format=raw </commit-id>`

- This time, Git wasn't able to perform a fast-forwarding. This is because feature-branch isn't directly upstream from master. This is clear on the above above, where master is at commit **D** which is in a different history tree to feature-branch at commit **C** so, how did git handle this merge ? Taking a look at the log, we see that git has actually created a new "merge" commit, as well as bringing the commit from feature-branch.

upon closer inspection, we can see that this is a special kind of commit object- It has **two parent commits** this is refered to as **merge commit**

### git merge
        
        fast-forward
        
        - if current branch is ancestor of the target branch, then no new commit will be created. Simply move the current branch pointer to point to the target branch.
            
            3-way merge ( real merge )
            
            - if no conflicts, the merge result will become a new commit, and its parent commit are both a tail commit of source and target branch
            - If found conflicts, the contents in working directory and index will be updated with the conflict results user is responsible to resolve it and commit


**cherry-picking :**

### git cherry-pick

    - Apply the same change set of a commit to current branch
    - Auto commit if no conflict, SHA1 will be different

- if you are on commit **D** and you run git cherry-pick **F**, Git will take that changes that are introduced in commit **F** and replay them as new commit(shown as 'F`') on top of commit **D**
    
    
- The reason why we end up with a copy of commit **F** rather than commit **F** itself is due to the way commits are constructed. Recall the parent commit is part of a commit's hash.so, despite containing the same changes, author information and timestamp. **F`** will have a different parent to **F**, giving it a different hash.
- A common workflow in git is to develop feature on small branches and merge the features one at a time into the masters branch.
    

    
- As you can see, master has been updated since, "foo" was created. To avoid potential conflicts when "foo" is merged with "master", we want to bring master's changes into "foo". Because master is the base branch, we want to play foo's commits on top of master. Essentially, we want to change commit **C's** parent from **B**to**F** it's not going to be easy. But, we can achieve this with git cherry-pick.First, we need to create a temporary branch at commit F

`$ git checkout master` `$ git checkout -b foo-tmp` Now that we have a base on commit **F**, we can cherry-pick all of foo's commits on top of it. `$ git cherry-pick C D`

- Now all that's left to do is point "foo" at commit **D`** and delete temporary branch "foo-temp". We do this with the reset command, which points HEAD(and therefore the current branch) at a specified commit. The --hard flag ensures our working tree is updated as well.


    why do we need reset ?
    
    - Remove error commits before push
    - combine commits before push
    - Refine history graph before push
    
    3 types of reset - Soft reset (1) - Mixed reset (1+2)(default0 - Hard reset (1+2+3)
    

`$ git checkout foo` `$ git reset --hard foo-temp` `$ git branch -D foo-temp`

- This gives the desired result of foo's commits being upstream of master. Note that the original **C**and**D** commits are no longer reachable because no branch points to them.

**Rebasing :** 

- ### Git rebase

```
      - Reapply all patches from the current branch on top of target branch
      - common ancestor commit will not be re-applied
      - current branch will be moved on top of the target branch, the history path will change.
      - Deal with conflicts
               - when you have resolved this problem run "git rebase --continue"
               - if you prefer to skip this patch run "git rebase --skip" instead
               - To check out the original branch and stop rebasing run "git rebase --abort"
        Do Not rebase branches that already pushed to remote only . Rebase personal branches

```

`$ git rebase <base> <target>`

- with the format git rebase , the rebase command will take all of the commits from and play them on top of one by one. It does this without actually modifying , so the end result is a linear history in which can be fast-forwarded to
- In a sense, performing a rebase is like telling git **"Hey, i want to pretend that was actually branched from Take all of the commits from , and pretend that they happened after "**.
- All we have to do to enable fast-forward merge of feature-branch into master is run git rebase master feature branch before performing the merge. This has brought feature-branch directly upstream of master.

![](https://user-images.githubusercontent.com/89054489/218262135-7530d9e1-ec21-47b5-aee0-5bc4b3d5f0f0.png)

- **Rebase flatterns the history, removing unwanted entries**. Git merge on the other hand, only changes the target branch and creates a commit, preserving the history of the source branch. -**cherry picking in git means to choose a particular commit from one branch and apply it onto another branch**. In contrast merge or rebase apply normally many commits onto another branch.

**Remotes :**

- It is therefore possible to have a repository which can store your project's history without actually having a working tree. this is called **bare repository**.Bare repositories are most commonly used as a "central" repository where collaborators can share changes. the mechanism for sharing these changes will be explained in detail in the **pushing**and**pulling**sections. For now, let's look at creating a bare repository.

`$ git init --bare`

- Notice here instead of creating a .git folder, the above command simply treats the current directory as .git directory.
- Notice how rather than creating a .git directory for the repository. git init --bare simply treats the current directory as the .git repository. There's really not much to this repository. The only interesting things it contains are HEAD reference. which points to the master branch(which doesn't exist yet) and a config file which has the bare flag set to true. The other files aren't of much interest of us.

`$ cat HEAD` `$ cat config` `$ find. -type f`

**Cloning :**

- the git clone is really just a shortcut which does a few things for you. with its default configuration, it will:
1. create remote-tracking branches for each branch in the remote.
2. checkout the branch which currently active(HEAD) on the remote.
3. perform a git pull to bring the current branch and working tree up-to-date with the remote.

the clone command takes a url and supports a number of transport protocols including HTTP, SSH, and Git's own protocol. It also supports plain old file paths, which is what we'll use.

`$ cd ..` `$ git clone bare-repo/clone-of-bare-repo` let's inspect this cloned repository to see how git has set it up.

`$ cd clone-of-bare-repository` `$ find. -type f` `$ cat .git/HEAD` `$ ls -l .git/refs/heads` `$ cat .git/config`

- This is quite literally a clone of bare-repo the only difference is that this repository contains a few extra lines in .git/configFirst, it contains a remote listing for "origin" which is the default name given to a repository's main remote. This tells git the URL of the repository and which reference it should retrieve when performing a **git-fetch**.

**pushing :**

- we just now cloned a completely empty repository, and we want to start working on it. `$ echo 'project v1.0'>README` `$ git add README` `$ git commit -m "Add readme"`
- Now that we've completed some work, we need to share this with our collaborators who have also cloned this repository. Git makes this really easy.

`$ git push origin master`

- As expected, the remote repository now contains a master branch which points to the commit that we just created.
- Essentially, what happened when we ran git push, is GIT updated the remote's references, and sent it any objects required to build those references. In this case, git push updated the remote's master to a point at and sent it to commit object as well as any tree and blob objects related to that commit.

`$ remote-tracking branches`

- As we saw in cloning, a remote-tracking branch is essentially just a few lines in .git/config. **[branch "master"]remote = "origin"merge = refs/heads/master

The line [branch "master"] denotes that the following configuration applies to the local **master** branch. The rest of the configuration specifies that when this remote-tracking branch is fetched. Git should fetch the **master** branch from the **origin** remote. Besides storing this configuration, git also stores a local copy of the remote branch.This is simply stored as a reference in .git/refs/remotes//

**fetching :**

- **git fech** command is fairly simple. It takes the name of a remote (unless used with -all flag, which fetches all remotes) and retrieves any new references and all objects necessary to complete them.
- This fetch parameters here specifies a mapping of
- - git fetch only update remote tracking branch
- Not change any local branch or working directory
- Always safe to do
    
    > git fetch origin <branch | --all>

The example above simply states that the references found in origin's refs/heads/* should be stored locally in /refs/remote/origin/*

`$ git fetch origin` This has done a couple of things. First, it has created a reference for the remote branch in .git/refs/remote/origin `$ cat .git/refs/remotes/origin/feature-branch` it has updated a specific file .git/FETCH_HEAD with some important information.

- But, what if we do want a local branch which tracks the remote feature-branch ? Git makes this easy. if we run git checkout feature-branch rather than failing because no local feature branch exists, git will see that there is a remote feature-branch available and create a local branch for us. `$ git checkout feature-branch` branch feature-branch set up to track remote branch feature-branch from origin.

git has done couple of things for us here. first, it has created a local feature-branch reference which points to the same commit as the remote feature-branch.

`$ cat .git/refs/remotes/origin/feature-branch` It has also created a remote-tracking branch entry in .git/config `$ cat .git/config`

**pulling :**

- the git pull command is, like git clone, a nice shortcut which essentially just runs a few lower-level commands. In short, with the format `$ git pull , the git pull command does the following :
1. Runs git fetch
2. Reads .git/FETCH_HEAD to figureout if has a remote-tracking branch which should be merged.
3. Runs git merge if required, otherwise quits with an appropriate message.

At this point, it helps to understand git's FETCH_HEAD. Everytime you run git fetch, git stores information about the fetched branches in .git/FETCH_HEAD. This is refered as short-lived reference, because by default git will override the contents of FETCH_HEAD everytime you run git fetch.

**Toolkit :** **git-reflog**:

- git records information about the changes in so called "reflog"
- git log is no help, since the commits are no longer reachable from HEAD. In these cases, we use reflog `$ git reflog`
- the reflog shows a list of all changes to HEAD in reverse chronological order.
- the hash in the first column is the value of HEAD after the action on the right was performed.
- if we want to recover commits we follow different methods depends upon situation. In this particular example, we can simply do `$ git reset --hard <commit-id>` to restore HEAD to its original position.However, if we have introduced new commits since, the destructive change, we may need to do something like **cherry-pick** all the commits that are lost.

**note:** git's reflog is only a record of chages for your repository. if your local repository becomes corrupt or deleted. the reflog won't be of any use(if the repository is deleted the reflog won't exist at all)

- depends upon the situation, you may find **git fsck** more suitable for recovering lost commits.
- git's object storage works like a primitive file system--objects are like files on harddrive and hashes are object's physical address on the disk. the git index is exactly like the index of a file system in that it contains references which point at an object's physical location.
- In `$ git fsck` fsck(file system check) this tool is able to check git's database and verify the validity and reachability of every object that it finds.
- when a reference(like branch) is deleted from git's index. the object(s) they refer to usually aren't deleted. even if they are no longer reachable by any other references. if we delete **feature-branch(ex)** the commit will no longer be reachable.At this point, commit still exist in our repository. but there are no references pointing to it. By searching through the database, git fsck is able to find it. `$ git fsck --lost found`
- An example of this is when you delete a remote branch through interfaces like github. Assuming the object haven't been garbage-collected, you can clone the remote repository and use git fsck to recover the deleted branch. **git stash:**
- it takes all changes to your working tree and index and "stashes" them away, giving you a clean working tree. you can then retrieve those changes from your stash and reapply them to the working tree at anytime with `$ git stash apply`
- A common usecase of git stash command is to save some half finished changes inorder to checkout another branch.
- stashes in git are put onto a stack. with the most recently stashed on top. you can list all current stashes with `$ git stash list` -**stash commit is a merge commit**
- to find path of git merge commit , we use `$ git show-ref`

### why does git creates a merge commit for stash ?

- Recording the stat of working tree, and record the state of index(also known as "staging area")
- since, its possible for the index and the working tree to contain changes to a same file. Git needs to store the states repeatedly. This gives us a history that looks a little like this :

![](https://user-images.githubusercontent.com/89054489/218262227-765b9b2c-6700-4c9a-9e6c-005c9c729082.png)

- In this history graph, the tree of commit C contains the changes to the working tree. commit C's first parent is the commit that HEAD pointed to when the stash was created (commit A). The second parent (commit B) contains the changes to the index. It is with these two commits that Git is able to re-apply your stashed changes.

**git describe:**

- git describe show the most recent tag that is reachable from a commit.
- git describe will take any reference or commit hash, and return the name of the most recent tag.if the tag points at the commit you gave it.
- git describe will return only the tag name. otherwise, it will suffix the tag name with some information including the number of commits since the tag and an abbreviation of the commit hash. `$ git describe <commit-id>`
- if you want to ensure that only the tag name is returned. you can force git to remove the suffix by parsing --abbrev=0 `$ git describe --abbrev=0 </commitid>` **git rev-parse**
- it is an ancillary plumbing command which takes a wide range of inputs and returns one or more commit hashes. The most common use case is figuring out which commit a tag or branch point to. `$ git rev-parse --short v1.2.15` **git bisect :**
- git bisect is an indispensible tool when you need to figure out which commit introduced a breaking change. the **bisect** command does a binary serach through your commit history to help you find the breaking change as quickly as possible. To get simply started, simply run `$ git bisect start`  To tell git that commit your'e currently on is broken `$ git bisect bad` then give git a commit that you know is working with `$ git bisect good <commit>` once bisect is finished( or when you want to abort it) be sure to run git bisect reset HEAD to where it was before the bisect.

find which commit a reference points at `$ git rev-parse HEAD` `$ git rev-parse --short HEAD` find which branches a commit is in `$ git branch --contains HEAD` find commits that are in one branch but not another `$ git log --oneline --right-only master..hotfixed-1` exclude commits that are cherry-picked `$ git log --oneline--cherry-pick --right-only master..hotfixed-1` To view details of an object `$ git cat-file -p HEAD` To shown an object's type `$ git cat-file -t HEAD` to show an object's size `$ git cat-file -s HEAD` print the tree of a given reference `$ git ls-tree-t-r HEAD` find the first tag that contains the reference `$ git describe HEAD`

`git config --global user.name "Nagacharan g"` To provide global user name `$ git config --global user.email "nagacharan4286@gmail.com"` To provide global user email id `$ git config --global user.name` To check the name of the user `$ git config --global user.email` To check the name of the email id `$ git config --list` To check all the list of configurations `$ git config --global --list` To check only the global configurations. `$ git config --global --edit` To edit the global configuration settings.

`$ git init` To create a new empty local repository.

`$ git status` To check the status of untracked files


cloning a project

Making changes/commits

Pulling commits

fetch+merge = pull

Resolving conflicts

The lifecycle of a file in git

stage 1: Untracked file

stage 2: unmodified

stage 3: Modified

stage 4: stage the file

Branching in git

- In git terminology, *downloading* is known as ****cloning.****

A project can be cloned only if it is exists as a repository on the server. Cloning is performed only for remote to local system. 

This is only onetime operation. Cloning a project already existing in your system is unnecessary.

$ git clone <remote repository url>

************************************Branching in git :************************************

- Branching helps developers deviate from the main line of development and continue work without disturbing the main line.
- In git this is an inexpensive process. This is due to the fact that git branches are lightweight and hence creating and switching branches is easy and fast.

**********************************************Structure of a branch********************************************** 

- git stores the changes in the form of snapshots .
- when  a commit is made in git, it stores a commit object that contains a pointer to the snapshot of the content that is being staged, the developer who is commited it and message metadata, and zero parents for the first commit, one parent for a normal commit, and multiple parents for a commit that results from a merge of two or more branches.

****************************************************************let’s understand Git in detail**************************************************************** 

- Git doesn’t store data as a series of changesets or differences, but instead as a series of snapshots.
- When u make a commit, git stores a commit oject that contains a pointer to the snapshot of the content that you staged.
- This object also contains the author’s name and email address, the message that you typed and pointers to the commit or commits that directly came before this commit (its parent or parents )
    - Zero parents for the initial commit, one parent for a normal commit, and multiple parents for a commit that results from a merge of two or more branches.
- The first initialization of file into a folder is called as blobs in git terminology
- $ git add README charan.rb LICENCE
- $ git commit -m “The initial commit of my project”
    - when u create the commit by running git commit, git checksums each subdirectory ( In this case just the root Project directory) and stores those tree objects in the git repository.
    - Git then creates a commit object that has the metadata and a pointer to the root project tree so it can re-create that snapshot when needed.

  what happens if you create a new branch ? >**************************************************************************************** well, doing so creates a new pointer for you to move around. [It creates a new pointer to the same commit you’re currently on ]
    
    ************************************How does git knows what branch you’re currently on ? >************************************ It keeps a special pointer called ******HEAD.****  ( In git, this is  a pointer to the local branch you’re currently on )*
    
    $ git log - -oneline - -decorate
    
    $ git checkout <branch name> → to switch branch
    
    **************NOTE :************** when u switch branches in git, files in your working directory will change.
    
    $ git log - -oneline - -decorate - -graph - -all * —> To see the history of your commits
    
    ************Types of branches :************
    
    **********************************************************There are 3 types of branches**********************************************************
    
    Long running
    
    Topic
    
    Remote
    
    Below are the features of **long running** branches :
    
    - Have several branches open
    - Master branch which is stable and meant for release
    - Development branch is for testing stability
    - Topic branches for local development
    - Suitable for large projects
    
    Below are the features of ******topic****** branches
    
    - short lived branches
    - can be used for any project size
    - can be used for hotfixes, experiments
    
    Features of remote branching
    
    - Remote branches are references to the state of branches on remote repositories
    - Act as bookmarks to where the branches on the remote repositories were the last time it was connected to
    
    
    ************Points to consider while choosing a workflow************
    
    - Team size
    - How much of overhead does the workflow impend on the team
    - Does it provide flexibility for changes and easiness in understanding the workflow
        - ********Centralized workflow********
            
            ![Centralized workflow](https://github.com/Charan-happy/Learn_Devops_tools/blob/main/Images/git/Centralized%20workflow.png)
            
        
        ************************************How does it work ?************************************
        
        - There is a shared repository which accepts code from all the developers in the team and they all synchronize their work onto it.
        - Each of the developers need to fetch the changes, merge with their code and push back the changes to the central repository.
        - Applicable to teams who are migrating from other version control systems to git and for small teams.
        
        ******************Benefits****************** 
        
        - simple workflow for small teams to manage version control
        
        **************************************Integration Manager Workflow**************************************
        
        ![Integration Manager workflow](https://github.com/Charan-happy/Learn_Devops_tools/blob/main/Images/git/Integration-Manager-Workflow.png)
        
        - There are multiple repositories
        - Each developer has write access to their public  directory and read access to other developer’s repositories
        - The maintainer of the project pushes to the public repositories
        - The developers clone that repository and make changes required, and push to the public repository
        - There is a notification sent to the maintainer regarding the change pushed and the latter merges the changes and pushes to the main repository
        
        ********Benefits :********
        
        - Common workflow
        - Each Developer can continue to work in their public repositories while the maintainer can pull changes when needed.
        - Avoids only reviewed code gets into the main repository.
        
        ******************************************************************Dictator and Lieutenants Workflow******************************************************************
        
        ![Dictator and Lieutenants Workflow](https://github.com/Charan-happy/Learn_Devops_tools/blob/main/Images/git/Dictator%20workflow.png)
        
        ************************************How does it work :************************************
        
        - There are many integration managers who take care of parts of the repository called lieutenants
        - They all have an integration manager called a dictator who maintains the main repository
        - Developers work on their public repos and rebase their work on top of the master
        - Lieutenants merge the developer branches to the master branch
        - Dictator
            - Merges the changes done by the lieutenants to the dictator master branch
            - Pushes that master branch to the reference repository so the other developers can rebase on it.
        

**Analyzing types of workflows in git**
1. Centralized workflow
2. Gitflow workflow
   
4. feature branch workflow
   - The core idea behind the feature branch workflow is that all feature development should take place in a dedicated branch instead of master branch. This encapsulation makes it easy for multiple developers to work on a particular feature without disturbing main codebase. it also means the master branch will never contain broken code, which is a huge advantage for continuous integration environments.
5. Github flow
    - Master branch of a specific location (github, gitlab, bitbucket, local server) contains the latest shippable version. For new feature/bugfix/architectural change each developer creates a branch.
    - Changes happened on that branch and can be discussed in a pull-request, code review etc. once accepted they get merged into the master branch.
      full flow by Scott CHacon :
       - Anything in the mater branch is deployable
       - To work on something new, create a descriptively named branch off of master (i.e; new-user-addition)
       - commit to that branch locally and regularly push your work to the same named branch on the server
       - when you need feedback or help, or you think the branch is ready for merging, open a pull request
       - After someone else has reviewed and signed off on the feature, you can merge it into master
       - once it is merged and pushed to master you can and should deploy immediately.
         
6. forking workflow
   - Instead of having one centralized repo that all developers have access to each developer has his/her own repo that is forked from the main repo. The advantage of this is that developers can post their own repos rather than a shared repo and a maintainer can integrate the changes from the forked repos into the original whenever appropriate.
     


Branching Strategy

Branches can be created for multiple reason. here we create branches for releases.
we follow git flow as a strategy. in our strategy, we have branches like master, feature,
hotfix, release and dev branch.

Feature branch - the developers wil create there own feature branch and merge the changes into the dev branch.

release branch - is used to maintian the releases.

hotfix fix branch - used to delever critical fix to the production environment.

master - it is a copy of production environment. it s always a clean branch.

development will be goin on in dev branch. once the code s ready for first release in dev branch, we will create a
separate branch for first release and make release from release branch.
whatever issue we hav in the first release will be fixed in first release branch.
parallel development will be going on in dev branch for second release. once the code s ready for the second release
in dev branch. before we create release 2 branch, we would merge the first release into the dev banch and then we wil create
release 2 branch for second release
whatever issue seen in the first release will not be present in the second release.

Reference : https://git-scm.com/docs

### GIT Commit Graph

- The link between commits are backwards
- Each commit has atleast one parent except the first commit
- Each commit represents a unique version
- we can use `git checkout [SHA1]` to go back to any history versions.

### Git Branch

- git branch is a named pointer of a commit (master) full name: /refs/heads/master
- Head is the pointer to a branch (except detached mode, cannot do commit)
- Head point to the baseline of our current working directory (only one per repo)
    
    Never commit binary files to git repository.
    
  
    
    ### git local operations
    
    ### git checkout
    
    - switch between branches -- `$ git checkout <branch-name>`
    - view history versions -- `$ git checkout <sha 1>`
    - create a new local branch --`$ git checkout -b <new branch name>`
    - Revert working directory/index -- `$ git checkout HEAD -- .`
    
    ### git diff
    
    difference between
    
    - working directory and index -- `$ git diff`
    - working directory and branch --`$ git diff <branch name>`
    - sha 1s --`$ git diff <sha 1a> <sha 2b>`
    - branches `$ git diff <branch A> <branch B>`
        
        
### Ammend a git commit
        
        why we need amend ?
        
        - found issue need fix before push
        - Modify commit message
        - Invoke commit hook
        - Modify for code review
        - After Ammend, the old commit will be replaced with new commit
        - DO NOT amend commits that are already pushed to remote server.
    
    `SHA1 will change after "git commit --amend"`

|command | explanation | when it is used |Benefit |
| --- | --- | --- | --- |
|clean | A command that helps you in getting rid of untracked files that are not required anymore |Too many untracked files that are not required to be added to the working directory | Helps keep repositories clean by removing files that are not needed to be tracked by git |
| Reset | A command that permanently removes the commit it gets acted upon | - used in order to remove files from the git staging area. <br>used to permanently delete commits from the history and resetting the changes that were made in those commits | Removes commits which are not needed, but has to be used with caution, helps keep history clean |
|squash | a command to merge concurrent commits as a single commit |In order to have a cleaner history which enhances readability of the history tree, two commits can be squeezed into a single commit |Merge concurrent commits to a single commit to keep the history clean |
|cherry-pick | A command to merge only single commits from one branch to the HEAD of the current branch | when merging of two branches in unnecessary or not feasible and only a single/handful commits are needed in current branch |Helps select commits to merge |
|Revert | A ctrl+Z function in git which performs an undo on a commit. While also preserving it as a commit in the history. |To remove the changes that were made on a particular commit, the action of revert is preserved as a new and recent most commit in the local repository and can also be pushed to upstream if required. | helps to undo unwanted commits |
|checkout | The command that helps you in visiting a different version of the same project in terms of a file, a commit or even a branch | It can be used in 3 instances <br>You need to have a look at a previous version of a file <br>You need to have a look at that version of the project existing when a particular commit was the HEAD of the repository <br> You need to compare files and folders with a different branch of the same repository. | Helps to switch between branches |
| amend |  It is a history re-writing command |you have made a local commit which is incorrect in terms of the commit content or the commit message  |This will overlap your incorrect ( and the most recent) commit with the current one. In this way, the incorrect commit gets completely removed from the repo history. |

commits per date ---> git log --pretty=format:"%ai"  | awk '{print ": "$1}'  | sort -r | uniq -c

total number of commmits --> git log --pretty=oneline | wc -l

find all local git repositories --> find $HOME -type d -name ".git" or locate .git | grep git$

show total number of commits per author --> git shortlog -s

To remove tracking between local and deleted remote branches use `git fetch -p` and `git branch -vv` 

git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d



![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/d5cd4a54-b837-4a01-9f6c-8b6fbe78569b)

(![image](https://github.com/Charan-happy/Learn_Devops_tools/assets/89054489/2b993808-2ddb-4a49-af52-417528546bce)


[Practical Git practice online](https://gitimmersion.com/lab_01.html)
