# TITANCORP: PERIMETER ASSESSMENT REPORT
**Operator:** Christopher Diaz **Target Subnet:** 172.88.0.0/24

## PHASE 1: ACTIVE ENUMERATION (NMAP)
*(List the live IPs discovered and their running services/versions)*
* **Host 1 ([172.88.0.10]):** [http nginx 1.14.2]
* **Host 2 ([172.88.0.15]):** [N/A]
* **Host 3 ([172.88.0.20]):** [http apache httpd 2.4.66]

## PHASE 2: VULNERABILITY AUDIT (NIKTO)
*(Run Nikto against the TWO web servers discovered above. List one major finding for each.)*
* **Web Server 1 Finding:** [The anti-clickjacking X-Frame-Options header is not present]
* **Web Server 2 Finding:** [OSVDB-877: HTTP TRACE method is active, suggesting the host is vulnerable to XST]

## PHASE 3: RISK TRIAGE
*(Review your findings. Identify the SINGLE highest-risk vulnerability across the entire DMZ. Justify why it is the top priority using the Likelihood x Impact formula.)*

* **Top Priority Remediation:** [OSVDB-877]
* **Justification:** [The active HTTP TRACE method on 172.88.0.20 is the top priority because it has a high likelihood of exploitation in a web-facing environment and a high impact, as it allows attackers to bypass cookie security and steal user session credentials.]
