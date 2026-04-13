# Week 1 — Linux Security Foundations

## 🎯 Objective
Establish foundational Linux security skills by performing system enumeration, permission hardening, and log-based threat detection.

---

## 🛠️ What I Did

- Conducted filesystem reconnaissance by navigating the Linux FHS to locate sensitive system data and hidden artifacts
- Extracted restricted information from protected directories, simulating post-exploitation discovery techniques
- Identified and remediated critical permission misconfigurations, including insecure access to `/etc/shadow`
- Developed command-line pipelines to detect malicious activity within log files using `grep`, `awk`, and `sort`
- Performed incident cleanup on a compromised system by restoring access controls and extracting forensic evidence

---

## 📂 Artifacts

- `discovery.txt` → Filesystem reconnaissance and extracted secrets 
- `final_threat_report.txt` → Clean forensic report from compromised logs
- `harden.sh` → Automated system hardening script  
- `threat_ips.txt` → Attacker IP list  

---

## 💡 What This Proves

I can:
- Ability to audit and navigate Linux systems securely
- Understanding of file permissions and access control vulnerabilities
- Experience extracting indicators of compromise (IOCs) from logs
- Hands-on incident response and forensic data handling

---

## 🚀 Outcome

Secured a compromised Linux environment by correcting critical permission flaws, identifying attacker activity, and producing validated forensic artifacts.
