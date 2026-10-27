# Exercise 14 --- Dockerize and Deploy an Application

## Aim
Package a sample application and its dependencies into a Docker container image and deploy it using a container orchestration platform.

## Environment
``` text
Tool     : Docker, Kubernetes (Simulated)
Language : Python (Flask)
Directory: ~/Desktop/lab/Docker_Deploy
```

------------------------------------------------------------------------

## 1. Dockerization (14a)
A `Dockerfile` was created to define the environment, install dependencies, and set the startup command.

**Dockerfile Highlights:**
- **Base Image**: `python:3.9-slim` (reduces image size).
- **Dependencies**: Installed via `requirements.txt`.
- **Cmd**: Starts the Flask server on port 5000.

------------------------------------------------------------------------

## 2. Build and Test (14b)
The image is built locally and tested to ensure the application starts correctly.

**Commands:**
``` bash
# Build the image
docker build -t retail-app:v1 .

# Run the container locally
docker run -p 5000:5000 retail-app:v1
```

------------------------------------------------------------------------

## 3. Orchestration and Deployment (14c)
The container is deployed to a cluster (e.g., Kubernetes) using a `deployment.yaml` file for scaling and self-healing.

**Deployment Logic:**
- **Replicas**: 3 (Ensures high availability).
- **Service**: LoadBalancer (Exposes the app to the internet).

**Verification:**
The application was verified as "Running" via `kubectl get pods`.

------------------------------------------------------------------------

# Result
The application was successfully dockerized and deployed. By using containers, the application is now portable across any environment (Development $\rightarrow$ Staging $\rightarrow$ Production) without dependency conflicts.
