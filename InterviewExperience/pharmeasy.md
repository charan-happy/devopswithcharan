# DevOps / Cloud / Kubernetes Interview Questions & Answers

> **Interview Date:** 05/10/2026\
> **Time:** 2:00 PM -- 2:30 PM\
> **Focus:** AWS, Kubernetes, EKS, IAM, Ingress, cluster upgrades,
> troubleshooting



<details>
<summary><strong>1. Tell me about yourself</strong></summary>

**Answer**

I am a DevOps/Cloud Engineer with around 4.5 years of professional
experience, primarily working with AWS, Kubernetes, Linux, CI/CD,
infrastructure automation, and monitoring.

My experience started with Linux and VMware administration, where I
worked extensively with RHEL, VMware, and vSphere. Over time, I moved
more deeply into DevOps and cloud technologies.

My core areas include:

-   **Cloud:** AWS and Azure
-   **Containers:** Docker and Kubernetes
-   **Kubernetes:** EKS, deployments, services, ingress, RBAC, storage,
    autoscaling and troubleshooting
-   **CI/CD:** Jenkins, GitHub Actions, Azure DevOps and Git
-   **Infrastructure as Code:** Terraform and Ansible
-   **Monitoring:** Prometheus, Grafana, CloudWatch and
    logging/observability tools
-   **Operating Systems:** Linux/RHEL
-   **Scripting:** Bash and Python

In my current work, I focus on building and maintaining cloud
infrastructure, improving CI/CD, implementing monitoring and security
controls, and troubleshooting production issues.

I am particularly interested in Kubernetes and cloud-native
infrastructure, and my goal is to grow into a senior DevOps/Cloud
Engineer role where I can take ownership of production infrastructure
and platform engineering.
</details> 
<details>
<summary><strong>2. What cloud have you worked with mostly?</strong></summary>

### Answer

I have worked mostly with **AWS**.

Some of the AWS services I have worked with include:

-   EC2
-   IAM
-   VPC
-   S3
-   CloudWatch
-   Lambda
-   RDS
-   Route 53
-   Load Balancers
-   EKS
-   SQS

I have also worked with Azure and have exposure to services such as
Azure VMs, VNets, Storage, Functions and Azure DevOps.

My stronger experience, particularly around Kubernetes and cloud
infrastructure, is with AWS.
</details>

<details><summary><strong>3. What is the difference between an IAM policy and a resource policy?
When will you use each? Give an example of both. </strong></summary>

There are two important concepts:

-   **IAM Policy** → Identity-based policy
-   **Resource Policy** → Resource-based policy

  -----------------------------------------------------------------------
                          IAM Policy              Resource Policy
  ----------------------- ----------------------- -----------------------
  Also called             Identity-based policy   Resource-based policy

  Attached to             User / Group / Role     Resource

  Main question           What can this identity  Who can access this
                          do?                     resource?

  Specifies `Principal`?  Usually no              Yes

  Cross-account access    Possible                Very common/useful

  Example                 IAM role →              S3 bucket → allow
                          `s3:GetObject`          another account

  Common services         IAM, EC2 roles, Lambda  S3, SQS, SNS, KMS,
                          roles                   Secrets Manager
  -----------------------------------------------------------------------

### Expanded Answer

An **IAM policy** is an identity-based policy. It is attached to an IAM
user, group, or role and defines what actions that identity is allowed
to perform.

For example, if an application runs using an IAM role, I can attach a
policy allowing that role to read objects from a particular S3 bucket.

``` text
Application
    |
    v
IAM Role
    |
    v
IAM Policy
    |
    +---- s3:GetObject
    |
    v
S3 Bucket
```

A **resource-based policy**, on the other hand, is attached directly to
the resource. It defines which principals are allowed to access that
resource.

For example, an S3 bucket policy can allow a role from another AWS
account to access objects in that bucket.

### Example: IAM Policy

``` json
{
  "Effect": "Allow",
  "Action": [
    "s3:GetObject"
  ],
  "Resource": "arn:aws:s3:::my-private-bucket/app/*"
}
```

This answers:

> **What can this IAM identity do?**

### Example: Resource Policy

An S3 bucket policy can specify a principal:

``` json
{
  "Effect": "Allow",
  "Principal": {
    "AWS": "arn:aws:iam::123456789012:role/application-role"
  },
  "Action": [
    "s3:GetObject"
  ],
  "Resource": "arn:aws:s3:::my-private-bucket/app/*"
}
```

This answers:

> **Who can access this resource?**

### Interview Point

I generally use IAM policies for granting permissions to users,
applications, and roles.

Resource policies are particularly useful when I want to control access
directly at the resource level, especially for scenarios such as
**cross-account access**.
</details>

<details><summary>4. A private S3 bucket should be accessible only by a specific Kubernetes pod. How would you implement this? </summary>

### Answer

If this is an **EKS cluster**, I would use **EKS Pod Identity or IRSA**
rather than giving S3 permissions to the worker-node IAM role.

The main objective is **least privilege**.

I would create:

1.  A dedicated Kubernetes `ServiceAccount`
2.  A dedicated IAM role
3.  An IAM policy with only the required S3 permissions
4.  Associate the ServiceAccount with that IAM role
5.  Configure the application pod to use that ServiceAccount

The architecture would look like:

``` text
                EKS Cluster
                    |
                    v
             Kubernetes Pod
                    |
                    v
          Dedicated ServiceAccount
                    |
                    v
               IAM Role
                    |
                    v
             IAM Policy
                    |
                    v
             Private S3 Bucket
```

### Example

The IAM policy could allow only:

``` text
s3:GetObject
```

and only for a specific bucket/prefix:

``` text
arn:aws:s3:::my-private-bucket/application/*
```

The application deployment would use:

``` yaml
spec:
  serviceAccountName: s3-reader
```

### Why not use the worker-node IAM role?

If I give S3 permissions to the worker-node role, potentially every pod
running on that node could obtain access to those permissions depending
on the credential setup.

That violates least privilege.

Instead:

``` text
Pod A → ServiceAccount A → IAM Role A → S3 Read
Pod B → ServiceAccount B → IAM Role B → No S3 Access
```

This gives workload-level identity and access control.

</details>

<details><summary><strong> 
5. Let's say I have my frontend application `pharmeasy.in`. Walk me
through the journey of this request from the browser to my pod.

</summary>

### Architecture

``` text
                         USER
                           |
                           | https://pharmeasy.in
                           v
                    +--------------+
                    |     DNS      |
                    |   Route 53   |
                    +------+-------+
                           |
                           v
                    +--------------+
                    |  CloudFront  |
                    |     / WAF    |
                    +------+-------+
                           |
                           v
                    +--------------+
                    |     ALB      |
                    | HTTPS/TLS    |
                    +------+-------+
                           |
                           | Ingress Rules
                           v
                    +--------------+
                    | K8s Service   |
                    | frontend-svc |
                    +------+-------+
                           |
                +----------+----------+
                |          |          |
                v          v          v
             +------+   +------+   +------+
             | Pod1 |   | Pod2 |   | Pod3 |
             | :3000|   | :3000|   | :3000|
             +------+   +------+   +------+
                           |
                           v
                    Application
```

### Step-by-step explanation

#### Step 1 --- User enters the URL

The user enters:

``` text
https://pharmeasy.in
```

The browser needs to determine where this domain should be sent.

#### Step 2 --- DNS resolution

The browser performs DNS resolution.

Route 53 resolves the domain to the public entry point, depending on the
architecture.

For example:

``` text
pharmeasy.in
      |
      v
Route 53
      |
      v
CloudFront / ALB
```

#### Step 3 --- CloudFront and WAF

If CloudFront is being used, the request first reaches CloudFront.

CloudFront can provide:

-   CDN caching
-   Reduced latency
-   TLS termination
-   Edge delivery

WAF can provide security controls such as:

-   IP filtering
-   Rate limiting
-   Managed rules
-   Protection against common web attacks

If the requested content is not available from cache, CloudFront
forwards the request to the origin.

#### Step 4 --- ALB

The request reaches the Application Load Balancer.

The ALB can terminate HTTPS using the appropriate certificate.

It then evaluates listener rules based on:

-   Host
-   Path
-   HTTP headers
-   Other listener conditions

For example:

``` text
pharmeasy.in/       → frontend-service

pharmeasy.in/api/*  → backend-service

admin.pharmeasy.in  → admin-service
```

#### Step 5 --- Kubernetes Ingress

In EKS, the **AWS Load Balancer Controller** can watch Kubernetes
Ingress resources and configure the AWS ALB.

For example:

``` yaml
kind: Ingress
metadata:
  name: frontend-ingress
spec:
  ingressClassName: alb
  rules:
    - host: pharmeasy.in
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: frontend-service
                port:
                  number: 80
```

#### Step 6 --- Kubernetes Service

The ALB forwards the request to the Kubernetes Service.

The Service provides a stable abstraction over the application pods.

Depending on the AWS Load Balancer Controller configuration, the ALB can
target pod IPs directly.

#### Step 7 --- Pod

The request finally reaches one of the healthy frontend pods:

``` text
frontend-service
       |
       +---- Pod 1
       |
       +---- Pod 2
       |
       +---- Pod 3
```

The application container processes the request.

### Health checks

I would also configure:

-   **Readiness probe** → determines whether a pod should receive
    traffic
-   **Liveness probe** → determines whether Kubernetes should restart an
    unhealthy container

So the complete flow is:

``` text
Browser
  ↓
DNS / Route 53
  ↓
CloudFront / WAF
  ↓
ALB
  ↓
Kubernetes Ingress
  ↓
Kubernetes Service
  ↓
Pod
  ↓
Application Container
```

### Important interview point

For outbound access from the pod, such as accessing a private S3 bucket,
I would use **EKS Pod Identity or IRSA with a dedicated ServiceAccount
and IAM role** rather than giving S3 permissions to the worker-node IAM
role.
</details>

<details><summary>6. What is the difference between an Ingress Controller and an Ingress Resource?</summary>

### Answer

An **Ingress Resource** is a Kubernetes API object where we define
HTTP/HTTPS routing rules.

An **Ingress Controller** is the actual component that watches those
rules and implements them.

### Simple analogy

Think of it like this:

``` text
Ingress Resource
       |
       | "What should happen?"
       v
Ingress Controller
       |
       | "I will implement it."
       v
Load Balancer / Proxy
```

### Ingress Resource

It defines rules such as:

``` text
pharmeasy.in/
        ↓
frontend-service

pharmeasy.in/api
        ↓
backend-service

admin.pharmeasy.in
        ↓
admin-service
```

Example:

``` yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: frontend-ingress
spec:
  ingressClassName: alb
  rules:
    - host: pharmeasy.in
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: frontend-service
                port:
                  number: 80
```

### Ingress Controller

The controller watches Kubernetes API resources and implements the
routing.

Examples include:

-   AWS Load Balancer Controller
-   NGINX Ingress Controller
-   HAProxy Ingress Controller

In EKS, the AWS Load Balancer Controller can create and manage an AWS
Application Load Balancer based on the Kubernetes configuration.

### Interview answer

> **Ingress defines the desired HTTP/HTTPS routing rules, while the
> Ingress Controller is the component that watches those rules and
> implements them.**
</details>

<details><summary>7. What do you configure in the AWS Load Balancer Controller? How does it know which Ingress rule to use?</summary>

### Answer

I have worked with the **AWS Load Balancer Controller in EKS**.

The important point is that I don't manually configure the controller to
watch one particular Ingress.

The controller continuously watches Kubernetes resources through the
Kubernetes API server.

### Controller-level configuration

At the controller level, important configuration includes:

-   AWS region
-   EKS cluster name
-   IAM permissions
-   VPC/subnet configuration
-   Controller ServiceAccount
-   AWS credentials/identity
-   IngressClass configuration

The controller needs appropriate AWS permissions to create and manage
resources such as:

-   Application Load Balancers
-   Target Groups
-   Listeners
-   Security Groups
-   Related AWS resources

### How does it know which Ingress to process?

At the application level, the Ingress can specify:

``` yaml
ingressClassName: alb
```

For example:

``` yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: frontend-ingress
spec:
  ingressClassName: alb

  rules:
    - host: pharmeasy.in
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: frontend-service
                port:
                  number: 80
```

The important part is:

``` yaml
ingressClassName: alb
```

This tells Kubernetes that this Ingress is intended for the ALB Ingress
Controller.

The controller watches applicable Ingress resources and reconciles the
desired state into AWS resources.

### Complete flow

``` text
Ingress Resource
       |
       | ingressClassName: alb
       v
AWS Load Balancer Controller
       |
       | Reconciliation
       v
AWS ALB
       |
       v
Listener Rules
       |
       v
Target Group
       |
       v
Kubernetes Pods
```

### Multiple applications

For example:

``` text
pharmeasy.in/
       ↓
frontend-service

pharmeasy.in/api
       ↓
backend-service

admin.pharmeasy.in/
       ↓
admin-service
```

The controller watches all applicable Ingress resources and maintains
the AWS resources according to those definitions.

### Strong interview statement

> I would not say that I manually tell the controller to watch a
> particular Ingress. The controller watches Kubernetes API resources
> matching its configured IngressClass and continuously reconciles the
> desired state.
</details>

<details><summary>8. What is an Ingress Resource?</summary>

### Answer

An **Ingress Resource** is a Kubernetes API object used to define
external HTTP/HTTPS routing rules to Kubernetes Services.

It allows us to configure things such as:

-   Host-based routing
-   Path-based routing
-   TLS configuration
-   Backend Services

For example:

``` text
pharmeasy.in/
       ↓
frontend-service

pharmeasy.in/api/
       ↓
backend-service

admin.pharmeasy.in/
       ↓
admin-service
```

Example:

``` yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: application-ingress
spec:
  ingressClassName: alb
  rules:
    - host: pharmeasy.in
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: frontend-service
                port:
                  number: 80
```

### Important distinction

The Ingress Resource itself does not implement the routing.

It defines:

> **What routing do I want?**

The Ingress Controller implements:

> **How do I make that routing actually work?**

</details>

<details><summary>9. How would you upgrade a Kubernetes cluster from 1.33 to 1.35?</summary>


### Answer

I would **not directly upgrade from 1.33 to 1.35** if the Kubernetes
upgrade policy requires sequential minor-version upgrades.

I would perform:

``` text
1.33
  ↓
1.34
  ↓
1.35
```

The key principle is:

> **Upgrade incrementally, validate at every stage, and maintain a
> recovery plan.**

------------------------------------------------------------------------

## Step 1 --- Understand the cluster

Before making any changes, I would understand:

-   Control plane
-   Worker nodes
-   Node groups
-   Applications
-   Ingress/load balancers
-   CNI
-   CSI drivers
-   Storage
-   Monitoring
-   Autoscaling
-   Admission controllers
-   Operators
-   Critical workloads

------------------------------------------------------------------------

## Step 2 --- Review release notes

I would review the Kubernetes release notes for:

``` text
1.34
1.35
```

I would specifically check:

-   Deprecated APIs
-   Removed APIs
-   Breaking changes
-   API version changes
-   Runtime changes
-   Configuration changes

I would scan:

-   Kubernetes manifests
-   Helm charts
-   Custom resources
-   Operators

for APIs that are no longer supported.

------------------------------------------------------------------------

## Step 3 --- Validate add-ons

I would check compatibility of:

-   CNI
-   CSI drivers
-   AWS Load Balancer Controller
-   CoreDNS
-   kube-proxy
-   Metrics Server
-   Cluster Autoscaler / Karpenter
-   Prometheus
-   Grafana
-   Operators

For EKS, I would specifically verify compatibility with AWS-supported
add-on versions.

------------------------------------------------------------------------

## Step 4 --- Check application readiness

Before upgrading worker nodes, I would check:

-   PodDisruptionBudgets
-   Readiness probes
-   Liveness probes
-   Resource requests
-   Resource limits
-   Replica counts
-   Stateful workloads
-   Storage dependencies

I need to ensure applications can tolerate node draining.

------------------------------------------------------------------------

## Step 5 --- Test in staging

I would first perform:

``` text
Staging:
1.33 → 1.34
```

Then test:

-   Application traffic
-   Deployments
-   DNS
-   Ingress
-   Storage
-   Autoscaling
-   Monitoring
-   Logging

If everything is stable:

``` text
Staging:
1.34 → 1.35
```

Then repeat the validation.

------------------------------------------------------------------------

## Step 6 --- Backup and recovery preparation

Before production, I would ensure we have:

-   Valid control-plane/etcd backup where applicable
-   Application data backups
-   Database recovery strategy
-   Configuration backups
-   Infrastructure-as-Code state and code
-   Recovery/rollback plan

For managed Kubernetes such as EKS, the control plane is managed by AWS,
so I would focus on application state, cluster configuration, manifests,
persistent data, and AWS resource recovery.

------------------------------------------------------------------------

## Step 7 --- Communicate the change

Before production:

-   Define maintenance/change window
-   Communicate impact
-   Define success criteria
-   Assign owners
-   Prepare rollback/recovery steps
-   Ensure monitoring is available

------------------------------------------------------------------------

## Step 8 --- Upgrade production from 1.33 to 1.34

First:

``` text
Control Plane
1.33 → 1.34
```

After verifying that the control plane is healthy, upgrade worker nodes
gradually.

------------------------------------------------------------------------

## Step 9 --- Rolling worker-node upgrade

I would avoid upgrading every node simultaneously.

Instead:

``` text
Node 1
  ↓
Cordon
  ↓
Drain
  ↓
Workloads rescheduled
  ↓
Upgrade / replace node
  ↓
Validate
```

Then proceed with the next node or batch.

The purpose is to maintain application availability.

------------------------------------------------------------------------

## Step 10 --- Validate

I would monitor:

-   Pod status
-   Pod restarts
-   Pending/Failed pods
-   CPU
-   Memory
-   4xx/5xx rates
-   Application latency
-   Ingress health
-   Load balancer health
-   DNS
-   Persistent volumes
-   Cluster events
-   Node conditions
-   CNI health
-   CSI health
-   Control-plane health

------------------------------------------------------------------------

## Step 11 --- Upgrade 1.34 → 1.35

Once 1.34 is stable:

``` text
Control Plane
1.34 → 1.35
```

Then again perform the worker-node upgrade gradually.

------------------------------------------------------------------------

## Step 12 --- Final validation

After reaching 1.35:

-   Run smoke tests
-   Run business-level validation
-   Verify all nodes are healthy
-   Verify all pods are healthy
-   Verify ingress
-   Verify storage
-   Verify autoscaling
-   Verify monitoring
-   Verify alerting
-   Check application error rates
-   Continue monitoring after the change

### Final upgrade flow

``` text
1. Assess cluster
        ↓
2. Check 1.34 / 1.35 compatibility
        ↓
3. Validate add-ons
        ↓
4. Backup / recovery preparation
        ↓
5. Staging: 1.33 → 1.34
        ↓
6. Validate
        ↓
7. Staging: 1.34 → 1.35
        ↓
8. Validate
        ↓
9. Production control plane: 1.33 → 1.34
        ↓
10. Rolling worker-node upgrade
        ↓
11. Validate
        ↓
12. Production control plane: 1.34 → 1.35
        ↓
13. Rolling worker-node upgrade
        ↓
14. Smoke + business validation
        ↓
15. Monitor and close change
```

### EKS-specific checklist

For EKS, I would additionally check:

``` text
AWS Load Balancer Controller
VPC CNI
CoreDNS
kube-proxy
EBS CSI Driver
EFS CSI Driver
Cluster Autoscaler / Karpenter
Metrics Server
Prometheus
Grafana
Operators
```

### Strong interview statement

> The most important thing is that I would not treat a Kubernetes
> upgrade as simply changing the version number. I would first validate
> API compatibility and add-ons, test the upgrade in staging, upgrade
> production incrementally, drain nodes safely, continuously monitor
> workloads, and have a recovery plan before making the production
> change.
</details>
<details><summary>10. What if an application does not support the new cAdvisor/cgroup version, but Kubernetes must be upgraded?</summary>

### Answer

First, I would not simply accept:

> "The application is not compatible."

I would identify the **exact compatibility problem**.

I would determine whether the issue is related to:

-   cAdvisor
-   cgroup v1 vs cgroup v2
-   Container runtime
-   Linux kernel
-   Application dependency
-   Application code
-   Monitoring agent
-   Metrics collection
-   Resource detection

I would reproduce the issue in a staging environment using the target
Kubernetes/platform configuration.

------------------------------------------------------------------------

## Step 1 --- Identify the exact dependency

For example:

``` text
Application
    |
    +-- Container runtime
    |
    +-- cgroups
    |
    +-- Kernel
    |
    +-- cAdvisor / metrics
```

I would determine exactly which layer is incompatible.

------------------------------------------------------------------------

## Step 2 --- Work with developers

If the application genuinely requires a code or dependency change, I
would work with the development team to:

1.  Identify the required change
2.  Implement the fix
3.  Build a new application version
4.  Test it in staging
5.  Validate it against the target Kubernetes version

------------------------------------------------------------------------

## Step 3 --- Temporary compatibility strategy

If Kubernetes must be upgraded immediately but the application cannot be
fixed immediately, I would consider temporarily isolating the legacy
workload.

For example:

``` text
                    Kubernetes Cluster
                           |
             +-------------+-------------+
             |                           |
             v                           v
       New Node Group              Legacy Node Group
             |                           |
       New workloads              Legacy workload
```

I can use Kubernetes scheduling controls such as:

### Taints

Mark the legacy nodes so that only workloads with the appropriate
toleration can run there.

### Tolerations

Allow the legacy workload to run on those nodes.

### Node Affinity

Ensure the legacy workload is scheduled only on the intended node group.

Conceptually:

``` text
Legacy Pod
   |
   +-- Toleration
   |
   +-- Node Affinity
   |
   v
Legacy Node Group
```

------------------------------------------------------------------------

## Step 4 --- Gradual migration

I would then migrate workloads gradually.

For example:

``` text
Legacy workload
       ↓
New compatible version
       ↓
Canary deployment
       ↓
Monitor
       ↓
Increase traffic
       ↓
Full migration
```

I would monitor:

-   Application errors
-   CPU/memory
-   Pod restarts
-   Latency
-   Request success rate
-   Infrastructure metrics
-   Logs

------------------------------------------------------------------------

## Step 5 --- Remove the temporary compatibility setup

The old node configuration should not become permanent technical debt.

I would track it as a temporary exception with:

-   Owner
-   Reason
-   Target migration date
-   Required application fix
-   Validation criteria

### Strong interview answer

> First, I would identify the exact compatibility issue instead of
> treating "not compatible" as sufficient information. I would reproduce
> it in staging and determine whether the issue is cAdvisor, cgroup
> v1/v2, the container runtime, kernel, or an application dependency. If
> a code change is required, I would work with the developers to fix and
> validate it. If the Kubernetes upgrade is mandatory and the
> application cannot be fixed immediately, I would temporarily isolate
> the legacy workload using a separate node group with taints,
> tolerations, and node affinity. Then I would migrate the workload
> gradually using a canary approach, monitor it closely, and maintain a
> rollback/recovery path. The legacy configuration should be treated as
> temporary and have a defined migration deadline.

------------------------------------------------------------------------

# Quick Interview Revision

## AWS

``` text
IAM Policy
    ↓
Identity-based permissions

Resource Policy
    ↓
Resource-based permissions
```

## EKS Pod → S3

``` text
Pod
 ↓
ServiceAccount
 ↓
EKS Pod Identity / IRSA
 ↓
IAM Role
 ↓
Least-privilege IAM Policy
 ↓
Private S3 Bucket
```

## Browser → Kubernetes

``` text
Browser
 ↓
DNS / Route 53
 ↓
CloudFront / WAF
 ↓
ALB
 ↓
Ingress
 ↓
Kubernetes Service
 ↓
Pod
 ↓
Container
```

## Ingress

``` text
Ingress Resource
    =
"What routing do I want?"

Ingress Controller
    =
"How do I implement that routing?"
```

## Kubernetes Upgrade

``` text
1.33
 ↓
1.34
 ↓
1.35
```

Always:

``` text
Assess
 ↓
Compatibility
 ↓
Staging
 ↓
Backup / Recovery
 ↓
Control Plane
 ↓
Rolling Nodes
 ↓
Validate
 ↓
Monitor
```

## Application Compatibility

``` text
Identify exact issue
        ↓
Fix with developers
        ↓
Test in staging
        ↓
Temporary isolation if required
        ↓
Canary migration
        ↓
Monitor
        ↓
Remove legacy setup
```

</details>

Feedback : Failed 
