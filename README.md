# Docker Nginx Flask Load Balancer Project

#### This project demonstrates how to build and deploy a simple Flask web application using Docker containers, run multiple replicas of the application, and configure Nginx as a load balancer to distribute incoming traffic across the replicas.

#### The setup simulates a basic production architecture where Nginx acts as a reverse proxy and load balancer in front of multiple backend Flask services.

## 🚀 Features

- Flask application serving a basic HTTP responses!

- Dockerized Flask services for easy deployment

- Multiple Flask replicas running on different ports

- Nginx configured as a reverse proxy and load balancer

- Load balancing using the least_conn strategy

- Simple and lightweight local development setup

## 🏗️ Architecture
```
Client
   |
   v
 Nginx (Load Balancer)
   |
   +---- Flask App (5001)
   +---- Flask App (5002)
   +---- Flask App (5003)
```
## 📁 Project Structure
```
.
├── app.py                # Flask application
├── Dockerfile            # Docker image definition for Flask app
├── docker-compose.yml   # Runs multiple Flask replicas
├── nginx.conf           # Nginx load balancer configuration
└── README.md
```
## ⚙️ Prerequisites

#### Ensure the following are installed on your system:

- Docker

- Docker Compose

- Nginx (installed locally on the host machine)

- Python 3.x (optional, for local testing)

🔧 Nginx Load Balancer Configuration

### Nginx is configured to distribute traffic across three Flask instances using the least_conn strategy.

**Example nginx.conf:**
```
worker_processes 1;

events {
    worker_connections 1024;
}

http {
    include mime.types; 
    
    upstream python_cluster {
        least_conn;
        server 127.0.0.1:5001;
        server 127.0.0.1:5002;
        server 127.0.0.1:5003;
        }


    server {
        listen 8080;
        server_name localhost;

        location / {
            proxy_pass http://python_cluster;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
        }
    }
}


```
## ▶️ How to Run
#### 1. Build and Start Flask Replicas

   - From the project root:

     ``docker-compose up --build``


   - This will start three Flask containers listening on:

     ``http://127.0.0.1:5001``

     ``http://127.0.0.1:5002``

     ``http://127.0.0.1:5003``

#### 2. Start Nginx

- Copy or link your nginx.conf into the Nginx configuration directory and reload Nginx:
     ```
  sudo nginx -t
  sudo systemctl reload nginx
     ```

- Nginx will now listen on:

  ``http://127.0.0.1``


- Requests will be load balanced across the Flask replicas.

 ## 🧪 Testing Load Balancing

- Send multiple requests:

  ``curl http://127.0.0.1``


You should observe responses coming from different Flask instances, confirming that load balancing is working.

## 📌 Technologies Used

``Flask – Backend web framework``

 ``Docker – Containerization``

``Docker Compose – Multi-container orchestration``

``Nginx – Reverse proxy and load balancer``
