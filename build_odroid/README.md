# Notes on using this playbook

## TODO in no particular order mostly:

- adjust /etc/network/interfaces.d/eth0 and wlan0
- configure and harden SSH
- install gulp
- determine if we still need bower (what version of software is Pami getting?)
- install Midwife-EMR
- configure MySQL
- install midwife-emr-services
- configure nginx or does midwife-emr-services do this?
- No more Redis, right?
- midwife-emr service
- configure ufw
- install autossh and configure
- configure remote backups
- install and configure automysqlbackups
- configure cron jobs

## Done

- setup the hostname
- change root password.
- add user named support in new admin group
- install Nodejs binary
- create Nodejs user
- install MySQL
- install nginx
- Configure external shutdown button

## Requirements:

1. Assumes that secure.yaml is in the top directory and that it is protected
   with ansible-vault. This file is not included in the git repository.

2. Assumes that secure.yaml provides definitions for the following variables:

   - support_user_password: this should be encrypted using `mkpasswd --method=SHA-512`
   - midwifeemr_user_password: this should also be encrypted
   - root_password: encrypted as well



## Running from the command line

Running the whole thing. Will be prompted for the root password.

```
ansible-playbook site.yaml -i inventories/odroid -k --vault-password-file ~/.ansible/vault_pass.txt
```

Running starting from a certain task

```
ansible-playbook site.yaml -i inventories/odroid -k --vault-password-file ~/.ansible/vault_pass.txt --start-at-task "Download Nodejs"
```
