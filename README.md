# Log Message Processor

This project is a microservice designed to process log messages. It is containerized using Docker and deployed to Azure using a CI/CD pipeline defined in `azure-pipelines.yml`.

## Features
- Processes log messages efficiently.
- Containerized for easy deployment.
- Integrated with Azure Container Apps for scalable deployment.

## Pipeline Overview
The CI/CD pipeline is defined in the `azure-pipelines.yml` file and includes the following stages:

### 1. Trigger
The pipeline is triggered on changes to the `main` branch.

### 2. Build and Push Stage
- **Login to Azure Container Registry (ACR):** Authenticates with the ACR.
- **Build Docker Image:** Builds the Docker image for the microservice.
- **Push Docker Image:** Pushes the built image to the ACR.

### 3. Deployment Stage
- **Deploy to Azure Container App:** Updates the Azure Container App with the new Docker image.

## Configuration
The pipeline uses the following variables:
- `vmImageName`: Specifies the VM image for the build agent (e.g., `ubuntu-latest`).
- `dockerRegistryServiceConnection`: Azure DevOps service connection for ACR.
- `acrLoginServer`: ACR login server URL.
- `imageRepository`: Name of the Docker image repository.
- `containerAppName`: Name of the Azure Container App.
- `resourceGroupName`: Azure resource group containing the Container App.
- `azureResourceManagerConnection`: Azure DevOps service connection for Azure Resource Manager.

## How to Run Locally
1. Clone the repository.
2. Build the Docker image:
   ```bash
   docker build -t log-msg-process .
   ```
3. Run the Docker container:
   ```bash
   docker run -p 8080:8080 log-msg-process
   ```

## Deployment
The pipeline automatically deploys the microservice to Azure Container Apps. Ensure the following resources are configured in Azure:
- Azure Container Registry (ACR)
- Azure Container App
- Azure Resource Group

## Requirements
- Docker
- Azure CLI
- Azure DevOps

## License
This project is licensed under the MIT License.

## Adding the Pipeline to Azure DevOps

To set up the pipeline in Azure DevOps, follow these steps:

### 1. Set Up Your Azure DevOps Project
- Log in to [Azure DevOps](https://dev.azure.com/).
- Create a new project or use an existing one.

### 2. Push Your Code to Azure Repos
- Ensure your code is in a Git repository.
- Push the repository to Azure Repos:
  ```bash
  git remote add origin <Azure_Repos_URL>
  git push -u origin main
  ```

### 3. Create a New Pipeline
- Navigate to your Azure DevOps project.
- Go to **Pipelines** > **New Pipeline**.
- Select **Azure Repos Git** as the source.
- Choose your repository.

### 4. Configure the Pipeline
- When prompted, select **Existing Azure Pipelines YAML file**.
- Choose the `azure-pipelines.yml` file from the repository.

### 5. Set Up Service Connections
- Go to **Project Settings** > **Service Connections**.
- Add the following service connections:
  - **Azure Container Registry (ACR):** Use the name `ACR-ingesoft5acrregistry-Connection`.
  - **Azure Resource Manager (ARM):** Use the name `AzureRM-microservice`.

### 6. Run the Pipeline
- Save and run the pipeline.
- Monitor the pipeline execution in the **Pipelines** section.

### 7. Verify Deployment
- After the pipeline completes, verify that the Azure Container App is updated with the new Docker image.