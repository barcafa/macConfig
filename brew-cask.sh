say "I need your password"
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew install caskroom/cask/brew-cask

# Work apps
brew tap caskroom/versions

brew cask install 1password
brew cask install alfred
brew cask install android-file-transfer
brew cask install atom
brew cask install charles
brew cask install divvy
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install gyazo
brew cask install horndis
brew cask install imagealpha
brew cask install imageoptim
brew cask install iterm2
brew cask install java
brew cask install java6
brew cask install miro-video-converter
brew cask install mysqlworkbench
brew cask install node
brew cask install phantomjs
brew cask install phpstorm
brew cask install sketch
brew cask install skype
brew cask install slack
brew cask install sourcetree
brew cask install spotify
brew cask install sublime-text3
brew cask install the-unarchiver
brew cask install transmission
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc



echo "##############################################################################################################"
echo "Cask apps installed"