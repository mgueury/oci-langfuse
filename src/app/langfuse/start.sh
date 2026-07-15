#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
export PATH=~/.local/bin/:$PATH

. $HOME/compute/tf_env.sh

# podman-compose is a python program
source myenv/bin/activate

# Avoid: ClickHouse query failed with non-retryable error: getaddrinfo ENOTFOUND clickhouse
export CLICKHOUSE_CLUSTER_ENABLED=false

cd langfuse
podman-compose up 2>&1 | tee ../langfuse.log
