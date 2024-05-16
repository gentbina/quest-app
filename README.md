# Quest App deployed in ECS Fargate with ALB and TLS - Terraform Example

This repository contains Terraform configuration files for deploying a containerized Node.js application on Amazon ECS Fargate with an Application Load Balancer (ALB) and TLS enabled.

## URL to a working deployment

https://test.gentbina.com

## Architecture

The architecture of the deployed resources includes:

1. **Amazon Virtual Private Cloud (VPC):**
   - A new VPC with two public subnets.
2. **Security Groups:**
   - Security group for ECS tasks allowing traffic on port 3000.
   - Security group for ALB allowing HTTP (port 80) and HTTPS (port 443) traffic.
3. **IAM Roles:**
   - An execution role for ECS tasks with necessary permissions.
4. **Amazon ECS:**
   - An ECS cluster.
   - A Fargate task definition for the Node.js application.
   - An ECS service linked to the ALB target group.
5. **Application Load Balancer (ALB):**
   - An ALB with listeners for HTTP and HTTPS.
   - Target group for routing traffic to ECS tasks.
   - Listener rule for redirecting HTTP to HTTPS.
6. **Amazon Certificate Manager (ACM):**
   - A certificate for enabling TLS.
7. **Amazon Route 53:**
   - DNS record for validating the ACM certificate.

```
+------------------------+
|      Route 53          |
|    (DNS Record)        |
+------------------------+
             |
             v
+------------------------+
|     ACM Certificate    |
+------------------------+
             |
             v
+------------------------+
|   Application Load     |
|        Balancer        |
|  (HTTP/HTTPS Listener) |
+------------------------+
             |
             v
+------------------------+
|     Target Group       |
+------------------------+
             |
             v
+------------------------+
|   ECS Fargate Service  |
|    (Node.js App)       |
+------------------------+
             |
             v
+------------------------+
|       VPC              |
|     (Public Subnets)   |
+------------------------+
```
## Notes
The node js app has been containerized and pushed into a private repository in ECR
```
FROM node:16

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```
