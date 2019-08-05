#!/usr/bin/env bash
echo "Attempting to set this up for you."
echo "####### If you didn't run this as root you will be prompted for your root password. #########"
echo "This script will make the following modifications in ubuntu:"
echo "  - Add several python modules"
echo "  - Change your .profile to add a new $PATH value"
echo "  - Add a .npm-global directory to your home directory to install puppeteer-pdf"
echo "  - install nodejs npm"
echo "  - install the puppeteer-pdf builder"
echo "  - install python3 virtual env and drop you into that folder"
echo "  - open the script to find out"

cd ..

echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.bash_profile
mkdir ~/.npm-global

source ~/.bash_profile

echo "Installing Puppeteer PDF"
npm install g puppeteer-pdf

cd ..
sudo apt install pandoc pdftk python3-venv python3-pip -y
python3 -m venv venv
source ./venv/bin/activate

pip install -r requirements.txt


