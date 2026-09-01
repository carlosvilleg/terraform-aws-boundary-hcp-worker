
This sample terraform code creates an ASG in AWS for Boundary workers in HCP Boundary. The workers will register automatically with Boundary.

## Prerequisites

- There needs to be a password auth method enabled in HCP Boundary at the global level
- There needs to be an account in the global password method with permissions to manage workers in HCP Boundary
- The code ideally reads the credentials from Vault
    Vault requirements:
        - Authentication to Vault is done via the AWS auth method
        - Given the secret is static, a KV secret engine needs to be configured and the username and password provided in those fileds



