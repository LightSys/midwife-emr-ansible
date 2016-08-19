# Notes on using this playbook

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
