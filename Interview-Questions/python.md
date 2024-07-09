<details><summary>wrote a boto3 script to automate the creation of EC2 instances. The script includes functionalities for creating instances, attaching security groups, and tagging resources. It also includes error handling and logging. </summary>
Automating EC2 instance creation using Boto3 can significantly streamline your workflow. Let’s break down the key steps for creating an EC2 instance with Boto3:

Prerequisites:
Ensure you have Python 3 installed.
Install Boto3 using pip install boto3.
Set up your AWS credentials (access key and secret key) if you haven’t already.
Creating an EC2 Key Pair:
A key pair consists of a private key (stored locally) and a public key (stored on Amazon).
You can create a key pair using the following Python code

```python
// creating EC2-keypair

import boto3
import os

def create_key_pair():
    ec2_client = boto3.client("ec2", region_name="us-west-2")
    key_pair = ec2_client.create_key_pair(KeyName="ec2-key-pair")
    private_key = key_pair["KeyMaterial"]
    # Write private key to file with 400 permissions
    with os.fdopen(os.open("/tmp/aws_ec2_key.pem", os.O_WRONLY | os.O_CREAT, 0o400), "w+") as handle:
        handle.write(private_key)

```
specify the necessary parameters (e.g., ImageId, InstanceType, KeyName, etc.).
Here is the script for the same :
```python
// creating EC2-instance
def create_instance():
    ec2_client = boto3.client("ec2", region_name="us-west-2")
    instances = ec2_client.run_instances(
        ImageId="ami-0b0154d3d8011b0cd",
        MinCount=1,
        MaxCount=1,
        InstanceType="t4g.nano",
        KeyName="ec2-key-pair"
    )
    print(instances["Instances"][0]["InstanceId"])

```
 </details>

<details><summary> Example of a Python script to generate JIRA reports older than a week</summary>

```python
import jira
from datetime import datetime, timedelta

jira_client = jira.JIRA(server='https://your_jira_server', basic_auth=('username', 'password'))
week_ago = (datetime.now() - timedelta(days=7)).strftime('%Y-%m-%d')

issues = jira_client.search_issues(f'created < {week_ago}')
for issue in issues:
    print(f"{issue.key}: {issue.fields.summary}")


```
 </details>