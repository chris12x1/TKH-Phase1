# Week 7 — Reconnaissance, Network Enumeration & Vulnerability Triage

🎯 **Objective**

Execute full-scope security assessments by combining passive OSINT, active network interrogation, and risk-based vulnerability triage to secure organizational perimeters and internal subnets.

🛠️ **What I Built**

*   **Conducted a Passive Security Audit** on target infrastructure using OSINT tools to map digital footprints without direct interaction.
*   **Identified exposed subdomains** and tech stack components using `Sublist3r`, `BuiltWith`, and `Wappalyzer`.
*   **Performed credential leak analysis** via `HaveIBeenPwned` to assess potential entry points for social engineering or stuffing attacks.
*   **Executed network-wide Ping Sweeps** using `nmap -sn` to identify live hosts within isolated `/24` subnets.
*   **Performed aggressive service version detection** (`nmap -sV`) to interrogate running software and identify legacy or vulnerable versions.
*   **Automated web security audits** using `Nikto` to flag missing security headers (X-Frame-Options) and dangerous HTTP methods (TRACE).
*   **Engineered a Remediation Plan** by triaging raw findings into the top 5 critical fixes based on **Risk = Likelihood x Impact**.
*   **Prioritized vulnerabilities** such as unauthenticated S3 buckets and SQL Injection over high-CVSS scores on air-gapped systems.
*   **Developed a professional Perimeter Assessment Report** documenting host enumeration, web audit findings, and strategic risk justifications.

📂 **Artifacts**

*   `ThreatProfile_CloudNano.md` → OSINT threat profile and passive reconnaissance findings (Session 19).
*   `nmap_scan_results.txt` → Network enumeration map with port/service version interrogations (Session 20).
*   `remediation_plan.md` → Strategic vulnerability triage and risk-based remediation roadmap (Session 21).
*   `Perimeter_Assessment.md` → Comprehensive assessment report for Operation Shadow Map (TLAB 7).

💡 **What This Proves**

I can:
*   **Execute stealthy reconnaissance** using industry-standard OSINT tools and methodologies.
*   **Map complex network topologies** and identify specific service versions via active scanning.
*   **Analyze web server configurations** for critical security gaps and misconfigurations.
*   **Think like a Lead Engineer** by prioritizing security patches based on actual business risk rather than just vulnerability scores.
*   **Document technical findings** in professional, CISO-ready reports with clear technical justifications.

🚀 **Outcome**

Successfully mapped unknown subnets and identified critical exposure points, resulting in a hardened security posture where:
*   **Hidden assets are discovered** and documented through structured enumeration.
*   **Vulnerability "noise" is filtered** to focus resources on the most impactful security threats.
*   **Risk-based decision making** ensures internet-facing and sensitive data stores are remediated first.
*   **The perimeter is assessed** for both technical flaws and high-level architectural weaknesses.
