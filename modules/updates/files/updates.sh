#! bash.sh

Logfile=/tmp/logs/updatelog

# ensuring log file is present.
if test -f "$Logfile";
then
    echo "$Logfile exists"
else
    touch $Logfile
fi


dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "UPDATE - $dt running updates and rebooting machine." >> $Logfile

apt update && apt upgrade -y

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "REBOOT - $dt update finished sending weekly reboot" >> $Logfile

reboot