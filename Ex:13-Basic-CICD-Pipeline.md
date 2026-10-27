# Exercise 13 --- Basic CI/CD Pipeline

## Aim
Configure a continuous integration and continuous deployment (CI/CD) pipeline to automate the building, testing, and deployment of an application.

## Environment
``` text
Tool     : GitLab CI / Jenkins (Simulated)
Language : Python
Directory: ~/Desktop/lab/CICD_Pipeline
```

------------------------------------------------------------------------

## 1. Pipeline Configuration (13a)
A pipeline configuration file (`.gitlab-ci.yml`) was created to define the automation stages.

**Stages Defined:**
1. **Build**: Compiles the code to check for syntax errors.
2. **Test**: Runs the `test_main.py` script to verify application logic.
3. **Deploy**: Simulates the push to a production server.

------------------------------------------------------------------------

## 2. Automation Workflow (13b)
The pipeline is configured to trigger automatically upon every `git push` to the repository.

**Simulation of the pipeline run:**
``` bash
# Stage 1: Build
python3 -m py_compile app/main.py

# Stage 2: Test
python3 app/test_main.py
```

------------------------------------------------------------------------

## 3. Deployment and Verification (13c)
The final stage ensures that if the tests pass, the application is automatically deployed.

**Verification Result:**
- **Build**: Success
- **Test**: Success ("Test Passed!")
- **Deploy**: Success

------------------------------------------------------------------------

# Result
A basic CI/CD pipeline was successfully designed and simulated. The automation of the build and test phases reduces manual error and ensures that only verified code is deployed to production.
