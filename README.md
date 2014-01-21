Installation
===

Install Vagrant on your host system: http://www.vagrantup.com/downloads.html
Then on your host system, run:
```
vagrant up
```

This will take about 30 minutes so feel free to grab a cup of coffee. It downloads a 300mb precise Linux box and installs Apache, MySQL, PHP, etc.

Apache will listen on 127.0.0.1:3000 and SSH on 127.0.0.1:2200. You can edit the Vagrantfile if you want to Box to use DHCP/NAT or similar.

Commands:
```
# Reloads the Vagrant-file if you've changed netowrk configuration etc.
vagrant reload

# Installs software on the machine according to the puppet-files
vagrant provision

# Turns the machine off
vagrant halt

# Hibernate. Saves the machine state to disk and turn it off
vagrant suspend

# Turns everything back on again
vagrant up
```

TODO
===
* Drupal Installation
* Samba (to access files, faster than Vagrant shared folder)
* Replace Apache with NGINX
* Replace MySQL with MariaDB

===
Based on https://github.com/willdietrich/vagrant-lamp
