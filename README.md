# Ansible playbooks to install and uninstall MongoDB

## 1) Become root
~~~
sudo -i
~~~
## 2) Install Ansible:
~~~
pip3 install ansible
~~~
## 3) Clone this repository:
~~~
git clone https://github.com/jacobemery/mongodb.git
~~~
## 4) Open the folder:
~~~
cd mongodb
~~~
## 5) Install MongoDB Enterprise.
Optionally, specify the major.minor version (default is 8.2):
~~~
ansible-playbook install_mongodb.yml -e version=8.0
~~~
To uninstall:
~~~
ansible-playbook uninstall_mongodb.yml
~~~