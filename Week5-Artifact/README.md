# Week 5 — Enterprise Identity & Active Directory

## 🎯 Objective
Design, implement, and validate enterprise identity infrastructure using Active Directory, Group Policy, and cross-platform authentication between Windows and Linux systems.


---

## 🛠️ What I Built

- Promoted a Windows Server to a Domain Controller and deployed a new Active Directory forest (`titan.local`)
- Designed and implemented Organizational Unit (OU) structures to logically group enterprise users (Engineering OU)
- Automated user provisioning at scale using PowerShell scripting (`New-ADUser`) for consistent onboarding
- Configured and enforced security policies using Group Policy Objects (GPOs), targeting specific OUs
- Validated GPO enforcement using `gpupdate /force` and system-level verification
- Integrated a Linux (Ubuntu) system into the Active Directory domain using `realmd` and `sssd`
- Configured DNS and Kerberos authentication to enable successful domain discovery and join
- Established cross-platform administrative control by mapping the **Domain Admins** group to Linux sudo privileges
- Configured `/etc/sudoers.d/domain_admins` to allow centralized privilege escalation from Active Directory

---

## 📂 Artifacts

- `onboard_engineers.ps1` → Automated user provisioning script  
- `onboard_engineers_proof_*.png` → Proof of successful account creation  
- `gpo_audit.txt` → Group Policy enforcement and validation report (Session 14)  
- `unified_identity.png` → Domain authentication and root privilege proof (Session 15)  
- `tlab5_report.txt` → Final enterprise audit report validating full environment

---

## 💡 What This Proves

I can:
- Deploy and manage **Active Directory environments**
- Automate identity provisioning using **PowerShell**
- Enforce and validate **Group Policy security controls**
- Integrate **Linux systems into Windows domains**
- Configure **cross-platform authentication (Kerberos / SSSD)**
- Implement **centralized privilege escalation using domain groups**
- Perform **full environment validation through auditing and reporting**
  
---

## 🚀 Outcome

Built and validated a fully functional enterprise identity environment where:

- Active Directory centrally manages authentication and access control  
- Users are provisioned automatically and organized within OUs  
- Security policies are enforced across the domain via GPOs  
- Linux systems authenticate using domain credentials  
- Domain Admins have controlled root access on Linux systems  
- A full audit (TLAB 5) confirms domain health, identity structure, GPO enforcement, and system integration  

End-to-end enterprise identity lifecycle successfully deployed, enforced, and validated.
