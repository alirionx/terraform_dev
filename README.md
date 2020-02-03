# MHP BA ADD Showroom  

## Goal

Setup showroom to implement and show examples to customers.

## Features

Features for a small medium enterprise:

- Directory Services
- DNS Server
- Certificate Services (CA)
- Domain Controllers (Samba)
- Single Sign On (SSO) with MFA
- File and Storage Services
- Database service
- Web GUIs, Virtual Desktop Environments (VDI)
- Website (Intranet, Internet)
- Office collaborations tools (mail, contacts, calendar)
- Messenger (chat)

Development tools:

- Container services (Kubernetes)
- CI / CD tools

### Usecase

Build a dashboard for e.g. performance of business processes ("BI").

### Usecase

Management of inventory items.

## Repository structure

This repository is structured as a mono repo that contains the different parts of the infrastructure for our virtual company.

If you want to create a new part of the infrastructure, place it in a well named subfolder of the projects directory.

The following workflow should be followed:

1. All infrastructure is created with terraform
2. All server configuration is done via ansible (?)
3. All documentation is done in markdown and with draw.io diagrams (save them both as .drawio and .svg)

