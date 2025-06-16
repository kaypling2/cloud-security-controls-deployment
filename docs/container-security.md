# Container Security Implementation

## Docker Security Best Practices

1. **Use Minimal Base Images**  
   Use small, purpose-built images like `alpine` or `distroless` to reduce the attack surface and limit unnecessary packages.

2. **Run Containers as Non-Root Users**  
   Avoid running containers as `root` to minimize the risk of privilege escalation if the container is compromised.

3. **Scan Images for Vulnerabilities**  
   Use tools like Trivy or Snyk to scan container images for known vulnerabilities before deployment.

4. **Use Read-Only Filesystems Where Possible**  
   Mount filesystems as read-only to prevent unauthorized modification of files during runtime.

5. **Avoid Hardcoding Secrets in Images**  
   Leverage external secrets management solutions (e.g., AWS Secrets Manager, Kubernetes Secrets).

---

## Dockerfile Example (Non-Root User)

```dockerfile
FROM node:18-alpine

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production && \
    npm cache clean --force

COPY --chown=nodejs:nodejs . .

USER nodejs

EXPOSE 3000

CMD ["node", "index.js"]
```

---

## Kubernetes Security Features

1. **Security Contexts**  
   Define user/group IDs, restrict privilege escalation, enforce read-only root filesystems, etc.

2. **Network Policies**  
   Control traffic flow between pods to implement micro-segmentation.

3. **Pod Security Standards (or Admission Controllers)**  
   Enforce baseline security requirements for pod deployments (e.g., no privileged containers).

---

## Kubernetes YAML Example (securityContext)

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secure-pod
spec:
  containers:
  - name: app
    image: myapp:latest
    securityContext:
      runAsNonRoot: true
      runAsUser: 1001
      readOnlyRootFilesystem: true
      allowPrivilegeEscalation: false
      capabilities:
        drop:
        - ALL
```

---

## IaaS Security Measures

**Concept:**  
IaaS (Infrastructure as a Service) provides virtualized computing resources over the internet (e.g., EC2, S3, VPC in AWS).  

**Security Implications:**  
- The cloud provider secures the physical infrastructure.  
- The customer is responsible for OS, application, network config, and data security.  
- Key responsibilities include:
  - Applying patches to VMs (e.g., EC2)
  - Configuring security groups, NACLs, and VPC properly
  - Encrypting data at rest and in transit
  - Managing IAM roles and permissions
  - Monitoring and logging (CloudTrail, GuardDuty)
