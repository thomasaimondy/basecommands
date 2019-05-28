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
