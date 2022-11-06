#! bash.sh

Logfile=/home/charlie/updatelog

# ensuring log file is present.
if test -f "$Logfile";
then
    echo "$Logfile exists"
else
    touch $Logfile
fi

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt running updates and rebooting machine." >> $Logfile

apt update
apt upgrade

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt update finished sending weekly reboot" >> $Logfile

reboot