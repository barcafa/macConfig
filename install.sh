cmd_exists() {
    [ -x "$(command -v "$1")" ] \
        && printf 0 \
        || printf 1
}

##############################################################################################################
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##############################################################################################################
echo "Installing Command Line Tools"
### XCode Command Line Tools
#      thx  https://github.com/alrra/dotfiles/blob/c2da74cc333/os/os_x/install_applications.sh#L39

if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
    xcode-select --install &> /dev/null
    # Wait until the XCode Command Line Tools are installed
    while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
        sleep 5
    done
	xcode-select -p &> /dev/null
	if [ $? -eq 0 ]; then
        # Prompt user to agree to the terms of the Xcode license
        # https://github.com/alrra/dotfiles/issues/10
       sudo xcodebuild -license
   fi
fi
###
echo "Installed Command Line Tools"
##############################################################################################################



echo "##############################################################################################################"
echo "Installing everything!"

##############################################################################################################
### homebrew!

# (if your maching has /usr/local locked down (like google's), you can do this to place everything in ~/.homebrew
mkdir $HOME/.homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH

echo "##############################################################################################################"
echo "Installed Homebrew"

# install all the things
source brew.sh
source brew-cask.sh
source npm.sh

### end of homebrew
##############################################################################################################




##############################################################################################################
### install of common things
###

# github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
# bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)


# Type `git open` to open the GitHub page or website for a repository.
# npm install -g git-open




# github.com/thebitguru/play-button-itunes-patch
# disable itunes opening on media keys

# git clone https://github.com/thebitguru/play-button-itunes-patch ~/code/play-button-itunes-patch


# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
sudo echo $BASHPATH >> /etc/shells
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X


# setting up the sublime symlink
# ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl



##############################################################################################################
sh .osx

##############################################################################################################
### symlinks to link dotfiles into ~/
###

#   move git credentials into ~/.gitconfig.local    	http://stackoverflow.com/a/13615531/89484
#   now .gitconfig can be shared across all machines and only the .local changes

# symlink it up!
# ./symlink-setup.sh

###
##############################################################################################################
cp -r bash/ ~
exec $SHELL -l
