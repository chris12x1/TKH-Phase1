# Week 8 — Exploitation, Privilege Escalation & Lateral Movement

🎯 **Objective**

Execute advanced penetration testing methodologies to gain initial access, escalate system privileges, and perform multi-tier network pivoting to discover and enumerate hidden internal assets.

🛠️ **What I Built**

*   **Automated Initial Access Exploitation:** Utilized the Metasploit Framework to weaponize `CVE-2007-2447` (Samba Usermap Script) and achieve unauthorized root shells.
*   **Engineered Persistence Mechanisms:** Deployed cron-based reverse shells that automatically re-establish command and control (C2) connections every 60 seconds.
*   **Executed Sudo-Based Privilege Escalation:** Identified misconfigured administrative binaries (`/usr/bin/find`) and utilized GTFOBins techniques to escape restricted shells.
*   **Performed Automated System Enumeration:** Used `LinPEAS` to identify high-probability vulnerabilities, including kernel exploits and vulnerable root-owned services.
*   **Weaponized Cron Job Wildcard Injections:** Poisoned `tar` commands to force the root user to execute custom payloads, granting SUID permissions to a persistent root shell.
*   **Architected a Multi-Tier Network Pivot:** Established a Meterpreter tunnel through a compromised public-facing web server to reach an isolated private subnet.
*   **Deployed a SOCKS5 Proxy Gateway:** Configured a SOCKS proxy within Metasploit to route external enumeration tools through established tunnels.
*   **TLAB: Operation Deep Pivot:** Combined persistence and lateral movement to interrogate hidden hosts (`10.0.10.50`) that were physically unreachable from the primary attack machine.

📂 **Artifacts**

*   `exploit_verification.png` → Proof of successful Samba exploitation and root access via Metasploit (Session 22).
*   `escalation_path.txt` → Technical documentation of the Sudo escape and Cron wildcard injection methodology (Session 23).
*   `pivot_success.png` → Evidence of lateral movement and discovery of a hidden network via proxychains (Session 24).
*   `Deep_Pivot_Report.md` → Comprehensive After-Action Report detailing the full attack chain from initial access to Redis database discovery on a restricted subnet (TLAB 8).

💡 **What This Proves**

I can:
*   **Automate Complex Exploits:** Use professional frameworks like Metasploit to gain footholds on vulnerable legacy systems.
*   **Think Like a Persistent Threat:** Establish backdoor access via cron jobs that survive session interruptions and reboots.
*   **Execute Vertical Escalation:** Identify and exploit system misconfigurations and administrative oversights in Linux environments.
*   **Master Lateral Movement:** Build technical "bridges" using SOCKS proxies and autorouting to move through multi-tiered network architectures.
*   **Conduct Advanced Troubleshooting:** Manage LHOST/RHOST configurations, proxy versioning (SOCKS4a/5), and network routing tables.

🚀 **Outcome**

Successfully transitioned from a limited external attacker to an internal administrator with full network visibility, resulting in:
*   **Total Compromise of Vulnerable Hosts:** Achieved through validated exploitation and privilege escalation paths.
*   **Discovery of Critical "Hidden" Data Stores:** Bypassed network air-gaps via authenticated pivoting to identify services like Redis on port 6379.
*   **Validated Persistence:** Compromised systems automatically re-establish connections, ensuring mission continuity even after accidental session closure.
*   **Professional Documentation:** Produced CISO-ready technical reports documenting the entire lateral movement and exploitation lifecycle.
