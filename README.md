# dnsmasq-blacklist

A small shell script that creates a bunch of DNS blacklist for Dnsmasq.

1. Edit the script to suit your needs (not every category in Shallalist is used).
2. Run the script and copy the resulting `txt` files into a directory of your choice. I use `/etc/dnsmasq-hosts-blocking`
3. Add the option `addn-hosts=/etc/dnsmasq-hosts-blocking/` to `/etc/dnsmasq.conf`
3. Restart Dnsmasq.

Please note that some of the regular expressions in the script are CPU and memory hungry. If you run Dnsmasq on a slow device you're adviced to run this script on a faster computer and then transfer the resulting `txt` files.

More list can be found at [The Firebog](https://firebog.net/)

Feel free to contribute!
