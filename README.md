# Ansible playbooks to install and uninstall MongoDB

This is a very simple, quick and dirty, automated install process for MongoDB on s390x (IBM Z & LinuxONE) servers. It's needed because mongodb-enterprise is not included in the base repository. Hope it helps!

Assumptions:
- This is running directly on a Red Hat Enterprise Linux (RHEL) server (tested on RHEL 8 & 9). You can run it from a remote controller, or against multiple servers, you'd just need to make some changes to the `inventory.ini` file.
- You have passwordless sudo access.
- This is not a production server. This is an opinionated install, so if there's actual important workload on the server you're installing to, make sure this won't mess things up for you.

## 1) Become root
~~~
sudo -i
~~~
## 2) Install git
Will only install if you don't have it already
~~~
command -v git >/dev/null 2>&1 && echo "git already installed" || sudo dnf install -y git
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
Will only install if you don't have them already
~~~
chmod +x setup.sh && ./setup.sh
~~~
## 6) Run the playbooks:
To install MongoDB Enterprise with Ansible with defaults:
~~~
ansible-playbook install.yml
~~~
Optionally, specify the desired major.minor version (default version is 8.2), i.e.
~~~
ansible-playbook install.yml -e version=8.0
~~~
To get more output, add -v for verbosity, more Vs = more output, i.e.
~~~
ansible-playbook install.yml -vvv
~~~
To uninstall:
~~~
ansible-playbook uninstall.yml
~~~