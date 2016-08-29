# Notes on using this playbook

## TODO in no particular order mostly:

- configure MySQL (get rid of 4 passwordless root accounts)
- configure ufw
- install autossh and configure (make this a separate playbook)
- configure remote backups
- install and configure automysqlbackups
- configure cron jobs
- Resolve hard-coded `option domain-name-servers 192.168.20.1;` in /etc/dhcp/dhcpd.conf
   - This is only when running with wlan0
- Resolve hard-coded 20 network in wlan0 for the gateway
   - This is only when running with wlan0

### Done

- setup the hostname
- change root password.
- add user named support in new admin group
- install Nodejs binary
- create Nodejs user
- install MySQL
- install nginx
- Configure external shutdown button
- adjust /etc/network/interfaces.d/eth0 and wlan0
- install/configure AP mode on wlan0
- configure iptables that are used with wlan0 in AP mode (they are not installing yet)
- configure and harden SSH (NO CHANGE)
- determine if we still need bower (what version of software is Pami getting?)
- No more Redis, right?
- install Midwife-EMR
- install midwife-emr-services
- midwife-emr service
- configure nginx or does midwife-emr-services do this?
- install and configure automysqlbackups
- configure cron jobs

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
