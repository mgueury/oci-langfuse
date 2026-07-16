#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/..

. starter.sh env -silent

get_ui_url

echo 
echo "Build done"

# Do not show the Done URLs if after_build.sh exists 
if [ "$UI_URL" != "" ]; then
    echo "URLs" > $FILE_DONE
    append_done "- LangFuse: $UI_URL:3000/"     
    append_done "  User = $TF_VAR_langfuse_init_user_email"
    append_done "  Password = $TF_VAR_langfuse_init_user_password"
    append_done "- Runtime"
    append_done "  LANGFUSE_PUBLIC_KEY: $TF_VAR_langfuse_init_project_public_key"
    append_done "  LANGFUSE_SECRET_KEY: $TF_VAR_langfuse_init_project_secret_key"
    append_done "  LANGFUSE_BASE_URL: http://$BASTION_IP:3000"
    append_done ""
    append_done "In this sample the IP is public and the IP range to access it is limited to your Laptop IP"
elif [ ! -f $FILE_DONE ]; then
    echo "-" > $FILE_DONE  
fi
cat $FILE_DONE  