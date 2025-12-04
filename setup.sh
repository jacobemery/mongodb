#!/usr/bin/env bash
set -e

# Get RHEL major version (e.g. "8" or "9")
. /etc/os-release
rhel_major="${VERSION_ID%%.*}"

changed=false

# Python
if command -v python3 >/dev/null 2>&1; then
  echo "[OK] python3 already installed"
else
  echo "[*] Installing python3..."
  sudo dnf install -y python3 python3-pip || sudo yum install -y python3 python3-pip
  changed=true
fi

# Pip
if command -v pip3 >/dev/null 2>&1; then
  echo "[OK] pip3 already installed"
else
  echo "[*] Installing pip3..."
  sudo dnf install -y python3-pip || sudo yum install -y python3-pip
  changed=true
fi

# Ansible
if command -v ansible-playbook >/dev/null 2>&1; then
  echo "[OK] ansible already installed"
else
  echo "[*] Installing ansible..."
  sudo dnf install -y "https://dl.fedoraproject.org/pub/epel/epel-release-latest-${rhel_major}.noarch.rpm" ansible
  changed=true
fi

# Final message
if [ "$changed" = true ]; then
  echo
  echo "Setup completed successfully."
else
  echo
  echo "Nothing to do. System already configured."
fi
