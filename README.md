# Ansible playbooks to install and uninstall MongoDB

This is a very simple, quick and dirty (somewhat) automated install process for MongoDB on s390x (IBM Z & LinuxONE) servers. It's needed because mongodb-enterprise is not included in the base repository. Hope it helps!

Assumptions:
- This is running directly on a Red Hat Enterprise Linux (RHEL) server (tested on RHEL 8 & 9).
- You have passwordless sudo access.
- This is not a production server.

## 1) Become root
~~~
sudo -i
~~~
## 2) Install git
### Will only install if you don't have it already
~~~
command -v git >/dev/null 2>&1 && echo "git already installed" || sudo dnf install -y git || sudo dnf install -y git
~~~
## 3) Clone this git repository:
~~~
git clone https://github.com/jacobemery/mongodb.git
~~~
## 4) Open the cloned folder:
~~~
cd mongodb
~~~
### 5) Run the setup script to install pre-reqs (Ansible & Python)
### Will only install if you don't have them already
~~~
chmod +x setup.sh && ./setup.sh
~~~
## 6) Install MongoDB Enterprise.
### Optionally, specify the desired major.minor version (default version is 8.2):
~~~
ansible-playbook install_mongodb.yml -e version=8.0
~~~
### To uninstall:
~~~
ansible-playbook uninstall_mongodb.yml
~~~