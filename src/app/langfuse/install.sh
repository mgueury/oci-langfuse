#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

. $HOME/compute/shared_compute.sh

# Podman and GIT
install_docker_tools

# LangFuse Source
git clone https://github.com/langfuse/langfuse.git

# Podman-compose
install_python
python -m pip install --user podman-compose

# Firewall 
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --reload

# Redis warning
sudo sysctl vm.overcommit_memory=1

# Warmup to pre-create all volumes first. It avoids error at startup
# cd langfuse
# podman compose up --no-start
# cd -