FROM debian:trixie-slim

ARG ANSIBLE_VERSION

COPY install-ansible.sh /usr/local/bin/install-ansible.sh

RUN chmod +x /usr/local/bin/install-ansible.sh \
    && install-ansible.sh \
    && rm /usr/local/bin/install-ansible.sh

WORKDIR /ansible

CMD ["ansible-playbook", "--version"]