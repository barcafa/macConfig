# Check if Homebrew is installed
if [ $(cmd_exists "brew") -eq 1 ]; then
    show_msg 'Installing Homebrew'

    printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
    #  └─ simulate the ENTER keypress
else
    show_msg 'Updating Homebrew'

	brew update
	brew upgrade --all
fi

# Tap alternate version of packages
brew tap homebrew/versions

show_msg 'Installing Homebrew packages'

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
# sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
################################################################################ Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

# Install some other useful utilities like `sponge`
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

brew install ack
brew install git
brew install tree
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

brew install bash
brew install bash-completion2

# Cleanup
brew cleanup
