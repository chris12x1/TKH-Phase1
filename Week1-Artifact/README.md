# Phase 1 — Week 1 Artifacts
The Knowledge House — Innovation Fellowship

---

## Artifact Overview

This folder contains all **Week 1 lab artifacts** for Phase 1:

1. `discovery.txt` — Linux navigation and filesystem reconnaissance  
2. `harden.sh` — Access control remediation script  
3. `threat_ips.txt` — Log analysis and attack IP extraction  
4. `final_threat_report.txt` — Incident response forensic report (TLAB-01)

---

## discovery.txt — The Scavenger Hunt

**Objective:** Map the filesystem, navigate restricted directories, and extract hidden system intelligence.

**Core Commands Reference:**

| Command | Name | Analogy | Example |
|--------|------|--------|--------|
| pwd | Print Working Directory | "Where am I right now?" | `pwd` |
| ls | List | "Turn on the lights." | `ls -la` |
| cd | Change Directory | "Move to another room." | `cd /etc` |
| mkdir | Make Directory | "Build a cardboard box." | `mkdir mission_alpha` |
| touch | Touch | "Create an empty sheet of paper." | `touch notes.txt` |
| cat | Read | "Read the paper aloud." | `cat /etc/os-release` |

---

### Lab Workflow

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

### Artifact Creation

```
cd ~
nano discovery.txt
```

Collected intelligence such as discovered file paths and system tokens were documented in the artifact file.

---

## harden.sh — Access Control Matrix

**Theme:** *The Keymaster — Managing file access permissions.*

### Phase 1 — The Lockout

```
cd ~/Vault       # Permission denied
ls -ld ~/Vault   # d---------
chmod 700 ~/Vault
cat ~/Vault/secrets.txt   # Permission denied
chmod 600 ~/Vault/secrets.txt
```

This phase restored proper directory permissions so the Vault directory could be accessed securely.

---

### Phase 2 — Identity Crisis

```
ls -l /etc/shadow
sudo chmod 640 /etc/shadow
sudo chown root:shadow /etc/shadow
```

This ensured that the **sensitive authentication file `/etc/shadow`** followed correct Linux security standards.

---

### Extra Verification (Beyond Standard)

```
ls -l | grep Vault
ls -l ~/Vault | grep secrets
ls -l /etc/shadow | grep shadow
```

These checks confirmed the permissions and ownership were correctly applied.

---

## threat_ips.txt — Stream Editing & Automation

**Theme:** *The Holy Trinity of Linux log analysis — grep, sed, awk.*

### Identify Failed Login Attempts

```
cat auth.log | grep "Failed password" | wc -l
```

This command counts the number of failed SSH login attempts recorded in the authentication log.

---

### Extract Attacker IPs from SQL Injection Attempts

```
grep "UNION SELECT" access.log | awk '{print $1}' | sort | uniq > threat_ips.txt
```

Workflow:

1. **grep** filters malicious SQL injection attempts  
2. **awk** extracts the source IP address column  
3. **sort | uniq** removes duplicate IP addresses  
4. Output is written to `threat_ips.txt`

---

# TLAB-01 — Operation Clean Sweep

**Theme:** *Incident Response & System Recovery*

In this scenario, a compromised server contained a sabotaged log file and restricted evidence directory. The goal was to recover access, analyze the logs, and extract attacker indicators.

---

## Phase 1 — The Maze (Navigation)

Evidence was hidden in a non-standard location:

```
/var/tmp/.evidence_cache
```

Inside the directory was the compromised log file:

```
raw_incident.log
```

However, the attacker set permissions preventing access.

---

## Phase 2 — The Locksmith (Permissions)

The directory and file permissions were configured as:

```
000
```

This meant **no user could read, write, or execute the files.**

Permissions were repaired using:

```
sudo chmod 500 /var/tmp/.evidence_cache
sudo chmod 400 /var/tmp/.evidence_cache/raw_incident.log
sudo chown <username> raw_incident.log
```

This restored secure read access for investigation.

---

## Phase 3 — The Surgery (Log Analysis)

The log file contained thousands of corrupted entries. The forensic pipeline extracted only malicious indicators.

```
grep "CRITICAL" raw_incident.log \
| sed 's/UserAgent: MalwareBot\/1.0//g' \
| awk '{print $1}' \
| sort | uniq \
> final_threat_report.txt
```

This workflow:

1. Filters **critical attack entries**
2. Removes malicious user-agent strings
3. Extracts **attacker IP addresses**
4. Deduplicates them for reporting

The final deliverable:

```
final_threat_report.txt
```

---

## Submission Notes

Artifacts were submitted using the fellowship submission system:

```
session-submit --session 01 --artifact ~/discovery.txt
session-submit --session 02 --artifact ~/harden.sh
session-submit --session 03 --artifact ~/threat_ips.txt
session-submit --session TLAB01 --artifact ~/final_threat_report.txt
```

---

## References

Linux Foundation. (2023). *Introduction to Linux*.  
https://training.linuxfoundation.org/resources/introduction-to-linux/

Red Hat. (2024). *Linux file permissions explained*.  
https://www.redhat.com/sysadmin/linux-file-permissions-explained

GNU Project. (2023). *Bash reference manual*.  
https://www.gnu.org/software/bash/manual/
