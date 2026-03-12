# Week1-Artifact README.md (Inside `Week1-Artifact` Folder)

# Phase 1 — Week 1 Artifacts
The Knowledge House — Innovation Fellowship

---

## Artifact Overview

This folder contains all **Week 1 lab artifacts** for Phase 1:

1. `discovery.txt` — Linux navigation and filesystem scavenger hunt  
2. `harden.sh` — Access control automation script  
3. `threat_ips.txt` — Stream editing and attack log analysis

---

## discovery.txt — The Scavenger Hunt

**Objective:** Map the filesystem, navigate restricted directories, and extract hidden system intel.

**Core Commands Reference:**

| Command | Name | Analogy | Example |
|---------|------|---------|---------|
| pwd     | Print Working Directory | "Where am I right now?" | `pwd` |
| ls      | List | "Turn on the lights." | `ls -la` |
| cd      | Change Directory | "Move to another room." | `cd /etc` |
| mkdir   | Make Directory | "Build a cardboard box." | `mkdir mission_alpha` |
| touch   | Touch | "Create an empty sheet of paper." | `touch notes.txt` |
| cat     | Read | "Read the paper aloud." | `cat /etc/os-release` |

**Lab Workflow:**

```
cd ~
curl -sL https://gist.githubusercontent.com/grobbins-cell/0aaa074ff77fca0b4cb8e097820d970a/raw/07abd5680a7db4a57e050594f35baf6a9ec03c48/setup_lab_01.sh | bash
cd /var/log
ls
cd /opt/alpha
cat mission.txt
cd /var/tmp
ls -la
cd .blackout
cat token.txt

```

Artifact Creation:

cd ~
nano discovery.txt
# Enter collected intel (paths and secrets)

harden.sh — Access Control Matrix

Theme: The Keymaster — Who can touch files

Phase 1 — The Lockout:

```

cd ~/Vault       # Permission denied
ls -ld ~/Vault   # d---------
chmod 700 ~/Vault
cat ~/Vault/secrets.txt   # Permission denied
chmod 600 ~/Vault/secrets.txt

```

Phase 2 — Identity Crisis:

```

ls -l /etc/shadow
sudo chmod 640 /etc/shadow
sudo chown root:shadow /etc/shadow

```

Extra Verification (Beyond Standard):

```

ls -l | grep Vault
ls -l ~/Vault | grep secrets
ls -l /etc/shadow | grep shadow

```

threat_ips.txt — Stream Editing & Automation

Theme: The Holy Trinity — grep, sed, awk

Workflow Example:

# Identify failed passwords
cat auth.log | grep "Failed password" | wc -l

# Find unique attacker IPs from SQL Injection logs
grep "UNION SELECT" access.log | awk '{print $1}' | sort | uniq > threat_ips.txt

Submission Notes

All artifacts were submitted via the fellowship session-submit commands:

session-submit --session 01 --artifact ~/discovery.txt
session-submit --session 02 --artifact ~/harden.sh
session-submit --session 03 --artifact ~/threat_ips.txt

References

Chapple, M., Stewart, J. M., & Gibson, D. (2021).
ISC2 CISSP Certified Information Systems Security Professional Official Study Guide (9th ed.).

NIST. (2022).
NICE Cybersecurity Workforce Framework (NIST SP 800-181r1).



