# Node.js Dockerized Application

This project demonstrates how to containerize a simple Node.js application using Docker. The setup employs multi-stage builds for optimizing the Docker image size and security, making it suitable for both development and production environments.

---

## **Features**

- Multi-stage Docker builds.
- Production-ready configuration using the lightweight `node:alpine` image.
- Runs the application as a non-root user for added security.
- Exposes the application on port `3000`.

---

## **Prerequisites**

To run this project on your machine, ensure you have the following installed:

1. [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. A terminal application (e.g., PowerShell, Command Prompt, or Terminal).
3. Basic familiarity with Node.js and Docker.

---

## **Project Structure**

```
/project
├── .dockerignore      # Specifies files to ignore during the Docker build process
├── Dockerfile         # Dockerfile defining the multi-stage build
├── index.js           # Simple Node.js application
├── package.json       # Application metadata and dependencies
├── package-lock.json  # Dependency lock file
```

---

## **How to Run the Application**

Follow these steps to build and run the application on your machine:

### 1. Clone the Repository

```bash
git clone https://github.com/tungstennn/Docker-Multi-Stage-Build.git
cd your-repo-name
```

### 2. Build the Docker Image

Use the following command to build the Docker image:

```bash
docker build -t my-node-app .
```

- **`-t my-node-app`**: Tags the image with the name `my-node-app`.
- **`.`**: Specifies the current directory as the context for the Docker build.

### 3. Run the Docker Container

Run the container using the image you just built:

```bash
docker run -p 3000:3000 my-node-app
```

- **`-p 3000:3000`**: Maps your local machine's port `3000` to the container's port `3000`.

### 4. Access the Application

- Open your browser and navigate to `http://localhost:3000`.
- You should see the JSON response:
  
  ```json
  { "message": "docker is easy" }
  ```

### 5. Stop the Container

To stop the running container:

- Press `Ctrl+C` in the terminal, or
- Run the following commands:

  ```bash
  docker ps        # Lists running containers
  docker stop <container_id>
  ```

---

## **How it Works**

The application is containerized using a **multi-stage Dockerfile**:

1. **Development Stage**:
   - Uses the official `node` image.
   - Installs dependencies and copies all application files into the container.

2. **Production Stage**:
   - Uses the lightweight `node:alpine` image.
   - Copies the necessary files from the development stage.
   - Runs the application as a non-root user for security.

---

## **Dockerfile Overview**

Here’s a brief overview of the `Dockerfile`:

```dockerfile
# Stage 0: Development Environment
FROM node AS builder
WORKDIR /app
COPY . .
RUN npm install

# Stage 1: Production Environment
FROM node:alpine AS production
COPY --from=builder /app .
RUN adduser -S user1
USER user1
EXPOSE 3000
CMD [ "npm", "start" ]
```

---

## **Additional Notes**

- **Optimizations**:
  - Using multi-stage builds reduces image size by excluding development dependencies.
  - Running as a non-root user enhances security.

- **Future Enhancements**:
  - Add health checks to the `Dockerfile` to monitor container health.
  - Integrate with CI/CD pipelines for automated builds and deployments.

---

## **Contributing**

Feel free to open issues or submit pull requests to improve this project. Contributions are welcome!

---

## **License**

This project is licensed under the MIT License. See the `LICENSE` file for details.

