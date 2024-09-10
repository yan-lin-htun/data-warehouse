#!/bin/bash
sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
sudo apt update
sudo apt install npm -y
sudo npm install -g yarn
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo apt remove nodejs -y
sudo apt purge --auto-remove -y
sudo apt install -y nodejs
node --version
git clone https://gitlab.com/yanlintun/demo-ecommerce-app.git
cp -r demo-ecommerce-app /home/ubuntu/demo-ecommerce-app
cd /home/ubuntu/demo-ecommerce-app
sudo yarn install
sudo yarn develop
