# Convert2Arabic – DevOps CI/CD Portfolio Project

This repository demonstrates a complete CI/CD pipeline using Jenkins and Docker
with a dynamically created build agent and a simple static web application.

## Project Goal
To showcase DevOps fundamentals including:
- CI/CD automation
- Dynamic infrastructure
- Secure configuration handling
- Clean repository structure

## Tech Stack
- Jenkins (Declarative Pipeline)
- Docker (Dynamic Build Agent)
- Ubuntu 22.04
- HTML / CSS / JavaScript

## CI/CD Workflow
1. Jenkins builds a custom Docker image used as a temporary agent
2. A container is started dynamically per build
3. Application files are deployed to the web directory
4. All resources are cleaned up after execution

## Repository Structure
