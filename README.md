# 🛡️ Advanced Cybersecurity Engineering Portfolio — Christopher Diaz

Hands-on cybersecurity engineering portfolio demonstrating real-world experience in **multi-layer system hardening, penetration testing, digital forensics, security automation, and enterprise defense-in-depth infrastructure**.

This repository reflects comprehensive, scenario-based labs simulating **real-world advanced persistent threats (APT), enterprise infrastructure failures, application-layer exploits, and incident response lifecycles**.

---

## 👨‍💻 About Me

Cybersecurity-focused Systems & Security Engineer with hands-on experience designing, compromising, and defending complex Linux, Windows, and containerized cloud networks. 

Skilled in:
- **Offensive Security & Penetration Testing** — Web application exploitation (OWASP Top 10), privilege escalation, and lateral movement.
- **Defensive Engineering & Hardening** — Kernel-level firewalls (`iptables`/UFW), custom IDS deployment, and host-based EDR engineering.
- **Digital Forensics & Incident Response (DFIR)** — Volatile memory carving, low-level disk sector data carving, and SIEM timeline reconstruction.
- **Security Scripting & Automation** — Developing programmatic log parsers, network scanners, and system monitors in Python, Bash, and PowerShell.
- **Enterprise Infrastructure & Architecture** — Active Directory identity domains, multi-tier container networks, and secure DMZ routing topology.

---

## 🧰 Technologies & Tools

**Operating Systems**
- Linux (Ubuntu, Kali Linux)
- Windows Server 2022

**Defensive & Forensic Tooling**
- Centralized SIEM Architecture (Elasticsearch, Kibana, ELK Stack)
- Intrusion Detection Systems (Suricata IDS)
- Endpoint Detection & Response (Sysmon / SysmonForLinux)
- The Sleuth Kit (`fls`, `icat`) & Advanced Memory Diagnostics

**Networking & Perimeter Control**
- Stateful Kernel Firewalls (`iptables`), Uncomplicated Firewall (UFW)
- Core Protocols: TCP/IP (Handshake Analysis), DNS, Routing, CIDR Subnetting
- Network Diagnostics & Traffic Interception: `nmap`, Burp Suite, SOCKS5 Proxies

**Programming & Infrastructure Automation**
- Python, Bash Shell Scripting, PowerShell Core
- Containerized Architecture: Docker & Docker Compose

---

## 📂 Repository Structure

The engineering artifacts and technical documentation within this repository are structured chronologically by operational focus:

*   [**`Week1-Artifact/`**](./Week1-Artifact) → Linux security foundations, file system permissions, and baseline defensive automation.
*   [**`Week2-Artifact/`**](./Week2-Artifact) → OSI-layer network diagnostics, gateway recovery, and CIDR subnet design.
*   [**`Week3-Artifact/`**](./Week3-Artifact) → Python-driven threat intelligence automation, port scanners, and real-time auth log parsing.
*   [**`Week4-Artifact/`**](./Week4-Artifact) → Multi-tier containerized architecture security and frontend/backend microservice isolation.
*   [**`Week5-Artifact/`**](./Week5-Artifact) → Active Directory domain integration, automated IAM provisioning, and enterprise GPO enforcement.
*   [**`Week6-Artifact/`**](./Week6-Artifact) → Cross-layer infrastructure troubleshooting, SSH security auditing, and formal Security Architecture Design (SAD).
*   [**`Week7-Artifact/`**](./Week7-Artifact) → Active perimeter reconnaissance, port/service version interrogation, and risk-adjusted vulnerability triage.
*   [**`Week8-Artifact/`**](./Week8-Artifact) → Vulnerability weaponization, persistent backdoor construction, privilege escalation, and SOCKS5 subnet pivoting.
*   [**`Week9-Artifact/`**](./Week9-Artifact) → Web application vulnerability chaining (SQLi, XSS, CSRF) and API Broken Object Level Authorization (BOLA) exploitation.
*   [**`Week10-Artifact/`**](./Week10-Artifact) → Live volatile triage, cryptographic evidence handling, raw disk block data carving, and ELK SIEM attack timeline analysis.
*   [**`Week11-Artifact/`**](./Week11-Artifact) → Triple-tier Defense-in-Depth architecture engineering incorporating firewalls, network IDS signatures, and host EDR policies.
*   [**`Week12-Artifact/`**](./Week12-Artifact) → Comprehensive final phase post-mortem documentation, service hardening, and complete structural repository audit.

---

## 📌 Featured Engineering Milestones

### 🪓 1. Multi-Tiered Defense-in-Depth Engineering (Week 11 & 12)
*   **Perimeter Firewalls:** Deployed kernel-level `iptables` rule-sets inside secure DMZ zones to enforce strict egress traffic parameters, dropping all unauthorized traffic directed at internal subnets (`10.0.5.0/24`) and database hubs (`10.0.5.50:3306`).
*   **Network Intrusion Detection (IDS):** Authored customized signature profiles inside **Suricata** to identify application exploit attempts, generating high-priority tracking alerts for automated ICMP sweeps and unauthorized layer-7 malicious User-Agent signatures (`Ghost_Scanner_v1`).
*   **Host Endpoint EDR Policies:** Architected and loaded custom XML detection schemas via **Sysmon** to trace volatile process behaviors, capturing unauthorized volume operations and precursor ransomware events (`delete shadows`).

### 🩻 2. Digital Forensics & SIEM Incident Response (Week 10)
*   **Volatile Memory & Disk Carving:** Interrogated raw memory dumps (`memdump.raw`) using low-level string extractions, and parsed raw file-system media blocks using The Sleuth Kit (`fls -r`, `icat`) to defeat anti-forensic deletions and pluck active malware payloads (`Resume.exe`) directly from unallocated sectors.
*   **ELK SIEM Threat Hunting:** Standardized telemetry aggregation schemas inside Elasticsearch and Kibana to process thousands of distributed server events, mapping active host brute-forcing vectors, lateral Active Directory pivots utilizing compromised Domain Admin accounts, and outbound data exfiltration thresholds.

### 🌪️ 3. Full-Stack Web Application & API Chained Exploitation (Week 9)
*   **Vulnerability Chaining:** Orchestrated an end-to-end compromise chain against corporate internal portals by combining tautology-based SQL Injection (`' OR 1=1 --`) authentication bypasses, database schema mapping via advanced `UNION SELECT` extractions, and persistent Stored XSS session-hijacking.
*   **API Security & Business Logic Auditing:** Utilized Burp Suite to analyze, manipulate, and execute ID Swapping requests to uncover Broken Object Level Authorization (BOLA) defects, and executed parameter manipulations via Burp Intruder to compromise back-end transactional logic.

### ⛓️ 4. Privilege Escalation, Lateral Movement & Pivoting (Week 8)
*   **Vertical Privilege Escalation:** Executed low-level exploitation vectors via Metasploit, establishing automated persistent cron-job reverse shells and executing shell escapes utilizing misconfigured binaries via GTFOBins (`/usr/bin/find`).
*   **Subnet Pivoting:** Engineered tactical proxies within compromised internet-facing nodes, using automated routing rules and SOCKS5 proxy gateways to tunnel scanning utilities into air-gapped, isolated database networks.

---

## 📊 Core Verified Artifact Summary

| Functional Focus | Core Artifact Reference | Technical Impact Description |
| :--- | :--- | :--- |
| **Defensive Engineering** | [`firewall_config.sh`](./Week11-Artifact/firewall_config.sh) | Scripted stateful access rules, default-deny postures, and automated DMZ network routing controls. |
| **Detection Engineering** | [`custom_ids.rules`](./Week11-Artifact/custom_ids.rules) | Optimized Suricata signatures tracking network scanning sweeps and application-layer signature profiles. |
| **Endpoint Security** | [`edr_policy.xml`](./Week11-Artifact/edr_policy.xml) | Target XML configuration file isolating malicious PowerShell behaviors and ransomware volume modification attempts. |
| **Security Architecture**| [`HardenedOutpost_SAD.pdf`](./Week6-Artifact/HardenedOutpost_SAD.pdf)| Comprehensive architectural design plan mapping secure network topology configurations and host-based access controls. |
| **Vulnerability Assessment**| [`OmniPortal_Assessment.md`](./Week9-Artifact/OmniPortal_Assessment.md)| Forensic auditing ledger detailing multi-stage web application exploits and source-code level parameterized remediation strategies. |
| **Digital Forensics** | [`Incident_Response_Report.md`](./Week10-Artifact/Incident_Response_Report.md)| Industrial-grade DFIR report detailing memory string extraction, disk block sector manipulation, and core SIEM log correlation. |
| **System Automation** | [`incident_response.py`](./Week3-Artifact/incident_response.py) | Dynamic Python processing engine parsing live server authentication logs to extract real-time brute-force attacker footprints. |
| **Identity & IAM** | [`onboard_engineers.ps1`](./Week5-Artifact/onboard_engineers.ps1)| Scripted PowerShell Core configuration tool automating Active Directory object generation and asset group access mappings. |

---

## 🎯 Career Objective

Highly technical, hands-on cybersecurity practitioner looking to join an enterprise security team as a **Cybersecurity Analyst / SOC Analyst / Detection Engineer / Junior Incident Responder**. Ready to deploy strong practical experience in live network defense, automated script mitigation, forensic tool exploitation, and enterprise threat detection architecture to secure production assets.

---

## 📬 Let’s Connect

*   **GitHub Repository:** [github.com/chris12x1](https://github.com/chris12x1)
*   **Professional LinkedIn:** [linkedin.com/in/christopherdiaz87](https://linkedin.com/in/christopherdiaz87)
