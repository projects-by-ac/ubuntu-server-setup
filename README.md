## Automated Server Setup Script for Ubuntu Server 22.04/24.04

### Overview
This bash script is designed to run **after installing Ubuntu-Server 22.04/24.04**

It automates the installation, configuration, and setup of specific packages, 
making it easier for system administrators to get their servers up and running quickly. 
By running this script, users can avoid manual steps and ensure consistent and uniform server configurations.
                    
![ubuntu-server](https://github.com/user-attachments/assets/f951dfc8-bebf-4102-9637-106fe8eb1fe2)

### Features
- **Root Privileges**: Grants the user root privileges to execute administrative tasks.
- **Timezone Configuration**: Sets the date and time to NL (Netherlands) timezone.
- **System Update and Upgrade**: Updates and upgrades all packages on the Ubuntu server to ensure the latest versions are installed.
- **CLI Tools Installation**: Installs essential command-line tools including `curl`, `wget`, `apt-transport-https`, `htop`, `duf`, `fzf`, and `nnn`.
- **Package Cleanup**: Automatically removes any leftover packages to free up space and maintain a clean system.
- **Firewall Setup**: Configures and activates the UFW (Uncomplicated Firewall) with SSH access to enhance server security.

### Requirements
- Ubuntu Server 22.04 or 24.04
- Bash
- Run script as root
- Input username as $1 parameter

### Installation
Clone the repository:
   ```bash
   git clone https://github.com/projects-by-ac/ubuntu-server-setup.git
```
   
Navigate to the script directory:
   ```bash
   cd ubuntu-server-setup
```
   
Make the script executable:
   ```bash
   sudo chmod +x ubuntu-server.sh
```

Run the script with username as $1 parameter:  

*(example running script with 'test1' as username)*  

   ```bash
   sudo ./ubuntu-server.sh test1
```

### This script has been thoroughly tested on Ubuntu Server 24.04


Feel free to customize the script further based on your specific requirements and package choices!
