say "I need your password"
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Node packages
sudo npm install -g gulp
sudo npm install -g grunt

echo "##############################################################################################################"
echo "Node packages installed"
