# Week 11 — Perimeter Hardening, Intrusion Detection (IDS) & Host-Based EDR Deployed

🎯 **Objective**

Implement an enterprise-grade Defense-in-Depth (DiD) security architecture across isolated production server clusters. This week focused on engineering three independent layers of defensive mitigation to prevent, detect, and isolate multi-stage threat actor movements. Operations involved configuring stateful kernel firewalls (`iptables`) and Uncomplicated Firewalls (UFW) to enforce strict network-layer isolation, developing custom signature-based rules inside the Suricata Intrusion Detection System (IDS) to trap application-layer exploits, and deploying System Monitor (`SysmonForLinux`) to audit host process telemetry and intercept ransomware precursors.

🛠️ **What I Built / Engineered / Hardened**

* **Enforced Default-Deny Perimeters via UFW:** hardended containerized DMZ web server instances (`dmz_web`) by implementing a baseline structural "Default Deny" network configuration, selectively whitelisting only essential service vectors on port 22/tcp (SSH) and port 443/tcp (HTTPS).
* **Restricted Lateral Subnet Traversals via iptables:** Engineered granular network-layer constraints inside the Linux kernel to eliminate malicious pivot paths, granting inbound internet transit to port 80 and port 443 while isolating internal database arrays (`10.0.5.50:3306`) and dropping all other unauthorized outbound traffic attempting to reach the internal subnet (`10.0.5.0/24`).
* **Designed Network-Layer ICMP Signatures:** Authored low-level detection rules within the Suricata IDS framework to flag unauthorized network discovery mapping campaigns, alerting administrators to inbound ICMP ping sweeps targeting core assets (`172.90.0.10`).
* **Trapped Application Malware Identifiers:** Engineered robust layer-7 application signatures to detect malicious string footprints, tracking hardcoded TCP traffic headers on port 80 containing specialized threat actor User-Agent signatures (`Ghost_Scanner_v1`) to expose active scanning tooling.
* **Audited Obfuscated PowerShell Processes:** Initialized endpoint detection layers natively across Linux hosts, using Sysmon Event ID 1 (Process Creation) logs to expose hidden background execution activities and isolate malicious child processes triggered by macro utilities (`invoice_macro.ps1`).
* **Mitigated Precursor Ransomware shadow deletion:** Deployed customized EDR detection configurations using XML rule matching to intercept active storage manipulation commands, trapping unauthorized attempts to wipe volume files via programmatic shadow copy purge scripts (`delete shadows`).
* **Engineered Multi-Tiered Egress Filtering Rules:** Constructed defensive script blocks (`firewall_task.sh`) designed to systematically block all outbound communication targeting malicious Command and Control (C2) address pools (`198.51.100.0/24`).
* **Assembled Comprehensive Defense-in-Depth Telemetry:** Formulated a full-spectrum security assessment matrix (`Operation_Fortress_Report.md`) detailing the integration of egress connection dropping, Suricata signature trapping (`cmd=whoami`), and EDR process tracking (`curl http://198.51.100.5`) to establish resilient system rings.

📂 **Artifacts**

* `firewall_config.sh` → Complete shell automation binary storing stateful network access rules, default-deny postures, and database egress restrictions (Session 31).
* `custom_ids.rules` → Configured signature file containing optimized Suricata identification rules for tracking ICMP ping probes and application-layer malware scanner patterns (Session 32).
* `edr_policy.xml` → Hardened Sysmon monitoring policy structure containing exact XML filter elements designed to catch ransomware process manipulation strings (Session 33).
* `Operation_Fortress_Report.md` → Multi-layered Defense-in-Depth technical report documenting synchronized configuration matrices across firewall, IDS, and host endpoint layers (TLAB 11).

💡 **What This Proves**

I can:
* **Architect Layered Defense-in-Depth Postures:** Move beyond single points of failure by structuring independent network, transport, and host protection rings that act as automated fail-safes for one another.
* **Isolate Network DMZ Segmentation Boundaries:** Restrict critical lateral asset traversal by manipulating kernel-level firewall arrays, ensuring compromised DMZ web servers cannot map or target backend database architectures.
* **Deploy and Target Enterprise IDS Sensors:** Develop, ingest, and reload custom signature rules within live engine instances (**Suricata**) to parse transport packets and catch indicators of compromise (IOCs) across network zones.
* **Audit Volatile Endpoint Process Invocations:** Leverage Linux kernel tracing utilities (**Sysmon**) to look past execution abstractions, isolating suspicious obfuscated child processes and command-line parameters in real time.
* **Write Production-Ready Detection Engineering Logic:** Translate complex threat intelligence indicators—such as C2 network brackets, specific exploit payloads, or malicious User-Agent strings—into formal detection patterns.

🚀 **Outcome**

Successfully built, verified, and pushed an entirely locked-down security architecture across all Week 11 production simulation networks:
* **Neutralized Network Lateral Excursions:** Wrapped the application perimeter in stateful iptables constraints, shutting down data exploration capabilities while maintaining legitimate application communications.
* **Exposed Hidden Malware Signatures:** Confirmed proper alert matching parameters for network-layer sweeps and custom browser-spoofed malware strains across local segment wires.
* **Trapped High-Impact Ransomware Techniques:** Established complete process visibility on host systems, configuring precise file alerts capable of stopping server data encryption attempts before execution.
* **Validated Secure Version Control Workflows:** Committed all functional configuration scripts, rule layouts, and master project records cleanly using structured Git commands to maintain a verified repository trail.
