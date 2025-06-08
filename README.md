# CI/CD Pipeline (Github Actions)

This guide demonstrates how to trigger the GitHub Actions CI/CD pipeline via a pull request.

---
## 1. Clone the repository

```bash
git clone https://github.com/<your-org>/<your-repo>.git
cd <your-repo>
```

## 2. Create a new feature branch
```bash
git checkout -b feature/update-hello
```

## 3. Make a small code change
For example, update the return message in app/main.py:
```bash
return f"Hello, CI/CD World! Config: {config_value}"
```

## 4. Commit and push the changes
```bash
git add app/main.py
git commit -m "Update hello message"
git push origin feature/update-hello
```

## 5. Open a Pull Request

Go to GitHub and open a Pull Request from feature/update-hello into main.
This will automatically trigger the CI/CD pipeline:
- Linting
- Unit tests
- Terraform validation
- Terraform apply in non-prod
- Docker build and push to ECR
- ECS rolling deployment (non-prod)

## 6. Monitor Workflow

- Go to the "Actions" tab on GitHub to watch the pipeline.
- Ensure all steps succeed and deployment completes.

## 7. Verify Deployment (Optional)
If your ECS service is fronted by a Load Balancer or API Gateway:
```bash
curl http://your-non-prod-url/
```

## Expected output:
```bash
Hello, CI/CD World! Config: <value-from-ssm>
```
----

# Dockerized microservice

## Create the key/value in parameter store

## Build and Run application
```bash
docker build -t hello-python .

docker run -it -e AWS_REGION=us-east-1  -e AWS_ACCESS_KEY_ID=AKIA3FLD3EXAMPLEKEY -e AWS_SECRET_ACCESS_KEY=SkPEHDPA2EXX8y+I4sw96fEXAMPLEKEY hello-python
```

## Verify the application

```bash
curl http://localhost:5000
```

## Run tests (Mock Testing Without Hitting AWS)
If you're in CI or dev, your test_main.py already mocks boto3.client, so it doesn't need real AWS calls.
```bash
pytest
```

## Run linter
We use flake8 to ensure consistent code style and catch common Python issues.
- max-line-length = 88: Matches Black's default formatting width.
- exclude: Skips unnecessary or generated directories during linting.

```bash
flake8 .
```
