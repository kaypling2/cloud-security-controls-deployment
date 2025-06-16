# Cybersecurity Analysis

## Threat Intelligence Report

### Types of Attacks That Could Be Used
- **SQL Injection (SQLi)**  
  Exploits unvalidated input fields to execute malicious SQL commands — could lead to data exfiltration or privilege escalation.

- **Cross-Site Scripting (XSS)**  
  Injects malicious scripts to steal session cookies, hijack accounts, or manipulate user input.

- **Remote Code Execution (RCE)**  
  Allows attackers to execute arbitrary code on the server — can fully compromise the host.

- **Server-Side Request Forgery (SSRF)**  
  Exploits server functionality to interact with internal services — exposes internal architecture.

- **Deserialization Attack**  
  Exploits unsafe deserialization logic to execute arbitrary code or commands.

---

### How Vulnerability Exploitation Provides Network Access
- **Initial Foothold:** Exploit unpatched web app to gain access to the EC2 instance or container.  
- **Privilege Escalation:** Use local exploits to gain root/system-level access.  
- **Lateral Movement:** Access other AWS resources using compromised IAM roles or credentials.  
- **Persistence:** Install backdoors, create rogue IAM users or roles.  
- **Data Exfiltration:** Transfer sensitive data out via allowed outbound connections.

---

### Preventive Measures
- Automated patch management (AWS Systems Manager Patch Manager).  
- AWS WAF with managed and custom rules for web app protection.  
- Use of AWS Security Hub, Inspector, and Config for continuous compliance checks.  
- Secure software development lifecycle (SAST, DAST in CI/CD).  
- Zero Trust network segmentation and IAM least privilege enforcement.

