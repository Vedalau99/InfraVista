\# 🧠 InfraVista



InfraVista is a serverless web application that \*\*visualizes cloud infrastructure\*\* using Terraform-style JSON. It features full \*\*CI/CD automation\*\* with AWS services and GitHub Actions.



---



\## 🚀 Project Features



\- 🔧 \*\*CI/CD with GitHub Actions\*\* — Automatic container build and deployment to ECR + App Runner on push

\- 🐳 \*\*Dockerized Backend\*\* — Python Flask app for processing JSON and returning architecture diagrams

\- 🛠️ \*\*Terraform Infrastructure\*\* — ECR, App Runner, IAM roles, S3 static hosting all provisioned via IaC

\- 🌐 \*\*Frontend Hosting on S3\*\* — Static HTML/JS frontend with CORS-enabled diagram preview

\- 🧭 \*\*Mermaid Diagrams Output\*\* — (Future-ready for PNG) Visualizes infrastructure as Mermaid graphs



---



\## 🧱 Architecture



```text

User --> S3-hosted Frontend (HTML+JS)

&nbsp;          |

&nbsp;          v

AWS App Runner (Flask + Docker)

&nbsp;          |

&nbsp;          v

AWS ECR (Backend container image)

&nbsp;          |

&nbsp;          v

Terraform (ECR, IAM, App Runner, S3 Infra)



