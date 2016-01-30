show_msg 'Installing Cask applications'

brew tap caskroom/cask
brew tap caskroom/versions

# Common apps
brew cask install 1password
brew cask install alfred
brew cask install android-file-transfer
brew cask install divvy
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install skype
brew cask install spotify
brew cask install the-unarchiver
brew cask install transmission
brew cask install vlc

# Dev
brew cask install dash
brew cask install firefox
brew cask install imageoptim
brew cask install ionic-lab
brew cask install java
brew cask install miro-video-converter
brew cask install mysqlworkbench
brew cask install node
brew cask install sketch
brew cask install slack
brew cask install sublime-text3
brew cask install vagrant
brew cask install virtualbox

# Arduino
#brew cask install arduino
#brew cask install frizzing

# Games
#brew cask install steam
#brew cask install warsow

brew cask cleanup
