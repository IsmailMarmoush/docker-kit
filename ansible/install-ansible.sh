#!/bin/sh
set -eu

: "${ANSIBLE_VERSION:?ANSIBLE_VERSION is required}"

apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    python3 \
    python3-pip \
    python3-venv \
    openssh-client

python3 -m venv /opt/ansible

/opt/ansible/bin/pip install \
    --no-cache-dir \
    "ansible==${ANSIBLE_VERSION}"

ln -s /opt/ansible/bin/ansible /usr/local/bin/ansible
ln -s /opt/ansible/bin/ansible-playbook /usr/local/bin/ansible-playbook
ln -s /opt/ansible/bin/ansible-galaxy /usr/local/bin/ansible-galaxy

mkdir -p /etc/ansible

printf '%s\n' 'localhost ansible_connection=local' > /etc/ansible/hosts

rm -rf /var/lib/apt/lists/*