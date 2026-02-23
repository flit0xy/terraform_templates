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
# trigger
# trigger
# trigger
