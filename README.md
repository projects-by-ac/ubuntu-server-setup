# ubuntu-server-setup

This Script is designed to run **after installing Ubuntu-Server 22.04/24.04**

**install guide:**
  - run script as root
  - input username as $1 parameter
    
***example:***  *sudo ./ubuntu-server.sh test1*
                    
![ubuntu-server](https://github.com/user-attachments/assets/f951dfc8-bebf-4102-9637-106fe8eb1fe2)

- give user root privileges
- set date/time (timezone) to NL (netherlands)
- update/upgrade packages
- autoremove leftover packages
- install cli-tools:
  - *curl / wget / apt-transport-https / htop / duf / fzf / nnn*
- setup & activate ufw firewall with ssh-access
