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
cd langfuse
podman compose up --no-start
cd -

# Avoid: ClickHouse query failed with non-retryable error: getaddrinfo ENOTFOUND clickhouse
export CLICKHOUSE_CLUSTER_ENABLED=false

# User / Password
export LANGFUSE_INIT_USER_EMAIL=$TF_VAR_langfuse_init_user_email
export LANGFUSE_INIT_USER_PASSWORD=$TF_VAR_langfuse_init_user_password

# Key
export LANGFUSE_INIT_PROJECT_PUBLIC_KEY=$TF_VAR_langfuse_init_project_public_key
export LANGFUSE_INIT_PROJECT_SECRET_KEY=$TF_VAR_langfuse_init_project_secret_key

# User, organisation, and project to create on the first startup.
export LANGFUSE_INIT_ORG_ID="org"
export LANGFUSE_INIT_PROJECT_ID="project"

cd langfuse
# podman-compose up 2>&1 | tee ../langfuse.log
podman-compose up -d
