# 🔐 MQTT Security Audit & Hardening Project

<div align="center">

![MQTT Security](https://img.shields.io/badge/MQTT-Security%20Audit-red?style=for-the-badge&logo=mqtt)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-Academic-blue?style=for-the-badge)

**A comprehensive security assessment and hardening guide for Mosquitto MQTT Broker**

*From vulnerable to fortress: Securing IoT communication one topic at a time*

[📖 Report](#-project-report) • [🎯 Demo](#-live-demonstration) • [🛠️ Setup](#-quick-start) • [🔒 Results](#-security-improvements)

</div>

---

## 🎯 Project Overview

This project exposes critical vulnerabilities in default MQTT broker configurations and demonstrates professional-grade hardening techniques to secure IoT communications. Through systematic penetration testing and defense implementation, we transform an insecure message broker into a production-ready secure system.

### 🚨 The Problem

```
❌ Anonymous access enabled          ✅ Password-based authentication
❌ Unencrypted communications        ✅ TLS 1.3 encryption
❌ No access control                 ✅ Topic-based ACL
❌ Exposed to network attacks        ✅ Firewall-protected
```

### 🎓 Academic Context

- **Course**: CyberSecurity - Computer Engineering & Embedded Systems
- **Institution**: Université Ibn Zohr, Faculté des Sciences d'Agadir
- **Program**: IISE (Ingénierie Informatique et Systèmes Embarqués)
- **Professor**: Monsef Boughrous
- **Academic Year**: 2025/2026

---

## 📋 Table of Contents

- [Project Phases](#-project-phases)
- [Attack Surface](#-attack-surface-discovered)
- [Arsenal](#-security-arsenal)
- [Quick Start](#-quick-start)
- [Exploitation Demo](#-exploitation--defense)
- [Results](#-security-improvements)
- [Documentation](#-documentation)
- [Team](#-team)

---

## 🔄 Project Phases

### Phase 1️⃣ : Reconnaissance & Setup
```bash
🔍 Network scanning with Nmap
📡 Service enumeration
🌐 Traffic baseline analysis
📊 Default configuration audit
```

### Phase 2️⃣ : Vulnerability Assessment
```bash
🚪 Authentication bypass testing
🔓 Encryption analysis
🎯 Access control evaluation
⚠️ Security misconfiguration identification
```

### Phase 3️⃣ : Exploitation & Proof of Concept
```bash
💥 Anonymous connection attacks
🕵️ Credential interception
📨 Unauthorized message publishing
🎭 Man-in-the-middle demonstrations
```

### Phase 4️⃣ : Hardening & Verification
```bash
🔐 Password authentication implementation
🔒 TLS/SSL certificate deployment
🛡️ Access Control Lists (ACL) configuration
🧱 Firewall rule enforcement
✅ Post-hardening validation
```

---

## 🎯 Attack Surface Discovered

| Vulnerability | Severity | CVSS Score | Status |
|--------------|----------|------------|---------|
| Anonymous Access | 🔴 **CRITICAL** | 9.8 | ✅ Fixed |
| Plaintext Communication | 🔴 **CRITICAL** | 8.2 | ✅ Fixed |
| No Topic Authorization | 🟠 **HIGH** | 7.5 | ✅ Fixed |
| Exposed Management Port | 🟠 **HIGH** | 6.8 | ✅ Fixed |
| Default Configuration | 🟡 **MEDIUM** | 5.3 | ✅ Fixed |

---

## 🛠️ Security Arsenal

<table>
<tr>
<td width="50%">

### Offensive Tools
```yaml
Reconnaissance:
  - Nmap 7.94
  - Wireshark 4.0+
  
Exploitation:
  - Mosquitto Clients
  - MQTT Explorer
  - Custom Python Scripts
```

</td>
<td width="50%">

### Defensive Tools
```yaml
Hardening:
  - OpenSSL 3.0
  - Mosquitto 2.0.x
  - UFW / Windows Firewall
  
Configuration:
  - ACL Files
  - Password Database
  - TLS Certificates
```

</td>
</tr>
</table>

---

## 🚀 Quick Start

### Prerequisites
```bash
# Linux (Ubuntu/Debian)
sudo apt update
sudo apt install mosquitto mosquitto-clients wireshark nmap openssl

# Verify installation
mosquitto -h
```

### 1. Clone the Repository
```bash
git clone https://github.com/oussamaelmessaoudi/securing-mqtt.git
cd securing-mqtt
```

### 2. Initial Setup (Vulnerable State)
```bash
# Start with insecure configuration
sudo cp config/mosquitto.conf.vulnerable /etc/mosquitto/mosquitto.conf
sudo systemctl restart mosquitto

# Verify vulnerability
mosquitto_sub -h localhost -t '#' -v  # No authentication required! 🚨
```

### 3. Run Security Audit
```bash
# Network reconnaissance
sudo nmap -sV -p 1883,8883 localhost

# Traffic capture
sudo wireshark -i lo -f "tcp port 1883"

# Exploit demo
./scripts/exploit_demo.sh
```

### 4. Apply Hardening
```bash
# Generate certificates
./scripts/generate_certs.sh

# Create password database
sudo mosquitto_passwd -c /etc/mosquitto/passwd iotuser

# Apply secure configuration
sudo cp config/mosquitto.conf.secure /etc/mosquitto/mosquitto.conf
sudo cp acl/acl.conf /etc/mosquitto/

# Restart and verify
sudo systemctl restart mosquitto
./scripts/verify_hardening.sh
```

---

## 💥 Exploitation & Defense

### Before Hardening: Easy Access
```bash
# Anyone can subscribe to ALL topics
$ mosquitto_sub -h localhost -t '#' -v
sensor/temperature 23.5
sensor/humidity 65
home/lights/bedroom ON
camera/stream rtsp://192.168.1.100  # 😱 Privacy breach!

# Wireshark shows credentials in plaintext
MQTT Payload: username:admin password:admin123  # 🚨 Exposed!
```

### After Hardening: Access Denied
```bash
# Connection without credentials fails
$ mosquitto_sub -h localhost -t '#'
Connection error: Not authorized

# TLS encryption required
$ mosquitto_sub -h localhost -p 8883 -t 'sensor/#' \
  --cafile certs/ca.crt \
  -u iotuser -P SecurePass123!
sensor/temperature 23.5  # ✅ Encrypted & Authenticated

# Wireshark shows encrypted traffic
TLSv1.3 [Application Data]  # 🔒 Cannot be decrypted!
```

---

## 📊 Security Improvements

<div align="center">

### Vulnerability Remediation

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| **Open Ports** | 1883 (unsecured) | 8883 (TLS only) | 🔒 100% encrypted |
| **Authentication** | ❌ None | ✅ Password + ACL | 🛡️ Full protection |
| **Encryption** | ❌ Plaintext | ✅ TLS 1.3 | 🔐 Military grade |
| **Access Control** | ❌ Global access | ✅ Topic-based | 🎯 Granular control |
| **Attack Surface** | 🔴 Critical | 🟢 Minimal | ⬇️ 95% reduction |

</div>

### 🎬 Visual Evidence

```
📸 Screenshots included:
├── nmap_scan_before.png       # Port 1883 open, no encryption
├── nmap_scan_after.png        # Only port 8883, TLS enabled
├── wireshark_plaintext.png    # Captured passwords
├── wireshark_encrypted.png    # Encrypted traffic
├── attack_success.png         # Unauthorized access demo
└── attack_blocked.png         # Hardened system blocks attack
```

---

## 📚 Documentation

### 📄 Project Report (15-20 pages)
Comprehensive security audit documentation following professional standards:
- Executive Summary
- Vulnerability Analysis
- Exploitation Results
- Hardening Implementation
- Before/After Comparison
- Actionable Recommendations

📥 **[Download Full Report](docs/MQTT_Security_Report.pdf)**

### 🎤 Presentation (10-15 slides)
Professional presentation covering:
- Problem Statement
- Attack Demonstrations
- Defense Implementation
- Live Demo
- Key Findings

📥 **[View Presentation](presentation/MQTT_Security_Slides.pdf)**

---

## 📁 Repository Structure

```
mqtt-security-audit/
├── 📁 config/
│   ├── mosquitto.conf.vulnerable    # Insecure baseline
│   ├── mosquitto.conf.secure        # Hardened configuration
│   └── README.md                    # Configuration guide
│
├── 📁 acl/
│   ├── acl.conf                     # Topic-based access rules
│   └── examples/                    # ACL patterns
│
├── 📁 certs/
│   ├── ca.crt                       # Certificate Authority
│   ├── server.crt                   # Server certificate
│   ├── generate_certs.sh            # Certificate generation script
│   └── .gitignore                   # (Private keys excluded)
│
├── 📁 scripts/
│   ├── setup_vulnerable.sh          # Deploy vulnerable broker
│   ├── exploit_demo.sh              # Demonstrate attacks
│   ├── apply_hardening.sh           # Secure the broker
│   ├── verify_security.sh           # Post-hardening tests
│   └── mqtt_test_client.py          # Python testing tool
│
├── 📁 scans/
│   ├── nmap_results/
│   ├── wireshark_captures/
│   └── vulnerability_reports/
│
├── 📁 docs/
│   ├── MQTT_Security_Report.pdf     # Full technical report
│   └── Hardening_Checklist.md       # Step-by-step guide
│
├── 📁 presentation/
│   └── MQTT_Security_Slides.pdf     # Project presentation
│
└── README.md                        # You are here! 🎯
```

---

## 🎓 Key Learnings

### 🧠 Technical Skills Acquired
- ✅ MQTT protocol analysis and security assessment
- ✅ TLS/SSL certificate generation and management
- ✅ Network traffic analysis with Wireshark
- ✅ Firewall configuration and port security
- ✅ Access Control List (ACL) design
- ✅ Penetration testing methodology
- ✅ Security hardening best practices

### 🔍 Cybersecurity Principles Applied
- **Defense in Depth**: Multiple security layers
- **Least Privilege**: Topic-based access control
- **Encryption at Rest & Transit**: TLS implementation
- **Authentication & Authorization**: Password + ACL
- **Security by Default**: Hardened configurations

---

## 🛡️ Hardening Checklist

- [x] **Authentication**
  - [x] Disable anonymous access
  - [x] Implement password authentication
  - [x] Use strong password policies

- [x] **Encryption**
  - [x] Generate TLS certificates
  - [x] Enable TLS 1.3
  - [x] Disable insecure protocols (TLS 1.0/1.1)

- [x] **Access Control**
  - [x] Configure topic-based ACL
  - [x] Implement read/write separation
  - [x] Test authorization rules

- [x] **Network Security**
  - [x] Close unencrypted port (1883)
  - [x] Configure firewall rules
  - [x] Restrict broker to localhost/VPN

- [x] **Monitoring & Logging**
  - [x] Enable security logging
  - [x] Monitor failed connection attempts
  - [x] Set up alerting

---

## 🎯 Demonstration Highlights

### 🔴 Attack Phase
```bash
✓ Successful anonymous connection
✓ Captured credentials via Wireshark
✓ Unauthorized topic subscription
✓ Message interception and modification
✓ Privacy breach demonstration
```

### 🟢 Defense Phase
```bash
✓ Connection attempts blocked
✓ Encrypted traffic (Wireshark verification)
✓ ACL preventing unauthorized access
✓ Firewall blocking external connections
✓ Security monitoring active
```

---

## 👥 Team

**IISE Students - Cybersecurity Project**
Oussama ELMESSAOUDI
Yassine EL ATIKI
Abdessamad ASKLOU
Nourreddine AIT MOULAY BRAHIM
*Université Ibn Zohr, Faculté des Sciences d'Agadir*

> 💡 **Note**: This project was conducted in a controlled lab environment. All security testing was performed ethically on systems owned and operated by the project team.

---

## 📜 License & Ethics

This project is for **educational purposes only**. 

⚠️ **Ethical Guidelines:**
- All testing performed in isolated lab environment
- No unauthorized network scanning
- No attacks on production systems
- Compliant with academic integrity policies

---

## 🔗 References & Resources

- [MQTT Protocol Specification](http://mqtt.org)
- [Mosquitto Documentation](https://mosquitto.org/documentation/)
- [OWASP IoT Security](https://owasp.org/www-project-internet-of-things/)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)

---

## 📞 Contact & Feedback

For questions about this project:
- 📧 Email: [oussama.elmessaoudi.39@edu.uiz.ac.ma]
- 🎓 Course: CyberSecurity - Prof. Monsef Boughrous

---

<div align="center">

### ⭐ If you found this project helpful, please star the repository!

**Built with 🔒 by IISE Cybersecurity Team**

*Securing the IoT, one broker at a time*

</div>
