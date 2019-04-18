#!/bin/sh

# See The Big Blocklist Collection for futher lists if needed:
# https://firebog.net/

# Remove files from last run (if any).
if [[ -d 'config-files' ]]; then
    rm config-files/*
else
    mkdir config-files
fi
if [[ -d 'tmp' ]]; then
    rm -rf tmp/*
else
    mkdir tmp
fi
cd tmp

#-------------------------------------#
# Steven Black unified hosts file
#-------------------------------------#

# Steven Black unified hosts file with fakenews, gambling, and porn extensions.
# https://github.com/StevenBlack/hosts
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts
mv hosts stevenblackhosts.conf

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

# Remove Epic Games metrics from the list.
sed -i '/metric-public-service-prod.ol.epicgames.com//d' stevenblackhosts.conf

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' stevenblackhosts.conf

#-------------------------------------#
# Crazy Max Microsoft telemetry
#-------------------------------------#

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

# Windows 10 performs regular lookups to these domains.
echo "address=/canonicalizer.ucsuri.tcs/0.0.0.0" >> crazy-max.conf
echo "address=/ctldl.windowsupdate.com/0.0.0.0" >> crazy-max.conf

#-------------------------------------#
# Shallalist
#-------------------------------------#

wget http://www.shallalist.de/Downloads/shallalist.tar.gz
tar -xzvf shallalist.tar.gz

touch shallalist.conf
#cat BL/adv/domains >> shallalist.conf
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
#cat BL/downloads/domains >> shallalist.conf
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
#cat BL/urlshortener/domains >> shallalist.conf
cat BL/violence/domains >> shallalist.conf
cat BL/warez/domains >> shallalist.conf
#cat BL/weapons/domains >> shallalist.conf
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

#-------------------------------------#
# Squid blacklist
#-------------------------------------#

wget https://www.squidblacklist.org/downloads/dg-ads.acl
mv dg-ads.acl dg-ads.conf

# Delete empty lines or blank lines.
sed -i -e '/^$/d' dg-ads.conf

# Delete lines that begin with #.
sed -i -e '/^#/d' dg-ads.conf

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' dg-ads.conf

#-------------------------------------#
# Firebog privacy list 
#-------------------------------------#

wget https://v.firebog.net/hosts/Easyprivacy.txt
mv Easyprivacy.txt easyprivacy.conf

# Delete empty lines or blank lines.
sed -i -e '/^$/d' easyprivacy.conf

# Delete lines that begin with #.
sed -i -e '/^#/d' easyprivacy.conf

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' easyprivacy.conf

#-------------------------------------#
# Firebog ads list 
#-------------------------------------#

wget https://v.firebog.net/hosts/Prigent-Ads.txt
mv Prigent-Ads.txt prigent-ads.conf

# Delete empty lines or blank lines.
sed -i -e '/^$/d' prigent-ads.conf

# Delete lines that begin with #.
sed -i -e '/^#/d' prigent-ads.conf

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' prigent-ads.conf

#-------------------------------------#
# NoTrack Tracker Blocklist 
#-------------------------------------#

wget https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt
mv notrack-blocklist.txt notrack-blocklist.conf

# Delete empty lines or blank lines.
sed -i -e '/^$/d' notrack-blocklist.conf

# Delete lines that begin with #.
sed -i -e '/^#/d' notrack-blocklist.conf

# Remove inline comments.
sed -i -e 's/#.*$//' notrack-blocklist.conf

# Remove left over white space.
sed -i 's/ //g' notrack-blocklist.conf

# Change into Dnsmasq format.
sed -i -e 's#^#address=/#; s#$#/0.0.0.0#' notrack-blocklist.conf

#-------------------------------------#
# Misc
#-------------------------------------#

# Add anti Nvidia telemetry.
touch misc.conf
echo "address=/gfswl.geforce.com/0.0.0.0" >> misc.conf
echo "address=/telemetry.nvidia.com/0.0.0.0" >> misc.conf
echo "address=/gfe.nvidia.com/0.0.0.0" >> misc.conf
echo "address=/telemetry-dce.gfe.nvidia.com/0.0.0.0" >> misc.conf
echo "address=/events-dc1.gfe.nvidia.com/0.0.0.0" >> misc.conf

# Add some homemade entries.
echo "address=/yandex.com/0.0.0.0" >> misc.conf
echo "address=/cpy-crack.net/0.0.0.0" >> misc.conf
echo "address=/ovpn.com/0.0.0.0" >> misc.conf
echo "address=/ssl.google-analytics.com/0.0.0.0" >> misc.conf

# Remove any blank spaces.
sed -i -e 's/ //g' misc.conf

# Remove any www. infront of domains.
sed -i -e 's/www\.//g' misc.conf

#-------------------------------------#
# Clean up
#-------------------------------------#

# Remove any duplicate entries.

# The old solution was to combine all files into one and then use awk:
# awk '!seen[$0]++' tmp.conf > dnsmasq-blacklist.conf
# By using this for loop we keep the different files separated and still
# prevent the occurrence of duplicate entries.

# This is CPU and memory expensive.
temp=$(mktemp)
for file_to_dedupe in $(echo *.conf|sort)
do
   for file_to_strip in *.conf
   do
      [ "$file_to_dedupe" == "$file_to_strip" ] && continue
      grep -w -Ff ${file_to_dedupe} -v ${file_to_strip} > ${temp}
      mv ${temp} ${file_to_strip}
   done
done

mv *.conf ../config-files/

echo ""
echo "Put all the *.conf files from the 'config-files' directory into"
echo "/etc/dnsmasq.d/"
echo ""
echo "Restart dnsmasq and remember to check the log!"
echo ""

