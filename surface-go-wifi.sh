# Simple bash script to automate the installation of Microsoft Surface Go wifi driver
# You can find the binary http://www.killernetworking.com/support/K1535_Debian/board.bin (As of the writing of this script, it seems as if intel has removed the binary. You may be able to ask around on the r/SurfaceLinux subreddit for help)
# Because the driver is proprietary, I am not sure I can distribute it on Github. 
# Source for this information comes from https://www.reddit.com/r/SurfaceLinux/comments/9t53gq/wifi_fixed_on_surface_go_ubuntu_1810/
# This script expects the board.bin file to be in your user directory

# Checks to ensure the binary is in your user directory

driver_present=$(ls ~ | grep 'board.bin')

# If the binary is present, removes the old binaries and puts the new on in it's place

if [ $driver_present == 'board.bin' ]
then
    echo "Driver found"
    echo "Continuing"
    $(sudo rm /lib/firmware/ath10k/QCA6174/hw2.1/board.bin)
    $(sudo cp ~/board.bin /lib/firmware/ath10k/QCA6174/hw2.1)
    $(sudo rm /lib/firmware/ath10k/QCA6174/hw3.0/board.bin)
    $(sudo cp ~/board.bin /lib/firmware/ath10k/QCA6174/hw3.0)
else
    echo "Driver not found"
    echo "Either you don't have the driver downloaded, or it's not in your user directory"
fi

#Asks the users if they would like to restart

echo "You must restart for changes to take place. Would you like to restart? [Y/N]"
read restart

if [ $restart == 'Y' ]
then
    $(shutdown now)
fi
    