**Improving daily work is even more important than doing daily work**

Ansible Topics to Learn

step by step) 🎯

If Ansible is in your learning plan then these topics can help you to start today itself & make you 92% ready👇

Introduction<br>
→ What is Ansible?<br>
→ Why Use Ansible? <br>

Installation
→ Operating System Requirements <br>
→ Installation Methods <br>
   - Package Managers<br>
   - Python PIP

Inventory <br>
→ Hosts<br>
→ Groups<br>
→ Variables

Playbooks <br>
→ Syntax<br>
→ Tasks<br>
   - Modules<br>
   - Parameters<br>
→ Handlers<br>
→ Variables<br>
   - Facts<br>
   - Custom Variables<br>

Roles
→ Structure<br>
→ Main Tasks<br>
→ Handlers<br>
→ Variables<br>

Playbook Execution<br>
→ Ad-hoc Commands<br>
→ ansible-playbook Command<br>
   - Options<br>
   - Tags<br>
   - Limiting Playbook Execution

Variables<br>
→ Precedence<br>
→ Variable Types<br>
   - Global Variables<br>
   - Play Variables<br>
   - Host Variables
     
Conditionals<br>
→ When Statement<br>
→ Loops<br>
   - With_items<br>
   - Loop Controls

Templates<br>
→ Jinja2 Templating Engine<br>
→ Template Files

Inventory Management<br>
→ Dynamic Inventory<br>
→ Static Inventory

Modules<br>
→ Common Modules<br>
→ Module Options

Debugging<br>
→ Verbose Mode<br>
→ Debug Module<br>
→ Error Handling

Best Practices<br>
→ Directory Structure<br>
→ Security Considerations<br>
→ Documentation

Advanced Topics<br>
→ Vault <br>
→ Callbacks <br>
→ Dynamic Includes

Community and Resources<br>
→ Ansible Galaxy<br>
→ Ansible Documentation<br>
→ Online Forums<br>
   - Reddit<br>
   - Stack Overflow



![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/a2be7731-103e-4bd5-ab13-8230a2fe0d79/e53ea1d6-7adf-42e2-a26a-84f0191990db/Untitled.png)

1. code Analysis                                                 5. Environment provisioning for testing
2. unit testing                                                     6. Testing (QA)
3. Code Coverage                                               7. Deployment to pre-production
4. Build                                                                8. Release Management

    9. Environment provisioning for production
                                  10. Deployment and release to production

******************************what does environment consist of ?******************************

- An environment means the underlying infrastructure, The configurations and various dependencies.
- The underlying infra defines in which place the application would run, the configurations needed by the application to run and how other external dependencies will associate with the application
- The configuration will decide how the application will fit and perform in the infrastructure that it deployed in.
- The dependencies would mean the various libraries and services from other modules or systems which are used by application.

******************************************Server Virtualization******************************************

- creating and abstracting of multiple instances on a single server. An administrator uses a software termed a virtualization software to partition one physical server into multiple isolated virtual environments. Each environment of such is capable of running independently.

**********************Containerization**********************

- Bundling an application together with all of its related configuration files, libraries and dependencies required for it to run in an efficient and bug-free way across different computing environments.
- Popular containerization softwares include Docker and Kubernetes

************************************************Configuration Management************************************************

- Configuration Management / Server Configuration Management(SCM) is an automation that ensures that the target system/server reaches its desirable state as per the configuration made upon it. This in turn achieved with the help of ********************************configuration Management Tools********************************

Home, furniture as an anology for these example

**Benefits of configuration Management Tools**

1. Reduce time taken for environment creation and management
2. Centralized infra operations and hence helps in quick delivery and scaling
3. Optimize usage of infrastructure and cost provision on demand and release when completed
4. Continuously adapt to the load - Ensure scalability, availability and responsiveness
5. Migration to new OS and technologies is easier
6. Better security governance

****************************************Ansible Installation****************************************

$ ansible [localhost](http://localhost) -m ping —> To Check if Ansible was installed properly or not

************History of Ansible************

- Ansible was released in 2012 by Micheal Dehaan a developer who was working with configuration managment and infrastructure orchestration earlier with puppet labs and Redhat.
- The Born of Ansible is from ****************cobbler**************** which was designed to manage datacenter environment in GUI

****************************************Ansible Architecture****************************************

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/a2be7731-103e-4bd5-ab13-8230a2fe0d79/51019000-89e6-480f-bcdd-feae57b46161/Untitled.png)

Ansible Automation Components

→ Ansible automation components include the inventory, API’s , Modules and Plugins.

The users use this tools to write playbooks which are executed for various activities. The tools also interact with the configuration management database for storing the various configurations and with the cloud/virtual machine services for the environment

************************Inventories************************ in ansible are lists of hosts along with their IP addresses, servers, databases which needs to be managed. SSH is used for UNIX based systems and WinRM for windows based ones.

**********APIs********** are used for Interacting with the cloud

********Modules******** these are programs executed on remote hosts through Ansible playbooks. They can be used to control services, system resources, files etc on these hosts.

EX: They can be used for installing software on a remote host. There are many ansible provided modules EX: file , raw, service etc

****************plugins**************** these represent external functionality that can add on to the existing functionalities of ansible. There are ansible provided plugins (EX: action, become, cache etc) and we can create our own plugins too.

**********************Networking********************** uses an agentless automation framework for communication. 

Agentless software requires the creation of a user account on the target machine or machines to facilitate access to the data on the account related to the desired operation.

Agentless programs directly access the files, often remotely, via this user account. this can be done without any prerequisite tool installation on the target machines.

**********Hosts********** are the different nodes that are going to be managed by Ansible with different Os’s

********************Playbooks******************** these are scripts which are written in YAML format for declaring configurations, task execution or orchestration. Has some features of programming language

**********CMDB********** this is a database containing details of the configuration items and the relationships between them.

**********************************Public/private Cloud**********************************  this is the infrastructure that is to be managed, they compose of a network of remote servers for sharing, managing and processing data.

other terms

************Role************ A mentioned method for organizing playbooks and other files for sharing parts of the script for provisioning

**********play********** a provisioning executed from start to finish is called a play

************facts************ global variables containing information about the system, like network interfaces or operating system

****Handlers**** used to trigger service status changes, like restarting or stopping a service

**************************************Controller Machine************************************** this is the node where ansible run

**********************************************Ansible Fitment in an automated CI/CD pipeline**********************************************

![Ansible Fitment in Automated CI/CD pipeline](https://prod-files-secure.s3.us-west-2.amazonaws.com/a2be7731-103e-4bd5-ab13-8230a2fe0d79/e2df2d29-fd80-423b-b2da-c5600ef85c6d/Untitled.png)

Ansible Fitment in Automated CI/CD pipeline

Ansible can help in environment provisionining, management and orchestration. 

This ensures that developers start to develop the mindset of including infra as part of their application. 

Infrastructure as code (IAC) consists of managing and provisioning infrastructure and their configurations through scripts, in this case using playbooks.

Thus IAC removes the operational burden of sysadmins from managing complex hardware manually, rather focus on working with the Dev teams, innovation and performance tuning.

**********Ansible Commands**********

 ****************************************************************************************************Connecting to ansible server from a remote machine****************************************************************************************************

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/a2be7731-103e-4bd5-ab13-8230a2fe0d79/5f07be70-d364-4d09-8531-9023e253404a/Untitled.png)

The basic idea for any OS machine before any remote machine connected to using ansible server are as follows

1. open connection from remote machine
2. Add remote machine details on ansible machine
    1. Inside the path $ vi /etc/ansible/hosts
        
        Each machine name, followed by the domain name, must be mentioned under a group/alias name as shown below 
        
        [machineXYZ]
        
        machineXYZ.ad.charan.com
        
        ****************Note :**************** A host can be under multiple group names. Every group name must be unique.
        
        The user credentials of the respective groups need to be added. For this create a directory inside of **************************/etc/ansible************************** named as ********************************group_vars,******************************** if not already present
        
        - ************************group_vars,************************ once created, will be a user defined folder within which the configuration details of each host such as username and password will be stored.
        - Within this folder, we will have files with names ****************exactly**************** the same as the group names mentioned in the host previously.
3. Test connection by ping
    
    Depending on the attributes of module, the term ******-a****** and **************target************** values may or may not exist.
    
    Ex: ansible “Hostname” -m ping —>for linux server
    
    ansible “Hostname” -m win_ping —>for windows server
    
    Modules of commands example are ping, copy, file, raw, shell, git, service
    

[Exercises](https://www.notion.so/Exercises-d045a7adebf84253a6d2b2edad695337?pvs=21)

********************playbooks******************** are ansible’s configuration, deployment, and orchestration language. They can describe a policy you want your remote systems to enforce, or a set of steps in a general IT process.

If ansible modules are the set of tools in your workshop, playbooks are your instruction manuals. and your inventory of hosts are your raw material.

To make it simple, the script inside a playbook holds the power to help in installation of packages, running servers, etc. This can be used to configure remote hosts individually or in a cluster.

once set of processes is defined within a playbook, we need not manually type out the commands again, the playbook will take care of it and execute those processes/commands into the host target.

The goal of **********play********** is to map a group of hosts to well defined roles, represented by tasks.

********Ansible playbooks - Variables, loops, conditionals, templates and error handling********

******************variables******************

A valid variable name should start with a letter and can only contain letters, numbers and underscores with no spaces. 

| Invalid | valid |
| --- | --- |
| abc-port | abcPort |
| RHEL satellite | rhelSatellite |
| ansible.machine | ansibleMachine |
| star#moon | moon21 |
| 69port | port69 |
| !panPeter | panPeter |

```yaml
- hosts: webservers
	vars:
		http_port: 80

ansible-playbook deploy_war.yml --extra-vars "build=23362.1536367-34" # variable as a command line argument while executing playbook.
```

******************************using variables******************************

- when variables are being used or referred to, we use the the jinja2 templating system, which is a templating language. For example: My name is {{ first_name }}
- Observe how a placeholder is kept for the first name, this is called a template. Which is a combination of variables enclosed within double curly brackets.
    - Templating languages essentially contain variables as well as some programming logic, which when evaluated (or rendered into HTML)  are replaced with ****************************actual values.****************************
    - The variables and/or logic are placed between tags or delimeters. For ex, jinja templates use {%….%} for expressions or logic (like for loops), while {{ … }} is used for outputting the results of an expression or a variable to the end user. The latter tag, when rendered, is placed with a value or values, and is seen by end user.

EX: sum: {{ var1 }}+{{ var2 }}

- Both jinja2 and Ansible have a huge repository of in-built variable transforming formats that can change or modify the value inside the variable if required.

****************************************Loops and conditions****************************************

- There could be situations where certain tasks may have to be repeatedly performed until a particular result is obtained. This is when we use the keyword with _items in ansible
- using **********when********** module a condition can be implemented in ansible.

```yaml
- name: check list of running node.js apps
	command: forever list
	register: forever_list
	chaned_when: false

- name: start example node.js app
	command: "forever start {{ node_apps_location }}/app/app.js"
	when: "forever_list.stdout.find{'{{ node_apps_location }}/app/app.js"} == -1"
```

************************************changed_when is different from when************************************ module. Changed_when ensures there is no change done to the system when the command above is executed, whereas the when is like if statement in other programming languages,  if the expression enclosed within the double quotes holds true, the command above will get executed.

******Multiple Conditions******

- when there are multiple conditions to be checked for, the relations between them can be established using AND or OR boolean operators.

```yaml
tasks:
	- name: "shutdown centos 6 or Debian 7 systems"
		command: /sbin/shutdown -t now
		when: (ansible_facts['distribution'] == "CentOs" and ansible_facts['distribution_major_version'] == "6") or
					(ansible_facts['distribution'] == "Debian" and ansible_facts ['distribution_major_version'] == "7")
```

**********debug**********

- A command used to print any statement before or after execution of any operation

```yaml
- debug:
			msg: Drink water, study ansible, stay banglore
```

****************ignore_errors****************

- A command used to direct the play to continuous execution despite having met errors.
- Generally playbooks will stop executing any more steps on a host that has a task fails, unless we decide to continue using the ignore_errors command

******Ex:******

```yaml
- name: this will not be counted as a failure
	command: /bin/false
	ignore_errors: yes
	debug:
		msg: I am the inevitable - Thanos 2023
```

**************************************************working with ansible loops**************************************************

Loops in ansible provides a lot of methods to repeat certain tasks until a condition is met.

EX: A basic example which can be used to install a lot of linux packages (python, CA certificates and a version control package like git)

```yaml
- name: Ansible loop example
	apt:
		name: "{{ item }}"
		state: present
	with_items:
		- python3
		- ca-certificates
		- git
```

From the above, the value of with_items block will be inserted in place of ********************{{ item }}********************

**********Ansible loop with index**********

- In some scenarios knowing the index value might come in handy.
- we can use the “******************************************with_indexed_items”****************************************** to refer to this on ansible. The loop index will be available at **************item.0************** and the value will be available at ****************item.1.**************** The index value starts at 0 asusual.

```yaml
- hosts: all
	tasks:
	- name: Ansible loop with index example
		debug:
			msg: "echo loop index at {{ item.0 }} and value at {{ item.1 }}"
		with_indexed_items:
			- "hello1"
			- "hello2"
			- "hello3"
output:
echo loop index at 0 and value at hello1
echo loop index at 1 and value at hello2
echo loop index at 2 and value at hello3
```

we can also make changes to the index value like addition, substraction etc.

```yaml
- name: Ansible loop with index modification example
		debug:
			msg: "echo loop index at {{ item.0 + 1 }} and value at {{ item.1 }}"
output :
echo loop index at 1 and value at hello1
echo loop index at 2 and value at hello2
echo loop index at 3 and value at hello3
```

we can also use “when” conditional statement along with the loop structure. Thus we can control the looping based on a variable too.

```yaml
- hosts: all
	vars:
		loop_1: "hello1"
	tasks:
	- name: Ansible loop with conditional example
		debug:
			msg: "{{ item }}"
		with_items:
			- "hello1"
			- "hello2"
			- "hello3"
		when: item == "{{ loop_1 }}"
output:
hello1
```

**************************************************looping through dictories**************************************************

```yaml
- hosts: all
	vars:
		Fruits:
			Apple: 'Red'
			Orange: 'Orange'
			Grapes: 'Green'
	tasks:
		- name: Ansible dictionary loop Example
			debug: 
				msg: "key is {{ item.key }} and color is {{ item.value }}"
			with_dict: "{{ Fruits }}"
```

****************output :****************

key is ********apple******** and color is ******Red******

key is **********************orange********************** and color is ************orange************

Key is ****************graphes**************** and color is **********Green**********

************Error-Handling :************

- The customization of error according to our needs and understanding is called error handling.

try → block

except → rescue

finally → always

```yaml
- name: Attempting block and resue as always
	block:
		- debug:
				msg: 'I execute normally'
		- name: i force a failure
			command: /bin/false
		- debug:
				msg: 'I never execute, due to the above task failing, :-('
	rescue:
		- debug:
				msg: 'I caught an error'
		- name: i force a failure in middle of recovery! >:-)
			command: /bin/false
		- debug:
				msg: 'I also never execute :-('
	always:
		- debug:
				msg: "this always executes"			
```

************Note :************ Always is not a mandatory

- In short, block executes commands to test whether they contain errors, if there are errors, the commands inside rescue got executed. Finally as a conclusion, always gets executed.

****************************************Handling Inventories****************************************

******************************using Default Groups******************************

inventory file stored in **“/etc/ansible”** is where the hostnames are put to be connected to, in future ansible server.

```yaml
hey.ad.company.com #host1
[webservers]
charan.ad.company.com
varam.ad.company.com
athi.ad.company.com

hello.ad.company.com #host2

[apache]
charan.ad.company.com
uma.ad.company.com
mahesh.ad.company.com
```

We already know that every host is declared under one or many group names but not mandatory too. in such cases, the same host inherits all parameters under the respective group names.

Ex: charan under webservers gets only rules of webservers group and charan under apache gets only rules of apache group only.

From the above hey and hello doesn’t belong to any group. Anything out of a section is considered an ungrouped host.

********************************************************************************How can ungrouped hosts be called upon ?********************************************************************************

- ansible has two implicit groups **********-all********** and ********************ungrouped******************** . when “all” the hosts are to be referred to, irrespective of the group name they are under, they can be called upon using the term “all”
- similarly, when refering to all hosts that don’t come under any group name, that can be done using the term “ungrouped”
- This means every hostname will always belong to at least 2 groups.

******************************Grouping host groups******************************

To declare a parent of any group or set of groups,  create it using suffix of “******************.children******************”. in these case, the order of precedence for variables in (group_vars) takes place in the below order:

- all group(because it is the ‘parent’ of all other groups)
- Parent group
- child group
- host

```yaml
[Mysore]
host1.ad.company.com
host2.ad.company.com

[Banglore]
host3.ad.company.com
host4.ad.company.com

[Karnataka:children]
Mysore
Banglore

[India:children]
Karnataka
punjab
maharashta
```

****************************Grouping hosts****************************

- If there is a need to execute the same ansible command or playbook on multiple hosts, we can have them added under a single parent and so instead of executing :

$ ansible Mysore -m win_ping

$ ansible Banglore -m win_ping

we can rather execute a single command # $ ansible karnataka -m win_ping

**********************************Real-Time Example**********************************

there was a requirement which needed Tomcat 9 running on all machines for a jenkins deployment. Hence, we added all the machines under a hostname Bangloreservers. So that we can have a playbook created to start tomcat 9 and bind it to host by name: Bangloreservers

```yaml
[Bangloreservers]
charan.ad.company.com
athi.ad.company.com
varam.ad.company.com
#uma.ad.company.com
```

“#” can be used to temporarily comment out/remove a machine name from that host. Reason could be because of server is unusable at the movement or may be just because it is currently not required.

********************************************************Handling Dynamic Inventories********************************************************

- to provide the ability to track dynamic hosts with the help of cloud providers, LDAP, openstack etc for which ansible provides a **********************************************dynamic external inventory system********************************************** with the help of ************************************inventory plugins************************************ and ************************************inventory scripts.************************************
- To interact with and handle the dynamic inventory with ease, ansible has a user-friendly web ******************GUI known as Red hat Ansible Tower******************

**********************************************************playbook 1- Display Date and Time**********************************************************

Task : create a  playbook that displays the time and date on the local machine

$ vi simple.yml

```yaml
---
- name: just a simple play to execute command date
	hosts: localhost
	tasks:
	- name: execute a command "date"
		command: date
```

$ ansible-playbook sample.yml

since, ansible is an environment configuration tool, It would by default only show the final output as how many times was the host changed, unreachable and failed.

- In order to print more details from an ansible playbook execution for ************************************debugging purpose************************************ we can use the parameter **************-v. V************** stands for verbose. which literally means the expressing in more words than needed.
- The more V’s you add, the more in-depth log will be printed while the ansible playbook is executed.

Ex : $ ansible-playbook sample.yml -v

**********************************playbook 2- Setting up of Node.js Server**********************************

$ vi node_demo.yml

 

```yaml
---
- name: Installing node and deploying app to server
	hosts: localhost
	vars:
		node_apps_location: /usr/local/opt/node
	environment:
		http_proxy: http://your_user_id:password@10.52.36:80
		https_proxy: https://your_user_id:password@10.58.45:80
	tasks:
	- name: Nodejs script to run before installation
		shell: curl -SL https://rpm.nodesource.com/setup_4.X | bash -
		args:
			warn: no

- name: Install Node.js and npm
	yum: name=nodejs state=present

- name: setup NPM HTTP Proxy
	command: npm config set proxy "{{ item }}"
	with_items:
		- http://your_user_id:password@10.52.96:80

- name: Install Forever ( to run our Node.js app)
	npm: name=forever global=yes state=latest

- name: Ensure Node.js app folder exists
	file: "path={{ node_apps_location }} state=directory"

- name: copy example Node.js app to server
	copy: "src=app dest={{ node_apps_location }}"

- name: Install app dependencies defined in package.json
	npm: path={{ node_apps_location }}/app

- name: Check list of running node.js apps
	command: forever list
	changed_when: false

- name: start node.js app
  command: "forever start {{ node_apps_location }}/app/app.js"
	when: "forever_list.stdout.find('{{ node_apps_location }}/app/app.js') == -1"
```

1. First we give a  name to the entire playbook, with our target host as ******************localhost******************
2. if any variable or command may be used multiple times in your playbook, it can be stored under ********vars******** that needs to be declared before any play is defined. This vars can be also stored as a separate file. ****************
3. As mentioned before, some sites that require access may be by default inaccessible if outside your intranet’s reach, hence proxy may be required. This can be set under the module of environment. So that every task is executed within this defined environment.
4. coming to the tasks
    1. We first run a shell script available in the given URL so that yum command can be used later to install Node.js and npm
        1. curl command is used in linux to download or access links on websites starting with http or https. The purpose of the pipeline is to take the output from the left command and use it as input for the command on the right side of the pipeline. In this case curl is 

pending ….

********************************************Ansible Roles and Ansible galaxy********************************************

- when a role is created for a specific subtask, that subtask can be utilized into different playbooks just by calling upon the name of the role.
- For ex, installation and starting of apache as a service is a common dependency for many real-time applications such as drupal or node.js. In such cases, ansible roles can be thoroughly utilized to call upon the subtask of apache into the drupal and nodejs playbooks without having to create a new subtasks inside each of these playbooks separately.
- To create roles, we can use the ******************************************************************ansible-galaxy init ‘rolename’******************************************************************

The reason why it is called a galaxy is because it is a community “app-story”-like platform for sharing reusable ansible roles, that other developers have created.

To access Ansible Galaxy, all you need is a browser and an internet connection. The data of these roles created are stored in ************************************github repository************************************ and so an account on the same is also required. We can access this using https://galaxy.ansible.com

**********************Using Roles**********************

- once role is created, you can have them available on ansible galaxy for other developers to see and use it.
- This takes us to the two ways of using roles :
    - Find roles on Ansible Galaxy
    - Initiate a role by using **********ansible-galaxy init********** command

**********************************Rolling out Roles**********************************

To understand the use of roles better, we try creating a playbook embedded with roles.

The purpose this time is to install MEAN stack tools into the target machine using Ansible playbooks and Ansible Roles.

→ this includes installation of Nodejs and MongoDB on the target machine, including any other dependencies that either of them would have.

—> For installation of mongodb-org, which is not available in RHEL machine by default, we will have to add the package details in the yum configuration as shown below:

 

```yaml
$ cd /etc/ansible/roles
$ ansible-galaxy init prerequisites
$ ansible-galaxy init mongodb
$ ansible-galaxy init nodejs
```

we can have 3 roles created, named prerequisites, mongodb and node.js

**************NOTE :************** Roles must be only created inside the roles directory of ansible  like shown in above code file.

- These directories are tasks, handlers, defaults, vars, files, templates and meta and a  [README.md](http://README.md) file for the below mentioned purposes:
    - ************Tasks :************ contains the main list of tasks that are to be executed by the role. It contains the main.yml file for that particular role.
    - ********************Handlers:******************** contains handlers which may be used by this role or even anywhere outside this role.
    - ****************Defaults:**************** Contains the default variables that are going to be used by this role
    - ****************vars:**************** this directory consists of other variables that are going to be used by the role. These variables can be defined in your playbook, but it’s good habit to define them in this section.
    - ************Files:************ Contains files that can be deployed by this role. It contains files that need to be sent to the hosts while configuring the role.
    - ****Meta:**** defines metadata for this role. Basically, it contains files that establish role dependencies.

Every task directory must consists of a main.yml file where the actual code for that particular role is written.

EX1 : **********Roles**********

For the first role as prerequisite, let us create a playbook that installs git

```yaml
$ cd prerequisites/tasks/main.yml

----
- name: Install git
  yum: 
		name: git
		state: present
		update_cache: yes
```

Next we will write a playbook for mongodb

```yaml
$ cd /mongodb/tasks/main.yml

----
- name: MongoDB - Install MongoDB
	environment:
		http_proxy: http://username:password@10.122.41.7
		https_proxy: http://username:password@10.122.41.7
  yum:
		name: mongodb-org
		state: present
		update_cache: yes

- name: MongoDB  - Running State
	service:
			name: mongod
			state: started 
```

Now for the final role named nodejs

```yaml
$ cd nodejs/tasks/main.yml

----
- name: Node.js - Get Script
	environment:
			http_proxy: http://username:password@10.144.51.4:80
			https_proxy: http://username:password@10.144.51.4:80
	shell: curl -sL https://rpm.nodesource.com/setup_4.X | bash -
  args:
	  warn: no

- name: Node.js - Install Node.js
	environment:
			http_proxy: http://username:password@10.144.51.4:80
			https_proxy: http://username:password@10.144.51.4:80
  yum: name={{ item }} state=present update_cache=yes
	with_items:
		- "@Development tools"
    - nodejs

- name: Setup NPM HTTP Proxy
	command: npm config set proxy "{{item}}"
	with_items:
		- http://username:password@10.144.51.4:80

- name: Node.js - Install bower and gulp globally
	environment:
			http_proxy: http://username:password@10.144.51.4:80
			https_proxy: http://username:password@10.144.51.4:80
	npm: name={{ item }} state=present global=yes
	with_items:
		- bower
		- gulp
```

Finally, let’s create our main playbook, which will orchestrate the roles together.

```yaml
$ cd (local workspace)/mean.yml

---
- hosts: localhost
	roles:
	- prerequisites
	- mongodb
	- nodejs

Deploy the above using $ anisble-playbook mean.yml
```

why ansible roles ?

- Make script well structured, makes playbook composition more systematic and abstract
- Each one of the roles lives in its own isolated world, and can be shared with other server, groups, and playbooks.

************************Ansible Tags************************

- if we have a large or complex playbook, instead of running all the tasks from the playbook we can run only the specific tasks from it by applying tags.
- ************a Tag************ is a text label on the task or the play. We use the **********tags********** keyword to apply tags on the ansible play or tasks.
- To execute the specific tagged tasks or plays, use the ************-tags************ option along with the **********************************ansible-playbook********************************** command.

---

- Tag each task - One of the most common ways the tags are used.

```yaml
---
- name: Ansible Tags
	hosts: Servicegroup
	tasks:
	- name: install the httpd service
		yum:
			name: httpd
			state: present
		tags: service
```

- Tag an entire play - use tags directive at the play level.

```yaml
---
- name: Ansbible Tags
	hosts: Servergroup
	tags: Service
	tasks:
	- name: install the httpd service
		yum:
			name: httpd
			state: present
```

- To run the tasks with a specific tag, use the - - tags option and to skip the tasks, use the —skip-tags option along with ansible-playbook command

$ ansible-playbook playbookname.yml - -tags <tag name>

$ ansible-playbook playbookname.yml - -skip-tags tag name

→ to run multiple tag tasks, specify - -tags in a comma-separated list as ******************************************************************ansible-playbook playbook.yml - -tags tagname1, tagname2******************************************************************

—> To view all the tags that are exist in a playbook, we use the ******************- -list-tags****************** option 

$ ansible-playbook <playbook name>  - -list-tags

**************Note :************** We can apply the same tag to one or more tasks

```yaml
---
- name: Ansible Tags
	hosts: Servergroup
	become: true
	tasks:
		- name: install this httpd service
			yum: 
				name: httpd
				state: present
			tags: Service
  - name: display date
		command: date
		tags: service
```

- A special tag named **************always************** in ansible can be assigned in playbook. When the play/task is tagged with **************always************** it will always run even if it does not match with the list of tags passed to the ******************- -tags.****************** The play/task tagged with **************always************** can be skipped only when we explicitly mention using the **********************- -skip-tags always********************** option.
- The play/task is tagged with ************never************ to ensure that it does not run except when we run the playbook with the ****************************- -tags never**************************** option

********Ansible vault********

- Ansible vault helps us to protect sensitive content like passwords or tokens by encrypting them instead of leaving them visible as text in playbooks or roles without compromising security.
- To access the ansible vault, we need a password to encrypt and decrypt the content.
- We can create encrypted files, encrypt existing files and modify or decrypt the encrypted files using the **************************ansible-vault************************** command.
- The encrypted content can be shared securely through a source code management system.
- To create the file as encrypted with the vault, the ********************************ansible-vault create******************************** command followed by the file’s name is used.

$ ansible-vault create <file name>

After executing the command, it will prompt us to enter the password for the file 

→ the **************************ansible-vault encrypt************************** command is used to encrypt the existing file.

→ the **************************ansible-vault view fille-name************************** command is used to view the contents of the encrypted file. After execution it will prompt us for password, if entered password matches then the contents will be displayed.

→ the **************************ansible-vault edit************************** command is used to edit the contents of the encrypted files. 

$ ansible-vault edit <file name>

the **************************ansible-vault rekey************************** command is used to change the password for the encrypted file. ****************************************************

$ ansible-vault rekey <file name>

********************************************privilege escalation :********************************************

- when we try to install some packages on the target machine using a playbook or ansible command, we need permission to switch the user as root which is called **********privilege escalation.**********
- By-default the tasks under the playbook will run as the connected user, whether it can be a root or any user with SSH access to the remote nodes mentioned in an inventory file.
- Ansible playbooks achieve privilege escalation at many levels using directives or connection variables.
- For plays, roles and tasks we use privilege escalation directives as given below :

| Directive | Used as |
| --- | --- |
| become | set to true or yes and triggers the user escalation setting.  By default value is true |
| become_method | specify the command used to make login and change the user. The default is sudo |
| become_user | set to the desired user in the remote host. The default is root |
| become_flags | change login parameters. This method is used mostly when we want to change to a system user without shell privileges |
| become_ask_pass | Asks for privilege escalation password, the default is False. |

| Configuration Directive | Command-line option | Example |
| --- | --- | --- |
| become | - - become or -b | ansible-playbook playbookname.yml - -become |
| become_method | - -become-method=BECOME_METHOD | ansible-playbook playbookname.yml -become-method=su |
| become_user | - -become-user=BECOME_USER | ansible-playbook playbookname.yml -become-user=root |
| become_ask_pass | - -ask-become-pass or -k | ansible-playbook playbookname.yml -ask-become-pass |

we can set the escalation for just one task in a play. To do so, add the become directive to the task .

```yaml
---
- name: Demo for privilege escalation used in playbook
	hosts: Servergroup
	become: false
	tasks:
	- name: Install httpd service
		yum: 
			name: httpd
			state: present
		become: true
```

The privilege escalation is turned off by default for the play, but the task uses the escalation.

There are two ways to perform privilege escalation in roles

- set the escalation inside the tasks of the role

```yaml
---
- name: role used for date command
	tasks:
	- name: display date
		command: date
		become: true
```

- Set the escalation on the play that calls the role

```yaml
---
- name: Demo for privilege escalation used in playbook
	hosts: servergroup
	roles: 
		- role: date
			become: true
```

- we can configure privilege escalation using connection variables. These variables are applied as inventory variables on groups or individual hosts which override the ************become************ settings in the configuration file as well as in the plays, tasks and roles.

| Configuration directives | Connection variables |
| --- | --- |
| become | ansible_become |
| become_method | ansible_become_method |
| become_user | ansible_become_user |
| become_password | ansible_become_pass |

Given below shows the group level variables used in an inventory

```yaml
[servergroup]
pod5862-ansiblenode1

[servergroup:vars]
ansible_become=true
ansible_become_method=sudo
ansible_become_user=root
ansible_become_pass=charan@123
```

we can set the connection variables for the escalation at the host level.

```yaml
[servergroup]
pod5862-ansiblenode1 ansible_become=true ansible_become_method=sudo
ansible_become_user=root ansible_become_pass=Charan@123
```

**************Ansible facts**************

- when we execute any playbook on the target machine, ansible gathers configuration details or the metadata about the hosts. the ************setup************ module called by the playbook automatically gathers the facts and stores them in the predefined variables which starts with ****************ansible_****************

For EX: 

**********************************ansible_hostname********************************** returns the hostname of the target machine

******************************************ansible_distribution****************************************** returns the OS distribution of the target machine

************facts************ are used to check the conditions before running on the nodes. for ex; if we need to check the OS of the remote nodes before installing the software, we can use the facts variables with conditions.

******************gather_facts****************** option is automatically enabled in ansible, If we need to disable it, then set gather_facts to false/no . We can explicitly enable gather_facts .

```yaml
---
- name: gathers and displays the facts of all nodes
	hosts: servergroup
	gather_facts: yes
	tasks:
		- name: displaying the facts using debug module
			debug:
				msg: "host name is {{ ansible_hostname }} and distribution is {{ ansible_distribution }}
```

The above playbook gathers and displays the facts about the machines under the group **********************servergroup**********************

→ To view the complete list of all ansible variables of all nodes, use the ******************************ansible all -m setup******************************

→ To view the complete list of ansible variables of the specific node, use **************************************************ansible nodename -m setup**************************************************

****************Ansible Handlers****************

The tasks under the handlers will get executed when the ********notify******** action is triggered. For ex; when we change the configuration files of the httpd service, we need to restart the service. The task to restart the service can be added to the handlers section and get triggered as soon as the changes task is completed.

- Handlers will run at the end of each task in a play. The below playbook executes the ********************************************************copy the configuration******************************************************** task and once it gets success, it triggers the ********************************************restart_httpd_service******************************************** handlers to execute.

```yaml
---
- name: demo for the handlers
	hosts: servergroup
	become: true
	tasks:
		- name: copy the configuration file
			copy:
				src: /tmp/httpd.conf
				dest: /src/httpd.conf
				notify:
				- restart_httpd_service
	handlers:
		- name: restart_httpd_service
			service:
				name: httpd
				state: restarted
```

when the task fails on the remote machine, handlers that were previously notified will not run on that machine. We can change this behaviour by adding the ******************************force_handlers****************************** directive as true in the playbook or using the ************************************- -force_handlers************************************ option along with the command line while running the playbook as like below

```yaml
---
- name: demo for force handlers executive
	hosts: servergroup
	force_handlers: true
	become: true
	tasks:
		- name: copy configuration
			copy:
				src: /tmp/httpd.conf
				dest: /etc/httpd.conf
			notify:
				- restart_httpd
		- name: copy the normal file
			copy:
				src: /home/esadmin/forcehandler.txt
				dest: /forcehandler.txt
	handlers:
		- name: restart httpd service
			service:
					name: httpd
					state: restarted

$ ansible-playbook handlers.yml --force-handlers
```

when the handler is forced, it will run when notified even if any of the subsequent tasks get fail on the host.

******************************************************order of playbook execution****************************************************** 

First, ansible runs the tasks from the roles section followed by tasks from the tasks section. 

```yaml
---
- name: order of task execution
	hosts: node1
	tasks:
		- name: Installing the httpd service
			yum:
				name: httpd
				state: present
			become: true
	roles:
		- role: role_date
```

it is always a good practice to write the roles section before the tasks section. So that order of playbook matches the order of execution.

```yaml
---
- name: order of task execution
	hosts: node1
	roles:
		- role: role_date
	tasks:
		- name: Installing the httpd service
			yum:
				name: httpd
				state: present
			become: true
	
```

The recent ansible versions allow us to include/import the roles as a task under the tasks section instead of using them under the roles section of the play.

************Advantage :************ We can easily run a set of tasks by importing or including the role and then run more tasks ,if any

********Disadvantage :******** The roles used by the playbook will not be clear without inspecting it closely.

To include the role dynamically, we can use the **************************include_role************************** module and for statistically use the ************************import_role************************ module.

************************import_role************************ the role is first inserted into the play before the ansible-playbook command execution. If there are any errors in the roles, ansible detects and reports them immediately and stops the playbook execution.

```yaml
---
- name: Demo for importing a role in task by using import_role
	hosts: node1
	tasks:
		- name: First task
			debug:
				msg: 'Execution of first task'
		- name: Importing role as task
			import_role:
					name: role_date
		- name: sum of two numbers
			debug:
				msg: 'The total is {{ 80 + 80 }}'
```

******************************include_role :****************************** The ansible-playbook command inserts the role in the play when it reaches the include_role task during the play execution. if ansible detects the errors in the role, then the playbook execution gets aborted. 

```yaml
---
- name: Demo for importing a role in task by using include_role
	hosts: node1
	tasks:
		- name: first task
			debug:
				msg: 'Execution of first task'
		- name: importing role as task
			include_role:
				name: role_date
		- name: sum of two numbers
			debug:
				msg: 'The total is {{ 80 + 80 }}'
```

suppose we wanted to run some tasks before the roles and after the tasks section. This can be achieved using the following two directives.

- **********************pre_tasks:********************** task section that runs before roles
- ************************post_tasks:************************ task section that runs after the tasks

EXample to show the playbook with pre_tasks, roles, tasks and post_tasks sections. It is not mandatory to have all these sections in the play

```yaml
---
- name: Order of Task Execution
	hosts: node1
	pre_tasks:
			- name: Executing the task under pre_task section
				debug:
					msg: 'Greetings from pre_tasks section'
	roles:
		- role: role_date
	tasks:
		- name: Installing the httpd service
			yum: 
				name: httpd
				state: present
			become: true
	post_tasks:
		- name: Executing the task under post_task section
			debug:
				msg: 'The tasks of this playbook are successfully executed'
```

Overall, ansible runs the play section in the order stated below

- pre_tasks
- handlers triggered in the pre_tasks
- roles
- tasks
- handlers triggered in the roles and tasks section
- post_tasks
- handlers triggered in the post_tasks

**********************************Ansible Templates**********************************

- One of the key aspects of ansible is to manage the configuration of multiple servers and environments. However, these configuration files may vary from one remote node to another. Except for a few parameters, all settings will remain the same.
- Creating these configurations statistically is not an efficient way as it takes a lot of time whenever a new node is added. Therefore, it would be useful if these configurations are managed dynamically. The ansible ******************template****************** module can be used for this purpose.
- Templates are files that contain all the configuration parameters with dynamic values provided as variables.
- once the playbook gets executed, the variables are replaced based on the node(s) being used. Templates have a ********.j2******** extension which specifies that it uses the jinja2 templating engine. The variables are denoted using double curly braces {{ variables }} in the template files. Along with the variable replacement, we can also have loops, conditions and filters in the templates.

The template module will have two parameters as given below:

- src - source path of the template file
- dest - destination path on the remote machine

consider the template file ************************template.j2************************ below

```yaml
Hi {{ username }}
welcome to the demo of ansible template
{{ commands }}
```

Let’s see how to replace the variables in this template file, using the template module in ansible playbook.

```yaml
---
- name: Demo for Ansible Template
	hosts: Servergroup
	vars:
		username: esadmin
		commands: This is my first template example
	tasks:
		- name: Replace the existing variables in the template.j2 file
			template:
					src: template.j2
					dest: /home/esadmin/user.txt
```

In the above playbook, we have used two modules named ****************************src and dest.**************************** The src parameter denotes the location of the template file from the master node whereas the dest parameter denotes the location where the files have to be stored in the target machine.

******************Ansible Tower******************

Ansible Tower, also referred as ********AWX******** is a web based solution for ansible at the enterprise level that manages with a simple UI. It provides a dashboard with the summary of all hosts, allowing rapid deployments and monitoring all infrastructure configurations.

****************************************************************pre-requisites to install Tower:****************************************************************

The following are the pre-requisites to install Tower :

- The following Operating systems are compatible with ansible tower
- Latest release of Ansible
- Minimum 2 cpus are required for Automation Platform installations
- Minimum 4 GB RAM are required for Automation Platform Installations

************parameters of Ansible Tower:************

The tower comes in the following three different editions with varying capabilities.

- self-supported - free trial version
- standard - requires a  subscription
- Premium edition - requires a subscription

************************************************Ansible Tower Features :************************************************

Ansible Tower Features are given below :

| Features | Description |
| --- | --- |
| Dashboard | Displays all the information happening in our ansible environment |
| Real-time job updates | can see the real-time job updates like plays and tasks by each machine whether successful or a failure |
| Multi playbook workflows | allows us to chain any no of playbooks irrespective of the usage of different inventories |
| who ran what job when | can easily know who ran what job where  and when as all the automation activity is securily logged in Ansible Tower |
| integrated Notification | Can notify a person or team when a job succeeds or fails |
| Schedule ansible jobs | can schedule the different kinds of jobs such as playbooks, and source control updates inside the tower to run |
| REST API | All the tower features are available via Tower’s REST API which provides the ideal API for a systems management infrastructure |
| Tower CLI Tool | available for launching jobs from CI systems like jenkins or when we need to integrate with other command-line tools |
| Remote Command Execution | can run simple tasks like adding new users, restarting any services, , and resetting the passwords with the Tower’s remote command execution |
|  |  |

**************************************Ansible Tower Usage**************************************

Ansible tower is mainly used for managing:

- Organizations
- Inventory via web GUI
- Credentials
- Job Templates

**************Ansible Tower installation**************

The following steps are applied to the bundler installer used to install the tower on RHEL 8.0 or later

1. ************************************************switch to root and enter password by entering $ sudo su************************************************
2. Download the setup bundle of tower from [2. Download the Ansible Automation Platform Installation Program — Ansible Tower Quick Install Guide v3.8.6](https://docs.ansible.com/ansible-tower/latest/html/quickinstall/download_tower.html#using-the-bundled-aap-installer)
3. Extract the downloaded bundle and switch to the extracted directory
4. open the inventory file in the editor using the command ************************vi inventory************************
5. Set the passwords for the Tower admin account (admin_password), an automation hub account ( automationhub_pg_password) and PostgreSQL database user account (pg_password) 
6. To close the editor, press ********ESC******** followed by ******:wq******
7. Run the [setup.sh](http://setup.sh) file to start the tower installer using the command ./setup.sh . This script may take upto 15 minutes to complete the execution. 

**************logging in to Tower:**************

After installing, browse to the tower interface at <http://ipaddress_of_the_machine> to log into the tower. The log in page of the tower .

The default user name is admin and password is which you provided on the inventory file during the installation

When logged into the Tower web UI for the first time, we are prompted to enter a llicense and accept the end-user license agreement . 

**********************Tower User Interface:**********************

After successful login, we can see the dashboard of the tower 

The left side navigation bar provides a quick access to resources like projects, inventories, job templates and jobs.

on top right side, we can access our user profile, about page, view related documentation and log out. Below these options, we can view the dashboard which provides a summary of our hosts, inventories and projects.

on the main dashboard screen, we can observe **********job status, recently used templates and recent job runs.**********

************job status:************

The job status is a graphical representation which displays the number of failed and successful jobs over a specific period.

**Recently used templates**

The most recently used templates are included in this section.

********************************Recent job runs:********************************

This section displays the jobs which were most recently executed, their status and time when they started to run.

**************organizations in Tower:**************

Organizations in tower is the highest level in the object hierarchy and it has the collection of ********************************************************************************users, teams, projects and inventories .********************************************************************************

We can access the organizations page by selecting the organizations option from the left navigation bar. This page displays all the existing organizations available in Tower.

Tower automatically creates a default organization named ****************default**************** 

********users:********

A user is a person who has access to tower with respective permissions and credentials. We can access the users page by selecting users option from the left navigation bar. This page allows us to manage all tower users

Tower automatically creates a default user named ************admin************ is a superuser. Atleast one superuser must always exist. If we want to delete the admin user account, you must first create another superuser account.

******************************Types of users:******************************

There are three types of tower users

| Tower users | Details |
| --- | --- |
| Normal User | Have read and write access to the limited resources |
| System Auditor | Implicitly inherits read-only access for all the objects within the tower |
| System Administrator | Has full system administration privileges |

************Teams:************

Team is a part of an organization with the related projects, users, permissions and credentials. We can create as many teams of users for our organization. We can provide permission to a whole team instead of granting individually. The team’s section in the left navigation bar displays the available teams and allows us to manage them.

************************Credentials:************************

The tower uses credentials while launching jobs against target machines, synchronizing with the inventory sources, and importing project content from a source code management system. We can grant users and teams permission to use these credentials without exposing them.

If a user is moved to a different team or leaves the organization, we don’t have to provide the new credentials to all the systems as they are already available in the tower.

The tower encrypts the password and key information in the tower database and never makes secret information visible. The credentials section in the left navigation bar displays the list of available credentials.

By default, when the credentials are added to the team, all the members of that team can access it. When credentials are added to a user, it is available only to that specific user.

**************projects**************

A project is a collection of playbooks represented in tower. Playbooks and their directories can be managed by either manually adding them to the project base path on the tower server or adding them to the source code management(SCM) system that the tower supports. The project section in the left navigation bar displays the list of available projects.

For each listed project, we can get the latest SCM revision, copy the project attributes or delete the project using the respective icons which is placed next to each project.

Status indicates the state of the project and the various status types are given below

| Status Type | Usage |
| --- | --- |
| pending | source control update has been created but not yet started or queued |
| waiting | source control update is in the queue to get execute |
| Running | Source control update is currently in progress |
| successful | Last source control update for the project is succeeded |
| Failed | Last source control update for the project is failed |
| Error | Last source control update for the job is failed |
| Cancelled | Last source control update for the project is cancelled |
| Never Updated | Project is configured for source control but never updated |
| Ok | Project is not configured for source control and placed correctly |
| Missing | Projects are absent from the project base path |

**********************inventories**********************

An inventory is same as the ansible inventory file which contains the details of the hosts. Inventories are split into groups that contain the actual hosts. Inventories section in the left navigation bar displays the list of available inventories.

List of inventory details are given below

| Inventory details | Description |
| --- | --- |
| Inventory sync | Green color indicates the success and red color indicates the failure |
| Status dot | Shows the status of recent jobs |
| Name | Inventory name, clicking on this will navigate to the properties screen for the selected inventory |
| Type | Shows the type of inventory |
| Organization | To which organization the inventory belongs |
| Edit | Edit the properties for the selected inventory |
| Copy | Makes a copy of an existing inventory as a template for creating a new one deletes the selected inventory . This action cannot be reversed |
| Delete | Deletes the selected inventory. This action cannot be reversed. |

**************************job template:**************************

A job template is an instruction to run ansible jobs . These templates are useful for executing the same job multiple times. We can also reuse the playbook content, which encourages team collaboration.

**********jobs:**********

A job is a tower instance launching a playbook against an inventory of hosts. The jobs section displays the list of jobs and their status (successful, failed or active ). We can take several actions from this section which includes viewing the details, re-launching jobs or removing jobs.

The re-launch operation will run only the playbook and not the project/inventory updates, system jobs and workflow jobs

clicking on any job takes us to the details of that particular job which has two sections.

 

| Sections | Details |
| --- | --- |
| Details Pane | Provides information and status about the job |
| Standard out pane | Displays job processes and output |

**Managing complex deployment**

Modern days, the companies doing high speed and frequent deployments

The challenges of high speed and frequent deployments include:

- frequent deployments to multiple part concurrently imply that debugging, pinpointing the root cause and tracing changes become difficult
- Since infrastructure is abstracted as code, new deployments would need change to code too.

Let’s have a look at the some of the common strategies for deployments for migrating these challenges .

************************************************************Blue Green or Red-Black or A/B Deployments************************************************************

************what ?************

Here, two identical environments are created ( hence the name blue-green , Red-black , A/B ). one represents a live environment and the other is the clone.

**********How ?**********

the deployment of the changes in the application is first done to the clone, tested (for features, functionality, performance etc). Once the testing is successful. the application traffic is routed to the clone. This now becomes the new live environment. If there are bugs/issues in the new environment, the traffic is routed to the original environment.

**************************considerations:**************************

- Two identical environments are needed. They need to be in sync and share the persistence and database layer
- Traffic routing software and configurations are needed using a switch
- Switching would also mean that current transactions and sessions would be lost

********************Advantages********************

- Fail safe method
- Zero downtime
- Tests are performed in production and hence confidence on success of deployment is more

******************************Rolling deployment******************************

************what ?************

The deployments are done in a phased manner over a period of time. The new and old versions co-exist for the transition period.

**********How ?**********

The old version is shown in red and the new version is shown in black across each server in the cluster.

****************************considerations****************************

- since the old and new versions would co-exist, care should be taken not to affect functionality or user experience
- Old versions is to be removed only after sufficient checks

******************Advantage******************

- fail safe method

****************examples****************

- Application or product suite upgrades can be done this way

************************canary deployment************************

************what ?************

The new code is available in a small part of the production environment with some selected and identified user groups. it is a variation of the blue-green deployment

**********How ?**********

The black color indicates the users to whom the changes have been deployed. Once the users sign off or no errors are reported, it can be deployed to the bigger lot of users.

**************Considerations:**************

- identification of the user base to which changes are to be deployed
- would need to do this through permission based method, IP ranging technique or through feature toggle (code) EX: Gatekeepere that is used in Facebook

**************Advantages**************

It is risk averse and minimizes impact of a wrong change

**************************************************************Recommended guidelines for deployment**************************************************************

- Having a deployment guideline list will help to ensure readiness for deployment
- Adoption of automated CICD pipeline using tools and gating conditions ensures that stable applications, those meeting quality conditions, tested and packaged are deployed
- usage of standard operating systems ensure that there is a reduction in cost and reduced time taken for deployment and maintainance
- usage of configuration management tools help in easier deployments
- use notification and communication for deployment that fails, supported by automated rollback
- use monitoring tools to check status post deployment to take pro-active action in case of failures

**********ansible support for automated deployment**********

- Multitier orchestration (i.e; ******************delegate_to)****************** allowing you to orderly target different groups of servers: monitoring, load balancer, application server, database etc
- rolling upgrade(i.e; serial) to control how changes are made (eX: 1 by 1, N by N, X% at a time etc)
- Error control, **************max_fail_percentage and any_errors_fatal************** is my process all-in or will it tolerate fails ?
- A vast library of modules for:
    - Monitoring (ex: Nagios, Zabbix etc)
    - Load balancers (EX; HAProxy, F5, Netscaler, Cisco etc)
    - Services (EX: service, command, file)
    - Deployment (Ex: Copy, unarchive)
    - Programmatic Verifications (Ex: Command, Uniform Resource Identifier )

************************Factors to Consider for tool selection************************

1. ************Infrastructure Complexity :************ The question that needs answering for this aspect is : Is your project big or small ?
2. **************************************************cost(Not necessarily in monetory terms):************************************************** Some tools are opensource, other tools need payments for their services. Apart from these, a special consideration is also required on the extra cost that training the team members could bear in terms of time.
3. ****************features:**************** many tools come up with advanced features that your team may just not need yet, hence you can always scratch off such tools while evaluating them.

**************Ansible**************

Ansible was developed to simplify complex orchestration and configuration management tasks. The platform is written in python and allows users to script comamnds in yaml as an imperating programming paradigm. Ansible offers multiple push models to send command modules to nodes via SSH that are executed sequentially.

Ansible doesn’t require agents on every system, and modules can reside on the server. A centralized Ansible workstation is commonly used to tunnel commands through multiple bastion host servers and access machines in a private network.

************************capabilities************************

- streamlined provisioning
- Configuration management
- Application deployment
- Automated workflow for continuous delivery
- Security and compilance policy integration into automated processes
- simplified orchestration

********pros********

- easy remote execution, and low barrier to entry
- Suitable for environments designed to scale rapidly
- Shares facts between multiple servers, so they can query each other
- Powerful orchestration engine. Strong focus on areas where others lack, such as zero downtime rolling updates to multitier applications across the cloud.
- Easy installation and initial setup
- Syntax and workflow is fairly easy to learn for new users
- Sequential execution order
- Supports both push and pull models
- Lack of master eliminates failure points and performance issues. Agent-less deployment and communication is faster than the master-agent model
- High security with SSH

********Cons********

- increased focus on orchestration over configuration management
- SSH communication slow down in scaled environment
- Requires root SSH access and python interpreter installed on machines, although agents are not required
- The syntax across scripting components such as playbooks and templates can vary
- Underdeveloped GUI with limited features
- The platform is new and not entirely mature as compared to chef and puppet

Ansible can enhance **************idempotency.************** Idempotency means it can be applied multiple times on different client nodes and still be expected to bring about the same successful result.

For EX: No matter how many times you fetch your name and address from a database, it will return the same result and not affect the database in any manner. Such a system is idempotent.

**********************************Recommended practice**********************************

1. Provide meaningful names to tasks, plays, variables and modules
    
    ```yaml
    - name: Installing MongoDB dependencies
    - name: Exporting proxy for ease in installation
    - name: Disabling firewall to access port 80
    Should not be like below
    - name: Playbook one
    - name: Experiment undo
    - name: The one created by Genrd
    ```
    
2. Usage of native YAML syntax as opposed to YAML shorthand notations
3. Use run commands sparingly
4. use debug statements effectively
5. organize playbooks well playbook Organization
6. Write comments
    
    ex: 
    
    ```yaml
    # use shell so commands are passed in correctly
    - name: copy solr components into place.
    	shell: >
    		cp -r {{ item.src }} {{ item.dest }}
    		creates={{ item.creates }}
    ```
    
7. Group tasks in multiple files
8. Roles can be used for grouping, logical configuration
9. Run playbooks from a central playbook runner
10. usage of forking
11. use configuration file (Default configuration file path in ansible is ************************************************/etc/ansible/ansible.cfg************************************************

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/a2be7731-103e-4bd5-ab13-8230a2fe0d79/fea5e69b-35cb-4011-a655-5c550b1cbdfd/Untitled.png)

[]()

[]()

[]()

> Practice is the best of all instructions → publius syrus
>
