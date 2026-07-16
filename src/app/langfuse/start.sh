#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
export PATH=~/.local/bin/:$PATH

. $HOME/compute/tf_env.sh

# podman-compose is a python program
source myenv/bin/activate

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
podman-compose up 2>&1 | tee ../langfuse.log
