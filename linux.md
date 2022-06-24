# basecommands
basic commands on ubuntu

# clear the big file in ubuntu:

```sh
du -sh * |grep G
```

Check first: /var/log/cups !!


```
# resolution for /var/log/cups/ log is too big
sudo service cups stop
sudo rm /etc/cups/subscriptions.conf*
sudo rm -r /var/cache/cups
sudo service cups start
```


Ubuntu server change IP address:

```
vim /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
ip addr show
sudo vim /etc/netplan/00-installer-config.yaml
addresses: [172.18.30.116/24]
      gateway4: 172.18.50.254
      nameservers:
        addresses: [172.18.50.3]
sudo netplan apply
```
