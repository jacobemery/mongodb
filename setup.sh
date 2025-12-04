#!/usr/bin/env bash
set -e
command -v python3 >/dev/null 2>&1 || sudo dnf install -y python3 python3-pip || sudo yum install -y python3 python3-pip
command -v pip3 >/dev/null 2>&1 || sudo dnf install -y python3-pip || sudo yum install -y python3-pip
command -v ansible-playbook >/dev/null 2>&1 || sudo pip3 install ansible
