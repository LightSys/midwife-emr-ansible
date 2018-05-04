#!/bin/bash
# =============================================
# Play the Ansible playbook.
#
# Note: due to a bug in Ansible 2.5 as of this writing, we
# have to explicitly set ANSIBLE_GATHER_SUBSET to not include
# "hardware".
# https://github.com/ansible/ansible/issues/37850
#
# Note: the build_admin role uses Docker. This playbook
# assumes that the local account does have permission 
# to use the docker client without requiring sudo.
# =============================================

export ANSIBLE_GATHER_SUBSET="!hardware all"

ansible-playbook -i inventories/odroid --vault-password-file ~/.ansible/vault_pass.txt play.yaml
