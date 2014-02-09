LOG=/var/log/updates.log

date
date >> $LOG
echo "Updating..."
sudo apt-get update > $LOG

echo "Upgrading..."
sudo apt-get upgrade -y

~/.blank.pl
echo "Distribution upgrade..."
sudo apt-get dist-upgrade -y

~/.blank.pl
echo "Cleaning..."
sudo apt-get autoclean -y >> $LOG

echo "Removing..."
sudo apt-get autoremove -y >> $LOG

clear
echo "Updated"
~/.restart.sh
