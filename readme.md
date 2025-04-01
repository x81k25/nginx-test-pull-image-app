# GHCR Pull Image Test

A simple repository to test connectivity between GitHub Container Registry (GHCR) and ArgoCD.

## Overview

This repository contains a minimal Nginx Docker image that is built and pushed to GitHub Container Registry (GHCR). The purpose is to test the connectivity and image pulling capabilities between GHCR and ArgoCD.

## Repository Structure

- `Dockerfile`: Minimal Nginx image configuration
- `.github/workflows/docker-build.yaml`: GitHub Actions workflow to build and push the Docker image to GHCR
- `docker-compose.yaml`: Docker Compose file for local testing

## How It Works

1. A GitHub Action builds the Nginx Docker image when code is pushed to the main branch
2. The image is pushed to GitHub Container Registry (GHCR)
3. The docker-compose file can be used to test pulling the image locally
4. ArgoCD can be configured to pull this image to verify connectivity

## Setup Instructions

### Prerequisites

- GitHub account with access to GHCR
- Personal Access Token with appropriate permissions
- Docker and Docker Compose installed (for local testing)

### Environment Variables

Set the following environment variables before running docker-compose:

```bash
export GITHUB_USERNAME=your-github-username
export GHCR_PULL_IMAGE_TOKEN=your-github-token
```

### Running Locally

```bash
docker-compose up -d
```

This will start an Nginx server on port 8080.

### Using with ArgoCD

Configure your ArgoCD deployment to use this image to verify GHCR connectivity:

1. Add GHCR as an image registry in ArgoCD
2. Configure appropriate credentials
3. Create an application that references this image
4. Deploy to verify successful image pulling

## Troubleshooting

If you encounter issues with image pulling:

1. Verify your GitHub token has appropriate permissions
2. Ensure the image exists in GHCR
3. Check network connectivity between ArgoCD and GHCR