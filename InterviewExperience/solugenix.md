1. Tell me about yourself
<details><summary>2. create a ansible playbook for logrotation daily at 11</summary> 
---
- name: Setup daily log rotation at 11 AM
  hosts: all
  become: yes

  vars:
    log_file_path: "/var/log/myapp/*.log"
    rotate_config_name: "myapp-logrotate"
    logrotate_path: "/etc/logrotate.d/myapp"
    cron_name: "logrotate-myapp"

  tasks:

    - name: Ensure logrotate is installed
      package:
        name: logrotate
        state: present

    - name: Create logrotate configuration
      copy:
        dest: "{{ logrotate_path }}"
        content: |
          {{ log_file_path }} {
              daily
              missingok
              rotate 7
              compress
              delaycompress
              notifempty
              create 0640 root utmp
              sharedscripts
              postrotate
                  systemctl reload rsyslog > /dev/null 2>/dev/null || true
              endscript
          }

    - name: Schedule cron job for log rotation at 11 AM
      cron:
        name: "{{ cron_name }}"
        minute: "0"
        hour: "11"
        job: "/usr/sbin/logrotate {{ logrotate_path }}"
        user: root
🔧 How to Run:

ansible-playbook -i inventory logrotate-playbook.yml
Ensure your inventory file has target hosts listed.
</details>
<details><summary>3. Terraform script to create s3 bucket</summary> This Terraform script will:

Create an S3 bucket

Enable versioning

Block public access

Enable server-side encryption

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "myapp-logs-bucket-nagacharan"
  force_destroy = true

  tags = {
    Name        = "MyAppLogs"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

Run commands

terraform init
terraform plan
terraform apply

</details>

✅ 🚀 Goal:
Rotate logs daily at 11 AM (already done)

After rotation, automatically upload rotated logs to S3

Ensure IAM permissions, AWS CLI setup, and cron automation

Here’s the updated logrotate-playbook.yml with:

logrotate config

AWS CLI setup

Cron job to upload logs to S3

```logrotate-s3-playbook.yml
---
- name: Setup log rotation and upload to S3
  hosts: all
  become: yes

  vars:
    log_file_path: "/var/log/myapp/*.log"
    rotated_dir: "/var/log/myapp/rotated"
    logrotate_config: "/etc/logrotate.d/myapp"
    s3_bucket: "myapp-logs-bucket-nagacharan"
    cron_script_path: "/usr/local/bin/upload_rotated_logs.sh"

  tasks:

    - name: Install logrotate and awscli
      package:
        name: "{{ item }}"
        state: present
      loop:
        - logrotate
        - awscli

    - name: Create rotated logs directory
      file:
        path: "{{ rotated_dir }}"
        state: directory
        owner: root
        group: root
        mode: '0755'

    - name: Configure logrotate
      copy:
        dest: "{{ logrotate_config }}"
        content: |
          {{ log_file_path }} {
              daily
              missingok
              rotate 7
              compress
              delaycompress
              notifempty
              create 0640 root utmp
              sharedscripts
              olddir {{ rotated_dir }}
              postrotate
                  systemctl reload rsyslog > /dev/null 2>/dev/null || true
              endscript
          }

    - name: Create shell script to upload rotated logs to S3
      copy:
        dest: "{{ cron_script_path }}"
        mode: '0755'
        content: |
          #!/bin/bash
          find {{ rotated_dir }} -type f -name "*.gz" -mmin -60 | while read file; do
            aws s3 cp "$file" s3://{{ s3_bucket }}/rotated-logs/$(basename $file)
          done

    - name: Schedule cron job to upload logs at 11:10 AM
      cron:
        name: "upload rotated logs to S3"
        minute: "10"
        hour: "11"
        job: "{{ cron_script_path }}"
        user: root

```
 2. IAM Setup on AWS (Manual/TF)
To upload logs to S3, the EC2 instance or VM must have permissions.

🧾 IAM Policy (Attach to instance role):

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::myapp-logs-bucket-nagacharan",
        "arn:aws:s3:::myapp-logs-bucket-nagacharan/*"
      ]
    }
  ]
}

```
Attach this to the EC2 instance’s IAM role (via AWS Console or Terraform).

 3. Test the Workflow
After running the playbook:

bash
Copy
Edit
ansible-playbook -i inventory logrotate-s3-playbook.yml
Verify:

Logs are rotated at /var/log/myapp/rotated/*.gz

At 11:10 AM, rotated logs are copied to:

arduino
Copy
Edit
s3://myapp-logs-bucket-nagacharan/rotated-logs/
✅ Bonus (Optional Enhancements)
Add email alert on failure in cron job

Upload logs with timestamp:


s3://bucket/rotated-logs/$(date +%F)/filename.log.gz
Compress logs with custom suffix or split size

Use S3 lifecycle policy to auto-delete after X day
