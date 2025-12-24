# DevOps CI/CD Portfolio – Jenkins Pipeline with Docker Dynamic Agent

🎯 Project Goal

This project showcases core DevOps fundamentals through a practical, production-style setup, including:

CI/CD automation using Jenkins

Dynamic infrastructure with Docker build agents

Secure handling of environment-specific configuration

Clean, scalable repository structure suitable for public portfolios

🧰 Tech Stack

Jenkins – Declarative Pipeline

Docker – Dynamic build agent

Ubuntu 22.04 – Base operating system

HTML / CSS / JavaScript – Sample web application

🔁 CI/CD Workflow

Jenkins builds a custom Docker image to be used as a temporary build agent

A container is started dynamically per pipeline execution

Application files are deployed into the web directory

All containers and temporary resources are cleaned up automatically after execution

This approach demonstrates ephemeral infrastructure and clean pipeline design.

🗂️ Repository Structure
Git → Jenkins → Docker Agent → Deploy → Cleanup


The repository follows a clear separation of concerns between:

Application code

CI/CD configuration

Infrastructure logic

🧪 Local Usage (Optional)

For local testing and demonstration purposes, a Makefile is provided to standardize common commands:

make build
make deploy
make clean


## **🔁 CI/CD Pipeline Diagram**

![Dynamic Docker Agent Jenkins CI/CD Pipeline](pipeline-diagram.png)


This allows consistent execution locally and mirrors CI behavior where applicable.

🔐 Proxy Configuration (Enterprise Best Practice)

Important Note

This project is designed to be safe for public GitHub repositories.

In environments with restricted network access, proxy settings are intentionally not hardcoded in the Dockerfile or committed to the repository.

✅ Recommended Approach

Proxy values are configured directly in Jenkins:

Path:

Job → Configure → Environment variables


Example variables:

HTTP_PROXY

HTTPS_PROXY

These variables are:

Injected at runtime

Managed outside the codebase

Excluded from version control to maintain security and portability

This mirrors how proxy and secret management is handled in real enterprise environments

Syria-Git
