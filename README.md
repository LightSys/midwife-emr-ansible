# Midwife-EMR Ansible Playbook

This is an Ansible playbook that can be used to build out an Odroid XU-4 with
the Midwife-EMR system.

See build_odroid/README.md for further details after following the
pre-playbook installation instructions below.

## Pre-playbook Installation

Before running the Ansible playbook, the Odroid XU4 and eMMC card must be
configured to run a minimal Linux server, Ubuntu 16.04 LTS.

These are the steps to prepare a new eMMC chip and XU4.

**NOTE: WARNING - WARNING - WARNING: the scripts in the scripts directory use
the `dd` command to write data to the eMMC flash chip. BUT, you must insure
that the partitions used actually reference the eMMC chip itself as opposed to
some other partition on your system.

You MUST modify the scripts for your own use in order that the correct
partition is referenced. Failure to do so could result in the destruction of
data in your own computer.**


1. Read `scripts/README.md` and follow the instructions carefully.
2. Attach the Odroid to the network using an ethernet cable and identify the
   IP address.
3. The Odroid will boot up and shut itself down again is a minute or two.
   Restart it after it does this.
4. SSH into the odroid using root/odroid as the username/password. For
   example, something like this but with the IP address you found in step 2.

```
ssh root@192.168.0.150
```

5. Follow the instructions on the Odroid wiki page here:
   https://wiki.odroid.com/odroid-xu4/os_images/linux/ubuntu_4.14/20171213#how_to_update_system_and_kernel_software_don_t_forget_dist-upgrade

```
apt update
apt upgrade
apt dist-upgrade
apt install linux-image-xu3
reboot
```
   **NOTE: the install of linux-image-xu3 will bring up a mean looking dialog box. Select NO.**

6. Install python on the Odroid because Ansible needs it

   - SSH into the Odroid using root/odroid as the username/password.

```
apt-get install python
```

  - Exit SSH

7. Generate a ssh key for your account on your workstation (only if you don't
   have one already or want to use a dedicated SSH key).

    ```
    ssh-keygen -b 4096 -t rsa -N "" -f /home/YourUserName/.ssh/midwife-emr-odroid-support-key
    ```

8. Read the README.md in the build_odroid directory and continue with
   instructions there.

## License

Copyright (C) 2013-2018 LightSys Technology Services, Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

