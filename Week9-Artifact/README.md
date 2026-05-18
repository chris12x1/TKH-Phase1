# Week 9 — Web Application Vulnerabilities, API Security & Chained Exploitation

🎯 **Objective**

Conduct a comprehensive full-stack security assessment of modern web environments. This week focused on identifying and exploiting OWASP Top 10 vulnerabilities—including SQL Injection, Stored/Reflected XSS, CSRF, and API BOLA—and implementing secure coding remediations to harden the application layer.

🛠️ **What I Built**

* **Engineered SQL Injection (SQLi) Exfiltration:** Leveraged tautology-based bypasses (`' OR 1=1 --`) to circumvent authentication gateways and mapped internal SQLite database schemas via UNION attacks.
* **Automated Sensitive Data Extraction:** Crafted advanced UNION SELECT payloads to enumerate the `sqlite_master` table and exfiltrate private financial data, including CEO-level salary information.
* **Executed Stored & Reflected XSS:** Injected malicious JavaScript payloads into persistent message boards and search fields to demonstrate DOM control and session hijacking capabilities.
* **Weaponized Cookie Theft:** Developed XSS scripts to steal `session_id` and `auth_token` cookies, proving how unencoded user input can lead to account takeover.
* **Crafted CSRF Forgery Attacks:** Built malicious hidden-image URLs (`<img src="...">`) designed to force authenticated users into performing unauthorized financial transfers silently.
* **Manipulated REST API Logic (BOLA):** Exploited Broken Object Level Authorization by intercepting and modifying API requests (ID Swapping) in Burp Suite to access unauthorized CISO profile data.
* **Automated Business Logic Brute-Forcing:** Utilized **Burp Suite Intruder** to execute a numerical attack on checkout API endpoints, successfully discovering a hidden "100% OFF" discount code.
* **TLAB: Operation Omni-Portal:** Chained three distinct attack vectors—SQLi for initial access, Stored XSS for session theft, and API BOLA for data exfiltration—to compromise a legacy corporate portal.

📂 **Artifacts**

* `sqli_report.txt` → Technical documentation of the database schema mapping and UNION-based salary exfiltration (Session 25).
* `xss_payloads.txt` → Audit log of Reflected/Stored XSS payloads and weaponized CSRF URLs for unauthorized fund transfers (Session 26).
* `api_audit.log` → Record of BOLA ID-swapping and Burp Intruder results for business logic exploitation (Session 27).
* `OmniPortal_Assessment.md` → Comprehensive assessment report detailing the full chained exploitation of the Titan Omni-Portal and providing source-code level remediations (TLAB 9).

💡 **What This Proves**

I can:
* **Identify Injection Flaws:** Recognize and exploit vulnerabilities where user input is improperly handled by backend databases or browsers.
* **Chain Attack Vectors:** Move beyond single-vulnerability testing to combine multiple exploits into a high-impact "kill chain."
* **Master Interception Proxies:** Use professional tools like **Burp Suite** to intercept, analyze, and manipulate live API traffic in real-time.
* **Audit API Security:** Verify that endpoints enforce strict object-level authorization (BOLA) and validate that business logic cannot be bypassed via brute-force.
* **Advocate for Secure Coding:** Provide actionable remediation advice, including **Parameterized Queries**, **Output Encoding**, and **Server-Side Authorization Checks**.

🚀 **Outcome**

Successfully audited four distinct web environments, transitioning from theoretical knowledge to validated practical exploitation:
* **Database Compromise:** Proved that improper input sanitization leads to total database exposure via SQLi.
* **Session Hijacking:** Demonstrated how persistent XSS can compromise administrative users and lead to unauthorized data access.
* **API Logic Hardening:** Discovered critical flaws in API authorization that allowed for the leakage of confidential order details and financial information.
* **End-to-End Remediation:** Documented professional-grade fixes for every vulnerability identified, ensuring the "Titan" infrastructure is protected against modern web threats.
