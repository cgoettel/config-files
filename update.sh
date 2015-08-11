LOG=/tmp/updates.log
blank=~/config-files/blank.pl

date
date >> $LOG
echo "Updating..."
sudo apt-get update > $LOG

echo "Upgrading..."
sudo apt-get upgrade -y

blank
echo "Distribution upgrade..."
sudo apt-get dist-upgrade -y

blank
echo "Cleaning..."
sudo apt-get autoclean -y >> $LOG

echo "Removing..."
sudo apt-get autoremove -y >> $LOG

clear
echo "Updated"

if [ -f /var/run/reboot-required ]; then
  echo 'reboot required'
fi
