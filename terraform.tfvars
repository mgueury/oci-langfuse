# -- Variables ---------------------------------------------

# Prefix to all resources created by terraform
prefix="langfuse"

# IP Range that can access port like 80/443 on the internet. Typically:
#   - All internet - 0.0.0.0/0
#   - or <your_laptop_ip>/32. Get your Laptop IP, by example, using https://whatismyipaddress.com
public_ip_filter="__TO_FILL__"

# Compartment
compartment_ocid="__TO_FILL__"

# LangFuse Init
# See src/app/langfuse/start.sh
#     https://langfuse.com/self-hosting/administration/headless-initialization
langfuse_init_user_email="admin@example.com"
langfuse_init_user_password="changeit"
langfuse_init_project_public_key="pk-lf-change-it"
langfuse_init_project_secret_key="sk-lf-change-it"