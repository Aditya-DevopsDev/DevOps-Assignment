# DevOps Assignment – Multi-Cloud Deployment (AWS + GCP)

This project demonstrates a multi-cloud DevOps architecture where a simple full-stack application is deployed on **both AWS and Google Cloud Platform**.

The application consists of:

- **Frontend:** Next.js
- **Backend:** FastAPI
- **Infrastructure:** Terraform
- **Containerization:** Docker
- **Deployment Platforms:** AWS and GCP

---

# Architecture Overview

The application is deployed across two cloud providers:

## Google Cloud Platform

Frontend
- Hosted on **Cloud Run**

Backend
- Docker container deployed to **Cloud Run**

Container Registry
- **Artifact Registry**

Infrastructure
- **Terraform**

Region
- `asia-south1`

---

## Amazon Web Services

Frontend
- Hosted using **S3 Static Website Hosting**

Backend
- Docker container running on **ECS Fargate**

Load Balancer
- **Application Load Balancer (ALB)**

Container Registry
- **Elastic Container Registry (ECR)**

Infrastructure
- **Terraform**

Region
- `ap-south-1`

---

# Hosted Application URLs

## Google Cloud Platform (GCP)

Frontend  
https://frontend-service-928600051964.asia-south1.run.app

Backend  
https://prod-backend-service-5c2dubkgnq-el.a.run.app


## Amazon Web Services (AWS)

Frontend  
http://devops-assignment-frontend-aditya.s3-website-ap-south-1.amazonaws.com

Backend  
http://prod-app-alb-366273241.ap-south-1.elb.amazonaws.com