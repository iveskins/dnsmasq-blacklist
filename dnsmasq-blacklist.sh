#!/bin/sh

# Please note that this script currently generates a huge block list with more
# than 3 million domains! Dnsmasq can handle this extremely well, but it does
# utilize some CPU during initial loading of the list and the list takes up
# about 380 MB of memory.

# Remove files from last run (if any).
if [ -d 'hosts-files' ]; then
    rm hosts-files/*
else
    mkdir hosts-files
fi
if [ -d 'tmp' ]; then
    rm -rf tmp/*
else
    mkdir tmp
fi
cd tmp || exit

#-------------------------------------#
# Chad Mayfield's pi-hole heavy list
#-------------------------------------#

# https://github.com/chadmayfield/my-pihole-blocklists
wget https://raw.githubusercontent.com/chadmayfield/pihole-blocklists/master/lists/pi_blocklist_porn_all.list
mv pi_blocklist_porn_all.list pi_blocklist_porn_all.txt

#-------------------------------------#
# Crazy Max Microsoft telemetry
#-------------------------------------#

wget https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/extra.txt
wget https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
wget https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/update.txt
mv spy.txt crazy-max.txt
cat update.txt >> crazy-max.txt
cat extra.txt >> crazy-max.txt
rm update.txt extra.txt

#-------------------------------------#
# Shallalist
#-------------------------------------#

# Uncomment the domains you need from Shallalist.

wget http://www.shallalist.de/Downloads/shallalist.tar.gz
tar -xzvf shallalist.tar.gz

touch shallalist.txt
cat BL/adv/domains >> shallalist.txt
cat BL/aggressive/domains >> shallalist.txt
cat BL/alcohol/domains >> shallalist.txt
cat BL/anonvpn/domains >> shallalist.txt
#cat BL/automobile/bikes/domains >> shallalist.txt
#cat BL/automobile/boats/domains >> shallalist.txt
#cat BL/automobile/cars/domains >> shallalist.txt
#cat BL/automobile/planes/domains >> shallalist.txt
#cat BL/chat/domains >> shallalist.txt
cat BL/costtraps/domains >> shallalist.txt
cat BL/dating/domains >> shallalist.txt
#cat BL/downloads/domains >> shallalist.txt
cat BL/drugs/domains >> shallalist.txt
#cat BL/dynamic/domains >> shallalist.txt
#cat BL/education/schools/domains >> shallalist.txt
#cat BL/finance/banking/domains >> shallalist.txt
#cat BL/finance/insurance/domains >> shallalist.txt
#cat BL/finance/moneylending/domains >> shallalist.txt
#cat BL/finance/other/domains >> shallalist.txt
#cat BL/finance/realestate/domains >> shallalist.txt
#cat BL/finance/trading/domains >> shallalist.txt
#cat BL/fortunetelling/domains >> shallalist.txt
#cat BL/forum/domains >> shallalist.txt
#cat BL/gamble/domains >> shallalist.txt
#cat BL/government/domains >> shallalist.txt
#cat BL/hacking/domains >> shallalist.txt
#cat BL/hobby/cooking/domains >> shallalist.txt
#cat BL/hobby/games-misc/domains >> shallalist.txt
#cat BL/hobby/games-online/domains >> shallalist.txt
#cat BL/hobby/gardening/domains >> shallalist.txt
#cat BL/hobby/pets/domains >> shallalist.txt
#cat BL/homestyle/domains >> shallalist.txt
#cat BL/hospitals/domains >> shallalist.txt
#cat BL/imagehosting/domains >> shallalist.txt
#cat BL/isp/domains >> shallalist.txt
#cat BL/jobsearch/domains >> shallalist.txt
#cat BL/library/domains >> shallalist.txt
#cat BL/military/domains >> shallalist.txt
#cat BL/models/domains >> shallalist.txt
#cat BL/movies/domains >> shallalist.txt
#cat BL/music/domains >> shallalist.txt
#cat BL/news/domains >> shallalist.txt
#cat BL/podcasts/domains >> shallalist.txt
#cat BL/politics/domains >> shallalist.txt
cat BL/porn/domains >> shallalist.txt
#cat BL/radiotv/domains >> shallalist.txt
#cat BL/recreation/humor/domains >> shallalist.txt
#cat BL/recreation/martialarts/domains >> shallalist.txt
#cat BL/recreation/restaurants/domains >> shallalist.txt
#cat BL/recreation/sports/domains >> shallalist.txt
#cat BL/recreation/travel/domains >> shallalist.txt
#cat BL/recreation/wellness/domains >> shallalist.txt
#cat BL/redirector/domains >> shallalist.txt
#cat BL/religion/domains >> shallalist.txt
#cat BL/remotecontrol/domains >> shallalist.txt
#cat BL/ringtones/domains >> shallalist.txt
#cat BL/science/astronomy/domains >> shallalist.txt
#cat BL/science/chemistry/domains >> shallalist.txt
#cat BL/searchengines/domains >> shallalist.txt
cat BL/sex/education/domains >> shallalist.txt
cat BL/sex/lingerie/domains >> shallalist.txt
#cat BL/shopping/domains >> shallalist.txt
#cat BL/socialnet/domains >> shallalist.txt
#cat BL/spyware/domains >> shallalist.txt
cat BL/tracker/domains >> shallalist.txt
#cat BL/updatesites/domains >> shallalist.txt
#cat BL/urlshortener/domains >> shallalist.txt
cat BL/violence/domains >> shallalist.txt
#cat BL/warez/domains >> shallalist.txt
#cat BL/weapons/domains >> shallalist.txt
#cat BL/webmail/domains >> shallalist.txt
#cat BL/webphone/domains >> shallalist.txt
#cat BL/webradio/domains >> shallalist.txt
#cat BL/webtv/domains >> shallalist.txt

#-------------------------------------#
# Firebog suspicious list 
#-------------------------------------#

wget https://v.firebog.net/hosts/Cameleon.txt
wget https://v.firebog.net/hosts/Dshield-Sus.txt
wget https://v.firebog.net/hosts/HostsFileOrg.txt
wget https://v.firebog.net/hosts/Kowabit.txt
wget https://v.firebog.net/hosts/Mahakala.txt
wget https://v.firebog.net/hosts/JoeyLane.txt
wget https://v.firebog.net/hosts/PeterLowe.txt
wget https://v.firebog.net/hosts/PiwikSpam.txt
wget https://v.firebog.net/hosts/ReddestDream.txt
wget https://v.firebog.net/hosts/SBDead.txt
wget https://v.firebog.net/hosts/SBKAD.txt
wget https://v.firebog.net/hosts/SBSpam.txt
wget https://v.firebog.net/hosts/SomeoneWC.txt
wget https://v.firebog.net/hosts/Spam404.txt
wget https://v.firebog.net/hosts/Vokins.txt
wget https://v.firebog.net/hosts/Winhelp2002.txt

#-------------------------------------#
# Firebog privacy list 
#-------------------------------------#

wget https://v.firebog.net/hosts/Airelle-trc.txt
wget https://v.firebog.net/hosts/Disconnect-trc.txt
wget https://v.firebog.net/hosts/Disconnect-mal.txt
wget https://v.firebog.net/hosts/Easyprivacy.txt
wget https://v.firebog.net/hosts/Quidsup-trc.txt
wget https://v.firebog.net/hosts/SB2o7Net.txt

#-------------------------------------#
# Firebog ads list 
#-------------------------------------#

wget https://v.firebog.net/hosts/AdAway.txt
wget https://v.firebog.net/hosts/Disconnect-ads.txt
wget https://v.firebog.net/hosts/HPHosts-ads.txt
wget https://v.firebog.net/hosts/Easylist.txt
wget https://v.firebog.net/hosts/Easylist-Dutch.txt
wget https://v.firebog.net/hosts/SBUnchecky.txt
wget https://v.firebog.net/hosts/AdguardDNS.txt
wget https://v.firebog.net/hosts/Prigent-Ads.txt

#-------------------------------------#
# NoTrack Tracker Blocklist 
#-------------------------------------#

wget https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt

#-------------------------------------#
# Misc
#-------------------------------------#

touch misc.txt

# Add anti Nvidia telemetry.
echo '0.0.0.0 gfswl.geforce.com' >> misc.txt
echo '0.0.0.0 telemetry.nvidia.com' >> misc.txt
echo '0.0.0.0 gfe.nvidia.com' >> misc.txt
echo '0.0.0.0 telemetry-dce.gfe.nvidia.com' >> misc.txt
echo '0.0.0.0 events-dc1.gfe.nvidia.com' >> misc.txt
echo '0.0.0.0 services.gfe.nvidia.com' >> misc.txt

# Add some homemade entries.
echo '0.0.0.0 yandex.com' >> misc.txt
echo '0.0.0.0 cpy-crack.net' >> misc.txt
echo '0.0.0.0 ovpn.com' >> misc.txt
echo '0.0.0.0 ssl.google-analytics.com' >> misc.txt
echo '0.0.0.0 canonicalizer.ucsuri.tcs' >> misc.txt
echo '0.0.0.0 adobe.com' >> misc.txt
echo '0.0.0.0 adobeereg.com' >> misc.txt
echo '0.0.0.0 hh-software.com' >> misc.txt
echo '0.0.0.0 adobe.de' >> misc.txt
echo '0.0.0.0 azureedge.net' >> misc.txt
echo '0.0.0.0 t.checkappexec.microsoft.com' >> misc.txt
echo '0.0.0.0 liberation.eulerian.net' >> misc

#-------------------------------------#
# Clean up
#-------------------------------------#

# Remove domains with non-printable characters.
# Use "LANG=C" to avoid a "Invalid collation character" error with sed.
LANG=C sed -i -e 's/[\d128-\d255]//g' *.txt

# Delete specific lines we don't want.
sed -i -e '/^::1/d' *.txt
sed -i -e '/^127.0.0.1/d' *.txt
sed -i -e '/^255.255.255.255/d' *.txt
sed -i -e '/^ff0/d' *.txt
sed -i -e '/^fe80/d' *.txt
sed -i -e 's#0\.0\.0\.0 0\.0\.0\.0##' *.txt
sed -i -e '/^localhost/d' *.txt
sed -i -e '/^localhost.localdomain/d' *.txt
sed -i -e '/^android/d' *.txt
sed -i -e '/^test/d' *.txt
sed -i -e '/^testing/d' *.txt

# Remove all domains beginning with a minus sign.
sed -i -e '/^-/d' *.txt

# Remove all domains containing multiple minus signs.
sed -i -e '/--/d' *.txt

# Remove all domains with a minus sign followed by a dot.
sed -i -e '/-\./d' *.txt

# Remove the dot from lines that begins with a dot.
sed -i -e 's/^\.//g' *.txt

# Remove all comment only lines.
sed -i -e '/^#/d' *.txt

# Remove all IP only lines from Shallalist.
sed -i -e 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}//g' shallalist.txt

# Delete all blank lines.
sed -i -e '/^$/d' *.txt

# Change all non-hosts format lists to hosts format.
sed -i -e '/^0\.0\.0\.0/! s/^/0.0.0.0 /g' *.txt

# Fix some minor left-over issues.
# Remove the dot from lines that begins with a dot.
sed -i -e 's/^0\.0.\0.\0 \./0.0.0.0 /g' *.txt

# Remove the minus from lines that begins with a minux.
sed -i -e 's/^0\.0.\0.\0 -/0.0.0.0 /g' *.txt

#-------------------------------------#
# Whitelist
#-------------------------------------#

sed -i -e '/0.0.0.0 gleam.io/d' *.txt # Also remove the comment from notrack-blocklist.txt
sed -i -e '/0.0.0.0 bit.ly$/d' *.txt
sed -i -e '/\.cloudflare.com$/d' *.txt
sed -i -e '/\.streamelements.com$/d' *.txt
sed -i -e '/0.0.0.0 googletagmanager.com$/d' *.txt
sed -i -e '/0.0.0.0 dba.dk$/d' *.txt
sed -i -e '/\.dba.dk$/d' *.txt
sed -i -e '/0.0.0.0 amazon.co.uk$/d' *.txt
sed -i -e '/0.0.0.0 assoc-amazon.co.uk$/d' *.txt
sed -i -e '/\.googleapis.com$/d' *.txt
sed -i -e '/\.one.com$/d' *.txt
sed -i -e '/\.videolan.org/d' *.txt
sed -i -e '/download.microsoft.com/d' *.txt

# Currently the combined lists holds more that 550.000 duplicate entries, but
# Dnsmasq automatically removes any duplicate hosts from its cache
# (see cache.c:979), so there is no need to remove the duplicate by this
# script. But in case it is needed, the fastest solution is to combine all the
# lists into one file using awk.
# awk '!seen[$0]++' *.txt > hosts-block-list.txt

mv *.txt ../hosts-files/

echo ""
echo "Put the files from the 'hosts-files' directory into a directory that"
echo "Dnsmasq can read and use it with the 'addn-hosts' option."
echo ""
echo "Restart dnsmasq and remember to check the log!"
echo ""
echo "If you want to change the default IP from 0.0.0.0 to say"
echo "192.168.1.1, you can use the following sed command:"
echo 'sed -i -e "s/0\.0\.0\.0/192\.168\.1\.1/" *.txt'
echo ""
