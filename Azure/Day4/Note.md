First, let's go to our Azure Management dashboard, and in the top search bar search for "virtual machines" and click on it.

How to create an Azure account for free

After a couple of minutes, you will see something like below on your management dashboard. which means, we have successfully created our Virtual Machine on Azure.

$ ssh -i <pem key location> username@ip

$ ssh -i Jenkins-Server_key.pem azureuser@20.235.137.56

# pre-requisite for jenkins is java
sudo apt update
sudo apt install openjdk-11-jre -y

java -version

 curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
jenkins --version

Finally, we have successfully deployed Jenkins on our Azure virtual machine and got our Jenkins UI.

