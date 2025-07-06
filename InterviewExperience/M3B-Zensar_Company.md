I got interview call from recruiter directly after applying from hirist.tech portal. Devops Engineer with Go for experience of 3-5 years.  Questions are given below
Date of interview : 04/12/2024  Duration of interview : 30 minutes 

1. Can you please briefly let me know about your experience/projects that you are worked ?

<details><summary> 2. How can we get the remote repo into local repo</summary>git clone <repo-url></details>

<details><summary>3. what is ssh keys ? which one we will keep in the server to connect to it from our local system ?</summary>SSH uses key-pairs: private key and public key

You keep private key on your local machine

Public key is placed in the server (~/.ssh/authorized_keys)

</details>

<details><summary>4. what are all the diffferent ways of getting the repo into our local system ?</summary>HTTPS clone: git clone https://...

SSH clone: git clone git@github.com:...

GitHub Desktop

ZIP download (manual)</details>

<details><summary>5. what is webhook ?</summary>A trigger mechanism to notify external systems (like Jenkins) when an event happens (e.g., push in GitHub). Used to start CI/CD pipelines.</details>

<details><summary>6. what is multibranch pipeline and what are the uses of it ?</summary>Jenkins auto-discovers branches in a repo and creates individual pipelines for each. Useful for PR-based workflows, dev/stage/prod separation.</details>

<details><summary>7. what is the difference between snapshot and release version ?</summary>Snapshot: Work-in-progress, mutable (e.g., 1.0-SNAPSHOT)

Release: Final, immutable (e.g., 1.0.0)
Used heavily in Maven and artifact repos.</details>

<details><summary>8. let's say somee user comes with us stating that it is building successfully if he runs on the local system  but it is failed in jenkins server ? what would be the reasons and how can you resolve them ?</summary>Common causes:

Missing tools/dependencies on Jenkins agent

Environment variables not set

Permission issues (file, ports)

Different versions of compilers/interpreters
Resolution:

Match Jenkins agent image/environment with local

Use Docker to unify builds

Capture logs with set -x, tee, and debug</details>

<details><summary>9. what is ec2 instance ?</summary>Elastic Compute Cloud. Virtual machine provided by AWS. Supports autoscaling, user-data bootstraps, elastic IPs, and security groups.</details>

<details><summary>10. what is docker and why we need docker ?</summary>Docker packages app + dependencies into containers. Portable, reproducible, fast deployment. Avoids "works on my machine" issues.</details>

<details><summary>11. from which place you are getting your images ? public/private registry</summary>Public: DockerHub, GitHub Container Registry

Private: AWS ECR, GitLab Container Registry
Use depends on security/compliance needs</details>

<details><summary>12. what is bluegreen deployment ?</summary>Two environments:

Blue (current live)

Green (new version)
Switch traffic after validation to reduce downtime.</details>

<details><summary>13. what is the difference between blugegteen deployment and rolling deployment in kubernetes ?</summary>Blue-Green: Complete cutover (new set of pods)

Rolling: Gradual replacement of pods
Rolling is built-in in K8s via maxSurge, maxUnavailable</details>

<details><summary>14. How to start the docker daemon</summary>sudo systemctl start docker</details>

<details><summary>15. what is git merge ?</summary>
  Combines changes from one branch into another.
git checkout main
git merge feature/login
</details>

<details><summary>16. any questions for me ?</summary></details>

<details><summary>17. what is cherry pick ?</summary>Apply specific commit(s) from another branch.git cherry-pick <commit-id></details>

<details><summary>18. what do you mean by commit id  in git ?</summary>A unique SHA hash representing a snapshot of the repo at a specific point in time. Used to reference, revert, or track changes.</details>


No Response from recruiter after interview. Don't know the reason. But, after interview , interviewer gave good feedback about me. 
So, Rejected ❌
