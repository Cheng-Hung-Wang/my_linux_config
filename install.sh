

sudo apt-get install aptitude
sudo apt-get update

sudo aptitude pure firefox
sudo aptitude install git curl -y
sudo aptitude install firefox -y

sudo aptitude install hime-chewing -y
mkdir ~/.config/hime
cp noseeing.gtab ~/.config/hime/
im-config

# for python pacakge
sudo aptitude install python3-pip  python-virtualenv ipython3 ipython3-notebook  python3-pygments pandoc -y

#build python3 env
#virtualenv env3 --python=python3

## install exfat
#sudo aptitude install exfat-utils exfat-fuse

# install mysql 
sudo aptitude install mysql-server-5.5 mysql-client-5.5 mysql-server-core-5.5 phpmyadmin

# install vim for python3(Before 16.04)
# reference: http://askubuntu.com/questions/585237/whats-the-easiest-way-to-get-vim-with-python-3-support
#=============================================================================
# for ubuntu 16.04=xenial 14.04=trusty
sudo vim /etc/apt/sources.list
# add two line (deb, deb-src)
#deb http://ppa.launchpad.net/pi-rho/dev/ubuntu xenial main 
#deb-src http://ppa.launchpad.net/pi-rho/dev/ubuntu xenial main 
sudo apt-add-repository ppa:pi-rho/dev
sudo apt-get update
sudo apt-get build-dep vim -y
apt-get source vim
cd vim-*  # it will be vim-7.4.something

###Edit debian/rules and replace
#ALLINTERPFLAGS+=--enable-pythoninterp --with-python-config-dir=$(shell python-config --configdir)
#ALLINTERPFLAGS+=--disable-python3interp
#-------------------------------------------------
#ALLINTERPFLAGS+=--enable-pythoninterp=dynamic --with-python-config-dir=$(shell python-config --configdir)
#ALLINTERPFLAGS+=--enable-python3interp=dynamic --with-python3-config-dir=$(shell python3-config --configdir)

sudo dpkg-buildpackage -us -uc
cd ..
sudo dpkg -i vim-gnome_*_amd64.deb vim-common_*_amd64.deb vim-gui-common_*_all.deb vim-runtime_*_all.deb

var=`vim --version | grep "+python3"`
if [[ ! -v "$var" ]]; then
	echo $var
	rm -rf vim*
fi
#==================================================================================================

# install vim plugin
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
#git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim

#install jedi (python3 命令補齊)
sudo pip3 install jedi

cp .vimrc ~/.vimrc
cp .bashhead.template ~/.bashhead.template
cp .pyhead.template ~/.pyhead.template
