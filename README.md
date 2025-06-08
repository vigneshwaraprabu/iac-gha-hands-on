# Gemini Security Scan

This project integrates a **simulated Google Gemini security scan** into the CI/CD workflow to analyze Terraform code for security misconfigurations on every pull request.

---

What It Does

- Scans Terraform files for common misconfigurations
- Flags issues like open security groups, unencrypted S3 buckets, etc.
- Generates a Markdown-based **security report**
- Posts the report as a **comment on the PR**

## Running Manually (Optional)

```bash
curl -X POST https://api.mock-gemini.com/v1/security/scan \
  -H "Authorization: Bearer YOUR_FAKE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{ "language": "terraform", "code": "base64_encoded_tf_code_here" }'
```

> Replace the URL and token with real values when the Gemini API is publicly available.