
#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath='nullobsidian/udacity-microservices'

# Step 2:  
# Authenticate & tag
cat ~/my_password.txt | docker login --username nullobsidian --password-stdin
echo "Docker ID and Image: $dockerpath"
docker tag microservices $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath
