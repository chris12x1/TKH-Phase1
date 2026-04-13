# Week 4 — Containerization, Isolation & Secure Architecture

## 🎯 Objective
Design, deploy, and secure containerized environments using Docker while enforcing **strict isolation, network segmentation, and disposable infrastructure principles**.

---

## 🏗️ Projects Completed

### 1️⃣ Malware Sandbox (Secure VM Isolation)

**Goal:** Prevent malicious code from escaping a controlled environment.

#### 🔹 Implementation
- Reconfigured VM networking from **Bridged → Host-Only Adapter**
- Created a fully **air-gapped analysis environment**
- Executed controlled payload simulation inside sandbox

#### 🔹 Security Validation
- Performed external connectivity test:
  - `ping google.com` → ❌ FAILED (expected)
- Confirmed **no outbound internet access**

#### 🔹 Artifact
- `sandbox_report.txt`

#### 💡 What This Demonstrates
- Malware containment strategies  
- Hypervisor-level network isolation  
- Safe analysis environment design  

---

### 2️⃣ Disposable Web Server (Ephemeral Infrastructure)

**Goal:** Deploy and destroy a web server with zero persistence.

#### 🔹 Implementation
- Pulled and ran containers using Docker (`nginx`)
- Deployed web server with:
  - Port mapping (`8080 → 80`)
  - Named container (`training-web`)
- Modified live container content

#### 🔹 Security & Operations
- Inspected logs using `docker logs`
- Verified container isolation (`ps aux`)
- Fully removed container (no residual footprint)

#### 🔹 Artifact
- `deploy_web.sh`

#### 💡 What This Demonstrates
- Ephemeral infrastructure design  
- Container lifecycle management  
- Rapid deployment & teardown  

---

### 3️⃣ Air-Gapped Stack (Network Segmentation)

**Goal:** Separate application tiers using isolated networks.

#### 🔹 Implementation
- Built multi-service stack using Docker Compose:
  - WordPress (frontend)
  - Database (backend)
- Created two networks:
  - `frontend` → internet access
  - `backend` → internal only (`internal: true`)

#### 🔹 Security Validation
- WordPress container:
  - `ping google.com` → ✅ SUCCESS
- Database container:
  - `ping google.com` → ❌ FAILED

#### 🔹 Artifact
- `docker-compose.yml`

#### 💡 What This Demonstrates
- Network segmentation in container environments  
- Backend service isolation  
- Secure multi-tier architecture design  

---

### 4️⃣ Fortified Node (TLAB 4 — Capstone)

**Goal:** Deploy a production-style, secure container architecture with validation and audit reporting.

#### 🔹 Implementation
- Designed **three-tier architecture**:
  - WordPress (Web Tier)
  - MariaDB (Database Tier)
  - Isolated VM sandbox
- Created:
  - `public_net` (external access)
  - `private_net` (restricted backend)
- Implemented persistent storage (`db_data` volume)

#### 🔹 Environment Hardening
- Identified and removed rogue container (`decoy_web`)
- Cleared port conflicts before deployment

#### 🔹 Security Validation
- Conducted port scan:
  - Port 80 → ✅ Open
  - Port 3306 → ❌ Blocked
- Executed isolation test:
  - Container → VM communication → ❌ FAILED (secure)

#### 🔹 Audit & Reporting
- Generated machine-readable audit:
  - `hyperstack_audit.json`
- Captured:
  - Network isolation status
  - Container IDs
  - Host/VM relationships
  - Persistence verification

#### 🔹 Artifacts
- `docker-compose.yml`
- `hyperstack_audit.json`
- `sandbox_report.txt`

---

## 📂 Artifacts Summary

- `deploy_web.sh` → Container deployment automation  
- `docker-compose.yml` → Multi-tier architecture definition  
- `sandbox_report.txt` → Malware sandbox validation  
- `hyperstack_audit.json` → Security audit report  

---

## 🧠 Core Skills Demonstrated

- Containerization (Docker)
- Multi-container orchestration (Docker Compose)
- Network segmentation & isolation
- Secure infrastructure design
- Malware sandboxing
- Infrastructure validation & auditing
- Ephemeral system deployment


---

## 🚀 Outcome

Developed and secured multiple containerized environments demonstrating:

- Real-world **DevOps workflows**
- Practical **cybersecurity controls**
- Production-style **infrastructure design**

This week reflects the ability to **not just deploy systems — but secure and validate them**.
