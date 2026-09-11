# Assignment 05

A simple DevOps project. It has a React app plus tools to build, deploy,
and run it on AWS.

## What's inside

| Folder / File | What it does |
|---------------|----------------|
| `react-app/` | A React frontend app |
| `dockerfile` | Builds the React app and serves it with Nginx |
| `terraform/` | Creates AWS resources (VPC, subnet, EC2 server, security group) |
| `ansible/` | Installs and sets up software on the server (Node.js, Apache) |

## How to use

### 1. Run the React app locally

```bash
cd react-app
npm install
npm start
```

### 2. Build and serve with Docker

```bash
docker build -t my-react-app .
docker run -p 8080:80 my-react-app
```

Then open `http://localhost:8080`.

### 3. Create AWS infrastructure with Terraform

```bash
cd terraform
terraform init
terraform apply
```

This creates an EC2 server. The public IP is shown at the end.

### 4. Set up the server with Ansible

Put your EC2 IP in `ansible/inventory.ini`, then run:

```bash
cd ansible
ansible-playbook nodejs-playbook.yml    # installs Node.js
ansible-playbook webserver-playbook.yml # installs Apache on port 81
```

## Notes

- The Dockerfile has two stages: one builds the app, the other serves it
  with Nginx (lightweight, no Node.js needed at runtime).
- The Ansible settings file (`ansible.cfg`) uses the `inventory` file by
  default, so update your IPs there or in `inventory.ini`.