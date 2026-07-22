## OCI Starter - LangFuse
### Usage

Install LangFuse on OCI using terraform.

For more info: https://langfuse.com/self-hosting/deployment/docker-compose

### Commands
- starter.sh             : Show the menu
- starter.sh help        : Show the list of commands
- starter.sh build       : Build the whole program: Run Terraform, Configure the DB, Build the App, Build the UI
- starter.sh destroy     : Destroy the objects created by Terraform
- starter.sh env         : Set the env variables in BASH Shell
- starter.sh ssh bastion : SSH to the Bastion
- ...
                    
### Directories
- src              : Sources files
    - app          : Source of the Application
        - langfuse : LangFuse installation script

### Next Steps:
- Edit the file terraform.tfvars. Some variables need to be filled:
```
# Filter IP access to the LangFuse machine from Internet
public_ip_filter="__TO_FILL__"
```

- Run:
  cd langfuse
  ./starter.sh
