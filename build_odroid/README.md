# Notes on using this playbook

## Requirements and Assumptions:

1. Assumes that secure.yaml is in the top directory and that it is protected
   with ansible-vault. This file is not included in the git repository.

2. Assumes that secure.yaml provides definitions for the following variables:

   - support_user_password: this should be encrypted using `mkpasswd --method=SHA-512`
   - ansible_become_pass: this should be the unencrypted version of the support_user_password
   - midwifeemr_user_password: this should also be encrypted
   - root_password: encrypted as well
   - mysql_root_password: unencrypted and better without spaces and other
     weird stuff for sake of automysqlbackup

3. Assumes that there is a file named `odroid` in `inventories` and it
   contains variable assignments. See sample below for details. Nothing in the
   inventories sub-directory is included in the git repository.

4. Assumes that `support_user.pub` is in `roles/preparation/files` and it is the SSH
   public file of the support user. This file is not included in the git
   repository. This is the public key of the SSH private key mentioned in the
   next step.

5. Assumes that the ansible_ssh_private_key_file in `inventories/odroid` is
   set to your SSH private key.

6. Assumes that ansible_ssh_user in `inventories/odroid` is set to the user
   account that you want the playbook to create on the odroid and authorize
   access to via the SSH public key in step 4 above.

7. Assumes that `preparation.sh` is run first one time against the target
   Odroid. Therefter, `play.sh` is always used.

8. Assumes that the midwife_emr_support_forwarding_port in
   `inventories/odroid` is set to a unique port per Odroid that allows remote
   support over SSH. No two currently active Odroids should be built with the
   same port if you want to be able to access them via SSH when they are
   located behind a NAT.

## inventories/odroid

```
[odroid]
192.168.20.21

[odroid:vars]
ansible_ssh_user=support
ansible_ssh_private_key_file=/home/yourUserName/.ssh/your-ssh-private-key
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

# This is the port-forwarding port that the Odroid will establish with autossh.
# This needs to be unique to each Odroid supported.
midwife_emr_support_forwarding_port=53258
```

## Running from the command line

As mentioned above, use `preparation.sh` once, and thereafter, use the
`play.sh` script in this directory.

## TODO

- Provide a means to specify whether the target should be build using a static
  IP or dynamic one.
- Provide a means to specify whether the target should run a DHCP server (but
  only if using a static IP).
