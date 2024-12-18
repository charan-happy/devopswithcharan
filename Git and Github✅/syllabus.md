<details><summary>1.Setup</summary>
1.Git Introduction
2.Git Installation
3.Porceleain(highly used commands) and Plumbing(rarely used commands)
4. Configuration</details>

<details><summary>2.Repositories </summary>1. Config (repo creation etc)
2. status [git workflow]
3. staging
4. commit
5. Git log </details>
<details><summary>3. Internals</summary>
1. Different Hashes
2. cat file (cat-file)
3. Trees (Git way of storing folders) and Blobs(Git way of storing files)
4. Storing Data </details>
<details><summary>4. config </summary>
1. Get (`git config --get <key> keys=<section>.<keyname> ex: user.name 
2. Unset (To remove configuration value)
3. Duplicates (--unset-all -> To purge all instances of a key from your configuration [--remove-section -> flag to remove an entire section from git configuration] 
4. Locations</details>
<details><summary>5. Branching </summary>
1. What is Branch ?
2. Default Branch ?
3. New Branch
4.switching branches
 </details>
<details><summary>6. Merging </summary> 
1.Merge commit 
2. Merge log
3. fast-forward merge</details>
<details><summary>7. Rebase </summary></details>
<details><summary>8. Reset </summary>1. Different git reset types (--soft, --Hard, --mixed) </details>
<details><summary>9. Git Remote</summary>
1. Adding Remote
2. fetch
3. Merge</details>
<details><summary>10. Github Repository </summary>
1. Git push
2. git pull
3. github pullrequest

</details>
<details><summary>11. .gitignore </summary></details>


LOCATIONS  
There are several locations where Git can be configured. From more general to more specific, they are:

system: /etc/gitconfig, a file that configures Git for all users on the system  
global: ~/.gitconfig, a file that configures Git for all projects of a user  
local: .git/config, a file that configures Git for a specific project  
worktree: .git/config.worktree, a file that configures Git for part of a project  
In my experience, 90% of the time you will be using --global to set things like your username and email. The other 9% of the time you will be using --local to set project-specific configurations. The last 1% of the time you might need to futz with system and worktree configurations, but it's extremely rare.

OVERRIDING  
If you set a configuration in a more specific location, it will override the same configuration in a more general location. For example, if you set user.name in the local configuration, it will override the user.name set in the global configuration.
