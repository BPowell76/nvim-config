#!/bin/bash
#    This script downloads the nvim source archive based on the version number provided,
#    compiles, and installs the newer version for Debian distros.
#    Requires cmake

OS=$(hostnamectl | grep "Operating System:" | cut -d ' ' -f 3)

if [[ $OS == "Ubuntu" || $OS == "Debian" ]]; then
     sudo apt update;
     sudo apt install -y ninja-build gettext cmake curl build-essential git;
else
     echo "This build script currently doesn't support RHEL or other variants of Linux"
     return 0
fi

echo "Building Neovim Latest Stable from Source"
echo "-----------------------------------------"

cd /tmp
git clone https://github.com/neovim/neovim
cd neovim

git checkout stable

if [[ $OS == "Ubuntu" || $OS == "Debian" ]]; then
     make CMAKE_BUILD_TYPE=RelWithDebInfo
     cd build
     cpack -G DEB
     sudo dpkg -i nvim-linux-x86_64.deb
fi

echo "Neovim build and install completed, cleaning up..."

cd /tmp
yes | rm -r neovim

echo "Going back to user home directory"
cd $XDG_HOME

echo "Setting up vim-plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
