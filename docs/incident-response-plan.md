# Incident Response Plan

## Phase 1: Preparation
- Activate incident response team.
- Define roles and responsibilities.
- Ensure communication channels are secure and documented.
- Validate that logs (CloudTrail, VPC Flow Logs) are being collected centrally (e.g., in S3, CloudWatch Logs).
- Ensure tools like AWS Security Hub, GuardDuty, Config are enabled.

---

## Phase 2: Identification
- Use GuardDuty, Security Hub, CloudTrail, and application logs to detect anomalies.
- Classify the incident type (e.g., RCE, privilege escalation).
- Assess scope and impact (which resources, data, accounts were affected).

---

## Phase 3: Containment
- **Short-term:** Isolate affected EC2 instances (remove from ELB, restrict SGs/NACLs).
- Revoke potentially compromised IAM credentials or roles.
- Disable compromised accounts or keys.
- **Long-term:** Enhance VPC segmentation, tighten IAM, implement additional WAF rules.

---

## Phase 4: Eradication
- Remove malicious code, backdoors, unauthorized users.
- Patch the exploited vulnerability.
- Validate remediation through retesting (e.g., using AWS Inspector).

---

## Phase 5: Recovery
- Restore services from clean AMIs / snapshots.
- Gradually reintegrate systems, monitoring closely.
- Conduct enhanced logging and monitoring during recovery period.

---

## Phase 6: Lessons Learned
- Document the timeline, root cause, and response actions.
- Conduct a post-incident review.
- Update incident response playbooks and technical controls.
- Share findings with internal stakeholders and compliance teams.
