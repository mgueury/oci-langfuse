if grep -q 'STREAM_OCID' $TARGET_DIR/tf_env.sh; then
    echo "tf_env.sh already modified"
else 
    ## Set env variables needed for env.sh

    # LangFuse
    append_tf_env "export TF_VAR_langfuse_init_user_email=\"$TF_VAR_langfuse_init_user_email\""
    append_tf_env "export TF_VAR_langfuse_init_user_password=\"$TF_VAR_langfuse_init_user_password\""
    append_tf_env "export TF_VAR_langfuse_init_project_public_key=\"$TF_VAR_langfuse_init_project_public_key\""
    append_tf_env "export TF_VAR_langfuse_init_project_secret_key=\"$TF_VAR_langfuse_init_project_secret_key\""
fi