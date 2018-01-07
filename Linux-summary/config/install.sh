#######################################################
# INSTALL BASIC APPLICATION ON DEBIAN BASIC OR MAC OS #
#######################################################

# 0. CONFIG
[ $(uname -s | grep -c CYGWIN) -eq 1 ] && OS_NAME="CYGWIN" || OS_NAME=`uname -s`
function updaterc() {
    if [[ -s ~/.zshrc ]]; then
        source ~/.zshrc;
    elif [[ -s ~/.bashrc ]]; then
        source ~/.bashrc;
    else
        echo "Not found rc file"
    fi
}
updaterc

# 1. KEEP UP TO DATE
if [ $OS_NAME == Darwin ]; then
    # install homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew upgrade

    # intall pip
    brew install python3
    pip install -U pip

    # install autojump
    if ! [ -x "$(which autojump)" ]; then
        brew install autojump
    fi

	# install emacs
	[ -x "$(which emacs)" ] || brew install emacs

    # install git
    [ -x "$(which git)" ] || brew install git

    updaterc
else
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y dist-upgrade
    sudo apt-get -y autoremove

    # install pip
    if ! [ -x "$(which pip)" ]; then
        curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
        python /tmp/get-pip.py
        pip install -U pip
    fi

    # install autojump
    [ -x "$(which autojump)" ] || sudo apt-get install -y autojump;

	# install emacs
	if ! [ -x "$(which emacs25)" ]; then
		sudo add-apt-repository -y ppa:kelleyk/emacs
		sudo apt-get update
		sudo apt-get install emacs25
	fi

    # install git
    [ -x "$(which git)" ] || sudo apt-get install -y git

    # install xsel
    [ -x "$(which xsel)" ] || sudo apt-get install -y xsel;

    updaterc
fi

# install emacs.d
if ! [ -f $HOME/.emacs.d/README.org ]; then
	rm $HOME/.emacs.d/init.el
	git clone https://github.com/redguardtoo/emacs.d.git $HOME/.emacs.d
	# Use stable version
	#cd .emacs.d; git reset --hard stable
fi

# install percol
[ -x "$(which percol)" ] || sudo -H pip install percol

# install virtualenv
[ -x "$(which virtualenv)" ] || sudo -H pip install virtualenv
[ "$(type -t mkvirtualenv)" = function ] || sudo -H pip install virtualenvwrapper
[ -d $HOME/.envs ] || mkdir $HOME/.envs

updaterc

[ -d $HOME/.envs/python2 ] || ([ -x "$(which python2)" ] && mkvirtualenv --python="$(which python2)" python2)
[ -d $HOME/.envs/python3 ] || ([ -x "$(which python3)" ] && mkvirtualenv --python="$(which python3)" python3)

# install nvm
[ "$(type -t nvm)" = function ] || curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

updaterc