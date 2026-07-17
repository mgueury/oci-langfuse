#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

. $HOME/compute/shared_compute.sh

# GIT
sudo dnf install -y git

# Docker-CE
install_docker_ce

# LangFuse Source
git clone https://github.com/langfuse/langfuse.git

# Firewall 
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --reload

# Redis warning
sudo sysctl vm.overcommit_memory=1

# Warmup to pre-create all volumes first. It avoids errors at startup
cd langfuse
docker compose up --no-start
