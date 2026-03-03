# DevOps Assignment (Full-Time Role)

## Overview

This project deploys a simple frontend and backend application across two cloud providers:

- Amazon Web Services (AWS)
- Google Cloud Platform (GCP)

The focus of this assignment is infrastructure design, scalability, availability, and operational thinking.

---

# Cloud Deployments

## AWS (Production)

Region: ap-south-1  
Compute: ECS Fargate  
Load Balancer: Application Load Balancer (ALB)  
Container Registry: Amazon ECR  
Infrastructure as Code: Terraform (S3 remote state + DynamoDB locking)

Backend URL:
http://prod-app-alb-366273241.ap-south-1.elb.amazonaws.com

Health Check:
http://prod-app-alb-366273241.ap-south-1.elb.amazonaws.com/api/health

---

## GCP (Production)

Region: asia-south1  
Compute: Cloud Run  
Container Registry: Artifact Registry  
Infrastructure as Code: Terraform

Backend URL:
https://prod-backend-service-5c2dubkgnq-el.a.run.app

Health Check:
https://prod-backend-service-5c2dubkgnq-el.a.run.app/api/health

---

# Environment Separation

Each cloud includes:

- dev
- staging
- prod

Differences include scaling configuration and resource allocation.

---

# Running Locally

## Backend

cd backend  
pip install -r requirements.txt  
uvicorn main:app --host 0.0.0.0 --port 3000  

Access:  
http://localhost:3000/api/health

---

## Frontend

cd frontend  
npm install  
npm start  

---

# Documentation & Demo

Architecture Documentation:
(Add Google Docs link here)

Demo Video:
(Add video link here)

---

# Notes

Infrastructure is fully provisioned using Terraform.

AWS uses remote state with S3 and DynamoDB locking.

Design decisions, scaling strategy, failure handling, and future growth considerations are documented separately.