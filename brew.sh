#!/bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew bundle --verbose

brew link --overwrite git-utils
brew link --overwrite git-extras

# See brew info openjdk
echo "Linking OpenJDK"
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

brew doctor

# git lfs install

echo "Install LogiPresentation Installer.app in /usr/local/Caskroom/logitech-presentation/*"
