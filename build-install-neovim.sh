#!/bin/bash
#    This script downloads the nvim source archive based on the version number provided,
#    compiles, and installs the newer version for Debian distros.
#    Requires cmake

read -p "Enter the Neovim version to download to download: v" nvimVersion
echo -n "Downloading version $nvimVersion"
cd "$HOME/Downloads/"
curl -s -OL "https://github.com/neovim/neovim/archive/refs/tags/v$nvimVersion.tar.gz"
echo "...Done"

echo "Extracting Neovim v$nvimVersion"
tar -xf "v$nvimVersion.tar.gz"

echo "Building Neovim v$nvimVersion Debian Package"
cd "neovim-$nvimVersion"

make -s CMAKE_BUILD_TYPE=Release
cd build  
cpack -G DEB

echo "Installing Neovim v$nvimVersion"
sudo dpkg -i nvim-linux64.deb

echo "Neovim v$nvimVersion has been installed"
echo "Do not forget to use 'select-editor' and 'sudo select-editor' if you want to set nvim as your default editor"
