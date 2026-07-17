#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

. $HOME/compute/shared_compute.sh

# GIT
sudo dnf install -y git

# Docker-CE
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce
sudo usermod -aG docker opc
sudo systemctl enable docker
sudo systemctl start docker

# Podman and GIT
# podmam-compose seems very buggy... ?
# install_docker_tools

# LangFuse Source
git clone https://github.com/langfuse/langfuse.git

# Firewall 
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --reload

# Redis warning
sudo sysctl vm.overcommit_memory=1

# Warmup to pre-create all volumes first. It avoids error at startup
cd langfuse
docker compose up --no-start
