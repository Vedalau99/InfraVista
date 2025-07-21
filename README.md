InfraVista is a modern serverless web application that allows users to generate architecture diagrams from simplified JSON definitions inspired by Terraform resource blocks. It leverages AWS services, containerized backends, and clean frontend design to give developers a visual snapshot of their cloud infrastructure.

🧰 Technologies Used
🚢 Docker
Containerized the backend Flask app.

Ensured consistent environments for development and deployment.

Simplified image builds for cloud deployment.

🧱 Terraform
Managed cloud infrastructure declaratively.

Automated setup for services like:

AWS IAM roles

Amazon ECR repository

AWS App Runner service

Made the project reproducible and infrastructure-as-code friendly.

🐳 AWS ECR (Elastic Container Registry)
Hosted the Docker image of the backend.

Integrated seamlessly with App Runner for scalable deployment.

Ensured secure, versioned image management.

🐍 Flask API
Served as the backend service for generating infrastructure diagrams.

Received Terraform-style JSON, parsed it, and returned a rendered diagram.

CORS-enabled for frontend interaction.

🎨 Mermaid (Initial Phase)
Used initially for rendering diagrams in the browser.

Offered quick prototyping and diagram generation via JavaScript.

Later replaced with the Diagrams Python library to produce real PNG images for a professional touch.

💻 Frontend (HTML + JS)
Clean and lightweight interface.

Accepts user JSON input.

Sends POST request to backend and renders diagram image dynamically.

Supports blob rendering for image display.

