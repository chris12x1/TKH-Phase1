# Week 8 — Exploitation, Privilege Escalation & Lateral Movement

🎯 **Objective**

Execute advanced penetration testing methodologies to gain initial access, escalate system privileges, and perform multi-tier network pivoting to discover and enumerate hidden internal assets.

🛠️ **What I Built**

*   **Automated Initial Access Exploitation** utilizing the Metasploit Framework to weaponize `CVE-2007-2447` (Samba Usermap Script) and achieve unauthorized root shells.
*   **Engineered Persistence Mechanisms** by deploying cron-based reverse shells that automatically re-establish command and control (C2) connections every 60 seconds.
*   **Executed Sudo-Based Privilege Escalation** by identifying misconfigured administrative binaries (`/usr/bin/find`) and utilizing GTFOBins techniques to escape restricted shells.
*   **Performed Automated System Enumeration** using `LinPEAS` to identify high-probability vulnerabilities, including kernel exploits and vulnerable root-owned services.
*   **Weaponized Cron Job Wildcard Injections** to poison `tar` commands, forcing the root user to execute custom payloads and grant SUID permissions to a persistent root shell.
*   **Architected a Multi-Tier Network Pivot** by establishing a Meterpreter tunnel through a compromised public-facing web server to reach an isolated private subnet.
*   **Deployed a SOCKS5 Proxy Gateway** within the Metasploit Framework to route external enumeration tools through established tunnels.
*   **Conducted "Deep Network" Reconnaissance** using `proxychains` and `nmap` to interrogate hidden hosts (`10.0.10.50`) that were physically unreachable from the primary attack machine.

📂 **Artifacts**

*   `exploit_verification.png` → Proof of successful Samba exploitation and root access via Metasploit (Session 22).
*   `escalation_path.txt` → Technical documentation of the Sudo escape and Cron wildcard injection methodology (Session 23).
*   `pivot_success.png` → Evidence of lateral movement and discovery of hidden Redis database on a private subnet (Session 24).

💡 **What This Proves**

I can:
*   **Automate Complex Exploits** using professional frameworks like Metasploit to gain footholds on vulnerable legacy systems.
*   **Think Like a Persistent Threat** by establishing backdoor access via cron jobs that survive session interruptions.
*   **Execute Vertical Escalation** by identifying and exploiting system misconfigurations and administrative oversights in Linux environments.
*   **Master Lateral Movement** by building technical "bridges" using SOCKS proxies and autorouting to move through multi-tiered network architectures.
*   **Conduct Advanced Troubleshooting** by managing LHOST/RHOST configurations, proxy versioning (SOCKS4a/5), and network routing tables.

🚀 **Outcome**

Successfully transitioned from a limited external attacker to an internal administrator with full network visibility, resulting in:
*   **Total Compromise of Vulnerable Hosts** through validated exploitation and privilege escalation paths.
*   **Discovery of Critical "Hidden" Data Stores** by bypassing network air-gaps via authenticated pivoting to identify services like Redis.
*   **Validated Persistence** where compromised systems automatically re-establish connections, ensuring mission continuity.
*   **Professional Documentation** of the attack chain, providing clear evidence of technical mastery for stakeholder review.
