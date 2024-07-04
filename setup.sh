#!/bin/bash

# Update package list
sudo apt-get update -y

sudo apt-get install build-essential

# Check if Homebrew is installed
if ! command -v brew
then
    echo "Homebrew could not be found, installing..."

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi


# Install kubectl
brew install kubectl

# Install helm
brew install helm

# Install k9s
brew install derailed/k9s/k9s

# Install teleport
TELEPORT_VERSION="15.0.0"
sudo curl https://goteleport.com/static/install.sh | bash -s ${TELEPORT_VERSION} oss

# Install fzf
brew install fzf

# Install kns x ktx
sudo curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && sudo chmod +x $_
sudo curl https://raw.githubusercontent.com/blendle/kns/master/bin/ktx -o /usr/local/bin/ktx && sudo chmod +x $_

# Verify installations
kubectl version --client
helm version
k9s version
tctl version
tsh version
tbot version
fzf --version

echo "\nInstallation of kubectl, helm, k9s, fzf, kns, ktx and teleport completed successfully!"