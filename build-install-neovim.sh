#!/bin/bash
#    This script downloads the nvim source archive based on the version number provided,
#    compiles, and installs the newer version for Debian distros.
#    Requires cmake

sudo apt update;
sudo apt install -y ninja-build gettext cmake curl build-essential git;

echo "Building Neovim Latest Stable from Source"
echo "-----------------------------------------"

cd /tmp
git clone https://github.com/neovim/neovim
cd neovim

git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build
cpack -G DEB
sudo dpkg -i nvim-linux-x86_64.deb

echo "Neovim build and install completed, cleaning up..."

cd /tmp
yes | rm -r neovim

echo "Going back to user home directory"
cd $XDG_HOME
