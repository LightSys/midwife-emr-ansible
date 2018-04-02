# Notes on using this playbook

## Requirements and Assumptions:

1. Assumes that secure.yaml is in the top directory and that it is protected
   with ansible-vault. This file is not included in the git repository.

2. Assumes that secure.yaml provides definitions for the following variables:

   - support_user_password: this should be encrypted using `mkpasswd --method=SHA-512`
   - midwifeemr_user_password: this should also be encrypted
   - root_password: encrypted as well
   - mysql_root_password: encrypted

3. Assumes that `support_user.pub` is in `roles/users/files` and it is the SSH
   public file of the support user. This file is not included in the git
   repository.

4. Assumes that there is a file named `odroid` in `inventories` and it
   contains variable assignments. See sample below for details.

## inventories/odroid

```
[odroid]
192.168.20.21

[odroid:vars]
ansible_ssh_user=root
download_dir=/root/downloads
hostname=midwife-emr
locale=en_US.UTF-8
timezone=Asia/Manila
support_user=support
database_support_user=midwifesupport
nodejs_version=6.9.4
midwife_emr_version=master
midwife_emr_internal_docs_deploy_dir=/srv/midwife-emr-internal

# The remote host that the ODroid connects to for support purposes.
midwife_emr_support_remote_host="midwife-emr-support.example.com"

# The remote ssh port that the ODroid connects to for support purposes.
midwife_emr_support_remote_port=22

# This id is for copying the generated public key to the remote support server.
ssh_id_for_remote_host=/home/your_username_here/.ssh/your_SSH_id_file

# Note: midwife_emr_support_forwarding_port is the port for port-forwarding
# that the ODroid will establish with autossh and is set via an Ansible prompt.
```

## Running from the command line

Running the whole thing. Will be prompted for the root password.

```
ansible-playbook site.yaml -i inventories/odroid -k --vault-password-file ~/.ansible/vault_pass.txt
```

Running starting from a certain task

```
ansible-playbook site.yaml -i inventories/odroid -k --vault-password-file ~/.ansible/vault_pass.txt --start-at-task "Download Nodejs"
```

## TODO

- Provide a means to specify whether the target should be build using a static
  IP or dynamic one.
- Provide a means to specify whether the target should run a DHCP server (but
  only if using a static IP).
