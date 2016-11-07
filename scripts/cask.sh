show_msg 'Installing Cask applications'

brew tap caskroom/cask
brew tap caskroom/versions

# Common apps
brew cask install 1password
brew cask install alfred
brew cask install android-file-transfer
brew cask install iterm2
brew cask install skype
brew cask install the-unarchiver
brew cask install vlc

# Dev
brew cask install google-chrome
brew cask install firefox
brew cask install dash
brew cask install imageoptim
brew cask install java

brew cask install node
brew cask install slack
brew cask install sublime-text3
brew cask install virtualbox
brew cask install visual-studio-code

# Arduino
#brew cask install arduino
#brew cask install frizzing

# Games
brew cask install steam
#brew cask install warsow

brew cask cleanup
