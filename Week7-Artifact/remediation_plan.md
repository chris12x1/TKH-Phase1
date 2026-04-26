# CLOUDNANO REMEDIATION PLAN
**Operator:** ## TOP 5 CRITICAL FIXES
*(From the 10 raw findings, select the 5 that pose the greatest ACTUAL risk. Explain your reasoning.)*

1. **[CVSS 9.8] Unauthenticated AWS S3 Bucket (Contains Customer PII)**
   * **Justification:** This is a direct leak of customer PII, massive legal/GRC failure. The reason why the CVSS 10 Default credentials on internal router was not #1 because it is an air-gapped network with no physical access.

2. **[CVSS 8.1] SQL Injection in Login Page (Customer Database Portal)**
   * **Justification:** Massive exfiltration of customer credentials and database records.

3. **[CVSS 9.8] Remote Code Execution in Apache Struts (Internet Facing Web Server)**
   * **Justification:** Total server takeover and foothold for lateral movement.

4. **[CVSS 9.0] SMBv1 Enabled (Internal HR File Server)**
   * **Justification:** HR data theft and likely entry point for ransomware.

5. **[CVSS 8.8] Cross-Site Scripting (XSS) on Support Forum**
   * **Justification:** Session hihacking of forum users, though less critical than direct DB access.


1.  [CVSS 9.8] Remote Code Execution in Apache Struts (Internet Facing Web Server)
2.  [CVSS 10.0] Default Credentials on Internal Router (Air-gapped network, no physical access)
3.  [CVSS 7.5] Outdated PHP Version 5.4 (Public Marketing Blog)
4.  [CVSS 8.1] SQL Injection in Login Page (Customer Database Portal)
5.  [CVSS 5.3] Missing HTTP Strict Transport Security (HSTS) Header
6.  [CVSS 9.0] SMBv1 Enabled (Internal HR File Server)
7.  [CVSS 4.3] Directory Listing Enabled (Internal Wiki)
8.  [CVSS 8.8] Cross-Site Scripting (XSS) on Support Forum
9.  [CVSS 3.1] TLS 1.0 Supported (Legacy Mail Server)
10. [CVSS 9.8] Unauthenticated AWS S3 Bucket (Contains Customer PII)
