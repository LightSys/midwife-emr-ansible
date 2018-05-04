#!/bin/bash
# =============================================
# Play the Ansible playbook.
#
# Note: due to a bug in Ansible 2.5 as of this writing, we
# have to explicitly set ANSIBLE_GATHER_SUBSET to not include
# "hardware".
# https://github.com/ansible/ansible/issues/37850
# =============================================

ANSIBLE_GATHER_SUBSET="!hardware all"
export ANSIBLE_GATHER_SUBSET

ansible-playbook --extra-vars "ansible_ssh_user=root" -k -i inventories/odroid --vault-password-file ~/.ansible/vault_pass.txt preparation.yaml
