# Docker Masterclass — Complete YouTube Video Script

## From Zero to Production | Theory + Hands-On | Beginners to Advanced

> **Estimated Video Length:** 8-10 hours (can be split into a series)
> **Format:** Theory explanation → Live hands-on demo → Real-world scenario
> **Target Audience:** Absolute beginners to experienced DevOps engineers

---

## VIDEO INTRO (5 minutes)

### [SCREEN: Animated Docker Logo + Title Card]

**[TALKING HEAD]**

"Hey everyone, welcome to the most comprehensive Docker tutorial you'll ever need. Whether you've never touched a container before or you're already running Docker in production — this video has something for you.

Here's what makes this different — we're not just learning commands. We're going to understand WHY containers exist, HOW they work under the hood, and then build real-world projects that you can put on your resume.

By the end of this masterclass, you'll be able to:

- Understand containers at a kernel level
- Build production-grade Docker images
- Orchestrate multi-container applications
- Debug any Docker issue like a pro
- Implement Docker in CI/CD pipelines
- Secure your containers for production

I've added timestamps in the description — jump to whatever section you need. But if you're a beginner, I highly recommend watching in order. Let's dive in."

### [SCREEN: Table of Contents with timestamps]

```
PART 1: Foundation (Beginners)
  Chapter 1: Why Containers Exist — The Problem They Solve
  Chapter 2: Docker Architecture Deep Dive
  Chapter 3: Installing Docker (All Platforms)
  Chapter 4: Your First Container
  Chapter 5: Docker Images Explained
  Chapter 6: Building Custom Images with Dockerfile
  Chapter 7: Managing Data with Volumes & Bind Mounts

PART 2: Intermediate
  Chapter 8: Docker Networking — Deep Dive
  Chapter 9: Docker Compose — Multi-Container Apps
  Chapter 10: Environment Variables & Configuration
  Chapter 11: Docker Logs, Events & Debugging
  Chapter 12: Docker Registry & Image Management
  Chapter 13: Real Project — Full Stack App Deployment

PART 3: Advanced
  Chapter 14: Multi-Stage Builds & Image Optimization
  Chapter 15: Docker Security — Hardening Containers
  Chapter 16: Docker in CI/CD Pipelines
  Chapter 17: Container Internals — Namespaces & Cgroups
  Chapter 18: Docker Daemon Configuration & Tuning
  Chapter 19: Container Orchestration Overview
  Chapter 20: Production Best Practices & Patterns

BONUS: Troubleshooting Guide + Interview Questions
```

---

# PART 1: FOUNDATION (BEGINNERS)

---

## Chapter 1: Why Containers Exist — The Problem They Solve (20 minutes)

### [SCREEN: "Chapter 1: Why Containers Exist"]

### 1.1 — The "It Works On My Machine" Problem

**[TALKING HEAD]**

"Before we touch Docker, let's understand the problem it solves. Imagine this scenario — you're a developer. You build an app on your laptop. It works perfectly. You send it to your teammate, and it breaks. You deploy it to the server, and it breaks differently.

Why? Because your laptop has Python 3.11, the server has Python 3.9. You have OpenSSL 1.1, the server has OpenSSL 3.0. You're on macOS, the server runs Ubuntu. Different OS, different libraries, different configurations.

This is the 'it works on my machine' problem, and it has been the number one pain point in software development for decades."

### [SCREEN: Diagram showing Dev Laptop → QA Server → Production — with different OS/library versions on each]

```
┌─────────────────────┐    ┌─────────────────────┐    ┌─────────────────────┐
│    DEV LAPTOP       │    │    QA SERVER         │    │    PRODUCTION       │
│                     │    │                      │    │                     │
│  Python 3.11        │    │  Python 3.9          │    │  Python 3.8         │
│  OpenSSL 1.1        │    │  OpenSSL 3.0         │    │  OpenSSL 1.0        │
│  macOS Sonoma       │    │  Ubuntu 22.04        │    │  Amazon Linux 2     │
│  libpq 15           │    │  libpq 14            │    │  libpq 12           │
│  npm 10.2           │    │  npm 9.6             │    │  npm 8.1            │
│                     │    │                      │    │                     │
│   ✅ "Works!"       │    │   ❌ "Breaks!"       │    │   💥 "Breaks         │
│                     │    │                      │    │      differently!"  │
└─────────────────────┘    └──────────────────────┘    └─────────────────────┘
         │                          │                           │
         └──────────────────────────┴───────────────────────────┘
                    Same code, different environments
                     = UNPREDICTABLE BEHAVIOR
```

### 1.2 — How We Solved It Before Docker

**[TALKING HEAD]**

"Before containers, we had a few approaches:

**Approach 1: Virtual Machines**
You package the entire operating system along with your app. A VM includes the full OS kernel, all system libraries, the application — everything. It guarantees consistency.

But VMs are HEAVY. A single VM can be 2-10 GB. Booting takes minutes. Running 10 VMs needs massive hardware. It's like shipping your entire house just to deliver a pizza.

**Approach 2: Configuration Management (Ansible, Puppet, Chef)**
You write scripts to configure servers identically. Great in theory, but configurations drift over time. Server A gets a hotfix that Server B doesn't. After 6 months, no two servers are truly identical."

### [SCREEN: Comparison diagram]

```
Virtual Machine:                    Container:
┌─────────────────┐                ┌─────────────────┐
│   Application   │                │   Application   │
├─────────────────┤                ├─────────────────┤
│   Libraries     │                │   Libraries     │
├─────────────────┤                ├─────────────────┤
│   Guest OS      │                │  (No Guest OS)  │
│   (Full Kernel) │                │                 │
├─────────────────┤                └────────┬────────┘
│   Hypervisor    │                         │
├─────────────────┤                ┌────────▼────────┐
│   Host OS       │                │  Container      │
│                 │                │  Runtime        │
└─────────────────┘                ├─────────────────┤
                                   │   Host OS       │
Size: 2-10 GB                      └─────────────────┘
Boot: Minutes                      Size: 50-500 MB
                                   Boot: Milliseconds
```

### [SCREEN: Evolution Timeline Diagram]

```
The Evolution of Application Deployment:

  1990s              2000s              2010s              2020s
    │                  │                  │                  │
    ▼                  ▼                  ▼                  ▼
┌────────┐       ┌──────────┐      ┌──────────┐      ┌──────────┐
│Bare    │       │ Virtual  │      │Containers│      │Serverless│
│Metal   │       │ Machines │      │ (Docker) │      │ + K8s    │
│        │       │          │      │          │      │          │
│1 App   │       │ Multiple │      │ Many     │      │ Auto-    │
│per     │       │ OS per   │      │ apps per │      │ scaling  │
│server  │       │ server   │      │ OS       │      │ anywhere │
└────────┘       └──────────┘      └──────────┘      └──────────┘
  Slow              Heavy              Fast             Fastest
  Wasteful          Better             Efficient        Pay-per-use
  Weeks             Minutes            Seconds          Milliseconds
```

### 1.3 — What Is a Container, Really?

**[TALKING HEAD]**

"A container is a lightweight, standalone, executable package that includes everything needed to run a piece of software — the code, runtime, system tools, libraries, and settings.

But here's the key insight that most tutorials miss: **a container is NOT a mini VM.** A container is just a regular Linux process that has been isolated using kernel features. It shares the host's kernel. There's no separate OS. That's why containers are so fast and lightweight.

Think of it this way:

- A VM is like a separate apartment with its own plumbing, electricity, and foundation
- A container is like a hotel room — it shares the building's infrastructure but your room is isolated from everyone else's"

### 1.4 — Docker vs Containers

**[TALKING HEAD]**

"One more important distinction — Docker did NOT invent containers. Container technology has existed in Linux since 2008 with LXC (Linux Containers). What Docker did was make containers incredibly easy to use. Docker added:

1. A simple CLI and API
2. A standard image format
3. A public registry (Docker Hub) to share images
4. A build system (Dockerfile)
5. Great developer experience

Today, Docker is the most popular container platform, but alternatives exist — Podman, containerd, CRI-O. The concepts you learn here apply to all of them."

### [SCREEN: Timeline]

```
2000: FreeBSD Jails
2004: Solaris Zones
2006: Google's Process Containers → cgroups
2008: LXC (Linux Containers)
2013: Docker is born (Solomon Hykes, DotCloud)
2014: Kubernetes announced by Google
2015: OCI (Open Container Initiative) formed
2017: containerd donated to CNCF
2019: Podman gains traction
2020: Kubernetes deprecates Docker runtime
2023: Docker Desktop alternatives emerge
```

---

## Chapter 2: Docker Architecture Deep Dive (25 minutes)

### [SCREEN: "Chapter 2: Docker Architecture"]

### 2.1 — Docker's Client-Server Architecture

**[TALKING HEAD]**

"Docker uses a client-server architecture. Understanding this is crucial because it explains a lot of Docker's behavior and how to troubleshoot issues."

### [SCREEN: Architecture Diagram]

```
┌──────────────────────────────────────────────────────────────┐
│                        Docker Client                          │
│  (docker CLI, Docker Desktop, API calls)                      │
│                                                               │
│  docker build    docker pull    docker run    docker ps        │
└──────────────┬───────────────────────────────────────────────┘
               │  REST API (unix:///var/run/docker.sock)
               │  or TCP (tcp://host:2376)
               ▼
┌──────────────────────────────────────────────────────────────┐
│                      Docker Daemon (dockerd)                  │
│                                                               │
│  ┌─────────────┐  ┌──────────────┐  ┌───────────────────┐   │
│  │   Images     │  │  Containers  │  │    Networks        │   │
│  │   Manager    │  │  Manager     │  │    Manager         │   │
│  └──────┬──────┘  └──────┬───────┘  └───────────────────┘   │
│         │                │                                    │
│  ┌──────▼────────────────▼──────────────────────────────┐    │
│  │              containerd                                │    │
│  │  (Container runtime - manages container lifecycle)     │    │
│  │                                                        │    │
│  │  ┌──────────────────────────────────────────────┐     │    │
│  │  │            runc                                │     │    │
│  │  │  (OCI runtime - actually creates containers)   │     │    │
│  │  │  Uses: namespaces, cgroups, seccomp, caps      │     │    │
│  │  └──────────────────────────────────────────────┘     │    │
│  └────────────────────────────────────────────────────────┘    │
└──────────────────────────────────────────────────────────────┘
```

**[TALKING HEAD]**

"Let me break this down:

1. **Docker Client** — This is what you interact with. When you type `docker run`, the client sends this command to the daemon via a REST API.
2. **Docker Daemon (dockerd)** — This is the brain. It manages images, containers, networks, and volumes. It listens on a Unix socket by default (`/var/run/docker.sock`).
3. **containerd** — This is the container runtime. The daemon delegates actual container operations to containerd. It manages the complete container lifecycle — pulling images, creating containers, managing storage.
4. **runc** — This is the low-level OCI runtime that actually creates containers. It talks directly to the Linux kernel to set up namespaces, cgroups, and other isolation features.

Why this layered architecture? Separation of concerns. Docker daemon can be updated without stopping containers. containerd can be used independently (Kubernetes does this). runc can be swapped with other OCI runtimes."

### 2.2 — What Happens When You Run `docker run`

**[TALKING HEAD]**

"Let's trace exactly what happens when you type `docker run nginx`:"

### [SCREEN: Step-by-step flow]

```
Step 1: Docker CLI parses the command
        → Sends POST /containers/create to Docker daemon

Step 2: Docker daemon checks if nginx image exists locally
        → If not, pulls from Docker Hub (registry)

Step 3: Image pull process:
        → Resolves tag (nginx:latest → nginx@sha256:abc...)
        → Downloads image manifest (list of layers)
        → Downloads each layer (parallel)
        → Verifies checksums
        → Stores in local image cache

Step 4: Docker daemon tells containerd to create container
        → containerd creates a container object
        → Sets up a snapshot (filesystem) from image layers
        → Creates container config (OCI spec)

Step 5: containerd starts the container via runc
        → runc creates namespaces (PID, NET, MNT, UTS, IPC, USER)
        → Sets up cgroups (CPU, memory limits)
        → Applies seccomp profile (syscall filtering)
        → Pivots root filesystem
        → Executes the entrypoint process (nginx)

Step 6: Container is running!
        → runc exits (it's just a launcher)
        → containerd-shim takes over as parent process
        → Container process runs as PID 1 inside its namespace
```

### 2.3 — Images vs Containers

**[TALKING HEAD]**

"This is a fundamental concept that trips up beginners. Let me make it crystal clear:

- An **image** is a read-only template. Think of it as a class in object-oriented programming.
- A **container** is a running instance of an image. Think of it as an object.

You can create many containers from one image. Just like you can create many objects from one class.

Images are made of **layers**. Each instruction in a Dockerfile creates a new layer. Layers are cached and shared between images — so if 10 images all use Ubuntu as a base, the Ubuntu layer is stored only once on disk."

### [SCREEN: Layer diagram]

```
Image Layers (Read-Only):              Container:
┌───────────────────────────┐         ┌───────────────────────────┐
│  Layer 4: COPY app.js     │         │  Container Layer (R/W)    │
├───────────────────────────┤         │  (writable thin layer)    │
│  Layer 3: RUN npm install │         ├───────────────────────────┤
├───────────────────────────┤         │  Layer 4: COPY app.js     │
│  Layer 2: RUN apt-get     │         ├───────────────────────────┤
├───────────────────────────┤         │  Layer 3: RUN npm install │
│  Layer 1: Ubuntu base     │         ├───────────────────────────┤
└───────────────────────────┘         │  Layer 2: RUN apt-get     │
                                      ├───────────────────────────┤
                                      │  Layer 1: Ubuntu base     │
                                      └───────────────────────────┘

When a container writes a file, it uses Copy-on-Write (CoW):
→ File from image layer is COPIED to the container's writable layer
→ Modifications happen ONLY in the container layer
→ Original image layer remains UNCHANGED
```

---

## Chapter 3: Installing Docker (15 minutes)

### [SCREEN: "Chapter 3: Installation"]

### 3.1 — Installation on Linux (Ubuntu/Debian)

**[TALKING HEAD]**

"Let me show you the proper way to install Docker on Linux. Do NOT use `apt install docker.io` — that gives you an outdated version from Ubuntu's repos. Always use Docker's official repository."

### [SCREEN: Terminal]

```bash
# ============================================
# Docker Installation on Ubuntu/Debian
# ============================================

# Step 1: Remove old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Step 2: Install prerequisites
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Step 3: Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Step 4: Set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 5: Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io \
    docker-buildx-plugin docker-compose-plugin

# Step 6: Add your user to docker group (avoid sudo)
sudo usermod -aG docker $USER
newgrp docker   # Apply group change without logout

# Step 7: Verify installation
docker --version
docker compose version
docker run hello-world
```

### 3.2 — Installation on macOS

**[TALKING HEAD]**

"On macOS, Docker doesn't run natively because macOS doesn't have the Linux kernel features Docker needs. So Docker Desktop creates a lightweight Linux VM behind the scenes."

### [SCREEN: Terminal]

```bash
# Option 1: Docker Desktop (GUI — free for personal use)
# Download from https://www.docker.com/products/docker-desktop/

# Option 2: Using Homebrew
brew install --cask docker
# Then launch Docker.app from Applications

# Option 3: Colima (Free alternative to Docker Desktop)
brew install colima docker docker-compose
colima start
# This starts a Lima VM with Docker configured

# Verify
docker --version
docker run hello-world
```

### 3.3 — Installation on Windows

### [SCREEN: Terminal]

```powershell
# Prerequisites:
# - Windows 10/11 64-bit (Pro, Enterprise, or Education for Hyper-V)
# - WSL2 enabled (recommended)

# Step 1: Enable WSL2
wsl --install

# Step 2: Download Docker Desktop from docker.com
# During install, select "Use WSL2 based engine"

# Step 3: Verify in PowerShell or WSL terminal
docker --version
docker run hello-world
```

### 3.4 — Post-Installation Verification

### [SCREEN: Terminal]

```bash
# ============================================
# Verify Everything is Working
# ============================================

# Check Docker version (client + server)
docker version

# Check system-wide information
docker info

# Run a test container
docker run hello-world

# Expected output:
# "Hello from Docker!"
# "This message shows that your installation appears to be working correctly."

# Check what's running under the hood
docker system info | head -30

# You should see:
# Server Version: 24.x or 25.x
# Storage Driver: overlay2
# Cgroup Driver: systemd (or cgroupfs)
# Runtime: runc
```

---

## Chapter 4: Your First Container (30 minutes)

### [SCREEN: "Chapter 4: Your First Container"]

### 4.1 — Running Your First Container

**[TALKING HEAD]**

"Alright, let's get hands-on. We'll start with the simplest possible container and build up from there."

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 1: Hello World Container
# ============================================

# Run the hello-world container
docker run hello-world

# What just happened?
# 1. Docker client sent command to daemon
# 2. Daemon didn't find "hello-world" image locally
# 3. Daemon pulled it from Docker Hub
# 4. Daemon created a container from the image
# 5. Container executed and printed the message
# 6. Container exited (process finished)

# Let's see the container (it's stopped now)
docker ps -a
# CONTAINER ID   IMAGE         COMMAND   CREATED         STATUS
# abc123         hello-world   "/hello"  10 seconds ago  Exited (0) 9 seconds ago

# Let's see the image that was downloaded
docker images
# REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
# hello-world   latest    abc123         3 months ago  13.3kB
```

### 4.2 — Interactive Containers

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 2: Interactive Container (Ubuntu)
# ============================================

# Run Ubuntu interactively
docker run -it ubuntu bash
#   -i = interactive (keep STDIN open)
#   -t = allocate a pseudo-TTY (terminal)

# You're now INSIDE the container!
# Notice: the prompt changed to root@<container-id>

# Explore the container
whoami          # root
hostname        # random container ID
cat /etc/os-release   # Ubuntu info
ls /             # standard Linux filesystem

# This is an isolated environment
# It has its own filesystem, processes, network
ps aux          # Only bash is running (PID 1)

# Install something
apt update && apt install -y curl
curl --version

# Exit the container
exit

# The container stopped when bash exited
docker ps -a | head -3

# Key insight: When the main process (PID 1) exits,
# the container stops. The container's lifecycle
# IS the process's lifecycle.
```

### 4.3 — Background Containers (Detached Mode)

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 3: Running Nginx in Background
# ============================================

# Run Nginx web server in detached mode
docker run -d --name my-nginx -p 8080:80 nginx
#   -d = detached (run in background)
#   --name = give it a friendly name
#   -p 8080:80 = map host port 8080 to container port 80

# Check it's running
docker ps
# CONTAINER ID  IMAGE  COMMAND                 STATUS       PORTS
# xyz789        nginx  "/docker-entrypoint.…"  Up 5 secs    0.0.0.0:8080->80/tcp

# Visit http://localhost:8080 in your browser!
# Or use curl:
curl http://localhost:8080

# You should see the Nginx welcome page!

# View container logs
docker logs my-nginx

# Follow logs in real-time (like tail -f)
docker logs -f my-nginx
# Press Ctrl+C to stop following

# Get detailed info about the container
docker inspect my-nginx

# See resource usage (live stats)
docker stats my-nginx
# CONTAINER    CPU %    MEM USAGE / LIMIT    MEM %    NET I/O
# my-nginx     0.00%    7.5MiB / 7.7GiB     0.10%    1.45kB / 0B

# Press Ctrl+C to exit stats
```

### [SCREEN: Container Lifecycle Diagram]

```
Docker Container Lifecycle:

  docker create          docker start           docker stop
       │                      │                      │
       ▼                      ▼                      ▼
  ┌──────────┐          ┌──────────┐          ┌──────────┐
  │ CREATED  │─────────►│ RUNNING  │─────────►│ STOPPED  │
  └──────────┘          └────┬─────┘          └─────┬────┘
                             │                      │
  docker run = create+start  │ docker pause         │ docker start
  (shortcut)                 ▼                      │ (restart)
                        ┌──────────┐                │
                        │ PAUSED   │                │
                        └──────────┘                │
                        docker unpause ──► RUNNING  │
                                                    │
                             docker rm              │
                               │                    │
                               ▼                    │
                        ┌──────────┐  ◄─────────────┘
                        │ REMOVED  │     docker rm
                        └──────────┘

  Key Rule: When PID 1 (main process) exits → container STOPS
            Container lifecycle = Process lifecycle
```

### 4.4 — Essential Container Operations

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 4: Container Lifecycle Operations
# ============================================

# --- EXECUTING COMMANDS IN RUNNING CONTAINER ---

# Open a shell inside running Nginx container
docker exec -it my-nginx bash

# Look around inside
ls /usr/share/nginx/html/   # Nginx web files
cat /etc/nginx/nginx.conf    # Nginx configuration
exit

# Run a single command without entering the container
docker exec my-nginx cat /etc/hostname
docker exec my-nginx nginx -v

# --- STOPPING AND STARTING ---

# Stop the container (sends SIGTERM, then SIGKILL after 10s)
docker stop my-nginx

# Container is stopped but still exists
docker ps -a | grep my-nginx

# Start it again
docker start my-nginx

# Restart (stop + start)
docker restart my-nginx

# --- PAUSING (freeze without stopping) ---
docker pause my-nginx     # Freezes all processes (SIGSTOP)
docker unpause my-nginx   # Resumes

# --- REMOVING ---

# Can't remove a running container
docker rm my-nginx        # Error!

# Force remove (stops then removes)
docker rm -f my-nginx

# Or stop first, then remove
docker stop my-nginx && docker rm my-nginx

# --- CLEANUP ---

# Remove ALL stopped containers
docker container prune

# Remove ALL unused images, containers, networks
docker system prune

# Nuclear option — remove everything including volumes
docker system prune -a --volumes
```

### 4.5 — Port Mapping Deep Dive

**[TALKING HEAD]**

"Port mapping is something beginners struggle with, so let me explain it clearly."

### [SCREEN: Diagram + Terminal]

```
Port Mapping: -p HOST_PORT:CONTAINER_PORT

Your Machine (Host)              Container
┌──────────────────┐            ┌──────────────────┐
│                  │            │                  │
│  localhost:8080 ─┼──────────►─┼─► :80 (nginx)   │
│                  │            │                  │
│  localhost:3000 ─┼──────────►─┼─► :3000 (node)  │
│                  │            │                  │
│  localhost:5432 ─┼──────────►─┼─► :5432 (pg)    │
│                  │            │                  │
└──────────────────┘            └──────────────────┘

Multiple containers can use the same internal port:
  Container A: -p 8081:80 (nginx)
  Container B: -p 8082:80 (nginx)
  Container C: -p 8083:80 (apache)
```

```bash
# ============================================
# LAB 5: Port Mapping Examples
# ============================================

# Map single port
docker run -d -p 8080:80 nginx

# Map multiple ports
docker run -d -p 8080:80 -p 8443:443 nginx

# Map to specific host interface (not all interfaces)
docker run -d -p 127.0.0.1:8080:80 nginx  # Only localhost

# Random host port (Docker picks one)
docker run -d -p 80 nginx
docker port <container-id>   # See what port was assigned

# Map UDP port
docker run -d -p 53:53/udp dns-server

# Expose a range of ports
docker run -d -p 8000-8010:8000-8010 myapp
```

---

## Chapter 5: Docker Images Explained (30 minutes)

### [SCREEN: "Chapter 5: Docker Images"]

### 5.1 — Understanding Image Layers

**[TALKING HEAD]**

"Docker images are the foundation of containers. Let me show you how they really work."

### [SCREEN: Image Layer Sharing Diagram]

```
How Image Layers Are SHARED Across Containers:

Image A (Node app)          Image B (React app)        Image C (Express API)
┌───────────────────┐      ┌───────────────────┐      ┌───────────────────┐
│ Layer 4: COPY app │      │ Layer 4: COPY app │      │ Layer 3: COPY app │
├───────────────────┤      ├───────────────────┤      ├───────────────────┤
│ Layer 3: npm ci   │      │ Layer 3: npm ci   │      │ Layer 2: npm ci   │
├───────────────────┤      ├───────────────────┤      ├───────────────────┤
│ Layer 2: apt-get  │      │ Layer 2: apt-get  │      │                   │
├───────────────────┤      ├───────────────────┤      │   node:20-alpine  │
│ Layer 1: node:20  │      │ Layer 1: node:20  │      │   (different base)│
└────────┬──────────┘      └────────┬──────────┘      └───────────────────┘
         │                          │
         └──────────┬───────────────┘
                    ▼
         ┌───────────────────┐
         │ SHARED on disk!   │   ← Layers 1 & 2 stored ONCE
         │ node:20 base      │      even though 2 images use them
         │ (only 1 copy)     │
         └───────────────────┘

Disk Usage WITHOUT sharing:  3 × 900MB = 2.7 GB
Disk Usage WITH sharing:     900MB + 200MB + 200MB = 1.3 GB  (52% saved!)
```

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 6: Exploring Docker Images
# ============================================

# Pull an image explicitly
docker pull ubuntu:22.04

# See all local images
docker images
# REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
# ubuntu       22.04     abc123         2 weeks ago    77.8MB
# nginx        latest    def456         1 week ago     187MB

# See image history (shows each layer)
docker history ubuntu:22.04
# IMAGE          CREATED       CREATED BY                                      SIZE
# abc123         2 weeks ago   /bin/sh -c #(nop) CMD ["/bin/bash"]             0B
# <missing>      2 weeks ago   /bin/sh -c #(nop) ADD file:xxx in /             77.8MB

# Inspect image for detailed metadata
docker inspect ubuntu:22.04

# See image layers in detail
docker inspect ubuntu:22.04 | jq '.[0].RootFS.Layers'
# Shows SHA256 hashes of each layer

# Key point: Layers are READ-ONLY and SHARED
# If two images both use ubuntu:22.04 as base,
# the ubuntu layers exist only ONCE on disk!

# Check disk usage
docker system df
# TYPE          TOTAL   ACTIVE   SIZE      RECLAIMABLE
# Images        5       2        1.2GB     800MB (65%)
# Containers    3       1        50MB      45MB (90%)
# Volumes       2       1        200MB     100MB (50%)
```

### 5.2 — Image Tags and Naming

**[TALKING HEAD]**

"Understanding image naming is essential. Let me break down the full image reference format."

### [SCREEN: Diagram]

```
Full image reference breakdown:

┌──────────────────────────────────────────────────────────────────────────┐
│                    FULL IMAGE REFERENCE FORMAT                           │
│                                                                          │
│   registry.io  /  namespace  /  repository  :  tag     @  digest        │
│   ──────────     ─────────     ──────────     ───        ──────         │
│   (optional)     (optional)    (required)    (optional)  (optional)     │
│                                                                          │
│   Defaults to    Defaults to   Image name    Defaults    Immutable      │
│   docker.io      library                     to latest   content hash   │
└──────────────────────────────────────────────────────────────────────────┘

Examples:
  nginx                          → docker.io/library/nginx:latest
  nginx:1.25                     → docker.io/library/nginx:1.25
  ubuntu:22.04                   → docker.io/library/ubuntu:22.04
  myuser/myapp:v1.0              → docker.io/myuser/myapp:v1.0
  ghcr.io/owner/image:tag        → GitHub Container Registry
  123456.dkr.ecr.region.amazonaws.com/myapp:v1  → AWS ECR

Tag best practices:
  ✗ latest          — NEVER use in production (mutable, unpredictable)
  ✓ v1.2.3          — Semantic versioning
  ✓ sha-a1b2c3d     — Git commit SHA
  ✓ 2024.01.15      — Date-based
  ✓ v1.2.3-alpine   — Version + variant
```

```bash
# ============================================
# LAB 7: Working with Image Tags
# ============================================

# Pull specific versions
docker pull node:20-alpine
docker pull node:20-slim
docker pull node:20-bookworm

# Compare sizes!
docker images | grep node
# node   20-alpine    ...   180MB    ← Smallest (Alpine Linux)
# node   20-slim      ...   220MB    ← Medium (Debian slim)
# node   20-bookworm  ...   1.1GB   ← Full Debian

# Tag an existing image (doesn't copy — just adds a pointer)
docker tag nginx:latest myregistry/nginx:v1.0

# Image ID is the same — tags are just labels
docker images | grep nginx
```

### [SCREEN: Image Size Comparison Diagram]

```
Node.js Base Image Size Comparison:

node:20-bookworm  ████████████████████████████████████████████████████  1.1 GB
node:20-slim      ████████████████                                      220 MB
node:20-alpine    ██████████████                                        180 MB

Python Base Image Size Comparison:

python:3.12       ████████████████████████████████████████████           1.0 GB
python:3.12-slim  ██████████                                            150 MB
python:3.12-alpine████████                                              55 MB

Rule of Thumb:
  Production  → Use -alpine or -slim (smallest attack surface)
  Development → Use full image (includes debugging tools)
  CI/CD       → Use -slim (good balance)
```

### 5.3 — Pulling from Different Registries

### [SCREEN: Terminal]

```bash
# ============================================
# LAB 8: Working with Registries
# ============================================

# Docker Hub (default)
docker pull nginx
docker pull library/nginx   # Same thing

# GitHub Container Registry
docker pull ghcr.io/actions/runner:latest

# Google Container Registry
docker pull gcr.io/google-containers/busybox

# AWS ECR Public
docker pull public.ecr.aws/nginx/nginx:latest

# Quay.io (Red Hat)
docker pull quay.io/prometheus/prometheus

# Search Docker Hub from CLI
docker search redis
# NAME           DESCRIPTION                    STARS   OFFICIAL
# redis          Redis is an open source...     12000   [OK]
# bitnami/redis  Bitnami Redis Docker Image     250
```

---

## Chapter 6: Building Custom Images with Dockerfile (45 minutes)

### [SCREEN: "Chapter 6: Dockerfile Deep Dive"]

### 6.1 — Dockerfile Basics

**[TALKING HEAD]**

"This is one of the most important chapters. Building good Docker images is a skill that separates beginners from professionals. Let's start from the fundamentals and build up."

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 9: Your First Dockerfile
# ============================================

# Create a project directory
mkdir ~/docker-lab && cd ~/docker-lab

# Create a simple Python app
cat > app.py << 'PYEOF'
from http.server import HTTPServer, SimpleHTTPRequestHandler
import json
import os

class MyHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        response = {
            "message": "Hello from Docker!",
            "hostname": os.uname().nodename,
            "version": "1.0"
        }
        self.wfile.write(json.dumps(response).encode())

server = HTTPServer(('0.0.0.0', 8000), MyHandler)
print("Server running on port 8000...")
server.serve_forever()
PYEOF
```

```dockerfile
# Create the Dockerfile
# Filename: Dockerfile (no extension)

# ---- Dockerfile ----

# FROM: Base image — every Dockerfile starts with this
FROM python:3.12-slim

# LABEL: Metadata about the image
LABEL maintainer="yourname@example.com"
LABEL version="1.0"
LABEL description="My first Docker image"

# WORKDIR: Set working directory inside container
# (creates it if it doesn't exist)
WORKDIR /app

# COPY: Copy files from host to container
COPY app.py .

# EXPOSE: Document which port the app uses
# (doesn't actually publish the port — it's documentation)
EXPOSE 8000

# CMD: Default command when container starts
CMD ["python", "app.py"]
```

```bash
# Build the image
docker build -t my-python-app:v1 .
#   -t = tag the image
#   . = build context (current directory)

# Watch the build output:
# Step 1/7 : FROM python:3.12-slim
#  ---> Using cache (if layer exists)
# Step 2/7 : LABEL maintainer="..."
#  ---> Running in abc123
# ...
# Successfully built xyz789
# Successfully tagged my-python-app:v1

# Run it!
docker run -d -p 8000:8000 --name myapp my-python-app:v1

# Test it
curl http://localhost:8000
# {"message": "Hello from Docker!", "hostname": "abc123", "version": "1.0"}

# Cleanup
docker rm -f myapp
```

### [SCREEN: Dockerfile Build Process Diagram]

```
What happens when you run: docker build -t myapp:v1 .

  Your Machine                            Docker Daemon
  ────────────                            ─────────────
  ┌──────────────┐   1. Send build
  │ Build Context │──────context──────►┌──────────────────────┐
  │ (your files)  │   (tar archive)    │                      │
  │               │                    │  2. Read Dockerfile  │
  │ Dockerfile    │                    │                      │
  │ app.py        │                    │  3. Execute each     │
  │ package.json  │                    │     instruction      │
  │ src/          │                    │     as a layer       │
  │               │                    │                      │
  │ .dockerignore │                    │  FROM ──► base layer │
  │ (excluded     │                    │  RUN  ──► new layer  │
  │  from context)│                    │  COPY ──► new layer  │
  └──────────────┘                    │  CMD  ──► metadata   │
                                       │                      │
                                       │  4. Tag final image  │
                                       │     myapp:v1         │
                                       └──────────────────────┘

  ⚠️ The ENTIRE build context is sent to the daemon!
     Use .dockerignore to exclude unnecessary files.
     Huge node_modules? .git? → EXCLUDE THEM!
```

### 6.2 — Every Dockerfile Instruction Explained

**[TALKING HEAD]**

"Let me walk you through every Dockerfile instruction with examples."

### [SCREEN: Reference + Examples]

```dockerfile
# ============================================
# COMPLETE DOCKERFILE REFERENCE
# ============================================

# ---- FROM ----
# Sets the base image. Always the first instruction.
FROM ubuntu:22.04              # Specific version
FROM python:3.12-slim          # Slim variant
FROM node:20-alpine            # Alpine variant (smallest)
FROM scratch                   # Empty base (for static binaries)

# ---- RUN ----
# Execute commands during image BUILD time.
# Each RUN creates a new layer!

# Shell form (runs in /bin/sh -c)
RUN apt-get update && apt-get install -y curl

# Exec form (no shell processing)
RUN ["apt-get", "install", "-y", "curl"]

# BEST PRACTICE: Chain commands to reduce layers
RUN apt-get update && \
    apt-get install -y \
        curl \
        wget \
        vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ---- COPY ----
# Copy files/directories from build context to image
COPY app.py /app/app.py         # Single file
COPY . /app/                    # Entire directory
COPY --chown=node:node . /app/  # Copy with ownership

# ---- ADD ----
# Like COPY but with extra features (generally prefer COPY)
ADD app.tar.gz /app/            # Auto-extracts archives
ADD https://example.com/file /  # Can download URLs (not recommended)

# ---- WORKDIR ----
# Set working directory for subsequent instructions
WORKDIR /app
# All following RUN, CMD, COPY commands will be relative to /app
# Creates the directory if it doesn't exist

# ---- ENV ----
# Set environment variables
ENV NODE_ENV=production
ENV DATABASE_URL=postgres://localhost/mydb
ENV PATH="/app/bin:${PATH}"

# ---- ARG ----
# Build-time variables (NOT available at runtime)
ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-alpine
ARG BUILD_DATE
LABEL build-date=$BUILD_DATE
# Usage: docker build --build-arg NODE_VERSION=18 .

# ---- EXPOSE ----
# Document which ports the container listens on
EXPOSE 80
EXPOSE 443
EXPOSE 8080/tcp
EXPOSE 53/udp

# ---- CMD ----
# Default command when container starts
# Only ONE CMD per Dockerfile (last one wins)

# Exec form (PREFERRED — no shell processing)
CMD ["python", "app.py"]
CMD ["node", "server.js"]

# Shell form (runs in /bin/sh -c — avoid)
CMD python app.py

# ---- ENTRYPOINT ----
# Like CMD but harder to override
# Used when container should always run as a specific executable

# Exec form
ENTRYPOINT ["python", "app.py"]

# Combined with CMD (CMD provides default arguments)
ENTRYPOINT ["python"]
CMD ["app.py"]
# docker run myimage          → python app.py
# docker run myimage test.py  → python test.py
```

### [SCREEN: CMD vs ENTRYPOINT Diagram]

```
CMD vs ENTRYPOINT — When to Use Which:

┌────────────────────────────────────────────────────────────────────┐
│                        CMD only                                     │
│                                                                     │
│  Dockerfile:  CMD ["python", "app.py"]                             │
│                                                                     │
│  docker run myimage              → python app.py          ✓        │
│  docker run myimage bash         → bash  (CMD replaced!)  ✓        │
│                                                                     │
│  Use when: You want a default that users can easily override       │
└────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────┐
│                     ENTRYPOINT only                                 │
│                                                                     │
│  Dockerfile:  ENTRYPOINT ["python", "app.py"]                      │
│                                                                     │
│  docker run myimage              → python app.py          ✓        │
│  docker run myimage bash         → python app.py bash     ✗ weird  │
│                                                                     │
│  Use when: Container IS the executable (like a CLI tool)           │
└────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────┐
│                  ENTRYPOINT + CMD (BEST PATTERN)                    │
│                                                                     │
│  Dockerfile:  ENTRYPOINT ["python"]                                │
│               CMD ["app.py"]                                        │
│                                                                     │
│  docker run myimage              → python app.py          ✓        │
│  docker run myimage test.py      → python test.py         ✓        │
│                                                                     │
│  Use when: Fixed executable + flexible arguments                   │
└────────────────────────────────────────────────────────────────────┘

# ---- VOLUME ----
# Create a mount point for persistent data
VOLUME /data
VOLUME ["/data", "/logs"]

# ---- USER ----
# Set the user for subsequent instructions and container runtime
RUN groupadd -r appuser && useradd -r -g appuser appuser
USER appuser
# All following commands run as appuser (not root!)

# ---- HEALTHCHECK ----
# Tell Docker how to check if container is healthy
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# ---- STOPSIGNAL ----
# Set the signal to stop the container (default: SIGTERM)
STOPSIGNAL SIGQUIT

# ---- SHELL ----
# Override the default shell
SHELL ["/bin/bash", "-c"]
```

### 6.3 — Practical Dockerfile Examples

### [SCREEN: Terminal — LIVE DEMO]

```dockerfile
# ============================================
# EXAMPLE 1: Node.js Application
# ============================================
FROM node:20-alpine

WORKDIR /app

# Copy package files first (better caching!)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application code
COPY . .

# Don't run as root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s \
    CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

CMD ["node", "server.js"]
```

```dockerfile
# ============================================
# EXAMPLE 2: Java Spring Boot Application
# ============================================
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Create non-root user
RUN addgroup -S spring && adduser -S spring -G spring

# Copy the built JAR (from your CI/CD build step)
COPY --chown=spring:spring target/*.jar app.jar

USER spring

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
```

```dockerfile
# ============================================
# EXAMPLE 3: Go Application (Static Binary)
# ============================================
FROM golang:1.22-alpine AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /myapp

# Final image — FROM SCRATCH (absolutely minimal)
FROM scratch
COPY --from=builder /myapp /myapp
EXPOSE 8080
ENTRYPOINT ["/myapp"]
```

### 6.4 — .dockerignore File

**[TALKING HEAD]**

"Just like `.gitignore`, the `.dockerignore` file tells Docker which files NOT to include in the build context. This is critical for build speed and security."

```bash
# ============================================
# .dockerignore
# ============================================

# Version control
.git
.gitignore

# Dependencies (will be installed in container)
node_modules
vendor

# Build outputs
dist
build

# Docker files
Dockerfile
docker-compose.yml
.dockerignore

# Environment files (NEVER include secrets in images!)
.env
.env.local
.env.production

# IDE files
.vscode
.idea
*.swp
*.swo

# OS files
.DS_Store
Thumbs.db

# Documentation
README.md
docs/
LICENSE

# Tests (usually not needed in production image)
__tests__
*.test.js
*.spec.js
coverage/
```

### 6.5 — Understanding Build Cache

**[TALKING HEAD]**

"Build cache is what makes Docker builds fast. Understanding it is the key to writing efficient Dockerfiles."

### [SCREEN: Diagram + Terminal]

```
Build Cache Rules:
1. Each instruction is checked against the cache
2. If the instruction AND all previous layers haven't changed → use cache
3. Once a cache miss occurs, ALL subsequent layers are rebuilt

Example: Why order matters!

BAD (cache busted on every code change):
┌──────────────────────────────────────────┐
│ FROM node:20-alpine                       │ ✓ Cached
│ WORKDIR /app                              │ ✓ Cached
│ COPY . .                    ← code changed│ ✗ MISS!
│ RUN npm install             ← rebuilt!    │ ✗ Rebuilt (3 min)
│ CMD ["node", "server.js"]   ← rebuilt!    │ ✗ Rebuilt
└──────────────────────────────────────────┘

GOOD (dependencies cached separately):
┌──────────────────────────────────────────┐
│ FROM node:20-alpine                       │ ✓ Cached
│ WORKDIR /app                              │ ✓ Cached
│ COPY package*.json ./       ← unchanged   │ ✓ Cached
│ RUN npm install             ← unchanged!  │ ✓ Cached (saves 3 min!)
│ COPY . .                    ← code changed│ ✗ MISS
│ CMD ["node", "server.js"]   ← rebuilt     │ ✗ Rebuilt
└──────────────────────────────────────────┘
```

```bash
# ============================================
# LAB 10: Build Cache Demonstration
# ============================================

mkdir cache-demo && cd cache-demo

# Create package.json
cat > package.json << 'EOF'
{
  "name": "cache-demo",
  "version": "1.0.0",
  "dependencies": {
    "express": "^4.18.0"
  }
}
EOF

# Create app
cat > server.js << 'EOF'
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Hello v1'));
app.listen(3000);
EOF

# Create optimized Dockerfile
cat > Dockerfile << 'EOF'
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["node", "server.js"]
EOF

# First build (nothing cached)
docker build -t cache-demo:v1 .
# All steps run fresh

# Change the app code
sed -i '' 's/Hello v1/Hello v2/' server.js

# Second build (dependencies cached!)
docker build -t cache-demo:v2 .
# Steps 1-4 use cache! Only COPY . . is rebuilt
# This is MUCH faster!

# Force rebuild without cache
docker build --no-cache -t cache-demo:v3 .
```

---

## Chapter 7: Managing Data — Volumes & Bind Mounts (30 minutes)

### [SCREEN: "Chapter 7: Volumes & Data"]

### 7.1 — The Data Problem

**[TALKING HEAD]**

"By default, all data inside a container is ephemeral. When the container is removed, the data is gone. This is by design — containers should be disposable. But what about databases? Log files? User uploads? We need persistent storage."

### [SCREEN: Diagram]

```
Docker Storage Options:

1. VOLUMES (Docker-managed)
   ┌──────────┐     ┌─────────────────────────┐
   │Container │◄───►│ /var/lib/docker/volumes/ │
   │ /data    │     │ my-volume/_data/          │
   └──────────┘     └─────────────────────────┘
   ✓ Best for persistent data
   ✓ Managed by Docker
   ✓ Works on all platforms
   ✓ Can be shared between containers

2. BIND MOUNTS (Host path)
   ┌──────────┐     ┌─────────────────────────┐
   │Container │◄───►│ /home/user/myproject/    │
   │ /app     │     │ (your actual files)      │
   └──────────┘     └─────────────────────────┘
   ✓ Best for development
   ✓ Direct access to host files
   ✗ Platform-dependent paths
   ✗ Less portable

3. TMPFS MOUNTS (RAM only)
   ┌──────────┐     ┌─────────────────────────┐
   │Container │◄───►│ RAM (temporary memory)   │
   │ /tmp     │     │ Lost when container stops │
   └──────────┘     └─────────────────────────┘
   ✓ Best for sensitive data
   ✓ Very fast
   ✗ Not persistent
```

### 7.2 — Docker Volumes

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 11: Docker Volumes
# ============================================

# --- CREATE AND USE VOLUMES ---

# Create a named volume
docker volume create my-data

# List volumes
docker volume ls
# DRIVER    VOLUME NAME
# local     my-data

# Inspect a volume
docker volume inspect my-data
# Shows mount point: /var/lib/docker/volumes/my-data/_data

# Run a container with the volume
docker run -d \
    --name db \
    -v my-data:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=secret \
    postgres:16

# Write some data
docker exec -it db psql -U postgres -c "CREATE TABLE test (id int, name text);"
docker exec -it db psql -U postgres -c "INSERT INTO test VALUES (1, 'Docker');"
docker exec -it db psql -U postgres -c "SELECT * FROM test;"
#  id |  name
# ----+--------
#   1 | Docker

# Remove the container
docker rm -f db

# Data survives! Create a new container with same volume
docker run -d \
    --name db2 \
    -v my-data:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=secret \
    postgres:16

# Check — data is still there!
docker exec -it db2 psql -U postgres -c "SELECT * FROM test;"
#  id |  name
# ----+--------
#   1 | Docker

# --- VOLUME MANAGEMENT ---

# Remove unused volumes
docker volume prune

# Remove specific volume (must not be in use)
docker rm -f db2
docker volume rm my-data

# --- ANONYMOUS VOLUMES ---
# Created automatically when you don't name them
docker run -d -v /data nginx
# Creates a volume with a random hash name
docker volume ls
# DRIVER    VOLUME NAME
# local     a1b2c3d4e5f6...  (anonymous — hard to manage!)
```

### 7.3 — Bind Mounts (Development Workflow)

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 12: Bind Mounts for Development
# ============================================

mkdir ~/dev-project && cd ~/dev-project

# Create a simple web page
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<body>
    <h1>Hello from Docker!</h1>
    <p>Edit this file and refresh — changes appear instantly!</p>
</body>
</html>
EOF

# Mount current directory into the container
docker run -d \
    --name dev-server \
    -p 8080:80 \
    -v $(pwd):/usr/share/nginx/html:ro \
    nginx
#   $(pwd) = current directory on host
#   /usr/share/nginx/html = Nginx's web root
#   :ro = read-only (container can't modify host files)

# Visit http://localhost:8080
curl http://localhost:8080

# Now edit index.html on your HOST machine
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<body>
    <h1>Updated Live!</h1>
    <p>No rebuild needed — bind mount reflects changes instantly</p>
</body>
</html>
EOF

# Refresh browser — changes appear immediately!
curl http://localhost:8080

# This is the DEVELOPMENT workflow:
# - Code on your host machine (with your IDE)
# - App runs in container (consistent environment)
# - Changes reflect instantly (no rebuild)

# --- USING --mount SYNTAX (more explicit) ---
docker run -d \
    --name dev-server2 \
    -p 8081:80 \
    --mount type=bind,source=$(pwd),target=/usr/share/nginx/html,readonly \
    nginx

# Cleanup
docker rm -f dev-server dev-server2
```

### 7.4 — Practical: Development Environment with Bind Mounts

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 13: Full Node.js Dev Environment
# ============================================

mkdir ~/node-dev && cd ~/node-dev

cat > package.json << 'EOF'
{
  "name": "docker-dev-demo",
  "version": "1.0.0",
  "scripts": {
    "dev": "node --watch server.js"
  },
  "dependencies": {
    "express": "^4.18.0"
  }
}
EOF

cat > server.js << 'EOF'
const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.json({ message: 'Hello from containerized Node.js!', time: new Date() });
});

app.get('/health', (req, res) => {
    res.json({ status: 'healthy' });
});

app.listen(3000, () => console.log('Server running on port 3000'));
EOF

cat > Dockerfile.dev << 'EOF'
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
# Don't COPY code — it comes from bind mount!
CMD ["npm", "run", "dev"]
EOF

# Build dev image
docker build -f Dockerfile.dev -t node-dev .

# Run with bind mount — your code syncs automatically
docker run -d \
    --name node-app \
    -p 3000:3000 \
    -v $(pwd):/app \
    -v /app/node_modules \
    node-dev
#   -v $(pwd):/app           → Mount source code
#   -v /app/node_modules     → Anonymous volume for node_modules
#                               (prevents host node_modules from overriding)

# Test
curl http://localhost:3000

# Edit server.js → Node.js auto-reloads via --watch!

# Cleanup
docker rm -f node-app
```

---

# PART 2: INTERMEDIATE

---

## Chapter 8: Docker Networking — Deep Dive (40 minutes)

### [SCREEN: "Chapter 8: Docker Networking"]

### 8.1 — Network Types

**[TALKING HEAD]**

"Docker networking is one of the most important topics and the one people understand the least. Let me explain every network type."

### [SCREEN: Diagram]

```
Docker Network Drivers:

1. BRIDGE (default)
   ┌─────────────────────────────────────────┐
   │ Host Machine                             │
   │                                          │
   │  ┌──────────┐  ┌──────────┐             │
   │  │Container │  │Container │             │
   │  │  App A   │  │  App B   │             │
   │  │ 172.17.  │  │ 172.17.  │             │
   │  │  0.2     │  │  0.3     │             │
   │  └────┬─────┘  └────┬─────┘             │
   │       │              │                   │
   │  ┌────▼──────────────▼─────┐             │
   │  │   docker0 bridge        │             │
   │  │   172.17.0.1            │             │
   │  └────────────┬────────────┘             │
   │               │ NAT                      │
   │  ┌────────────▼────────────┐             │
   │  │   Host Network (eth0)   │             │
   └──┴─────────────────────────┴─────────────┘

2. HOST
   Container shares host's network directly
   No port mapping needed — app on port 80 IS host's port 80
   Best performance (no NAT overhead)

3. NONE
   Container has NO network access
   Complete isolation — for security-sensitive workloads

4. OVERLAY
   Multi-host networking (Docker Swarm / Kubernetes)
   Containers on different hosts can communicate

5. MACVLAN
   Container gets its own MAC address
   Appears as physical device on the network

Network Driver Comparison:
┌────────────┬──────────────┬─────────────┬───────────────┬────────────────┐
│ Driver     │ Isolation    │ Performance │ Port Mapping  │ Use Case       │
├────────────┼──────────────┼─────────────┼───────────────┼────────────────┤
│ bridge     │ ✓ Isolated   │ Good        │ Required (-p) │ Default, most  │
│ (default)  │   per network│             │               │ applications   │
├────────────┼──────────────┼─────────────┼───────────────┼────────────────┤
│ host       │ ✗ Shares     │ Best (no    │ Not needed    │ Performance-   │
│            │   host stack │  NAT)       │ (direct)      │ critical apps  │
├────────────┼──────────────┼─────────────┼───────────────┼────────────────┤
│ none       │ ✓✓ Complete  │ N/A         │ N/A           │ Security,      │
│            │    no network│             │               │ batch jobs     │
├────────────┼──────────────┼─────────────┼───────────────┼────────────────┤
│ overlay    │ ✓ Cross-host │ Moderate    │ Via ingress   │ Swarm/K8s      │
│            │   isolation  │ (VXLAN)     │               │ multi-host     │
├────────────┼──────────────┼─────────────┼───────────────┼────────────────┤
│ macvlan    │ ✓ Own MAC    │ Good        │ Not needed    │ Legacy apps,   │
│            │   on LAN     │             │ (own IP)      │ DHCP needed    │
└────────────┴──────────────┴─────────────┴───────────────┴────────────────┘
```

### 8.2 — Bridge Networks in Practice

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 14: Bridge Network Deep Dive
# ============================================

# --- DEFAULT BRIDGE NETWORK ---

# See existing networks
docker network ls
# NETWORK ID     NAME      DRIVER    SCOPE
# abc123         bridge    bridge    local   ← Default
# def456         host      host      local
# ghi789         none      null      local

# Run two containers on default bridge
docker run -d --name container-a nginx
docker run -d --name container-b nginx

# Inspect the default bridge network
docker network inspect bridge
# Shows both containers with their IPs

# Containers CAN reach each other by IP
docker exec container-a ping -c 2 172.17.0.3

# But CANNOT reach each other by name on default bridge!
docker exec container-a ping -c 2 container-b
# ping: bad address 'container-b'  ← FAILS!

# This is why you should ALWAYS use custom networks

# Cleanup
docker rm -f container-a container-b

# --- CUSTOM BRIDGE NETWORK (RECOMMENDED) ---

# Create a custom bridge network
docker network create my-network

# Or with specific options
docker network create \
    --driver bridge \
    --subnet 10.0.0.0/24 \
    --gateway 10.0.0.1 \
    --ip-range 10.0.0.128/25 \
    my-custom-net

# Run containers on custom network
docker run -d --name web --network my-network nginx
docker run -d --name api --network my-network nginx

# NOW DNS resolution works!
docker exec web ping -c 2 api
# PING api (10.0.0.3): 56 data bytes
# 64 bytes from 10.0.0.3  ← SUCCESS!

# This is Docker's embedded DNS server in action
# It resolves container names to their IPs automatically

# --- CONNECTING TO MULTIPLE NETWORKS ---

docker network create frontend
docker network create backend

docker run -d --name web-server --network frontend nginx
docker run -d --name app-server --network frontend nginx
docker run -d --name db-server --network backend postgres:16 -e POSTGRES_PASSWORD=secret

# Connect app-server to BOTH networks
docker network connect backend app-server

# Now:
# web-server → can reach app-server (frontend network) ✓
# app-server → can reach db-server (backend network) ✓
# web-server → CANNOT reach db-server (different network) ✗
# This is network isolation!

# Disconnect from a network
docker network disconnect frontend app-server

# Cleanup
docker rm -f web-server app-server db-server
docker network rm frontend backend my-network my-custom-net
```

### 8.3 — Host and None Networks

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 15: Host and None Networks
# ============================================

# --- HOST NETWORK ---
# Container shares the host's network stack directly
# No NAT, no port mapping — maximum network performance

docker run -d --name web-host --network host nginx

# Nginx is now directly on host's port 80!
# No -p flag needed
curl http://localhost:80

# Best for: Network-intensive apps, monitoring tools
# Caveat: Only ONE container can use a given port
# Only works on Linux (not macOS/Windows Docker Desktop)

docker rm -f web-host

# --- NONE NETWORK ---
# Complete network isolation

docker run -d --name isolated --network none alpine sleep 3600

# No network interfaces (except loopback)
docker exec isolated ip addr
# Only shows 'lo' (127.0.0.1)

docker exec isolated ping 8.8.8.8
# Network is unreachable!

# Use case: Security-sensitive processing
# (crypto operations, secret generation, etc.)

docker rm -f isolated
```

### 8.4 — DNS and Service Discovery

**[TALKING HEAD]**

"Docker's built-in DNS is powerful and often underutilized. Let me show you how it works."

### [SCREEN: Diagram + Terminal]

```
Docker DNS Resolution (Custom Bridge Networks):

┌──────────────────────────────────────────────┐
│           Docker Embedded DNS Server          │
│              127.0.0.11:53                    │
│                                               │
│  web → 172.18.0.2    api → 172.18.0.3        │
│  db  → 172.18.0.4    cache → 172.18.0.5      │
└──────────────────────────────────────────────┘

Container resolves "api" → DNS server returns 172.18.0.3

With Network Aliases (multiple names for one container):
  docker run --network my-net --network-alias db \
             --network-alias database \
             --network-alias postgres \
             postgres:16

  Now "db", "database", and "postgres" ALL resolve to this container!
```

```bash
# ============================================
# LAB 16: DNS and Aliases
# ============================================

docker network create app-net

# Run with network alias
docker run -d \
    --name postgres-primary \
    --network app-net \
    --network-alias db \
    --network-alias database \
    -e POSTGRES_PASSWORD=secret \
    postgres:16

# All these names resolve to the same container
docker run --rm --network app-net alpine nslookup db
docker run --rm --network app-net alpine nslookup database
docker run --rm --network app-net alpine nslookup postgres-primary

# Load balancing with aliases!
# Multiple containers with the same alias
docker run -d --name web1 --network app-net --network-alias web nginx
docker run -d --name web2 --network app-net --network-alias web nginx
docker run -d --name web3 --network app-net --network-alias web nginx

# DNS returns all IPs (round-robin)
docker run --rm --network app-net alpine nslookup web
# Non-authoritative answer:
# Name: web  Address: 172.18.0.3
# Name: web  Address: 172.18.0.4
# Name: web  Address: 172.18.0.5

# Cleanup
docker rm -f postgres-primary web1 web2 web3
docker network rm app-net
```

---

## Chapter 9: Docker Compose — Multi-Container Apps (50 minutes)

### [SCREEN: "Chapter 9: Docker Compose"]

### 9.1 — Why Docker Compose?

**[TALKING HEAD]**

"Real applications aren't a single container. You have a web server, an API, a database, a cache, a message queue — all running together. Managing all of these with individual `docker run` commands is painful. Docker Compose lets you define your entire application stack in a single YAML file."

### [SCREEN: Before vs After]

```
WITHOUT Docker Compose (manual):
$ docker network create myapp
$ docker volume create pgdata
$ docker run -d --name db --network myapp -v pgdata:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=secret postgres:16
$ docker run -d --name redis --network myapp redis:7-alpine
$ docker run -d --name api --network myapp -p 4000:4000 \
    -e DATABASE_URL=postgres://... -e REDIS_URL=redis://redis:6379 myapi:latest
$ docker run -d --name web --network myapp -p 3000:3000 myfrontend:latest

# To stop: 4 docker stop commands
# To remove: 4 docker rm commands + network + volume
# To update: rebuild, stop, remove, re-run... 🤯

WITH Docker Compose:
$ docker compose up -d     # Start everything
$ docker compose down       # Stop everything
$ docker compose up -d --build  # Rebuild and restart
```

### [SCREEN: Compose Service Dependency Diagram]

```
Docker Compose — Service Startup Order (depends_on):

  docker compose up
         │
         ▼
  ┌──────────┐
  │    db    │ ◄── Starts FIRST (no dependencies)
  │ postgres │     Waits until: service_healthy (pg_isready passes)
  └────┬─────┘
       │ healthy ✓
       ▼
  ┌──────────┐     ┌──────────┐
  │  cache   │     │    api   │ ◄── Starts AFTER db is healthy
  │  redis   │     │  node.js │     AND cache is started
  └────┬─────┘     └────┬─────┘
       │ started ✓      │ healthy ✓
       │                ▼
       │           ┌──────────┐
       └──────────►│   web    │ ◄── Starts LAST
                   │  react   │     AFTER api is healthy
                   └──────────┘

  ⚠️ depends_on with condition: service_healthy
     waits for the health check to pass!
     Without condition, it only waits for container start (not ready).
```

### 9.2 — Compose File Structure

### [SCREEN: Terminal — LIVE DEMO]

```yaml
# ============================================
# docker-compose.yml — Full Reference
# ============================================

# Version is no longer required (modern Compose)
# But you can add it for compatibility:
# version: "3.8"

services:
  # --- WEB APPLICATION ---
  web:
    build:
      context: ./frontend
      dockerfile: Dockerfile
      args:
        NODE_ENV: production
    image: myapp-web:latest        # Tag the built image
    container_name: myapp-web      # Custom container name
    ports:
      - "3000:3000"                # host:container
    environment:
      - API_URL=http://api:4000    # Use service name as hostname!
    depends_on:
      api:
        condition: service_healthy  # Wait for API to be healthy
    restart: unless-stopped
    networks:
      - frontend

  # --- API SERVER ---
  api:
    build: ./backend               # Short form (context only)
    ports:
      - "4000:4000"
    environment:
      - DATABASE_URL=postgres://user:pass@db:5432/myapp
      - REDIS_URL=redis://cache:6379
    env_file:
      - .env                       # Load from file
    depends_on:
      db:
        condition: service_healthy
      cache:
        condition: service_started
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:4000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
    restart: unless-stopped
    networks:
      - frontend
      - backend
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M

  # --- DATABASE ---
  db:
    image: postgres:16-alpine
    volumes:
      - pgdata:/var/lib/postgresql/data
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql  # Init script
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user -d myapp"]
      interval: 10s
      timeout: 5s
      retries: 5
    ports:
      - "5432:5432"               # Expose for local dev tools
    restart: unless-stopped
    networks:
      - backend

  # --- REDIS CACHE ---
  cache:
    image: redis:7-alpine
    command: redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru
    volumes:
      - redisdata:/data
    ports:
      - "6379:6379"
    restart: unless-stopped
    networks:
      - backend

# --- VOLUMES ---
volumes:
  pgdata:
    driver: local
  redisdata:
    driver: local

# --- NETWORKS ---
networks:
  frontend:
    driver: bridge
  backend:
    driver: bridge
    internal: true                 # No external access!
```

### 9.3 — Compose Commands Masterclass

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 17: Docker Compose Commands
# ============================================

# Let's build a real project!
mkdir ~/compose-project && cd ~/compose-project

# Create a simple backend
mkdir backend && cat > backend/server.js << 'JSEOF'
const express = require('express');
const { Pool } = require('pg');
const redis = require('redis');

const app = express();
const pool = new Pool({ connectionString: process.env.DATABASE_URL });
const redisClient = redis.createClient({ url: process.env.REDIS_URL });

app.get('/health', (req, res) => res.json({ status: 'healthy' }));

app.get('/api/visits', async (req, res) => {
    await redisClient.connect().catch(() => {});
    const visits = await redisClient.incr('visits');
    res.json({ visits, message: 'Hello from Dockerized API!' });
});

app.listen(4000, () => console.log('API running on :4000'));
JSEOF

cat > backend/package.json << 'EOF'
{
  "name": "api",
  "dependencies": {
    "express": "^4.18.0",
    "pg": "^8.11.0",
    "redis": "^4.6.0"
  }
}
EOF

cat > backend/Dockerfile << 'EOF'
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 4000
CMD ["node", "server.js"]
EOF

# Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
services:
  api:
    build: ./backend
    ports:
      - "4000:4000"
    environment:
      - DATABASE_URL=postgres://user:pass@db:5432/myapp
      - REDIS_URL=redis://cache:6379
    depends_on:
      - db
      - cache
    restart: unless-stopped

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    volumes:
      - pgdata:/var/lib/postgresql/data

  cache:
    image: redis:7-alpine

volumes:
  pgdata:
EOF

# --- ESSENTIAL COMMANDS ---

# Start everything (build + create + start)
docker compose up -d
#   -d = detached mode

# See running services
docker compose ps
# NAME                  STATUS      PORTS
# compose-project-api   Running     0.0.0.0:4000->4000/tcp
# compose-project-db    Running     5432/tcp
# compose-project-cache Running     6379/tcp

# View logs
docker compose logs           # All services
docker compose logs api       # Specific service
docker compose logs -f api    # Follow logs

# Test it!
curl http://localhost:4000/api/visits

# --- LIFECYCLE COMMANDS ---

# Stop services (containers still exist)
docker compose stop

# Start stopped services
docker compose start

# Restart services
docker compose restart
docker compose restart api    # Single service

# Stop and REMOVE containers, networks
docker compose down

# Stop and remove EVERYTHING including volumes
docker compose down -v

# --- BUILD COMMANDS ---

# Rebuild images
docker compose build

# Rebuild and restart
docker compose up -d --build

# Rebuild without cache
docker compose build --no-cache

# Rebuild single service
docker compose build api

# --- SCALING ---

# Run multiple instances of a service
docker compose up -d --scale api=3
# Creates 3 API containers (api-1, api-2, api-3)
# Note: Remove the 'ports' mapping or use port ranges
# to avoid port conflicts

# --- EXEC AND RUN ---

# Execute command in running service
docker compose exec db psql -U user -d myapp

# Run a one-off command (creates temporary container)
docker compose run --rm api npm test

# --- USEFUL FLAGS ---

# Use a different compose file
docker compose -f docker-compose.prod.yml up -d

# Use multiple compose files (merged)
docker compose -f docker-compose.yml -f docker-compose.override.yml up -d

# Set project name
docker compose -p myproject up -d

# Show the final merged config
docker compose config
```

### 9.4 — Compose Profiles and Overrides

**[TALKING HEAD]**

"In real projects, you'll have different configurations for development and production. Compose has elegant solutions for this."

```yaml
# ============================================
# docker-compose.yml (base)
# ============================================
services:
  api:
    build: ./backend
    ports:
      - "4000:4000"
    environment:
      - NODE_ENV=production
    restart: unless-stopped

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

```yaml
# ============================================
# docker-compose.override.yml (auto-loaded in dev!)
# ============================================
services:
  api:
    build:
      context: ./backend
      dockerfile: Dockerfile.dev
    volumes:
      - ./backend:/app          # Bind mount for hot reload
      - /app/node_modules
    environment:
      - NODE_ENV=development
      - DEBUG=true

  db:
    ports:
      - "5432:5432"             # Expose DB port in dev

  # Dev-only services
  adminer:
    image: adminer
    ports:
      - "8080:8080"             # Database GUI
```

```yaml
# ============================================
# docker-compose.prod.yml
# ============================================
services:
  api:
    image: myregistry/api:${VERSION:-latest}
    deploy:
      replicas: 3
      resources:
        limits:
          cpus: '1.0'
          memory: 1G

  db:
    volumes:
      - pgdata:/var/lib/postgresql/data
    # No port exposure in production!
```

```yaml
# ============================================
# Compose Profiles (selective startup)
# ============================================
services:
  api:
    build: ./backend
    ports:
      - "4000:4000"

  db:
    image: postgres:16-alpine

  # Only start with: docker compose --profile debug up
  debug-tools:
    image: nicolaka/netshoot
    profiles:
      - debug
    network_mode: "service:api"

  # Only start with: docker compose --profile monitoring up
  prometheus:
    image: prom/prometheus
    profiles:
      - monitoring
    ports:
      - "9090:9090"

  grafana:
    image: grafana/grafana
    profiles:
      - monitoring
    ports:
      - "3001:3000"
```

```bash
# Usage:
docker compose up -d                           # api + db only
docker compose --profile debug up -d           # api + db + debug-tools
docker compose --profile monitoring up -d      # api + db + prometheus + grafana
docker compose --profile debug --profile monitoring up -d  # everything
```

---

## Chapter 10: Environment Variables & Configuration (20 minutes)

### [SCREEN: "Chapter 10: Configuration"]

### 10.1 — All the Ways to Pass Configuration

**[TALKING HEAD]**

"There are multiple ways to pass configuration to containers. Let me show you all of them and when to use each."

### [SCREEN: Environment Variable Precedence Diagram]

```
Environment Variable Precedence (highest to lowest):

  ┌─────────────────────────────────────────────────┐
  │  1. docker run -e MY_VAR=value                  │  ← HIGHEST priority
  │     (runtime flag — always wins)                 │     Overrides everything
  ├─────────────────────────────────────────────────┤
  │  2. docker run --env-file .env                  │  ← Runtime file
  │     (loaded at container start)                  │
  ├─────────────────────────────────────────────────┤
  │  3. Compose environment: section                │  ← Compose inline
  │     (in docker-compose.yml)                      │
  ├─────────────────────────────────────────────────┤
  │  4. Compose env_file: section                   │  ← Compose file
  │     (in docker-compose.yml)                      │
  ├─────────────────────────────────────────────────┤
  │  5. Dockerfile ENV instruction                  │  ← LOWEST priority
  │     (baked into image at build time)             │     Default fallback
  └─────────────────────────────────────────────────┘

  Secrets Flow (NEVER use env vars for secrets in production!):

  ┌──────────┐    ┌──────────────┐    ┌─────────────────────────┐
  │ Vault /  │───►│ Docker       │───►│ Container reads file    │
  │ AWS SSM  │    │ Secrets /    │    │ /run/secrets/db_pass    │
  │ / KMS    │    │ mounted file │    │ (not in env, not in ps) │
  └──────────┘    └──────────────┘    └─────────────────────────┘
```

```bash
# ============================================
# LAB 18: Environment Variables
# ============================================

# --- METHOD 1: -e flag ---
docker run -e MY_VAR=hello -e DB_HOST=localhost alpine env

# --- METHOD 2: --env-file ---
cat > .env << 'EOF'
DATABASE_URL=postgres://user:pass@db:5432/myapp
REDIS_URL=redis://cache:6379
SECRET_KEY=my-secret-key-123
LOG_LEVEL=info
EOF

docker run --env-file .env alpine env

# --- METHOD 3: In Dockerfile (baked into image) ---
# ENV NODE_ENV=production
# Use for defaults, NOT secrets!

# --- METHOD 4: Docker Compose ---
# See previous chapter for all compose env options

# --- METHOD 5: Docker secrets (Swarm mode) ---
echo "supersecretpassword" | docker secret create db_password -
# Mounted as file at /run/secrets/db_password inside container
```

### 10.2 — Configuration Best Practices

### [SCREEN: Comparison Table]

```
Method              Use For                    Secrets?   Persists in Image?
─────────────────────────────────────────────────────────────────────────────
Dockerfile ENV      Defaults, non-sensitive    ✗ NO       ✓ YES (visible!)
docker run -e       Runtime config             ✓ OK       ✗ NO
--env-file          Multiple variables         ✓ OK       ✗ NO
Compose env         Development config         ✓ OK       ✗ NO
Docker secrets      Production secrets         ✓ BEST     ✗ NO
Build ARG           Build-time only            ✗ NO       ✓ YES (in layers!)

GOLDEN RULES:
1. NEVER put secrets in Dockerfile ENV or ARG
2. NEVER commit .env files to git
3. Use --env-file for local development
4. Use secrets management (Vault, AWS SSM) for production
5. Always provide sensible defaults in code
```

```bash
# ============================================
# LAB 19: Config Patterns
# ============================================

# Pattern 1: Default with override
cat > Dockerfile << 'EOF'
FROM node:20-alpine
WORKDIR /app
COPY . .
ENV PORT=3000
ENV LOG_LEVEL=info
CMD ["node", "server.js"]
EOF
# Override at runtime:
docker run -e PORT=8080 -e LOG_LEVEL=debug myapp

# Pattern 2: Config files via bind mount
docker run -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro nginx

# Pattern 3: Config files via volume
docker run -v config-vol:/etc/myapp myapp

# Pattern 4: Variable substitution in Compose
# .env file:
#   APP_PORT=3000
#   DB_VERSION=16

# docker-compose.yml:
#   ports: "${APP_PORT}:3000"
#   image: "postgres:${DB_VERSION}-alpine"
```

---

## Chapter 11: Docker Logs, Events & Debugging (30 minutes)

### [SCREEN: "Chapter 11: Debugging"]

### 11.1 — Docker Logging

**[TALKING HEAD]**

"When something goes wrong — and it will — you need to know how to debug containers. Let me teach you a systematic debugging approach."

### [SCREEN: Logging Architecture Diagram]

```
Docker Logging Architecture:

  Container stdout/stderr
         │
         ▼
  ┌──────────────────┐
  │  Logging Driver   │ ◄── Configured per-container or globally in daemon.json
  └────────┬─────────┘
           │
     ┌─────┴──────┬──────────────┬──────────────┬────────────────┐
     ▼            ▼              ▼              ▼                ▼
┌─────────┐ ┌─────────┐  ┌──────────┐  ┌──────────┐    ┌────────────┐
│json-file│ │ syslog  │  │ fluentd  │  │ awslogs  │    │  journald  │
│(default)│ │         │  │          │  │          │    │            │
│         │ │ Local   │  │ Forward  │  │ AWS      │    │ systemd    │
│ On-disk │ │ syslog  │  │ to ELK/  │  │CloudWatch│    │ journal    │
│  JSON   │ │ server  │  │ Splunk   │  │          │    │            │
└────┬────┘ └─────────┘  └──────────┘  └──────────┘    └────────────┘
     │
     ▼
  /var/lib/docker/containers/<id>/<id>-json.log
  ⚠️ Without max-size limit, this file grows FOREVER!
     Always set: --log-opt max-size=10m --log-opt max-file=3
```

### [SCREEN: Debugging Decision Tree]

```
Container Debugging — Systematic Approach:

  Container issue?
         │
         ├── Is it RUNNING? ──► docker ps -a
         │         │
         │    NO ──┤── Check logs ──► docker logs <container>
         │         │── Check state ──► docker inspect <c> | jq '.[0].State'
         │         └── Check events ──► docker events --filter container=<c>
         │
         │   YES ──┤── SLOW? ──► docker stats (CPU/Memory/IO)
         │         │── ERRORS? ──► docker logs -f --tail 100 <c>
         │         │── CAN'T CONNECT? ──► docker exec <c> curl localhost:<port>
         │         └── FILESYSTEM? ──► docker diff <c>  (A=Added C=Changed D=Deleted)
         │
         └── Need to get INSIDE?
              ├── Running container ──► docker exec -it <c> /bin/sh
              ├── Crashed container ──► docker cp <c>:/var/log ./logs
              └── Network debug ──► docker run -it --network container:<c> nicolaka/netshoot
```

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 20: Logging Deep Dive
# ============================================

# Run a container that generates logs
docker run -d --name logtest nginx

# --- VIEWING LOGS ---

# All logs
docker logs logtest

# Last 100 lines
docker logs --tail 100 logtest

# Since a specific time
docker logs --since 2024-01-01T00:00:00 logtest
docker logs --since 30m logtest    # Last 30 minutes

# Follow (real-time)
docker logs -f logtest

# With timestamps
docker logs -t logtest

# Combine: last 50 lines with timestamps, then follow
docker logs -f -t --tail 50 logtest

# --- LOGGING DRIVERS ---
# Docker supports multiple log backends

# Check current logging driver
docker info | grep "Logging Driver"

# Run with specific driver
docker run -d \
    --log-driver json-file \
    --log-opt max-size=10m \
    --log-opt max-file=3 \
    nginx

# Available drivers:
# json-file (default) — stored on disk as JSON
# syslog — sends to syslog
# journald — sends to systemd journal
# fluentd — sends to Fluentd
# awslogs — sends to AWS CloudWatch
# gcplogs — sends to Google Cloud Logging
# none — no logs

# --- WHERE ARE LOGS STORED? ---
# Default json-file location:
# /var/lib/docker/containers/<container-id>/<container-id>-json.log

# Check log file size
docker inspect --format='{{.LogPath}}' logtest

docker rm -f logtest
```

### 11.2 — Debugging Containers

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 21: Debugging Toolkit
# ============================================

# --- INSPECT EVERYTHING ---

# Full container info (JSON)
docker inspect <container>

# Specific fields with Go templates
docker inspect --format='{{.State.Status}}' <container>
docker inspect --format='{{.NetworkSettings.IPAddress}}' <container>
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container>
docker inspect --format='{{.State.ExitCode}}' <container>
docker inspect --format='{{json .Config.Env}}' <container>

# --- PROCESS INSPECTION ---

# See processes running in a container
docker top <container>

# Real-time resource usage
docker stats
docker stats <container>

# --- EXAMINING A CRASHED CONTAINER ---

# Container keeps crashing? Check its logs and state
docker logs <crashed-container>
docker inspect <crashed-container> | jq '.[0].State'
# Shows: Status, ExitCode, Error, StartedAt, FinishedAt, OOMKilled

# Copy files out of a stopped container
docker cp <container>:/var/log/app.log ./app.log

# --- NETWORK DEBUGGING ---

# Check container's network
docker exec <container> ip addr
docker exec <container> cat /etc/resolv.conf
docker exec <container> cat /etc/hosts

# Test connectivity
docker exec <container> ping other-container
docker exec <container> curl http://api:4000/health
docker exec <container> nslookup db

# Use netshoot for advanced network debugging
docker run -it --network container:<target> nicolaka/netshoot
# Now you have tcpdump, nmap, curl, dig, etc.!

# --- FILESYSTEM DEBUGGING ---

# See what changed in a container's filesystem
docker diff <container>
# A = Added, C = Changed, D = Deleted

# Export entire container filesystem
docker export <container> > filesystem.tar

# --- EVENTS ---
# Watch Docker events in real-time (all containers)
docker events
docker events --filter container=myapp
docker events --filter event=die
docker events --filter event=oom

# --- COMMON ISSUES AND FIXES ---

# Container exits immediately
# → Check: Is there a foreground process?
# → Fix: Make sure CMD/ENTRYPOINT runs in foreground

# Container OOM killed
docker inspect --format='{{.State.OOMKilled}}' <container>
# → Fix: Increase memory limit or optimize app

# Port already in use
# Error: bind: address already in use
# → Fix: lsof -i :8080 to find who's using it

# Permission denied
# → Fix: Check USER in Dockerfile, volume permissions

# DNS resolution fails
# → Fix: Use custom bridge network (not default bridge)
```

### 11.3 — Health Checks

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 22: Health Checks
# ============================================

# Run with health check
docker run -d \
    --name healthy-app \
    --health-cmd="curl -f http://localhost:80/ || exit 1" \
    --health-interval=10s \
    --health-timeout=5s \
    --health-retries=3 \
    --health-start-period=30s \
    nginx

# Watch health status
docker ps
# STATUS: Up 5s (health: starting)
# ... wait ...
# STATUS: Up 35s (healthy)

# Health check in Dockerfile
cat > Dockerfile << 'EOF'
FROM nginx:alpine
HEALTHCHECK --interval=10s --timeout=5s --retries=3 \
    CMD curl -f http://localhost:80/ || exit 1
EOF
```

### [SCREEN: Health Check Lifecycle Diagram]

```
Health Check State Machine:

  Container starts
       │
       ▼
  ┌──────────┐   start_period (grace period)
  │ starting │──────────────────────────────────┐
  └────┬─────┘                                  │
       │ start_period expires                   │ health check runs
       ▼                                        │ but failures don't count
  ┌──────────┐  ◄── health check passes ──┐     │
  │ healthy  │                             │     │
  └────┬─────┘                             │     │
       │ health check fails                │     │
       ▼                                   │     │
  ┌──────────┐   retries not exceeded      │     │
  │ failing  │──────────────────────────────┘     │
  └────┬─────┘                                   │
       │ consecutive failures ≥ retries          │
       ▼                                         │
  ┌───────────┐                                  │
  │ unhealthy │ ◄────────────────────────────────┘
  └───────────┘   (if failures during start_period exceed retries)

  Timeline Example (interval=10s, retries=3, start_period=30s):

  0s        10s       20s       30s       40s       50s       60s
  │──start_period──────│─────────│─────────│─────────│─────────│
  start   check(ok)  check(ok)  check(✓)  check(✓)  check(✗)  check(✗)
                                healthy!             failing   failing
                                                               │
                                                     3 fails = unhealthy
```

```bash

# Check health details
docker inspect --format='{{json .State.Health}}' healthy-app | jq

# Health statuses:
# starting — within start_period, still initializing
# healthy  — health check passes
# unhealthy — consecutive failures exceed retries

docker rm -f healthy-app
```

---

## Chapter 12: Docker Registry & Image Management (25 minutes)

### [SCREEN: "Chapter 12: Registry"]

### [SCREEN: Registry Ecosystem Diagram]

```
Docker Registry Ecosystem — Push & Pull Flow:

  Developer Machine                     Registry (stores images)
  ──────────────────                    ────────────────────────

  ┌──────────────┐     docker push      ┌─────────────────────────────┐
  │              │ ──────────────────►  │                             │
  │  Local Image │                      │   ┌─── Docker Hub          │
  │  myapp:v1    │                      │   │    (docker.io)         │
  │              │     docker pull      │   ├─── GitHub GHCR         │
  │              │ ◄──────────────────  │   │    (ghcr.io)           │
  └──────────────┘                      │   ├─── AWS ECR             │
                                        │   │    (*.dkr.ecr.*.com)   │
  Authentication:                       │   ├─── Google Artifact     │
  ┌──────────────┐                      │   │    (*.pkg.dev)         │
  │docker login  │                      │   ├─── Azure ACR           │
  │              │                      │   │    (*.azurecr.io)      │
  │ Stores creds │                      │   └─── Self-Hosted         │
  │ in ~/.docker/│                      │        (localhost:5000)    │
  │ config.json  │                      │                             │
  └──────────────┘                      └─────────────────────────────┘

  CI/CD Pipeline Flow:

  ┌──────┐    ┌───────┐    ┌────────┐    ┌──────────┐    ┌──────────┐
  │ Code │───►│ Build │───►│  Tag   │───►│   Push   │───►│  Deploy  │
  │ Push │    │ Image │    │ v1.2.3 │    │ to ECR/  │    │  pulls   │
  │      │    │       │    │ + sha  │    │ GHCR     │    │  from    │
  └──────┘    └───────┘    └────────┘    └──────────┘    │  registry│
                                                          └──────────┘
```

### 12.1 — Docker Hub

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 23: Working with Docker Hub
# ============================================

# Login to Docker Hub
docker login
# Enter username and password

# Tag your image for Docker Hub
# Format: docker.io/USERNAME/IMAGE:TAG
docker tag my-python-app:v1 yourusername/my-python-app:v1
docker tag my-python-app:v1 yourusername/my-python-app:latest

# Push to Docker Hub
docker push yourusername/my-python-app:v1
docker push yourusername/my-python-app:latest

# Pull from Docker Hub (anyone can do this for public images)
docker pull yourusername/my-python-app:v1

# --- AUTOMATED BUILDS ---
# Connect your GitHub repo to Docker Hub
# Every push to main → automatic image build and push
# Configure at hub.docker.com → Repository → Builds
```

### 12.2 — Private Registries

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 24: Private Registry Options
# ============================================

# --- OPTION 1: Self-Hosted Registry ---
docker run -d \
    -p 5000:5000 \
    --name registry \
    --restart unless-stopped \
    -v registry-data:/var/lib/registry \
    registry:2

# Push to local registry
docker tag my-python-app:v1 localhost:5000/my-python-app:v1
docker push localhost:5000/my-python-app:v1

# Pull from local registry
docker pull localhost:5000/my-python-app:v1

# List images in registry
curl http://localhost:5000/v2/_catalog
curl http://localhost:5000/v2/my-python-app/tags/list

# --- OPTION 2: AWS ECR ---
# Login
aws ecr get-login-password --region us-east-1 | \
    docker login --username AWS --password-stdin \
    123456789.dkr.ecr.us-east-1.amazonaws.com

# Create repository
aws ecr create-repository --repository-name myapp

# Tag and push
docker tag myapp:v1 123456789.dkr.ecr.us-east-1.amazonaws.com/myapp:v1
docker push 123456789.dkr.ecr.us-east-1.amazonaws.com/myapp:v1

# --- OPTION 3: GitHub Container Registry ---
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin

docker tag myapp:v1 ghcr.io/username/myapp:v1
docker push ghcr.io/username/myapp:v1

# --- OPTION 4: Google Artifact Registry ---
gcloud auth configure-docker us-docker.pkg.dev

docker tag myapp:v1 us-docker.pkg.dev/project-id/repo/myapp:v1
docker push us-docker.pkg.dev/project-id/repo/myapp:v1
```

### 12.3 — Image Management Best Practices

```bash
# ============================================
# LAB 25: Image Cleanup & Management
# ============================================

# See disk usage
docker system df
docker system df -v    # Verbose (per-image)

# Remove dangling images (untagged)
docker image prune

# Remove ALL unused images
docker image prune -a

# Remove images older than 24h
docker image prune -a --filter "until=24h"

# Full cleanup (careful!)
docker system prune -a --volumes

# Save image to tar (for offline transfer)
docker save -o myapp.tar myapp:v1

# Load image from tar
docker load -i myapp.tar

# Image scanning for vulnerabilities
docker scout cves myapp:v1        # Docker Scout
# Or use: trivy image myapp:v1    # Trivy (free)
```

---

## Chapter 13: Real Project — Full Stack App (40 minutes)

### [SCREEN: "Chapter 13: Real Project"]

**[TALKING HEAD]**

"Let's build a complete full-stack application from scratch. We'll containerize a React frontend, Node.js API, PostgreSQL database, and Redis cache — and tie it all together with Docker Compose. This is what you'll actually do at work."

### [SCREEN: Architecture Diagram]

```
┌─────────────────────────────────────────────────────────┐
│                                                          │
│  Browser ──► :3000 React (Nginx) ──► :4000 Node API     │
│                                          │       │       │
│                                    :5432 DB   :6379 Redis│
│                                                          │
└─────────────────────────────────────────────────────────┘
```

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 26: Full Stack Docker Project
# ============================================

mkdir ~/fullstack-docker && cd ~/fullstack-docker

# === BACKEND (Node.js + Express) ===
mkdir -p backend

cat > backend/package.json << 'EOF'
{
  "name": "fullstack-api",
  "version": "1.0.0",
  "scripts": {
    "start": "node server.js",
    "dev": "node --watch server.js"
  },
  "dependencies": {
    "express": "^4.18.0",
    "pg": "^8.11.0",
    "redis": "^4.6.0",
    "cors": "^2.8.5"
  }
}
EOF

cat > backend/server.js << 'JSEOF'
const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');
const redis = require('redis');

const app = express();
app.use(cors());
app.use(express.json());

// Database connection
const pool = new Pool({
    connectionString: process.env.DATABASE_URL
});

// Redis connection
const redisClient = redis.createClient({ url: process.env.REDIS_URL });
redisClient.connect().catch(console.error);

// Initialize database
async function initDB() {
    await pool.query(`
        CREATE TABLE IF NOT EXISTS todos (
            id SERIAL PRIMARY KEY,
            title TEXT NOT NULL,
            completed BOOLEAN DEFAULT false,
            created_at TIMESTAMP DEFAULT NOW()
        )
    `);
    console.log('Database initialized');
}
initDB();

// Routes
app.get('/health', (req, res) => res.json({ status: 'healthy' }));

app.get('/api/todos', async (req, res) => {
    // Try cache first
    const cached = await redisClient.get('todos').catch(() => null);
    if (cached) {
        return res.json({ source: 'cache', data: JSON.parse(cached) });
    }

    const result = await pool.query('SELECT * FROM todos ORDER BY created_at DESC');
    await redisClient.setEx('todos', 60, JSON.stringify(result.rows));
    res.json({ source: 'database', data: result.rows });
});

app.post('/api/todos', async (req, res) => {
    const { title } = req.body;
    const result = await pool.query(
        'INSERT INTO todos (title) VALUES ($1) RETURNING *', [title]
    );
    await redisClient.del('todos');  // Invalidate cache
    res.status(201).json(result.rows[0]);
});

app.delete('/api/todos/:id', async (req, res) => {
    await pool.query('DELETE FROM todos WHERE id = $1', [req.params.id]);
    await redisClient.del('todos');
    res.json({ deleted: true });
});

app.get('/api/stats', async (req, res) => {
    const total = await pool.query('SELECT COUNT(*) FROM todos');
    const completed = await pool.query('SELECT COUNT(*) FROM todos WHERE completed = true');
    const visits = await redisClient.incr('page_visits');
    res.json({
        totalTodos: parseInt(total.rows[0].count),
        completedTodos: parseInt(completed.rows[0].count),
        pageVisits: visits
    });
});

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log(`API running on port ${PORT}`));
JSEOF

cat > backend/Dockerfile << 'EOF'
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
EXPOSE 4000
HEALTHCHECK --interval=30s --timeout=5s \
    CMD wget --no-verbose --tries=1 --spider http://localhost:4000/health || exit 1
CMD ["node", "server.js"]
EOF

cat > backend/.dockerignore << 'EOF'
node_modules
npm-debug.log
Dockerfile
.dockerignore
.git
.env
EOF

# === FRONTEND (Simple HTML served by Nginx) ===
mkdir -p frontend

cat > frontend/index.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docker Full Stack Demo</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 0 20px; }
        h1 { color: #0db7ed; }
        input { padding: 10px; width: 70%; border: 1px solid #ddd; border-radius: 4px; }
        button { padding: 10px 20px; background: #0db7ed; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .todo { display: flex; justify-content: space-between; padding: 10px; margin: 5px 0; background: #f5f5f5; border-radius: 4px; }
        .stats { background: #e8f4f8; padding: 15px; border-radius: 8px; margin: 20px 0; }
        .delete-btn { background: #ff4444; padding: 5px 10px; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .source { font-size: 12px; color: #888; }
    </style>
</head>
<body>
    <h1>🐳 Docker Full Stack Demo</h1>
    <div class="stats" id="stats">Loading stats...</div>
    <div>
        <input type="text" id="todoInput" placeholder="Add a new todo...">
        <button onclick="addTodo()">Add</button>
    </div>
    <div id="todoList"></div>
    <p class="source" id="source"></p>

    <script>
        const API = '/api';

        async function loadTodos() {
            const res = await fetch(`${API}/todos`);
            const json = await res.json();
            document.getElementById('source').textContent = `Data source: ${json.source}`;
            const list = document.getElementById('todoList');
            list.innerHTML = json.data.map(t => `
                <div class="todo">
                    <span>${t.title}</span>
                    <button class="delete-btn" onclick="deleteTodo(${t.id})">Delete</button>
                </div>
            `).join('');
        }

        async function addTodo() {
            const input = document.getElementById('todoInput');
            if (!input.value.trim()) return;
            await fetch(`${API}/todos`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ title: input.value })
            });
            input.value = '';
            loadTodos();
            loadStats();
        }

        async function deleteTodo(id) {
            await fetch(`${API}/todos/${id}`, { method: 'DELETE' });
            loadTodos();
            loadStats();
        }

        async function loadStats() {
            const res = await fetch(`${API}/stats`);
            const stats = await res.json();
            document.getElementById('stats').innerHTML = `
                <strong>Stats:</strong> ${stats.totalTodos} todos |
                ${stats.completedTodos} completed |
                ${stats.pageVisits} page visits
            `;
        }

        loadTodos();
        loadStats();
    </script>
</body>
</html>
HTMLEOF

cat > frontend/nginx.conf << 'EOF'
server {
    listen 80;
    root /usr/share/nginx/html;
    index index.html;

    # Serve frontend
    location / {
        try_files $uri $uri/ /index.html;
    }

    # Proxy API requests to backend
    location /api/ {
        proxy_pass http://api:4000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
EOF

cat > frontend/Dockerfile << 'EOF'
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s \
    CMD curl -f http://localhost:80/ || exit 1
EOF

# === DOCKER COMPOSE (ties everything together) ===

cat > docker-compose.yml << 'EOF'
services:
  frontend:
    build: ./frontend
    ports:
      - "3000:80"
    depends_on:
      api:
        condition: service_healthy
    restart: unless-stopped
    networks:
      - frontend-net

  api:
    build: ./backend
    environment:
      - DATABASE_URL=postgres://appuser:secretpass@db:5432/tododb
      - REDIS_URL=redis://cache:6379
      - PORT=4000
    depends_on:
      db:
        condition: service_healthy
      cache:
        condition: service_started
    healthcheck:
      test: ["CMD", "wget", "--no-verbose", "--tries=1", "--spider", "http://localhost:4000/health"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 30s
    restart: unless-stopped
    networks:
      - frontend-net
      - backend-net

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: tododb
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: secretpass
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U appuser -d tododb"]
      interval: 10s
      timeout: 5s
      retries: 5
    restart: unless-stopped
    networks:
      - backend-net

  cache:
    image: redis:7-alpine
    command: redis-server --maxmemory 128mb --maxmemory-policy allkeys-lru
    volumes:
      - redisdata:/data
    restart: unless-stopped
    networks:
      - backend-net

volumes:
  pgdata:
  redisdata:

networks:
  frontend-net:
  backend-net:
    internal: true   # No external access to backend network
EOF

# === LAUNCH THE ENTIRE STACK ===

echo "🚀 Building and starting..."
docker compose up -d --build

echo "⏳ Waiting for services to be healthy..."
docker compose ps

echo ""
echo "✅ Visit http://localhost:3000"
echo ""
echo "Test the API directly:"
echo "  curl http://localhost:3000/api/todos"
echo "  curl -X POST http://localhost:3000/api/todos -H 'Content-Type: application/json' -d '{\"title\":\"Learn Docker\"}'"
echo "  curl http://localhost:3000/api/stats"
```

---

# PART 3: ADVANCED

---

## Chapter 14: Multi-Stage Builds & Image Optimization (35 minutes)

### [SCREEN: "Chapter 14: Multi-Stage Builds"]

### 14.1 — Why Multi-Stage Builds?

**[TALKING HEAD]**

"This is one of the most important advanced Docker topics. Multi-stage builds let you use multiple FROM statements in a single Dockerfile. Each FROM starts a new 'stage'. You can selectively copy artifacts from one stage to another, leaving behind everything you don't need.

### [SCREEN: Multi-Stage Build Flow Diagram]

```
Multi-Stage Build — How It Works:

  Dockerfile with 3 stages:

  ┌─── Stage 1: "deps" ───────────────────────────────┐
  │  FROM node:20-alpine AS deps                       │
  │  COPY package*.json ./                             │
  │  RUN npm ci                                        │   THROWN AWAY
  │                                                     │   after build
  │  Contains: Node.js + npm + ALL dependencies        │
  │  Size: ~400 MB                                     │
  └────────────────────┬───────────────────────────────┘
                       │ COPY --from=deps /app/node_modules
                       ▼
  ┌─── Stage 2: "build" ──────────────────────────────┐
  │  FROM node:20-alpine AS build                      │
  │  COPY --from=deps /app/node_modules ./             │
  │  COPY . .                                          │   THROWN AWAY
  │  RUN npm run build                                 │   after build
  │                                                     │
  │  Contains: Source + deps + built output            │
  │  Size: ~600 MB                                     │
  └────────────────────┬───────────────────────────────┘
                       │ COPY --from=build /app/dist
                       ▼
  ┌─── Stage 3: "production" (FINAL) ─────────────────┐
  │  FROM nginx:alpine                                  │
  │  COPY --from=build /app/dist /usr/share/nginx/html │   KEPT!
  │                                                     │   This is your
  │  Contains: Nginx + static files ONLY               │   final image
  │  Size: ~25 MB                                      │
  └─────────────────────────────────────────────────────┘

  Result: 600 MB of build tools NEVER enter your production image!
```

Why does this matter? Because smaller images mean:

- Faster pulls and deployments
- Smaller attack surface (fewer vulnerabilities)
- Less storage costs
- Faster container startup"

### [SCREEN: Comparison]

```
Without Multi-Stage:
┌─────────────────────────────────────────┐
│ Final Image: 1.2 GB                      │
│                                          │
│ ✓ Node.js runtime                        │
│ ✓ Application code                       │
│ ✗ npm/yarn (not needed in prod)          │
│ ✗ Build tools (gcc, make, python)        │
│ ✗ Dev dependencies                       │
│ ✗ Source maps                            │
│ ✗ Test files                             │
│ ✗ Documentation                          │
└─────────────────────────────────────────┘

With Multi-Stage:
┌─────────────────────────────────────────┐
│ Build Stage (thrown away):               │
│ Node.js + npm + all dependencies         │
│ → produces: /app/dist/ (built files)     │
└──────────────┬──────────────────────────┘
               │ COPY --from=build
               ▼
┌─────────────────────────────────────────┐
│ Final Image: 25 MB                       │
│                                          │
│ ✓ Nginx (just serves static files)       │
│ ✓ Built HTML/CSS/JS files                │
│ Nothing else!                            │
└─────────────────────────────────────────┘
```

### 14.2 — Multi-Stage Build Examples

### [SCREEN: Terminal — LIVE DEMO]

```dockerfile
# ============================================
# EXAMPLE 1: React Frontend (1.2GB → 25MB)
# ============================================

# Stage 1: Build
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
# Output: /app/dist/ (static files)

# Stage 2: Production
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# Final image: ONLY nginx + static files ≈ 25MB
```

```dockerfile
# ============================================
# EXAMPLE 2: Go Application (800MB → 7MB)
# ============================================

# Stage 1: Build
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
# Build static binary (no external dependencies)
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -ldflags='-w -s' -o /app/server .

# Stage 2: Minimal runtime
FROM scratch
# Copy CA certificates (for HTTPS calls)
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
# Copy the binary
COPY --from=builder /app/server /server
EXPOSE 8080
ENTRYPOINT ["/server"]

# Final image: JUST the binary ≈ 7MB (from scratch = empty!)
```

```dockerfile
# ============================================
# EXAMPLE 3: Java Spring Boot (600MB → 200MB)
# ============================================

# Stage 1: Build with Maven
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline   # Cache dependencies
COPY src ./src
RUN mvn package -DskipTests

# Stage 2: Extract Spring Boot layers (for better caching)
FROM eclipse-temurin:17-jre-alpine AS layers
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
RUN java -Djarmode=layertools -jar app.jar extract

# Stage 3: Final image with layers
FROM eclipse-temurin:17-jre-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring
WORKDIR /app
COPY --from=layers /app/dependencies/ ./
COPY --from=layers /app/spring-boot-loader/ ./
COPY --from=layers /app/snapshot-dependencies/ ./
COPY --from=layers /app/application/ ./
EXPOSE 8080
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]
```

```dockerfile
# ============================================
# EXAMPLE 4: Python with Virtual Environment
# ============================================

# Stage 1: Build dependencies
FROM python:3.12-slim AS builder
RUN pip install --no-cache-dir virtualenv
RUN virtualenv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Production
FROM python:3.12-slim
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
WORKDIR /app
COPY . .
RUN adduser --system --group appuser
USER appuser
EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:create_app()"]
```

### 14.3 — Image Optimization Techniques

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 27: Image Size Optimization
# ============================================

# --- TECHNIQUE 1: Choose the right base image ---
# Compare sizes:
docker pull node:20           # ~1.1GB (full Debian)
docker pull node:20-slim      # ~220MB (Debian slim)
docker pull node:20-alpine    # ~180MB (Alpine Linux)

# Alpine is smallest, but some packages may not work
# Slim is a good middle ground

# --- TECHNIQUE 2: Minimize layers ---

# BAD: Each RUN creates a layer
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get clean

# GOOD: Single layer, clean up in same layer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# --- TECHNIQUE 3: Use .dockerignore ---
# Prevents unnecessary files from entering build context

# --- TECHNIQUE 4: Order matters for caching ---
# Least-changing → Most-changing
COPY package*.json ./    # Changes rarely
RUN npm ci               # Cached if package.json unchanged
COPY . .                 # Changes often

# --- TECHNIQUE 5: Don't install dev dependencies ---
RUN npm ci --only=production
# or
RUN pip install --no-cache-dir -r requirements.txt

# --- TECHNIQUE 6: Use docker buildx for compression ---
docker buildx build --output type=image,compression=zstd .

# --- ANALYZE IMAGE SIZE ---

# See layer sizes
docker history myapp:latest

# Use dive to explore layers interactively
# Install: https://github.com/wagoodman/dive
dive myapp:latest
```

### [SCREEN: Before/After Table]

```
Image Optimization Results:

Application          Before          After           Savings
──────────────────────────────────────────────────────────────
React Frontend       1.2 GB          25 MB           98%
Go Microservice      800 MB          7 MB            99%
Node.js API          1.1 GB          180 MB          84%
Java Spring Boot     600 MB          200 MB          67%
Python Flask         900 MB          150 MB          83%
```

---

## Chapter 15: Docker Security — Hardening Containers (40 minutes)

### [SCREEN: "Chapter 15: Docker Security"]

### 15.1 — Container Security Model

**[TALKING HEAD]**

"Security is not optional. If you're running containers in production, you MUST understand security. Containers are not as isolated as VMs — they share the host kernel. A container escape is a real threat. Let me teach you how to harden your containers."

### [SCREEN: Container vs VM Isolation Diagram]

```
Why Container Security Matters — Shared Kernel Risk:

  Virtual Machines (Strong Isolation):
  ┌───────────┐  ┌───────────┐  ┌───────────┐
  │ App + OS  │  │ App + OS  │  │ App + OS  │   Each VM has its
  │ Kernel A  │  │ Kernel B  │  │ Kernel C  │   OWN kernel
  └─────┬─────┘  └─────┬─────┘  └─────┬─────┘
        └───────────────┼───────────────┘
                   Hypervisor                    VM escape = very hard
                   Host Kernel

  Containers (Shared Kernel — weaker boundary):
  ┌───────────┐  ┌───────────┐  ┌───────────┐
  │   App A   │  │   App B   │  │   App C   │   All containers share
  └─────┬─────┘  └─────┬─────┘  └─────┬─────┘   the SAME kernel
        └───────────────┼───────────────┘
              ┌─────────▼─────────┐
              │  Shared Host      │              Container escape =
              │  Linux Kernel     │              possible if misconfigured!
              └───────────────────┘

  ⚠️ If a container runs as ROOT with ALL capabilities
     and host mounts → it can compromise the host!

  Defense in Depth:
  ┌─────────────────────────────────────────────────────────┐
  │  Layer 1: Non-root user (USER in Dockerfile)            │
  │  Layer 2: Drop capabilities (--cap-drop=ALL)            │
  │  Layer 3: Read-only filesystem (--read-only)            │
  │  Layer 4: Seccomp profile (block dangerous syscalls)    │
  │  Layer 5: AppArmor/SELinux (mandatory access control)   │
  │  Layer 6: User namespaces (root inside ≠ root outside) │
  │  Layer 7: Resource limits (prevent DoS)                 │
  └─────────────────────────────────────────────────────────┘
```

### [SCREEN: Attack Surface Diagram]

```
Docker Security Layers:

1. IMAGE SECURITY
   ├── Use trusted base images
   ├── Scan for vulnerabilities
   ├── Don't embed secrets
   └── Minimize packages

2. BUILD SECURITY
   ├── Multi-stage builds
   ├── Non-root user
   ├── Read-only filesystem
   └── No unnecessary capabilities

3. RUNTIME SECURITY
   ├── Resource limits
   ├── Read-only root filesystem
   ├── Drop capabilities
   ├── Seccomp profiles
   └── AppArmor/SELinux

4. NETWORK SECURITY
   ├── Network segmentation
   ├── TLS everywhere
   ├── No exposed daemon socket
   └── Firewall rules

5. HOST SECURITY
   ├── Keep Docker updated
   ├── Protect Docker socket
   ├── Enable user namespaces
   └── Audit logging
```

### 15.2 — Image Security

### [SCREEN: Terminal — LIVE DEMO]

```dockerfile
# ============================================
# LAB 28: Secure Dockerfile
# ============================================

# BAD — Insecure Dockerfile
FROM ubuntu:latest              # ✗ Mutable tag
RUN apt-get update && \
    apt-get install -y python3  # ✗ Runs as root
COPY . /app                     # ✗ May include secrets
ENV DB_PASSWORD=secret123       # ✗ Secret in image!
EXPOSE 8000
CMD ["python3", "/app/app.py"]  # ✗ Running as root!

# ---

# GOOD — Secure Dockerfile
FROM python:3.12-slim@sha256:abc123...   # ✓ Pinned digest
LABEL org.opencontainers.image.source="https://github.com/you/app"

# Install security updates
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        tini && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Create non-root user FIRST
RUN groupadd -r appuser && \
    useradd -r -g appuser -d /app -s /sbin/nologin appuser

# Copy only what's needed
COPY --chown=appuser:appuser requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser . .

# Switch to non-root user
USER appuser

# Use tini as init system (handles signals properly)
ENTRYPOINT ["tini", "--"]

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')"

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:create_app()"]
```

```bash
# --- SCANNING IMAGES FOR VULNERABILITIES ---

# Using Docker Scout (built-in)
docker scout cves myapp:latest
docker scout quickview myapp:latest

# Using Trivy (free, popular)
# Install: brew install trivy (or download from GitHub)
trivy image myapp:latest
trivy image --severity HIGH,CRITICAL myapp:latest

# Using Grype (Anchore)
grype myapp:latest

# Check for secrets in image
# Using trufflehog
trufflehog docker --image myapp:latest

# --- VERIFY IMAGE CONTENT ---
# Never trust, always verify
docker history --no-trunc myapp:latest
docker inspect myapp:latest
```

### 15.3 — Runtime Security

### [SCREEN: Terminal — LIVE DEMO]

```bash
# ============================================
# LAB 29: Runtime Security Hardening
# ============================================

# --- NON-ROOT USER ---
docker run --user 1000:1000 nginx

# --- READ-ONLY ROOT FILESYSTEM ---
docker run --read-only \
    --tmpfs /tmp \
    --tmpfs /var/run \
    nginx

# App can only write to tmpfs mounts
# Prevents attackers from modifying binaries

# --- DROP ALL CAPABILITIES AND ADD ONLY NEEDED ONES ---
docker run \
    --cap-drop ALL \
    --cap-add NET_BIND_SERVICE \
    nginx

# Common capabilities:
# NET_BIND_SERVICE — bind to ports below 1024
# CHOWN — change file ownership
# SETUID/SETGID — change user/group
# SYS_PTRACE — debugging (NEVER in production)

# List default capabilities
docker run --rm alpine sh -c 'apk add -q libcap && capsh --print'

# --- RESOURCE LIMITS ---
docker run \
    --memory 512m \
    --memory-swap 512m \
    --cpus 0.5 \
    --pids-limit 100 \
    --ulimit nofile=1024:2048 \
    nginx

# --memory 512m       = Max 512MB RAM
# --memory-swap 512m  = No swap (same as memory)
# --cpus 0.5          = Half a CPU core
# --pids-limit 100    = Max 100 processes (prevents fork bombs)

# --- SECURITY OPTIONS ---
docker run \
    --security-opt no-new-privileges \
    --security-opt seccomp=default.json \
    nginx

# no-new-privileges — prevents privilege escalation via setuid
# seccomp — restricts which system calls the container can make

# --- COMPLETE HARDENED CONTAINER ---
docker run -d \
    --name secure-app \
    --user 1000:1000 \
    --read-only \
    --tmpfs /tmp:rw,noexec,nosuid,size=100m \
    --cap-drop ALL \
    --cap-add NET_BIND_SERVICE \
    --memory 256m \
    --cpus 0.5 \
    --pids-limit 50 \
    --security-opt no-new-privileges \
    --security-opt seccomp=default \
    --restart unless-stopped \
    --health-cmd="curl -f http://localhost:8080/health || exit 1" \
    --health-interval=30s \
    -p 8080:8080 \
    myapp:v1
```

### 15.4 — Docker Socket Security

**[TALKING HEAD]**

"The Docker socket is the MOST dangerous thing in Docker. If a container has access to the Docker socket, it effectively has root access to the host. Never mount it unless absolutely necessary."

```bash
# DANGEROUS — gives container full host access!
docker run -v /var/run/docker.sock:/var/run/docker.sock myapp
# This container can now:
# - Create privileged containers
# - Mount host filesystem
# - Execute commands on host
# - Essentially has ROOT on the host

# If you MUST expose the socket (CI/CD, monitoring):
# Use Docker socket proxy (only allows specific API calls)
docker run -d \
    --name socket-proxy \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e CONTAINERS=1 \
    -e IMAGES=1 \
    -e INFO=1 \
    -e POST=0 \
    tecnativa/docker-socket-proxy

# Other containers connect to proxy instead of real socket
docker run -e DOCKER_HOST=tcp://socket-proxy:2375 mymonitoring
```

### 15.5 — Docker Content Trust (Image Signing)

```bash
# ============================================
# LAB 30: Image Signing & Verification
# ============================================

# Enable Docker Content Trust
export DOCKER_CONTENT_TRUST=1

# Now all push/pull operations require signed images
docker pull nginx:latest         # Only pulls if signed
docker push myrepo/myapp:v1     # Signs before pushing

# Disable for specific commands
DOCKER_CONTENT_TRUST=0 docker pull unsigned-image

# Inspect signatures
docker trust inspect nginx
docker trust inspect --pretty nginx
```

---

## Chapter 16: Docker in CI/CD Pipelines (35 minutes)

### [SCREEN: "Chapter 16: Docker in CI/CD"]

### 16.1 — CI/CD with Docker Overview

**[TALKING HEAD]**

"Docker and CI/CD are a match made in heaven. Docker gives you consistent build environments, reproducible deployments, and easy rollbacks. Let me show you how to integrate Docker into real CI/CD pipelines."

### [SCREEN: Pipeline Diagram]

```
CI/CD Pipeline with Docker:

┌──────┐    ┌───────────┐    ┌──────────┐    ┌──────────┐    ┌────────────┐
│ Push │───►│   Build   │───►│   Test   │───►│   Scan   │───►│   Deploy   │
│ Code │    │  Docker   │    │    in    │    │  Image   │    │  Container │
│      │    │  Image    │    │Container │    │ Security │    │    to      │
└──────┘    └───────────┘    └──────────┘    └──────────┘    │Production  │
                                                             └────────────┘
```

### [SCREEN: CI/CD Docker Workflow Diagram]

```
Complete Docker CI/CD Workflow:

  Developer                CI Server                    Production
  ─────────               ──────────                   ──────────

  git push ──────────────►┌─────────────────────────┐
                          │ 1. CHECKOUT code         │
                          ├─────────────────────────┤
                          │ 2. LINT Dockerfile       │
                          │    (hadolint)             │
                          ├─────────────────────────┤
                          │ 3. BUILD image           │
                          │    docker build           │
                          │    --tag app:sha-abc123   │
                          ├─────────────────────────┤
                          │ 4. TEST in container     │
                          │    docker run app pytest  │
                          ├─────────────────────────┤
                          │ 5. SCAN for CVEs         │──── Fail? ──► Block merge
                          │    trivy image app       │
                          ├─────────────────────────┤
                          │ 6. PUSH to registry      │
                          │    docker push            │
                          │    ECR / GHCR / DockerHub │
                          └───────────┬─────────────┘
                                      │
                                      ▼
                          ┌─────────────────────────┐
                          │ 7. DEPLOY                │────►┌──────────┐
                          │    docker compose pull   │     │ App v2   │
                          │    docker compose up -d  │     │ running  │
                          │    (or K8s kubectl apply)│     │ ✓ healthy│
                          └─────────────────────────┘     └──────────┘

  Rollback: docker compose up -d --force-recreate
            (with previous image tag)
```

### 16.2 — GitHub Actions Pipeline

```yaml
# ============================================
# .github/workflows/docker-ci.yml
# ============================================
name: Docker CI/CD

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Build test image
        uses: docker/build-push-action@v5
        with:
          context: .
          target: test          # Multi-stage: build up to test stage
          load: true
          tags: myapp:test
          cache-from: type=gha
          cache-to: type=gha,mode=max

      - name: Run tests in container
        run: |
          docker run --rm myapp:test npm test

      - name: Run linting
        run: |
          docker run --rm myapp:test npm run lint

  security-scan:
    needs: build-and-test
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Build image
        run: docker build -t myapp:scan .

      - name: Run Trivy vulnerability scanner
        uses: aquasecurity/trivy-action@master
        with:
          image-ref: myapp:scan
          format: table
          exit-code: 1                    # Fail on HIGH/CRITICAL
          severity: HIGH,CRITICAL

      - name: Run Dockle (Dockerfile best practices)
        uses: erzz/dockle-action@v1
        with:
          image: myapp:scan

  push-image:
    needs: [build-and-test, security-scan]
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Login to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
          tags: |
            type=sha,prefix=
            type=semver,pattern={{version}}
            type=raw,value=latest

      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha,mode=max
          platforms: linux/amd64,linux/arm64

  deploy:
    needs: push-image
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to server
        uses: appleboy/ssh-action@v1
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USER }}
          key: ${{ secrets.SSH_KEY }}
          script: |
            cd /opt/myapp
            docker compose pull
            docker compose up -d --remove-orphans
            docker image prune -f
```

### 16.3 — GitLab CI Pipeline

```yaml
# ============================================
# .gitlab-ci.yml
# ============================================
stages:
  - build
  - test
  - scan
  - deploy

variables:
  DOCKER_IMAGE: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA
  DOCKER_IMAGE_LATEST: $CI_REGISTRY_IMAGE:latest

build:
  stage: build
  image: docker:24
  services:
    - docker:24-dind
  script:
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker build --cache-from $DOCKER_IMAGE_LATEST -t $DOCKER_IMAGE -t $DOCKER_IMAGE_LATEST .
    - docker push $DOCKER_IMAGE
    - docker push $DOCKER_IMAGE_LATEST

test:
  stage: test
  image: docker:24
  services:
    - docker:24-dind
  script:
    - docker run --rm $DOCKER_IMAGE npm test

scan:
  stage: scan
  image:
    name: aquasec/trivy:latest
    entrypoint: [""]
  script:
    - trivy image --exit-code 1 --severity HIGH,CRITICAL $DOCKER_IMAGE

deploy_staging:
  stage: deploy
  script:
    - docker compose -f docker-compose.staging.yml pull
    - docker compose -f docker-compose.staging.yml up -d
  environment:
    name: staging
  only:
    - develop

deploy_production:
  stage: deploy
  script:
    - docker compose -f docker-compose.prod.yml pull
    - docker compose -f docker-compose.prod.yml up -d
  environment:
    name: production
  when: manual
  only:
    - main
```

### 16.4 — Docker Build Caching in CI

```bash
# ============================================
# LAB 31: Optimize CI Build Times
# ============================================

# --- BUILD CACHE STRATEGIES ---

# Strategy 1: Use BuildKit cache mounts
# syntax=docker/dockerfile:1
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm \
    npm ci --only=production
COPY . .
CMD ["node", "server.js"]

# Strategy 2: Cache from registry
docker build \
    --cache-from myregistry/myapp:latest \
    --build-arg BUILDKIT_INLINE_CACHE=1 \
    -t myregistry/myapp:v1.2.3 .

# Strategy 3: GitHub Actions cache
# Uses type=gha cache (shown in GitHub Actions example above)

# Strategy 4: Local cache export
docker buildx build \
    --cache-from type=local,src=/tmp/.buildx-cache \
    --cache-to type=local,dest=/tmp/.buildx-cache-new \
    -t myapp:latest .
```

---

## Chapter 17: Container Internals — Namespaces & Cgroups (35 minutes)

### [SCREEN: "Chapter 17: Container Internals"]

### 17.1 — Linux Namespaces

**[TALKING HEAD]**

"Now we go deep. If you want to truly understand Docker, you need to understand the Linux kernel features that make containers possible. There are two main pillars: namespaces for isolation and cgroups for resource limits.

Namespaces provide isolation — they make it so a container can't see or affect other containers or the host. Each namespace type isolates a different resource."

### [SCREEN: Diagram + Terminal]

```
Linux Namespaces:

┌──────────────────────────────────────────────────────────────────┐
│ NAMESPACE    │ ISOLATES                │ WHAT IT MEANS           │
├──────────────┼─────────────────────────┼─────────────────────────┤
│ PID          │ Process IDs             │ Container sees only its │
│              │                         │ own processes (PID 1)   │
├──────────────┼─────────────────────────┼─────────────────────────┤
│ NET          │ Network interfaces,     │ Container has its own   │
│              │ IPs, ports, routes      │ network stack           │
├──────────────┼─────────────────────────┼─────────────────────────┤
│ MNT          │ Filesystem mount points │ Container has its own   │
│              │                         │ root filesystem         │
├──────────────┼─────────────────────────┼─────────────────────────┤
│ UTS          │ Hostname, domain name   │ Container has its own   │
│              │                         │ hostname                │
├──────────────┼─────────────────────────┼─────────────────────────┤
│ IPC          │ Inter-process comms     │ Container has isolated  │
│              │ (shared memory, etc.)   │ shared memory           │
├──────────────┼─────────────────────────┼─────────────────────────┤
│ USER         │ User/Group IDs          │ Root in container ≠     │
│              │                         │ root on host            │
├──────────────┼─────────────────────────┼─────────────────────────┤
│ CGROUP       │ Cgroup root directory   │ Container can't see     │
│              │                         │ host's cgroup hierarchy │
└──────────────┴─────────────────────────┴─────────────────────────┘
```

```bash
# ============================================
# LAB 32: Exploring Namespaces
# ============================================

# Run a container
docker run -d --name ns-demo nginx

# Find the container's PID on the HOST
PID=$(docker inspect --format '{{.State.Pid}}' ns-demo)
echo "Container PID on host: $PID"

# View the container's namespaces (Linux only)
ls -la /proc/$PID/ns/
# lrwxrwxrwx 1 root root 0 Jan 1 00:00 cgroup -> 'cgroup:[4026532XXX]'
# lrwxrwxrwx 1 root root 0 Jan 1 00:00 ipc -> 'ipc:[4026532XXX]'
# lrwxrwxrwx 1 root root 0 Jan 1 00:00 mnt -> 'mnt:[4026532XXX]'
# lrwxrwxrwx 1 root root 0 Jan 1 00:00 net -> 'net:[4026532XXX]'
# lrwxrwxrwx 1 root root 0 Jan 1 00:00 pid -> 'pid:[4026532XXX]'
# lrwxrwxrwx 1 root root 0 Jan 1 00:00 user -> 'user:[4026531XXX]'
# lrwxrwxrwx 1 root root 0 Jan 1 00:00 uts -> 'uts:[4026532XXX]'

# PID NAMESPACE DEMO
# Inside the container:
docker exec ns-demo ps aux
# PID 1 = nginx (container thinks it's the only process)

# On the host:
ps aux | grep nginx
# Shows the REAL PID (e.g., 12345)

# The same process has PID 1 in container, PID 12345 on host!

# NET NAMESPACE DEMO
# Container has its own network:
docker exec ns-demo ip addr
# Shows eth0 with container IP (e.g., 172.17.0.2)

# Host has its own:
ip addr
# Shows host interfaces (eth0 with host IP)

# ENTER a container's namespace from the host
nsenter -t $PID -n ip addr    # Enter network namespace
nsenter -t $PID -p -r ps aux  # Enter PID namespace

docker rm -f ns-demo
```

### 17.2 — Control Groups (cgroups)

**[TALKING HEAD]**

"While namespaces provide isolation — what a container can SEE — cgroups control what resources a container can USE. Without cgroups, a single container could consume all the CPU and memory on the host, starving everything else."

### [SCREEN: Diagram + Terminal]

```
cgroups Resource Controls:

┌─────────────────────────────────────────────────┐
│ RESOURCE     │ CONTROLS                          │
├──────────────┼───────────────────────────────────┤
│ CPU          │ cpu.shares, cpu.cfs_quota,        │
│              │ cpuset (pin to specific cores)     │
├──────────────┼───────────────────────────────────┤
│ Memory       │ memory.limit, memory.swap,        │
│              │ memory.oom_control                 │
├──────────────┼───────────────────────────────────┤
│ I/O          │ blkio.weight,                     │
│              │ blkio.throttle.read_bps_device     │
├──────────────┼───────────────────────────────────┤
│ PIDs         │ pids.max (fork bomb protection)   │
├──────────────┼───────────────────────────────────┤
│ Network      │ (via iptables/tc, not cgroups)    │
└──────────────┴───────────────────────────────────┘
```

```bash
# ============================================
# LAB 33: cgroups in Action
# ============================================

# --- CPU LIMITS ---

# Limit to 50% of one CPU core
docker run -d --name cpu-demo --cpus 0.5 nginx

# Limit to specific cores (core 0 and 1)
docker run -d --cpuset-cpus="0,1" nginx

# CPU shares (relative weight — default is 1024)
docker run -d --cpu-shares 512 nginx    # Gets half the CPU vs default

# --- MEMORY LIMITS ---

# Hard limit: 256MB RAM, no swap
docker run -d --name mem-demo --memory 256m --memory-swap 256m nginx

# What happens when limit is exceeded?
docker run -d --name oom-demo --memory 50m \
    python:3-slim python -c "x = ' ' * (100 * 1024 * 1024)"
# Container gets OOM-killed!

docker inspect --format='{{.State.OOMKilled}}' oom-demo
# true

# --- PID LIMITS ---

# Prevent fork bombs
docker run -d --pids-limit 50 nginx
# Container can only create 50 processes

# --- I/O LIMITS ---
docker run -d \
    --device-read-bps /dev/sda:10mb \
    --device-write-bps /dev/sda:10mb \
    nginx

# --- VIEW CGROUP SETTINGS (Linux) ---
# Find cgroup path
CGPATH=$(docker inspect --format='{{.HostConfig.CgroupParent}}' cpu-demo)
# View limits
cat /sys/fs/cgroup/cpu/docker/<container-id>/cpu.cfs_quota_us
cat /sys/fs/cgroup/memory/docker/<container-id>/memory.limit_in_bytes

# --- MONITORING RESOURCE USAGE ---
docker stats --no-stream
# CONTAINER   CPU %   MEM USAGE / LIMIT   MEM %   NET I/O    BLOCK I/O
# cpu-demo    0.05%   5MiB / 7.7GiB       0.06%   1kB / 0B   0B / 0B
# mem-demo    0.02%   3MiB / 256MiB       1.17%   0B / 0B    0B / 0B

docker rm -f cpu-demo mem-demo oom-demo
```

### 17.3 — UnionFS / OverlayFS (Container Filesystem)

**[TALKING HEAD]**

"The final piece of the puzzle is how containers manage their filesystem. Docker uses a Union filesystem — specifically OverlayFS — which layers multiple directories on top of each other to create a single unified view."

### [SCREEN: Diagram]

```
OverlayFS (overlay2 storage driver):

Container View (unified):
┌────────────────────────────────────┐
│  /bin  /etc  /home  /app  /tmp     │
│  (appears as one filesystem)       │
└────────────────┬───────────────────┘
                 │
    ┌────────────┴────────────┐
    │                         │
┌───▼──────────┐    ┌────────▼───────┐
│  Upper Layer │    │  Lower Layers  │
│  (writable)  │    │  (read-only)   │
│              │    │                │
│ Container's  │    │ Image layers   │
│ changes go   │    │ (shared with   │
│ here         │    │  other         │
│              │    │  containers)   │
└──────────────┘    └────────────────┘

Copy-on-Write (CoW):
1. READ: file found in lower layer → read directly (fast!)
2. WRITE: file from lower layer → COPY to upper layer → modify copy
3. DELETE: whiteout file created in upper layer (hides lower file)
4. NEW FILE: written directly to upper layer
```

```bash
# ============================================
# LAB 34: Exploring the Filesystem (Linux only)
# ============================================

# See the storage driver
docker info | grep "Storage Driver"
# Storage Driver: overlay2

# Run a container
docker run -d --name fs-demo nginx

# Find the overlay mounts
docker inspect fs-demo | jq '.[0].GraphDriver'
# {
#   "Data": {
#     "LowerDir": "/var/lib/docker/overlay2/.../diff:...",
#     "MergedDir": "/var/lib/docker/overlay2/.../merged",
#     "UpperDir": "/var/lib/docker/overlay2/.../diff",
#     "WorkDir": "/var/lib/docker/overlay2/.../work"
#   }
# }

# LowerDir = image layers (read-only)
# UpperDir = container layer (writable)
# MergedDir = unified view (what container sees)

# Write a file in the container
docker exec fs-demo bash -c 'echo "hello" > /test.txt'

# The file appears in the UpperDir on the host
ls $(docker inspect --format='{{.GraphDriver.Data.UpperDir}}' fs-demo)

# See what changed
docker diff fs-demo
# A /test.txt   (A = Added)

docker rm -f fs-demo
```

---

## Chapter 18: Docker Daemon Configuration & Tuning (20 minutes)

### [SCREEN: "Chapter 18: Daemon Configuration"]

### 18.1 — Daemon Configuration

**[TALKING HEAD]**

"The Docker daemon has many configurable options that affect performance, security, and behavior. Let me show you the most important ones."

### [SCREEN: Daemon Architecture Diagram]

```
Docker Daemon (dockerd) — Configuration Areas:

  ┌────────────────────────────────────────────────────────────────────┐
  │                      /etc/docker/daemon.json                       │
  │                                                                    │
  │  ┌─────────────┐  ┌──────────────┐  ┌────────────────────────┐   │
  │  │  STORAGE    │  │  NETWORKING  │  │  SECURITY              │   │
  │  │             │  │              │  │                        │   │
  │  │ • driver:   │  │ • bip        │  │ • userns-remap        │   │
  │  │   overlay2  │  │ • dns        │  │ • no-new-privileges   │   │
  │  │ • data-root │  │ • iptables   │  │ • seccomp-profile     │   │
  │  │             │  │ • icc        │  │ • tls/tlsverify       │   │
  │  └─────────────┘  └──────────────┘  └────────────────────────┘   │
  │                                                                    │
  │  ┌─────────────┐  ┌──────────────┐  ┌────────────────────────┐   │
  │  │  LOGGING   │  │ PERFORMANCE  │  │  RUNTIME               │   │
  │  │            │  │              │  │                        │   │
  │  │ • driver:  │  │ • max-       │  │ • default-runtime     │   │
  │  │   json-file│  │   concurrent │  │ • default-ulimits     │   │
  │  │ • max-size │  │   -downloads │  │ • live-restore        │   │
  │  │ • max-file │  │ • max-       │  │ • cgroup-driver       │   │
  │  │            │  │   concurrent │  │ • buildkit            │   │
  │  │            │  │   -uploads   │  │ • metrics-addr        │   │
  │  └────────────┘  └──────────────┘  └────────────────────────┘   │
  └────────────────────────────────────────────────────────────────────┘

  Daemon Restart Flow:

  Edit daemon.json ──► systemctl restart docker ──► docker info (verify)
                                │
                                ▼
                    ⚠️ All containers restart!
                    (unless live-restore: true)
```

### [SCREEN: Terminal]

```json
// ============================================
// /etc/docker/daemon.json — Full Reference
// ============================================
{
    // Storage
    "storage-driver": "overlay2",
    "data-root": "/var/lib/docker",

    // Logging
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "10m",
        "max-file": "3"
    },

    // Networking
    "bip": "172.26.0.1/16",            // Bridge IP
    "default-address-pools": [
        {"base": "172.26.0.0/16", "size": 24}
    ],
    "dns": ["8.8.8.8", "8.8.4.4"],
    "iptables": true,

    // Security
    "userns-remap": "default",          // User namespace remapping
    "no-new-privileges": true,
    "seccomp-profile": "/etc/docker/seccomp-default.json",
    "icc": false,                       // Disable inter-container comm

    // Performance
    "max-concurrent-downloads": 10,
    "max-concurrent-uploads": 5,
    "max-download-attempts": 5,

    // Runtime
    "default-runtime": "runc",
    "default-ulimits": {
        "nofile": {
            "Name": "nofile",
            "Hard": 65536,
            "Soft": 32768
        }
    },

    // Remote access (use with TLS!)
    "hosts": ["unix:///var/run/docker.sock", "tcp://0.0.0.0:2376"],
    "tls": true,
    "tlscacert": "/etc/docker/ca.pem",
    "tlscert": "/etc/docker/server-cert.pem",
    "tlskey": "/etc/docker/server-key.pem",
    "tlsverify": true,

    // Registry
    "insecure-registries": ["myregistry.local:5000"],
    "registry-mirrors": ["https://mirror.gcr.io"],

    // BuildKit
    "features": {
        "buildkit": true
    },

    // Live restore (containers keep running during daemon restart)
    "live-restore": true,

    // Cgroup driver
    "exec-opts": ["native.cgroupdriver=systemd"],

    // Metrics
    "metrics-addr": "0.0.0.0:9323",
    "experimental": true
}
```

```bash
# ============================================
# LAB 35: Daemon Configuration
# ============================================

# Edit the daemon config
sudo vim /etc/docker/daemon.json

# Recommended production config:
cat > /tmp/daemon.json << 'EOF'
{
    "storage-driver": "overlay2",
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "10m",
        "max-file": "3"
    },
    "default-ulimits": {
        "nofile": {"Name": "nofile", "Hard": 65536, "Soft": 32768}
    },
    "max-concurrent-downloads": 10,
    "live-restore": true,
    "features": {"buildkit": true},
    "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

# Restart Docker daemon to apply
sudo systemctl restart docker

# Verify configuration
docker info

# --- DISK CLEANUP AUTOMATION ---
# Set up automatic pruning via cron
echo "0 2 * * * docker system prune -af --filter 'until=168h'" | sudo crontab -
# Removes unused images/containers older than 7 days, daily at 2 AM
```

---

## Chapter 19: Container Orchestration Overview (25 minutes)

### [SCREEN: "Chapter 19: Orchestration"]

### 19.1 — When Docker Alone Isn't Enough

**[TALKING HEAD]**

"Docker is great for running containers on a single machine. But in production, you need:

- Multiple hosts for high availability
- Automatic scaling based on load
- Self-healing (restart crashed containers)
- Rolling updates with zero downtime
- Service discovery and load balancing
- Secret management

This is where container orchestration comes in."

### [SCREEN: Comparison]

```
Container Orchestration Options:

┌──────────────────────────────────────────────────────────────────┐
│ Tool              │ Best For                │ Complexity          │
├───────────────────┼─────────────────────────┼─────────────────────┤
│ Docker Compose    │ Development, small apps │ ★☆☆☆☆ (Simple)     │
│                   │ Single host only        │                     │
├───────────────────┼─────────────────────────┼─────────────────────┤
│ Docker Swarm      │ Small-medium production │ ★★☆☆☆ (Easy)       │
│                   │ Built into Docker       │                     │
├───────────────────┼─────────────────────────┼─────────────────────┤
│ Kubernetes (K8s)  │ Large-scale production  │ ★★★★★ (Complex)    │
│                   │ Industry standard       │                     │
├───────────────────┼─────────────────────────┼─────────────────────┤
│ Nomad (HashiCorp) │ Mixed workloads         │ ★★★☆☆ (Moderate)   │
│                   │ VMs + containers        │                     │
├───────────────────┼─────────────────────────┼─────────────────────┤
│ ECS (AWS)         │ AWS-native workloads    │ ★★★☆☆ (Moderate)   │
│                   │ Managed control plane   │                     │
└──────────────────────────────────────────────────────────────────┘
```

### 19.2 — Docker Swarm Quick Start

```bash
# ============================================
# LAB 36: Docker Swarm (Built-in Orchestration)
# ============================================

# Initialize a swarm
docker swarm init

# Create a service (replicated)
docker service create \
    --name web \
    --replicas 3 \
    --publish 80:80 \
    --update-delay 10s \
    --update-parallelism 1 \
    --restart-condition on-failure \
    nginx:alpine

# List services
docker service ls

# See tasks (containers)
docker service ps web
# ID        NAME    IMAGE         NODE     STATUS
# abc       web.1   nginx:alpine  host1    Running
# def       web.2   nginx:alpine  host1    Running
# ghi       web.3   nginx:alpine  host1    Running

# Scale up
docker service scale web=5

# Rolling update
docker service update --image nginx:1.25-alpine web
# Updates one at a time with 10s delay

# Rollback
docker service rollback web

# View logs
docker service logs -f web

# Remove service
docker service rm web

# Leave swarm
docker swarm leave --force
```

### 19.3 — From Docker to Kubernetes

**[TALKING HEAD]**

"Most production environments today use Kubernetes. Let me show you how Docker concepts map to Kubernetes — and a quick example."

### [SCREEN: Mapping]

```
Docker to Kubernetes Concept Mapping:

Docker                    →  Kubernetes
─────────────────────────────────────────────
docker run                →  kubectl run / Pod
docker-compose.yml        →  Deployment + Service YAML
Container                 →  Pod (1+ containers)
docker service (Swarm)    →  Deployment + ReplicaSet
Port mapping (-p)         →  Service (ClusterIP/NodePort/LoadBalancer)
Volume                    →  PersistentVolumeClaim
docker network            →  NetworkPolicy
Environment variables     →  ConfigMap / Secret
Health check              →  Liveness/Readiness probes
docker stack              →  Helm chart
Docker Registry           →  Same! (registries work with both)
```

```yaml
# ============================================
# Kubernetes equivalent of docker-compose.yml
# ============================================

# Deployment (like docker run with replicas)
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
        - name: web
          image: myapp:v1.0
          ports:
            - containerPort: 3000
          env:
            - name: DATABASE_URL
              valueFrom:
                secretKeyRef:
                  name: db-secret
                  key: url
          resources:
            limits:
              cpu: "500m"
              memory: "256Mi"
          livenessProbe:
            httpGet:
              path: /health
              port: 3000
            initialDelaySeconds: 30
            periodSeconds: 10
---
# Service (like -p port mapping, with load balancing)
apiVersion: v1
kind: Service
metadata:
  name: web-service
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 3000
  selector:
    app: web
```

---

## Chapter 20: Production Best Practices & Patterns (35 minutes)

### [SCREEN: "Chapter 20: Production Best Practices"]

### 20.1 — Dockerfile Best Practices Checklist

### [SCREEN: Checklist]

```
✅ DOCKERFILE BEST PRACTICES:

□ Use specific image tags (never :latest in production)
□ Pin image digest for maximum reproducibility
□ Use multi-stage builds
□ Use .dockerignore
□ Run as non-root user
□ One process per container
□ Use COPY instead of ADD
□ Combine RUN commands to minimize layers
□ Clean up in the same RUN layer
□ Order instructions from least to most frequently changing
□ Use HEALTHCHECK
□ Don't store secrets in image (no ENV for passwords)
□ Scan images for vulnerabilities
□ Use tini or --init for proper signal handling
□ Set proper STOPSIGNAL
□ Keep images small (Alpine/slim/distroless)
```

### [SCREEN: Production Architecture Diagram]

```
Production Docker Deployment Architecture:

                        Internet
                           │
                    ┌──────▼──────┐
                    │   Firewall  │
                    │   (iptables)│
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐         ┌────────────────┐
                    │   Nginx     │         │  Let's Encrypt │
                    │   Reverse   │◄────────│  SSL/TLS       │
                    │   Proxy     │         │  Auto-Renew    │
                    │  :80/:443   │         └────────────────┘
                    └──────┬──────┘
                           │
              ┌────────────┼────────────┐
              │            │            │
        ┌─────▼────┐ ┌────▼─────┐ ┌────▼─────┐
        │  App     │ │  App     │ │  App     │    frontend
        │ Replica 1│ │ Replica 2│ │ Replica 3│    network
        └─────┬────┘ └────┬─────┘ └────┬─────┘
              │            │            │
              └────────────┼────────────┘
                           │
                    ┌──────▼──────┐                backend
              ┌─────┤   Backend   ├──────┐        network
              │     │   Network   │      │        (internal)
              │     └─────────────┘      │
        ┌─────▼────┐              ┌──────▼─────┐
        │PostgreSQL│              │   Redis     │
        │  :5432   │              │   :6379     │
        │  + Vol   │              │   + Vol     │
        └──────────┘              └────────────┘

  NOT exposed to internet ──► Only Nginx ports (80/443) are published
```

### 20.2 — Production Docker Compose Patterns

```yaml
# ============================================
# docker-compose.prod.yml
# Complete Production-Ready Template
# ============================================

services:
  # --- APPLICATION ---
  app:
    image: ${REGISTRY}/myapp:${VERSION}     # Always use image, never build in prod
    deploy:
      replicas: 3
      resources:
        limits:
          cpus: '1.0'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 128M
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 3
        window: 120s
      update_config:
        parallelism: 1
        delay: 30s
        failure_action: rollback
        order: start-first         # New container starts before old one stops
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 60s
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
    read_only: true
    tmpfs:
      - /tmp:size=100M
    security_opt:
      - no-new-privileges:true
    networks:
      - frontend
      - backend

  # --- REVERSE PROXY ---
  nginx:
    image: nginx:1.25-alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/conf.d:/etc/nginx/conf.d:ro
      - ./nginx/ssl:/etc/nginx/ssl:ro
      - nginx-cache:/var/cache/nginx
    depends_on:
      app:
        condition: service_healthy
    restart: unless-stopped
    networks:
      - frontend

  # --- DATABASE ---
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: ${DB_NAME}
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD_FILE: /run/secrets/db_password
    secrets:
      - db_password
    volumes:
      - pgdata:/var/lib/postgresql/data
      - ./db/init:/docker-entrypoint-initdb.d:ro
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${DB_USER} -d ${DB_NAME}"]
      interval: 10s
      timeout: 5s
      retries: 5
    deploy:
      resources:
        limits:
          cpus: '2.0'
          memory: 2G
    shm_size: '256m'             # Shared memory for PostgreSQL
    restart: unless-stopped
    networks:
      - backend

  # --- BACKUP ---
  db-backup:
    image: prodrigestivill/postgres-backup-local
    environment:
      POSTGRES_HOST: db
      POSTGRES_DB: ${DB_NAME}
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD_FILE: /run/secrets/db_password
      SCHEDULE: "@daily"
      BACKUP_KEEP_DAYS: 7
      BACKUP_KEEP_WEEKS: 4
      BACKUP_KEEP_MONTHS: 6
    secrets:
      - db_password
    volumes:
      - ./backups:/backups
    depends_on:
      db:
        condition: service_healthy
    restart: unless-stopped
    networks:
      - backend

  # --- MONITORING ---
  prometheus:
    image: prom/prometheus:latest
    volumes:
      - ./monitoring/prometheus.yml:/etc/prometheus/prometheus.yml:ro
      - prometheus-data:/prometheus
    ports:
      - "9090:9090"
    restart: unless-stopped

  grafana:
    image: grafana/grafana:latest
    volumes:
      - grafana-data:/var/lib/grafana
    environment:
      GF_SECURITY_ADMIN_PASSWORD_FILE: /run/secrets/grafana_password
    secrets:
      - grafana_password
    ports:
      - "3001:3000"
    restart: unless-stopped

secrets:
  db_password:
    file: ./secrets/db_password.txt
  grafana_password:
    file: ./secrets/grafana_password.txt

volumes:
  pgdata:
  nginx-cache:
  prometheus-data:
  grafana-data:

networks:
  frontend:
    driver: bridge
  backend:
    driver: bridge
    internal: true
```

### 20.3 — Zero-Downtime Deployment Pattern

### [SCREEN: Blue-Green Deployment Diagram]

```
Blue-Green Deployment Strategy:

  STEP 1: Blue is live, Green is being deployed
  ─────────────────────────────────────────────

  Users ──► Nginx ──► ┌─────────────┐
                      │  APP v1     │ ◄── BLUE (live, serving traffic)
                      │  (blue)     │
                      └─────────────┘
                      ┌─────────────┐
                      │  APP v2     │ ◄── GREEN (starting, health check)
                      │  (green)    │
                      └─────────────┘

  STEP 2: Green is healthy, swap traffic
  ───────────────────────────────────────

  Users ──► Nginx ──► ┌─────────────┐
                ×     │  APP v1     │ ◄── BLUE (idle, ready for rollback)
                │     │  (blue)     │
                │     └─────────────┘
                └───► ┌─────────────┐
                      │  APP v2     │ ◄── GREEN (now live!)
                      │  (green)    │
                      └─────────────┘

  STEP 3: Remove old blue
  ────────────────────────

  Users ──► Nginx ──► ┌─────────────┐
                      │  APP v2     │ ◄── GREEN (live)
                      │  (green)    │
                      └─────────────┘
                      BLUE removed ✓

  Rollback? Just point Nginx back to blue (if still running)
```

```bash
# ============================================
# LAB 37: Blue-Green Deployment with Docker
# ============================================

# Blue-Green deployment using Nginx as reverse proxy

# Start "blue" version
docker run -d --name app-blue --network mynet myapp:v1

# Start "green" version
docker run -d --name app-green --network mynet myapp:v2

# Update Nginx config to point to green
# (swap upstream from app-blue to app-green)
docker exec nginx nginx -s reload

# Verify green is working
curl http://localhost/health

# Remove old blue version
docker rm -f app-blue

# --- ROLLING UPDATE WITH COMPOSE ---

# Method 1: Using --no-deps to update one service
docker compose up -d --no-deps --build app

# Method 2: Using deploy.update_config (shown above)
# Compose handles rolling update automatically

# Method 3: Script-based rolling update
#!/bin/bash
NEW_VERSION=$1
REPLICAS=3

for i in $(seq 1 $REPLICAS); do
    echo "Updating replica $i..."
    docker compose up -d --scale app=$REPLICAS --no-recreate
    sleep 30
    # Health check
    if curl -sf http://localhost/health > /dev/null; then
        echo "Replica $i healthy"
    else
        echo "Rollback!"
        docker compose up -d --scale app=$REPLICAS
        exit 1
    fi
done
```

### 20.4 — Logging & Monitoring in Production

### [SCREEN: Production Monitoring Stack Diagram]

```
Production Monitoring & Logging Architecture:

  ┌─────────────────────────────────────────────────────────────────┐
  │                    Docker Host                                   │
  │                                                                  │
  │  ┌────────┐  ┌────────┐  ┌────────┐                            │
  │  │ App 1  │  │ App 2  │  │ App 3  │   Application Containers   │
  │  │ :3000  │  │ :4000  │  │ :5000  │                            │
  │  └───┬────┘  └───┬────┘  └───┬────┘                            │
  │      │           │           │                                  │
  │      │    stdout/stderr      │                                  │
  │      ▼           ▼           ▼                                  │
  │  ┌──────────────────────────────────┐                           │
  │  │        Logging Driver            │                           │
  │  │    (fluentd / json-file)         │                           │
  │  └──────────────┬───────────────────┘                           │
  │                 │                                                │
  │      ┌──────────┴──────────┐                                   │
  │      ▼                     ▼                                    │
  │  ┌────────┐          ┌──────────┐      ┌──────────┐            │
  │  │Fluentd │─────────►│Elastic   │─────►│ Kibana   │  Logs     │
  │  │        │          │search    │      │ :5601    │            │
  │  └────────┘          └──────────┘      └──────────┘            │
  │                                                                  │
  │  ┌──────────┐        ┌──────────┐      ┌──────────┐            │
  │  │Prometheus│───scrape│ App      │      │ Grafana  │  Metrics  │
  │  │ :9090    │────────►│ /metrics │      │ :3001    │            │
  │  └────┬─────┘        └──────────┘      └─────┬────┘            │
  │       └─────────── data source ──────────────►┘                │
  │                                                                  │
  │  ┌──────────┐                          ┌──────────┐            │
  │  │cAdvisor  │  Container-level CPU,    │AlertMgr  │  Alerts   │
  │  │ :8080    │  memory, network stats   │ :9093    │            │
  │  └──────────┘                          └──────────┘            │
  └─────────────────────────────────────────────────────────────────┘
```

```yaml
# ============================================
# Production Logging Stack (ELK/EFK)
# ============================================

# Option 1: Centralized logging with Fluentd
services:
  app:
    image: myapp:latest
    logging:
      driver: fluentd
      options:
        fluentd-address: localhost:24224
        tag: app.{{.Name}}

  fluentd:
    image: fluent/fluentd:v1.16-1
    volumes:
      - ./fluentd/conf:/fluentd/etc
    ports:
      - "24224:24224"

# Option 2: Prometheus metrics
# Add to your application:
# GET /metrics → Prometheus-format metrics

# prometheus.yml
# scrape_configs:
#   - job_name: 'docker'
#     static_configs:
#       - targets: ['app:3000']
```

```bash
# ============================================
# LAB 38: Docker Monitoring Commands
# ============================================

# Real-time resource monitoring
docker stats

# Container events
docker events --filter type=container

# Inspect resource usage
docker system df -v

# Container health
docker inspect --format='{{json .State.Health.Status}}' myapp

# Export metrics for Prometheus
# Enable Docker daemon metrics:
# {"metrics-addr": "0.0.0.0:9323", "experimental": true}
curl http://localhost:9323/metrics
```

### 20.5 — Disaster Recovery

### [SCREEN: Backup & Recovery Strategy Diagram]

```
Docker Production Backup Strategy:

  WHAT TO BACKUP              HOW                        FREQUENCY
  ─────────────────           ──────────────────         ─────────
  ┌─────────────────┐
  │ Database         │ ──► pg_dump / mysqldump          Daily + before deploy
  │ (PostgreSQL/     │     Store: S3 / GCS / NFS
  │  MySQL)          │     Retain: 7 daily, 4 weekly, 6 monthly
  └─────────────────┘

  ┌─────────────────┐
  │ Docker Volumes   │ ──► tar czf from volume          Daily
  │ (persistent data)│     Mount with :ro flag
  └─────────────────┘

  ┌─────────────────┐
  │ Config Files     │ ──► Git repo (encrypted)         Every change
  │ docker-compose   │     .env in Vault/SSM
  │ nginx.conf       │     NOT in git!
  └─────────────────┘

  ┌─────────────────┐
  │ Docker Images    │ ──► docker save (air-gapped)     After each build
  │ (for offline)    │     Or: registry replication
  └─────────────────┘

  Recovery Flow:

  Disaster ──► Provision Host ──► Install Docker ──► Pull Images
                                                         │
     ┌───────────────────────────────────────────────────┘
     ▼
  Restore Volumes ──► Restore DB ──► Apply Configs ──► docker compose up
                                                              │
                                                         Verify Health
                                                         Switch DNS ✓
```

```bash
# ============================================
# LAB 39: Backup & Recovery Patterns
# ============================================

# --- VOLUME BACKUP ---
docker run --rm \
    -v pgdata:/source:ro \
    -v $(pwd)/backups:/backup \
    alpine tar czf /backup/pgdata-$(date +%Y%m%d).tar.gz -C /source .

# --- VOLUME RESTORE ---
docker run --rm \
    -v pgdata:/target \
    -v $(pwd)/backups:/backup:ro \
    alpine sh -c "cd /target && tar xzf /backup/pgdata-20240101.tar.gz"

# --- DATABASE BACKUP (PostgreSQL) ---
docker exec db pg_dump -U user mydb > backup.sql
docker exec db pg_dumpall -U user > all_databases.sql

# --- DATABASE RESTORE ---
cat backup.sql | docker exec -i db psql -U user mydb

# --- IMAGE BACKUP (for air-gapped environments) ---
docker save -o images.tar myapp:v1 postgres:16 redis:7
# Transfer to target machine
docker load -i images.tar

# --- FULL COMPOSE BACKUP SCRIPT ---
#!/bin/bash
BACKUP_DIR="/backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p $BACKUP_DIR

# 1. Backup database
docker compose exec -T db pg_dump -U user mydb > $BACKUP_DIR/db.sql

# 2. Backup volumes
for vol in $(docker volume ls -q --filter name=myproject); do
    docker run --rm -v $vol:/data:ro -v $BACKUP_DIR:/backup \
        alpine tar czf /backup/${vol}.tar.gz -C /data .
done

# 3. Backup configs
cp docker-compose.yml $BACKUP_DIR/
cp .env $BACKUP_DIR/

echo "Backup completed: $BACKUP_DIR"
```

---

# BONUS: Troubleshooting Guide + Interview Questions

---

## Troubleshooting Guide (20 minutes)

### [SCREEN: "BONUS: Troubleshooting"]

**[TALKING HEAD]**

"Let me give you a systematic approach to debugging ANY Docker issue. I call this the Docker Debugging Flowchart."

### [SCREEN: Flowchart]

```
Docker Debugging Flowchart:

Container won't START?
├── Check: docker logs <container>
│   ├── Application error → Fix app code
│   ├── Permission denied → Check USER, volume permissions
│   └── File not found → Check COPY, WORKDIR in Dockerfile
├── Check: docker inspect <container> | jq '.[0].State'
│   ├── OOMKilled: true → Increase memory limit
│   ├── ExitCode: 127 → Command not found (wrong entrypoint)
│   └── ExitCode: 1 → Application error
└── Check: docker events
    └── Shows what happened when

Container is SLOW?
├── Check: docker stats
│   ├── High CPU → Profile app, check infinite loops
│   ├── High Memory → Check for memory leaks
│   └── High Block I/O → Optimize disk access
├── Check: network connectivity
│   ├── docker exec <c> ping <target>
│   ├── docker exec <c> curl <url>
│   └── docker exec <c> nslookup <service>
└── Check: docker system df
    └── Low disk space → docker system prune

Container can't CONNECT?
├── Same network? → docker network inspect
├── DNS working? → docker exec <c> nslookup <service>
├── Port exposed? → docker port <container>
├── Firewall? → iptables -L -n
└── Service running? → docker exec <c> curl localhost:<port>

Image won't BUILD?
├── Check Dockerfile syntax
├── Check build context (.dockerignore too aggressive?)
├── Layer caching issue → docker build --no-cache
├── Network issue during build → Check DNS in daemon.json
└── Disk space → docker system prune, docker builder prune
```

### [SCREEN: Common Issues & Fixes]

```bash
# ============================================
# COMMON DOCKER ISSUES & SOLUTIONS
# ============================================

# --- ISSUE 1: "port is already allocated" ---
# Solution: Find and stop what's using the port
lsof -i :8080
# or
docker ps --filter "publish=8080"

# --- ISSUE 2: "no space left on device" ---
docker system df                  # See what's using space
docker system prune -a --volumes  # Clean everything
docker builder prune --all        # Clean build cache

# --- ISSUE 3: "permission denied" while trying to connect ---
# Docker socket permission
sudo usermod -aG docker $USER
newgrp docker

# --- ISSUE 4: Container restarts in a loop ---
docker logs --tail 50 <container>
docker inspect --format='{{.State.ExitCode}}' <container>
# Run interactively to debug:
docker run -it --entrypoint /bin/sh <image>

# --- ISSUE 5: Volume mount empty ---
# On macOS/Windows: path must be in Docker Desktop's file sharing settings
# On Linux: check SELinux (:z or :Z flag)
docker run -v $(pwd):/app:z nginx

# --- ISSUE 6: DNS resolution not working ---
# Custom bridge network required!
docker network create mynet
docker run --network mynet --name app1 myapp
docker run --network mynet --name app2 myapp

# --- ISSUE 7: "Cannot connect to the Docker daemon" ---
# Check daemon is running
sudo systemctl status docker
sudo systemctl start docker

# Check socket permissions
ls -la /var/run/docker.sock

# --- ISSUE 8: Slow builds ---
# Check .dockerignore (are you copying node_modules?)
# Optimize layer ordering
# Use BuildKit: DOCKER_BUILDKIT=1 docker build .
# Use build cache
docker buildx build --cache-from type=registry,ref=myapp:cache .

# --- ISSUE 9: Container time is wrong ---
# Mount host timezone
docker run -v /etc/timezone:/etc/timezone:ro \
           -v /etc/localtime:/etc/localtime:ro \
           myapp

# Or set TZ environment variable
docker run -e TZ=Asia/Kolkata myapp

# --- ISSUE 10: "exec format error" ---
# Architecture mismatch (e.g., ARM image on x86)
# Build for correct platform:
docker buildx build --platform linux/amd64 .
```

---

## Docker Interview Questions (25 minutes)

### [SCREEN: "BONUS: Interview Questions"]

**[TALKING HEAD]**

"Let me cover the most frequently asked Docker interview questions. These range from basic to advanced — know all of these and you'll ace any Docker interview."

### [SCREEN: Q&A Format]

```
==============================================
BEGINNER LEVEL
==============================================

Q1: What is Docker and why do we use it?
A: Docker is a platform that packages applications with all their
   dependencies into containers. We use it for:
   - Consistent environments (dev = staging = prod)
   - Fast deployment and scaling
   - Resource efficiency (vs VMs)
   - Microservices architecture support
   - CI/CD pipeline standardization

Q2: What's the difference between a container and a VM?
A: VMs virtualize hardware (each has its own OS kernel, boots in
   minutes, uses GBs of disk). Containers virtualize the OS (share
   host kernel, start in milliseconds, use MBs of disk). Containers
   are processes with isolation, not mini operating systems.

Q3: What's the difference between an image and a container?
A: An image is a read-only template (like a class). A container
   is a running instance (like an object). You can create many
   containers from one image.

Q4: What is a Dockerfile?
A: A text file with instructions to build a Docker image.
   Each instruction creates a layer. Key instructions: FROM, RUN,
   COPY, WORKDIR, ENV, EXPOSE, CMD, ENTRYPOINT.

Q5: Difference between CMD and ENTRYPOINT?
A: CMD sets the default command that can be completely overridden.
   ENTRYPOINT sets the fixed executable — CMD then provides default
   arguments. Best practice: ENTRYPOINT for the executable,
   CMD for default arguments.

   ENTRYPOINT ["python"]
   CMD ["app.py"]
   → docker run myimage          = python app.py
   → docker run myimage test.py  = python test.py

Q6: Difference between COPY and ADD?
A: Both copy files into the image. ADD has extra features:
   auto-extracts archives and can download URLs. Best practice:
   Always use COPY unless you specifically need ADD's features.

Q7: What is Docker Compose?
A: A tool for defining and running multi-container applications
   using a YAML file. One command (docker compose up) creates
   all services, networks, and volumes.

Q8: How do you persist data in Docker?
A: Three ways:
   1. Volumes (Docker-managed, best for production)
   2. Bind mounts (host directory, best for development)
   3. tmpfs mounts (RAM, best for sensitive temporary data)

==============================================
INTERMEDIATE LEVEL
==============================================

Q9: Explain Docker networking.
A: Docker has several network drivers:
   - Bridge (default): Containers get private IPs, NAT to host
   - Host: Container shares host network (no isolation)
   - None: No networking
   - Overlay: Multi-host networking (Swarm/K8s)
   - Macvlan: Container gets MAC address, appears as physical device

   Custom bridge networks enable DNS-based service discovery.

Q10: What is a multi-stage build?
A: A Dockerfile with multiple FROM statements. Each FROM starts a
    new stage. You copy only needed artifacts from build stages
    to the final stage. This dramatically reduces image size.
    Example: Build stage has SDK (1GB) → Final stage has only
    runtime + binary (50MB).

Q11: How does Docker layer caching work?
A: Each Dockerfile instruction creates a layer. Docker caches layers.
   If an instruction and all previous layers haven't changed, the
   cached layer is reused. Once a cache miss occurs, ALL subsequent
   layers are rebuilt. Order instructions: least-changing first.

Q12: How do you make Docker images smaller?
A: 1. Use alpine/slim base images
   2. Multi-stage builds
   3. Combine RUN commands (fewer layers)
   4. Clean up in the same RUN layer
   5. Use .dockerignore
   6. Don't install unnecessary packages
   7. Use --no-cache-dir for pip

Q13: What are Docker health checks?
A: Instructions that tell Docker how to verify a container is
   healthy. Docker periodically runs the health check command.
   States: starting, healthy, unhealthy. Used by orchestrators
   for rolling updates and service discovery.

Q14: Explain the Docker build context.
A: The set of files sent to the Docker daemon for building.
   Defined by the path in `docker build .` (the dot is the context).
   Use .dockerignore to exclude files. Large contexts slow builds.

Q15: What's the best way to handle secrets in Docker?
A: Never in Dockerfile ENV or ARG (visible in image layers).
   Options: Docker secrets (Swarm), environment variables at
   runtime, secrets management tools (Vault, AWS SSM), or
   mounted secret files.

==============================================
ADVANCED LEVEL
==============================================

Q16: Explain Linux namespaces and how Docker uses them.
A: Namespaces provide isolation:
   - PID: Process isolation (container sees only its processes)
   - NET: Network isolation (own IP, ports, routes)
   - MNT: Filesystem isolation (own root filesystem)
   - UTS: Hostname isolation
   - IPC: Inter-process communication isolation
   - USER: User/group ID mapping (root in container ≠ root on host)
   - CGROUP: Cgroup visibility isolation
   Docker creates a new set of namespaces for each container.

Q17: Explain cgroups and how Docker uses them.
A: Control Groups limit resource usage:
   - CPU: cpu.shares, cpu.cfs_quota (--cpus flag)
   - Memory: memory.limit_in_bytes (--memory flag)
   - I/O: blkio limits
   - PIDs: max processes (--pids-limit)
   Docker creates a cgroup for each container with the specified
   limits. Exceeding memory limit → OOM kill.

Q18: What is OverlayFS and how does Docker use it?
A: OverlayFS is a union filesystem that layers directories:
   - LowerDir: Read-only image layers
   - UpperDir: Writable container layer
   - MergedDir: Unified view (what container sees)
   Uses Copy-on-Write: modifying a file copies it from lower to
   upper layer. Original image layers remain unchanged and shared.

Q19: How does Docker handle networking internally?
A: Bridge networking uses:
   1. veth pairs (virtual ethernet) connecting container to bridge
   2. docker0 bridge (or custom bridge) for L2 switching
   3. iptables NAT rules for port mapping
   4. iptables FORWARD rules for inter-container communication
   5. Embedded DNS server (127.0.0.11) for name resolution

Q20: Container security — what are the main attack vectors?
A: 1. Image vulnerabilities (unpatched CVEs)
   2. Container escape (kernel exploits, misconfigured caps)
   3. Docker socket exposure (= root on host)
   4. Secrets in images (exposed in layers)
   5. Privileged containers (disable all isolation)
   6. Network exposure (no segmentation)
   Mitigations: Non-root user, drop capabilities, read-only FS,
   seccomp profiles, image scanning, network policies.

Q21: Docker vs Podman — what are the differences?
A: Podman is daemonless (no background process), rootless by
   default, and CLI-compatible with Docker. It doesn't use a
   central daemon — each container is a child process. Podman
   also supports pods (groups of containers, like K8s pods).
   Docker needs a daemon running as root (by default).

Q22: How would you debug a container that keeps crashing?
A: Systematic approach:
   1. docker logs <container> — check application output
   2. docker inspect <container> — check State.ExitCode, OOMKilled
   3. docker events — see what happened
   4. Run interactively: docker run -it --entrypoint /bin/sh <image>
   5. Check resource limits: docker stats
   6. Check dependencies: network, DB connections
   7. Use docker diff to see filesystem changes
   8. Use nsenter or docker exec to inspect running state

Q23: Explain Docker image layer deduplication.
A: Image layers are identified by SHA256 content hash. If two
   images share identical layers, those layers are stored only
   once on disk. This applies across ALL images on the host.
   This is why using common base images (Alpine, Ubuntu) saves
   significant disk space and download time.

Q24: What happens during a docker build --no-cache?
A: Docker ignores all cached layers and rebuilds everything from
   scratch. Each RUN instruction executes again, each COPY
   re-copies files. Useful when: base image was updated, external
   dependencies changed (apt-get, pip install), or cache is
   corrupted.

Q25: Design a Docker deployment for a microservices application.
A: Key considerations:
   - One container per microservice
   - Custom bridge networks for service isolation
   - API gateway (Nginx/Traefik) as entry point
   - Shared logging (ELK/EFK stack)
   - Health checks on every service
   - Resource limits per container
   - Persistent volumes for stateful services
   - Secrets management (Vault)
   - Monitoring (Prometheus + Grafana)
   - CI/CD pipeline: build → test → scan → push → deploy
   - Rolling updates for zero-downtime deployment
```

---

## VIDEO OUTRO (3 minutes)

### [SCREEN: Summary Card]

**[TALKING HEAD]**

"And that's a wrap! Let me quickly summarize what we covered:

**Part 1 — Foundation:** We learned why containers exist, Docker's architecture, how to run containers, build images with Dockerfile, and manage data with volumes.

**Part 2 — Intermediate:** We mastered Docker networking, Docker Compose for multi-container apps, configuration management, debugging, and registries. We built a complete full-stack project.

**Part 3 — Advanced:** We went deep — multi-stage builds, security hardening, CI/CD pipelines, container internals with namespaces and cgroups, daemon tuning, and production best practices.

Here's my challenge to you:

1. **This week:** Containerize one of your existing projects
2. **Next week:** Add Docker Compose with a database and cache
3. **Week 3:** Set up a CI/CD pipeline that builds and deploys Docker images
4. **Week 4:** Security harden your containers and set up monitoring

If this video helped you, smash that like button and subscribe — I have more deep-dive tutorials coming. Drop a comment if you want a specific Docker topic covered in detail.

See you in the next one!"

### [SCREEN: End Card with Subscribe button + Links to other videos]

---

## Quick Reference Card

```
╔══════════════════════════════════════════════════════════════╗
║              DOCKER ESSENTIAL COMMANDS CHEATSHEET            ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  CONTAINERS:                                                 ║
║  docker run -d -p 8080:80 --name web nginx   # Run          ║
║  docker ps                                    # List running ║
║  docker ps -a                                 # List all     ║
║  docker stop <id>                             # Stop         ║
║  docker rm <id>                               # Remove       ║
║  docker logs -f <id>                          # Follow logs  ║
║  docker exec -it <id> bash                    # Shell into   ║
║  docker inspect <id>                          # Full details ║
║  docker stats                                 # Live metrics ║
║                                                              ║
║  IMAGES:                                                     ║
║  docker build -t myapp:v1 .                   # Build        ║
║  docker images                                # List         ║
║  docker pull nginx:1.25                       # Pull         ║
║  docker push myrepo/myapp:v1                  # Push         ║
║  docker tag img:v1 myrepo/img:v1              # Tag          ║
║  docker rmi <id>                              # Remove       ║
║  docker history <image>                       # Show layers  ║
║                                                              ║
║  VOLUMES:                                                    ║
║  docker volume create mydata                  # Create       ║
║  docker volume ls                             # List         ║
║  docker run -v mydata:/data nginx             # Use volume   ║
║  docker run -v $(pwd):/app nginx              # Bind mount   ║
║                                                              ║
║  NETWORKS:                                                   ║
║  docker network create mynet                  # Create       ║
║  docker network ls                            # List         ║
║  docker run --network mynet nginx             # Connect      ║
║                                                              ║
║  COMPOSE:                                                    ║
║  docker compose up -d                         # Start all    ║
║  docker compose down                          # Stop all     ║
║  docker compose logs -f                       # All logs     ║
║  docker compose ps                            # Status       ║
║  docker compose up -d --build                 # Rebuild      ║
║                                                              ║
║  CLEANUP:                                                    ║
║  docker system prune -a                       # Everything   ║
║  docker container prune                       # Containers   ║
║  docker image prune -a                        # Images       ║
║  docker volume prune                          # Volumes      ║
║  docker builder prune                         # Build cache  ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

---

*Script written for YouTube Masterclass — Total runtime: ~8-10 hours*
*Can be split into a playlist of 20 chapters + bonus content*
