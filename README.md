# Azure-Based Deployment of a RAG Chatbot Using Terraform

## Prerequisites

Before starting the deployment process, ensure the following requirements are available:

* An active Microsoft Azure subscription
* Terraform installed and configured locally
* Azure CLI installed and authenticated with your Azure account

---

## Project Features

This solution provides:

* PDF document upload and intelligent document querying
* Secure and scalable cloud infrastructure hosted on Azure
* Automated infrastructure provisioning using Terraform
* Complete deployment workflow for an AI-powered chatbot platform

---

## Project Description

This project demonstrates the deployment of a **Retrieval-Augmented Generation (RAG) Chatbot** on **Microsoft Azure** through **Terraform Infrastructure as Code (IaC)**. The platform combines modern AI technologies with cloud-native infrastructure to deliver a document-aware conversational experience.

### Technology Stack

The application consists of the following components:

* **Streamlit** – User-facing web interface
* **FastAPI** – Backend API and application logic
* **ChromaDB** – Vector database for semantic document retrieval
* **PostgreSQL** – Persistent relational database

The chatbot enables users to upload PDF files and ask questions directly related to the uploaded content. Retrieved document context is incorporated into the response generation process, allowing more accurate and relevant answers.

---

## Application Architecture

The system follows a multi-layer architecture designed around Retrieval-Augmented Generation principles.

### Workflow

1. Users interact with the chatbot through the Streamlit interface.
2. PDF documents can be uploaded and processed.
3. Document content is converted into embeddings and stored in ChromaDB.
4. Relevant document segments are retrieved whenever a user submits a query.
5. FastAPI processes requests and coordinates communication between services.
6. PostgreSQL stores application-related data and metadata.
7. Responses are generated using the retrieved document context.

### Core Components

* **Presentation Layer:** Streamlit
* **Application Layer:** FastAPI
* **Vector Storage Layer:** ChromaDB
* **Data Storage Layer:** PostgreSQL

> **Note:** The primary objective of this project is to demonstrate cloud deployment and infrastructure automation. Advanced AI model internals are outside the main scope of this implementation.

---

## Azure Infrastructure Design

The deployment architecture includes several Azure services that work together to provide security, scalability, and availability.

### Infrastructure Components

#### Virtual Network (VNet)

Provides network isolation and contains multiple dedicated subnets for different workloads.

#### Application Gateway

Acts as the entry point for incoming traffic and distributes requests across application instances.

#### Azure Bastion

Offers secure administrative access to virtual machines without exposing SSH ports publicly.

#### Virtual Machine Scale Sets (VMSS)

Hosts the frontend and backend application services while enabling horizontal scaling.

#### ChromaDB Virtual Machine

Dedicated VM responsible for running the vector database service.

#### Azure Database for PostgreSQL

Managed database service used for structured data persistence.

#### Azure Key Vault

Securely stores secrets, credentials, API keys, and database connection information.

#### Network Security Groups (NSGs)

Control inbound and outbound traffic between infrastructure components.

---

## Deployment Process

### Step 1 – Clone the Repository

```bash
git clone https://github.com/your-username/your-repository.git
cd Chatbot-Project-Terraform
```

### Step 2 – Create SSH Keys for Virtual Machines

```bash
mkdir -p ssh-keys

ssh-keygen -t rsa -b 4096 -f ssh-keys/terraform-azure -N ""

chmod 400 ssh-keys/terraform-azure
```

### Step 3 – Create SSH Keys for VM Scale Sets

```bash
ssh-keygen -t rsa -b 4096 -f ssh-keys/terraform-azure-vmss -N ""

chmod 400 ssh-keys/terraform-azure-vmss
```

### Step 4 – Configure Terraform Variables

Update the `terraform.tfvars` file with your Azure and application-specific values:

```hcl
subscription_id = "<AZURE_SUBSCRIPTION_ID>"

source_image_id = "<VMSS_IMAGE_ID>"

openai_key = "<OPENAI_API_KEY>"
```

---

## Infrastructure Provisioning

Initialize Terraform:

```bash
terraform init
```

Review the deployment plan:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply --auto-approve
```

> The `--auto-approve` flag is optional and can be removed if manual confirmation is preferred.

---

## ChromaDB Deployment

After infrastructure creation:

1. Connect to the ChromaDB virtual machine.
2. Clone the application repository.
3. Install dependencies.
4. Configure database connectivity.
5. Start the ChromaDB service.
6. Verify the service is running successfully.

Service status can be checked using:

```bash
sudo systemctl status chromadb.service
```

---

## VM Scale Set Configuration

Access VMSS instances through Azure Bastion:

1. Open the Azure Portal.
2. Navigate to the VM Scale Set.
3. Select an instance.
4. Choose **Connect via Bastion**.
5. Authenticate using the configured SSH credentials.
6. Verify that application services are operational.

Backend service status:

```bash
sudo systemctl status backend.service
```

Frontend service status:

```bash
sudo systemctl status frontend.service
```

Restart services if required:

```bash
sudo systemctl restart backend.service

sudo systemctl restart frontend.service
```

---

## Validation

After deployment is complete:

* Verify Terraform resources were created successfully.
* Confirm ChromaDB is operational.
* Ensure frontend and backend services are running.
* Test database connectivity.
* Access the application through the public IP address associated with the Azure Application Gateway.

---

## Conclusion

This project showcases how Terraform can be used to automate the deployment of a complete RAG-based chatbot environment on Microsoft Azure. By combining scalable cloud infrastructure with document-aware AI capabilities, the solution demonstrates a practical implementation of Infrastructure as Code for modern AI applications.
