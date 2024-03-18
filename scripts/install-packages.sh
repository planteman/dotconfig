#!/usr/bin/env bash


# Everything hardwired for Ubuntu 22.04 LTS on x86_64

sudo apt update
sudo apt upgrade -y
sudo apt install -y software-properties-common ca-certificates curl apt-transport-https lsb-release gnupg feh yakuake

# Microsoft signing key
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

# Microsoft Azure CLI
echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | 
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Microsoft Edge
curl -fSsL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-edge.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main' | sudo tee /etc/apt/sources.list.d/microsoft-edge.list

# Visual Studio Code
echo 'deb [arch=amd64,arm64,armhf] https://packages.microsoft.com/repos/code stable main' | sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update
sudo apt install -y azure-cli code microsoft-edge-stable powershell 

sudo apt autoremove -y
