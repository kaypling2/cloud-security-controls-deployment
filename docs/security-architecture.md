# Security Architecture

## Network Security
- **VPC Design:** Public and private subnets to isolate workloads. Public subnets only for load balancers or bastion hosts.  
- **Security Groups & NACLs:** Restrict inbound and outbound traffic; least privilege rules.  
- **AWS Network Firewall:** Deep packet inspection and traffic filtering between VPCs.  
- **GuardDuty:** Continuous threat detection for network and account activity.

---

## Identity and Access Management
- **IAM Least Privilege:** Role-based access controls; tightly scoped policies.  
- **MFA Everywhere:** Enforced for all privileged users.  
- **Service Control Policies (SCPs):** Organization-level guardrails to block unsafe actions (e.g., deny creation of public S3 buckets).  

---

## Data Protection
- **Encryption at Rest:** KMS-managed keys for S3, EBS, RDS, and other AWS services.  
- **Encryption in Transit:** Enforced TLS for all communications (ALB/ELB HTTPS, API Gateway).  
- **Secrets Management:** AWS Secrets Manager and Parameter Store to avoid hardcoding credentials.

---

## Monitoring and Compliance
- **Security Hub:** Centralized security findings aggregation.  
- **Config:** Continuous config compliance against CIS benchmarks.  
- **CloudTrail + CloudWatch:** API activity logging and alerting on suspicious actions.  
- **Inspector:** Automated vulnerability scanning of EC2 instances.

---

## Application Layer Security
- **AWS WAF:** Protects web apps from common exploits (SQLi, XSS).  
- **Secure SDLC:** SAST/DAST integrated in CI/CD pipeline (e.g., Checkov, Trivy, Snyk).  
- **Code Reviews:** Mandatory security reviews for critical code paths.

---

*This architecture aligns with AWS Well-Architected Framework and supports SOX, PCI-DSS compliance for financial services.*
