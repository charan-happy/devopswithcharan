Ansible:
1)What are handlers
2)What types modules we have?
3)where do we have ansible config file location?
4)what are ansible tags?
5)what are ansible blocks
6) what are Ansible Roles? 4 types
7)what is Ansible tower? How to monitor jobs in it?
8)what are ansible vaults?why we need to encrypt playbook?what is the command to excute 
Ansible vault is useful to encrypt our playbooks(including roles and variable)
We need to encrypt our playbooks because there is a possibly that playbooks contain certain credentials(passwords,Aws keys) 
,SSL certificates or other sensitive data.saving such sentive data is bad idea,because ,one wrong commit can cause org a huge loss.
Or 
Ansible Vault is a feature of ansible that allows you to keep sensitive data such as passwords or keys in encrypted files, 
rather than as plaintext in playbooks or roles. These vault files can then be distributed or placed in source control.
Command: ansible-vault encrypt playbookname 
after that enter password, we should remember this password.
9)what are adhoc commands?
10)What is ansible?
11.what is maven plugin installed in Jenkins
mavantop level  invoks
12.what are the maven phases and goals ?which ones runs first?
What are Maven goals and phases and what is their difference?
Goals are executed in phases which help determine the order goals get executed in. 
The best understanding of this is to look at the default Maven lifecycle bindings which shows which goals get run 
in which phases by default. The compile phase goals will always be executed before the test phase goals which will always be 
executed before the package phase goals and so on.
