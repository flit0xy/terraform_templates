Terraform Projects – Azure Infrastructure

This repository contains a collection of Terraform projects focused on designing and deploying
Microsoft Azure infrastructure using Infrastructure as Code (IaC) best practices.

Each project demonstrates a real-world cloud architecture pattern and can be used for learning,
reference, and portfolio purposes.

📌 Project 1: Azure Hub-and-Spoke Architecture
🔹 Overview

This project implements a Hub-and-Spoke network architecture in Azure using Terraform.
The hub virtual network provides centralized connectivity and security using Azure Firewall,
while the spoke virtual network hosts application workloads.

🏗 Architecture Components

Resource Group: Production

Hub Virtual Network

AzureFirewallSubnet

Azure Firewall with Public IP

Spoke Virtual Network

Subnet for Virtual Machines

Linux Virtual Machine

Bidirectional VNet Peering (Hub ↔ Spoke)

User Defined Routes (UDR)

Default route (0.0.0.0/0) pointing to Azure Firewall

Log Analytics Workspace

Azure Firewall Diagnostic Settings (logs and metrics)

🛠 Technologies Used

Terraform

Microsoft Azure

Azure Virtual Networks & Peering

Azure Firewall

Azure Monitor / Log Analytics

📌 Project 2: Monster Azure Infrastructure
🔹 Overview

This project deploys a secure Azure environment for the Monster application using Terraform.
It includes networking, private Web App hosting, Application Gateway, private endpoints, and DNS integration.

🏗 Architecture Components

Resource Group: monster-rg

Virtual Network: monster-vnet

Subnets

s-appgateway (Application Gateway)

s-webapp (Web App with delegation)

s-private-endpoint (Private Endpoints)

Public IP: monster-public-ip

Application Gateway: monster-appgateway

App Service Plan: monster-appserviceplan (S1)

Web App: monster-webapp (private access)

VNet Integration

Private Endpoint: monster-webapp-pe

Private DNS Zone: privatelink.azurewebsites.net

🛠 Technologies Used

Terraform

Microsoft Azure

Azure Virtual Networks & Subnets

Azure Application Gateway

Azure App Service

Azure Private Endpoint & Private DNS

📌 Project 3: Azure Container Apps with Terraform & CI/CD

🔹 Overview

This project deploys a containerized workload in Microsoft Azure using Terraform and GitHub Actions.

It provisions Azure infrastructure components, including Azure Container Registry (ACR), Azure Container Apps Environment, and Azure Container App, while implementing secure authentication using Managed Identity and OpenID Connect (OIDC).

The solution demonstrates Infrastructure as Code (IaC), secure CI/CD automation, and modern Azure container deployment practices.

🏗 Architecture Components

Resource Group: dzik-rg

Azure Container Registry (ACR): dzikacr

Azure Container Apps Environment

Azure Container App: dzik-ca

System-Assigned Managed Identity

Role Assignment: AcrPull (Container App → ACR)

Azure Storage Account (Terraform remote backend)

Blob Container for state storage

GitHub Actions Workflow (CI/CD)

OIDC Federated Credential (GitHub → Azure Entra ID)

🔄 Deployment Flow

Push to dev branch triggers:

GitHub Actions authenticates to Azure using OIDC

Terraform initializes with Azure Storage backend

Infrastructure (RG, ACR, CAE) is deployed

Public nginx image is imported into ACR

Container App is deployed pulling image from ACR

Container App authenticates to ACR using Managed Identity and RBAC (AcrPull).

🔐 Security Implementation

No client secrets stored in GitHub

OIDC-based authentication (federated identity)

Azure AD authentication for Terraform backend

Storage account keys disabled

RBAC-based access control

Managed Identity used for container image pulls

🗂 Terraform Structure

Root Module:

Backend configuration (Azure Storage)

Module wiring and dependency management

Modules:

resource_group

container_registry

container_app_env

container_app

role_assignment

The design follows modular Terraform best practices:

Reusable modules

Clear input/output separation

No cross-module resource references

Least-privilege access

🛠 Technologies Used

Terraform

Microsoft Azure

Azure Container Apps

Azure Container Registry (ACR)

Azure Storage (Blob – remote state backend)

GitHub Actions

OpenID Connect (OIDC)

Azure RBAC

Managed Identity

Docker (image management)

🎯 Key Concepts Demonstrated

Terraform modular architecture

Remote state migration to Azure Storage

Azure AD–based backend authentication

Managed Identity integration

Role-based access control (RBAC)

CI/CD automation with GitHub Actions

Secure image deployment from private ACR

Infrastructure promotion from the dev branch
