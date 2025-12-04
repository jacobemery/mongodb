#!/usr/bin/env bash
set -e

# Get RHEL major version (e.g. 8, 9)
. /etc/os-release
rhel_major="${VERSION_ID%%.*}"

command -v python3 >/dev/null 2>&1 || sudo dnf install -y python3 python3-pip || sudo yum install -y python3 python3-pip
command -v pip3 >/dev/null 2>&1 || sudo dnf install -y python3-pip || sudo yum install -y python3-pip
command -v ansible-playbook >/dev/null 2>&1 || \
  sudo dnf install -y "https://dl.fedoraproject.org/pub/epel/epel-release-latest-${rhel_major}.noarch.rpm" ansible
