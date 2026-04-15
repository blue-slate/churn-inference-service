# Customer churn MLOps service

[![CI](https://github.com/blue-slate/customer-churn-mlops-service/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/blue-slate/customer-churn-mlops-service/actions/workflows/ci.yml) [![CI](https://github.com/blue-slate/customer-churn-mlops-service/actions/workflows/delivery.yml/badge.svg?branch=main)](https://github.com/blue-slate/customer-churn-mlops-service/actions/workflows/delivery.yml) [![CI](https://github.com/blue-slate/customer-churn-mlops-service/actions/workflows/deploy.yml/badge.svg?branch=main)](https://github.com/blue-slate/customer-churn-mlops-service/actions/workflows/deploy.yml)


## Overview

This project is a production-inspired MLOps service for customer churn prediction.

It exposes a machine learning model through a FastAPI API, packages the service with Docker, provisions infrastructure with Terraform, and uses GitHub Actions for CI/CD. The project also includes monitoring with Prometheus and Grafana to reflect real-world deployment and reliability practices.

Its goal is not to build the most complex model, but to demonstrate how an ML service can be structured, deployed, monitored, and maintained in a clean and professional way.

## Architecture

![Architecture-diagram](docs/architecture-diagram.svg)

The project is built as a simple end-to-end ML service with a deployment flow inspired by real-world production setups.

- A **FastAPI** application exposes the prediction API and operational endpoints
- A **scikit-learn pipeline** is loaded by the service to serve predictions
- The application is packaged and run in a **Docker** container
- **GitHub Actions** handles CI/CD tasks such as testing, linting, image build, and delivery
- **Terraform** provisions the AWS infrastructure
- The service is deployed on an **EC2 instance**
- **Prometheus** scrapes application metrics
- **Grafana** visualizes service health and performance through dashboards


At a high level, the system covers the full lifecycle of an ML service: packaging, deployment, delivery, monitoring, and basic production reliability practices.

## Quickstart

### Prerequisites

- Docker
- Python 3.11+ (only needed for local non-Docker execution)
- Git

### Run locally

Clone the repository and start the API:

```bash
git clone https://github.com/blue-slate/churn-inference-service.git
cd churn-inference-service

make docker-build
make docker-run
```

If you prefer running with Python and uvicorn directly:
```bash
make install
make run
```

### Verify the service

Health check:
```bash
curl http://localhost:8000/health
```

API prediction:

```bash
curl -X 'POST' \
  'http://localhost:8000/predict' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d curl -X 'POST' \
  'http://localhost:8000/predict' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "gender": "Female",
  "SeniorCitizen": 0,
  "Partner": "Yes",
  "Dependents": "No",
  "tenure": 1,
  "PhoneService": "No",
  "MultipleLines": "No phone service",
  "InternetService": "DSL",
  "OnlineSecurity": "No",
  "OnlineBackup": "Yes",
  "DeviceProtection": "No",
  "TechSupport": "No",
  "StreamingTV": "No",
  "StreamingMovies": "No",
  "Contract": "Month-to-month",
  "PaperlessBilling": "Yes",
  "PaymentMethod": "Electronic check",
  "MonthlyCharges": 29.85,
  "TotalCharges": 29.85
}'
```
## Features

### ML service
- FastAPI inference service for customer churn prediction
- Inference endpoint exposed through `/predict`
- Operational endpoints: `/health`, `/model-info`, and `/metrics`


### Containerization and deployment
- Dockerized application for reproducible execution
- Infrastructure as Code with Terraform
- Deployment to an AWS EC2
- CI/CD workflow with GitHub Actions for test, build, delivery and deployment steps

### Monitoring and operations
- Prometheus metrics collection
- Grafana dashboards for request volume, latency, and service health
<!-- - Structured logging for easier debugging and observability -->

### Production-readiness
<!-- - Healthcheck support for runtime verification
- Post-deployment smoke tests
- Service and model versioning
- Simple rollback-oriented deployment approach -->
- Clean configuration and secrets handling






