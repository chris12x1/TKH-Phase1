# Week 4 — Containerization, Orchestration & Secure Deployment

## 🎯 Objective
Design, deploy, and secure a **multi-tier containerized application stack** using Docker and Docker Compose, while enforcing **network segmentation and isolation** in a hybrid virtualized environment.

---

## 🏗️ Project: Operation Fortified Node (TLAB 4)

Built a **three-tier containerized architecture** (WordPress + MariaDB) alongside a **sandboxed legacy VM**, ensuring strict isolation between environments.

---

## 🛠️ Key Implementations

### 🔹 Container Orchestration
- Designed and deployed a **multi-container application stack** using Docker Compose
- Configured:
  - **WordPress (Web Tier)**
  - **MariaDB (Database Tier)**
- Implemented **persistent storage** using Docker volumes

### 🔹 Network Segmentation
- Created two isolated Docker networks:
  - `public_net` → exposes web service (port 80)
  - `private_net` → restricts database access (internal only)
- Ensured **database is not externally accessible**

### 🔹 Environment Hardening
- Identified and removed rogue container (`decoy_web`) occupying port 80
- Verified clean runtime environment before deployment
- Prevented unauthorized service exposure

### 🔹 Security Validation
- Performed port scanning using `nmap`:
  - Port 80 → Accessible (expected)
  - Port 3306 → Blocked (secured)
- Executed **container-to-VM isolation test**
  - Verified containers cannot reach host-only network
  - Confirmed proper network boundary enforcement

### 🔹 Automation & Deployment
- Built infrastructure using:
  - `docker-compose.yml`
  - Bash-based deployment workflows
- Enabled rapid, repeatable environment setup

---

## 📂 Artifacts

- `docker-compose.yml` → Defines full multi-tier architecture
- `deploy_web.sh` → Automated deployment script
- `sandbox_report.txt` → Environment documentation & validation
- `hyperstack_audit.json` → Machine-readable security audit report


---

## 🔍 Audit Highlights

- ✅ **Network segmentation enforced**
- ✅ **Database isolated from public access**
- ✅ **Persistent storage verified**
- ✅ **Unauthorized container removed**
- ✅ **Isolation test PASSED (no container → VM access)**

---

## 💡 What This Demonstrates

I can:

- Architect and deploy **containerized applications**
- Implement **secure network segmentation**
- Enforce **least-access principles in infrastructure**
- Perform **security validation and auditing**
- Automate deployments using **Docker + Bash**
- Design **production-style multi-tier environments**

---

## 🚀 Outcome

Successfully deployed a **secure, isolated, and production-style container environment**, demonstrating real-world skills in:

- DevOps engineering  
- Infrastructure security  
- Container orchestration  
- Network isolation  

This project reflects how modern organizations **secure applications at the infrastructure level**, not just the code level.
