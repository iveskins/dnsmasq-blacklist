#!/bin/sh

# Remove files that possibly exist from last run.
rm hosts *.conf shalla* *.acl *.txt
rm -rf BL

#
# Steven Black hosts file.
#
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
cp hosts stevenblackhosts.conf

# Remove this line.
sed -i -e 's#0.0.0.0 0.0.0.0##' stevenblackhosts.conf

# Delete empty lines or blank lines.
sed -i -e '/^$/d' stevenblackhosts.conf

# Delete lines that begin with #.
sed -i -e '/^#/d' stevenblackhosts.conf

# Delete other specific lines.
sed -i -e '/^::/d' stevenblackhosts.conf
sed -i -e '/^127.0.0.1/d' stevenblackhosts.conf
sed -i -e '/^255.255.255.255/d' stevenblackhosts.conf
sed -i -e '/^ff0/d' stevenblackhosts.conf
sed -i -e '/^fe80/d' stevenblackhosts.conf
sed -i -e 's#0.0.0.0 ##' stevenblackhosts.conf

# Remove inline comments.
sed -i -e 's/#.*$//' stevenblackhosts.conf

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' stevenblackhosts.conf

#
# Crazy Max anti phone home Windows 10 spying.
#
wget http://winspyblocker.crazyws.fr/data/hosts/spy.txt
wget http://winspyblocker.crazyws.fr/data/hosts/update.txt
wget http://winspyblocker.crazyws.fr/data/hosts/extra.txt
cat spy.txt > crazy-max.conf
cat update.txt >> crazy-max.conf
cat extra.txt >> crazy-max.conf

# Delete lines that begin with #.
sed -i -e '/^#/d' crazy-max.conf

# Delete empty lines or blank lines.                                                                          
sed -i -e '/^$/d' crazy-max.conf

# Delete other specific lines.
sed -i -e 's#0.0.0.0 ##' crazy-max.conf

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' crazy-max.conf

#
# Shallalist.
# 
wget http://www.shallalist.de/Downloads/shallalist.tar.gz
tar -xzvf shallalist.tar.gz

# COMMENT OUT THE SECTIONS YOU DON'T WANT.

touch shallalist.conf
cat BL/adv/domains >> shallalist.conf
cat BL/aggressive/domains >> shallalist.conf
cat BL/alcohol/domains >> shallalist.conf
cat BL/anonvpn/domains >> shallalist.conf
#cat BL/automobile/bikes/domains >> shallalist.conf
#cat BL/automobile/boats/domains >> shallalist.conf
#cat BL/automobile/cars/domains >> shallalist.conf
#cat BL/automobile/planes/domains >> shallalist.conf
#cat BL/chat/domains >> shallalist.conf
cat BL/costtraps/domains >> shallalist.conf
cat BL/dating/domains >> shallalist.conf
cat BL/downloads/domains >> shallalist.conf
cat BL/drugs/domains >> shallalist.conf
#cat BL/dynamic/domains >> shallalist.conf
#cat BL/education/schools/domains >> shallalist.conf
#cat BL/finance/banking/domains >> shallalist.conf
#cat BL/finance/insurance/domains >> shallalist.conf
#cat BL/finance/moneylending/domains >> shallalist.conf
#cat BL/finance/other/domains >> shallalist.conf
#cat BL/finance/realestate/domains >> shallalist.conf
#cat BL/finance/trading/domains >> shallalist.conf
#cat BL/fortunetelling/domains >> shallalist.conf
#cat BL/forum/domains >> shallalist.conf

# For some strange reason github.com doesn't work when this list is added.
# Github isn't located in the domain file.
#cat BL/gamble/domains >> shallalist.conf

#cat BL/government/domains >> shallalist.conf
#cat BL/hacking/domains >> shallalist.conf
#cat BL/hobby/cooking/domains >> shallalist.conf
#cat BL/hobby/games-misc/domains >> shallalist.conf
#cat BL/hobby/games-online/domains >> shallalist.conf
#cat BL/hobby/gardening/domains >> shallalist.conf
#cat BL/hobby/pets/domains >> shallalist.conf
#cat BL/homestyle/domains >> shallalist.conf
#cat BL/hospitals/domains >> shallalist.conf
#cat BL/imagehosting/domains >> shallalist.conf
#cat BL/isp/domains >> shallalist.conf
#cat BL/jobsearch/domains >> shallalist.conf
#cat BL/library/domains >> shallalist.conf
#cat BL/military/domains >> shallalist.conf
#cat BL/models/domains >> shallalist.conf
#cat BL/movies/domains >> shallalist.conf
#cat BL/music/domains >> shallalist.conf
#cat BL/news/domains >> shallalist.conf
#cat BL/podcasts/domains >> shallalist.conf
#cat BL/politics/domains >> shallalist.conf
cat BL/porn/domains >> shallalist.conf
#cat BL/radiotv/domains >> shallalist.conf
#cat BL/recreation/humor/domains >> shallalist.conf
#cat BL/recreation/martialarts/domains >> shallalist.conf
#cat BL/recreation/restaurants/domains >> shallalist.conf
#cat BL/recreation/sports/domains >> shallalist.conf
#cat BL/recreation/travel/domains >> shallalist.conf
#cat BL/recreation/wellness/domains >> shallalist.conf
#cat BL/redirector/domains >> shallalist.conf
#cat BL/religion/domains >> shallalist.conf
#cat BL/remotecontrol/domains >> shallalist.conf
#cat BL/ringtones/domains >> shallalist.conf
#cat BL/science/astronomy/domains >> shallalist.conf
#cat BL/science/chemistry/domains >> shallalist.conf
#cat BL/searchengines/domains >> shallalist.conf
cat BL/sex/education/domains >> shallalist.conf
cat BL/sex/lingerie/domains >> shallalist.conf
#cat BL/shopping/domains >> shallalist.conf
#cat BL/socialnet/domains >> shallalist.conf
#cat BL/spyware/domains >> shallalist.conf
cat BL/tracker/domains >> shallalist.conf
#cat BL/updatesites/domains >> shallalist.conf
cat BL/urlshortener/domains >> shallalist.conf
cat BL/violence/domains >> shallalist.conf
cat BL/warez/domains >> shallalist.conf
cat BL/weapons/domains >> shallalist.conf
#cat BL/webmail/domains >> shallalist.conf
#cat BL/webphone/domains >> shallalist.conf
#cat BL/webradio/domains >> shallalist.conf
#cat BL/webtv/domains >> shallalist.conf

# Remove all IP only lines.
sed -i -e 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}//g' shallalist.conf

# Remove the dot from lines that begins with a dot.
sed -i -e 's/^\.//' shallalist.conf

# Fix mistake in the warez zone.
sed -i -e 's#tpb"#tpb#' shallalist.conf 

# Remove PIA from the list because we want that.
sed -i '/privateinternetaccess.com/d' shallalist.conf

# Delete empty lines or blank lines.
sed -i -e '/^$/d' shallalist.conf

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' shallalist.conf

#
# Squid Blacklist. 
#
wget https://www.squidblacklist.org/downloads/dg-ads.acl

# Delete empty lines or blank lines.
sed -i -e '/^$/d' dg-ads.acl

# Delete lines that begin with #.
sed -i -e '/^#/d' dg-ads.acl

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' dg-ads.acl 

# Create our final list.
cat crazy-max.conf stevenblackhosts.conf shallalist.conf dg-ads.acl > dnsmasq-blacklist.conf

# Add a homemade blacklist.
echo "address=/yandex.com/0.0.0.0" >> dnsmasq-blacklist.conf
echo "address=/cpy-crack.net/0.0.0.0" >> dnsmasq-blacklist.conf
echo "address=/ovpn.com/0.0.0.0" >> dnsmasq-blacklist.conf

echo ""
echo "Put dnsmasq-blacklist.conf in /etc/dnsmasq.d/"
echo ""
echo "Restart dnsmasq and remember to check the log!"
echo ""

