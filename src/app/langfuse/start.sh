#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
export PATH=~/.local/bin/:$PATH

. $HOME/compute/tf_env.sh

# podman-compose is a python program
source myenv/bin/activate

cd langfuse
podman-compose up 2>&1 | tee ../langfuse.log
