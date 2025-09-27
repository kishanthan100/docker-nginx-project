# Docker Nginx Flask Load Balancer Project

## Overview

This project demonstrates how to build and deploy a simple Flask web application using Docker containers, run multiple replicas of the app, and configure Nginx as a load balancer to distribute traffic among the replicas.

---

## Features

- Flask app serving a basic web page
- Dockerized application for easy containerization
- Running 3 replicas of the same Flask app on different ports
- Nginx configured as a reverse proxy and load balancer on the host machine
- Load balancing strategy using `least_conn` to route requests efficiently

---

## Prerequisites

- Docker installed on your machine
- Docker Compose (for managing multiple containers)
- Nginx installed locally (not containerized)
- Python (for local development)

---

## How to Run

1. Build and run the containers:

   ```bash
   docker-compose up --build
