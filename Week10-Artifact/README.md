# Week 10 — Digital Forensics, Incident Response (DFIR) & SIEM Log Correlation

🎯 **Objective**

Conduct enterprise-level Digital Forensics and Incident Response (DFIR) operations across the entire breach lifecycle. This week focused on acting as the Lead Incident Responder—hunting active Command and Control (C2) threats via live host triage, cryptographically locking evidence to establish an ironclad Chain of Custody, parsing raw memory dumps, carving deleted payloads out of raw disk sectors, and leveraging an enterprise ELK SIEM stack to reconstruct multi-stage lateral movement and data exfiltration timelines.

🛠️ **What I Built / Investigated**

* **Executed Live Host Triage:** Accessing quarantined production environments via lightweight containers to trace volatile network states using native utilities (`netstat -antp`), successfully mapping suspicious open listening sockets (Port 4444) back to their parent process IDs (PIDs) and malicious binary names.
* **Established Forensic Chain of Custody:** Navigated secure evidence lockers containing raw file captures and generated cryptographic hashes (MD5 and SHA256) for system memory dumps and archived artifacts, securing digital evidence integrity against anti-forensic tampering.
* **Carved Volatile Memory Dumps:** Simulated advanced memory analysis tools on raw RAM image files (`memdump.raw`), utilizing targeted data strings pipelines (`strings | grep`) to bypass local OS hiding techniques and expose stealthy malicious processes running completely hidden from the user desktop space.
* **Reconstructed Deleted Files via Disk Autopsy:** Utilized forensic file-system tools from The Sleuth Kit (`fls -r`) to parse the Master File Table / Directory Structures of compromised drives, successfully identifying the exact inode allocation markers of deleted threat actor beacons marked with deletion flags (`*`).
* **Extracted Hidden Malware Payloads:** Weaponized the raw data viewer (`icat`) to target unallocated data blocks directly at the sector level, successfully carving out a deleted malicious `Resume.exe`/`beacon.exe` binary and capturing its embedded Command and Control infrastructure text strings.
* **Optimized & Fixed Lab Automation Scripts:** Enhanced the deployment shell scripts by integrating low-level kernel disk synchronization mechanisms (`sync`), guaranteeing that volatile filesystem buffers flush entirely to disk blocks to prevent data loss and ensure robust recovery validation.
* **Correlated Enterprise Logs via ELK SIEM:** Configured data view entry patterns (`enterprise_logs*`) within a centralized Elasticsearch/Kibana stack to aggregate thousands of security, firewall, and authentication events across a multi-server environment.
* **Reconstructed Multi-Stage Attack Timelines:** Performed advanced log aggregation to track an administrative compromise lifecycle: mapping initial password brute-forcing, pinning down lateral movement via Windows Security logs through compromised "Domain Admin" accounts, and quantifying data exfiltration sizes and timestamps from raw egress firewall records.
* **TLAB: Operation Phantom Pursuit:** Combined all three forensic disciplines—SIEM log correlation, live container network hunting, cryptographic evidence validation, and raw disk data carving—to compile a professional-grade Incident Response Report from scratch.

📂 **Artifacts**

* `collection_log.txt` → Digital evidence logging tracking live triage process identifications, program binaries on port 4444, and matching cryptographic verification hashes (Session 28).
* `forensic_findings.md` → Detailed threat intelligence document tracking memory-carved execution names, deleted file inode maps, and the extracted execution capabilities of recovered payloads (Session 29).
* `attack_timeline.csv` → Formatted spreadsheet matrix laying out the exact chronological attack path mapping Initial Access IPs, Windows lateral movement patterns, and outbound data volumes (Session 30).
* `Incident_Response_Report.md` → Complete capstone artifact charting the entire investigation chain of the TitanCorp network breach from initial SIEM alert verification to raw disk binary extraction (TLAB 10).

💡 **What This Proves**

I can:
* **Perform Live System Triage:** Interrogate a live, compromised production host to gather volatile network state configurations and track localized malware tracking metrics without contaminating system evidence.
* **Enforce Chain of Custody Standards:** Implement industrial security protocols by locking raw images down with cryptographic fingerprints, ensuring zero-repudiation and evidence admissibility in legal or corporate settings.
* **Carve Raw Data Media:** Reach beneath operating system abstraction limits using specialized utilities like **The Sleuth Kit** to systematically map file systems and pluck deleted threat components out of unallocated raw block clusters.
* **Navigate Enterprise SIEM Interfaces:** Architect and query data index layouts inside **Elasticsearch & Kibana** to isolate critical security indicators of compromise from massive multi-source datasets.
* **Track the Attacker Kill Chain:** Move beyond single log analysis to stitch together complex, multi-host log threads detailing Initial Access, Lateral Movement, Privilege Escalation, and Data Exfiltration.

🚀 **Outcome**

Successfully investigated three simulated corporate breach environments, moving from chaotic log files to an actionable, fully verified forensic conclusion:
* **Secured Volatile Evidentiary Footprints:** Tracked down living C2 network nodes, isolated their active processes, and preserved data structures using standard hashing workflows.
* **Defeated Anti-Forensic Deletion:** Proved that file-system deletion is merely an address-clearing mechanism by tracking down hidden inodes and reading payload code directly out of raw bytes.
* **Mapped Enterprise Breach Lifecycles:** Consolidated network firewall data and server authorization histories into a unified chronological map, identifying exactly what data was targeted and where security rings failed.
* **Maintained Defensible Technical Pipelines:** Standardized deployment tooling configurations across class peer nodes, ensuring precise simulation environments for reliable, repeatable security reporting.
