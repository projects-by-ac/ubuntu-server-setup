# ubuntu-server-setup

This bash script is designed to run **after installing Ubuntu-Server 22.04/24.04**

It automates the installation, configuration, and setup of specific packages, 
making it easier for system administrators to get their servers up and running quickly. 
By running this script, users can avoid manual steps and ensure consistent server configurations.

**Install guide:**
  - run script as root
  - input username as $1 parameter
    
**Example:**

- `sudo ./ubuntu-server.sh test1`
                    
![ubuntu-server](https://github.com/user-attachments/assets/f951dfc8-bebf-4102-9637-106fe8eb1fe2)

**This script will install & configure the following packages/settings:**
- give user root privileges
- set date/time (timezone) to NL (netherlands)
- update/upgrade packages
- install cli-tools:
  - *curl / wget / apt-transport-https / htop / duf / fzf / nnn*
- autoremove leftover packages
- setup & activate ufw firewall with ssh-access

Feel free to customize the script further based on your specific requirements and package choices!
