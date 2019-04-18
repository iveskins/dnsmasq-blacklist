# dnsmasq-blacklist

A small shell script that creates a bunch of DNS blacklist for Dnsmasq.

1. Edit the script to suit your needs (not every category in Shallalist is used).
2. Run the script and copy the resulting conf files in `config-files` to `/etc/dnsmasq.d/`.
3. Restart Dnsmasq.

Please note that some of the regular expressions in the script are CPU and memory hungry. If you run Dnsmasq on a slow device you're adviced to run this script on a faster computer and then transfer the resulting files.

Feel free to contribute!
