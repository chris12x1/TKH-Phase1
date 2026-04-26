# TARGET THREAT PROFILE: CloudNano 
**Classification:** Passive Security Audit
**Operator:** ## 1. Subdomain Discovery 
* **Tool Used:** Sublist3r
* **Subdomains Found:** * api-gcp.credstore.yahoo.com
  * checkout.yahoo.com

## 2. Tech Stack Mapping 
* **Tool Used:** BuiltWith 
* **Identified Technologies (CMS/CDN/Backend):** * Yahoo DNS(Infrastructure/DNS)  
  * Yahoo Tag Manager(Tracking/Analystics)

## 3. Major Exposure Points & Dangers 
*(List three major exposure points discovered during your OSINT audit and explain why they are dangerous)*
1. **Exposed Credential Store:** If an API vulnerability exists here, an attack could potentially access encrypted user credentials or authentications tokens
2. **Financial Subdomains:** These pages handle sensitive payment data. A misconfiguration here could lead to financial data theft style skimming attacks. 
3. **Publicly Listed Subdomains:** By having 200 subdomains visible, the attack surface is huge. Every sub-domain is a potential "unlocked window" into the main network. 
