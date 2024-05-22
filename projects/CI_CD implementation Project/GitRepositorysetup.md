### Github Repository setup

Steps to create a private Git repository, generate a personal access token, connect to the repository, and push code to it:
1. Create a Private Git Repository:
o Go to your preferred Git hosting platform (e.g., GitHub, GitLab, Bitbucket). o Log in to your account or sign up if you don't have one. o Create a new repository and set it as private. 2. Generate a Personal Access Token:
o Navigate to your account settings or profile settings. o Look for the "Developer settings" or "Personal access tokens" section. o Generate a new token, providing it with the necessary permissions (e.g., repo
access). 3. Clone the Repository Locally:
o Open Git Bash or your terminal. o Navigate to the directory where you want to clone the repository. o Use the git clone command followed by the repository's URL. For example:
git clone <repository_URL>
4. Replace <repository_URL> with the URL of your private repository. 5. Add Your Source Code Files:
o Navigate into the cloned repository directory. o Paste your source code files or create new ones inside this directory. 6. Stage and Commit Changes:
o Use the git add command to stage the changes:
git add . o Use the git commit command to commit the staged changes along with a
meaningful message:
git commit -m "Your commit message here" 7. Push Changes to the Repository:
o Use the git push command to push your committed changes to the remote
repository:
git push
o If it's your first time pushing to this repository, you might need to specify the
remote and branch:
git push -u origin master
8. Replace master with the branch name if you're pushing to a different branch.
9. Enter Personal Access Token as Authentication:

- When prompted for credentials during the push, enter your username (usually
your email) and use your personal access token as the password. By following these steps, you'll be able to create a private Git repository, connect
to it
using Git Bash, and push your code changes securely using a personal access
token
for authentication.

 GIT REPOSITORY - https://github.com/charan-happy/Board-Game.git

 