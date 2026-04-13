# Week 4 — Containerization & Secure Deployment

## 🎯 Objective
Design and secure containerized application environments using isolation, segmentation, and automated deployment.

---

## 🛠️ What I Built

- Engineered a malware analysis sandbox by configuring a host-only network, ensuring complete isolation from external systems
- Deployed a disposable web server using Docker, enabling rapid provisioning and full teardown to eliminate persistence risks
- Built a multi-container architecture using Docker Compose to simulate real-world application and database separation
- Implemented frontend/backend network segmentation, restricting sensitive services from internet exposure
- Validated containment controls by confirming restricted outbound connectivity in isolated containers
- Automated container deployment workflows using Bash scripting
  
---

## 📂 Artifacts

- `deploy_web.sh` → Automated Docker deployment script
- `docker-compose.yml` → Multi-container segmented architecture
- `hyperstack_audit.json` → Container environment security audit  
- `sandbox_report.txt` → Air-gapped malware sandbox validation

---

## 💡 What This Proves

I can:
- Ability to design secure containerized environments
- Understanding of network segmentation and isolation strategies
- Experience deploying multi-tier application architectures
- Capability to automate infrastructure deployment
  
---

## 🚀 Outcome

Deployed a segmented containerized application stack with enforced isolation controls, reducing attack surface and validating secure service communication boundaries.
