

sudo apg-get install aptitude
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
sudo apt-get build-dep vim
apt-get source vim
cd vim-*  # it will be vim-7.4.something

###Edit debian/rules and replace
#ALLINTERPFLAGS+=--enable-pythoninterp --with-python-config-dir=$(shell python-config --configdir)
#ALLINTERPFLAGS+=--disable-python3interp
#-------------------------------------------------
#ALLINTERPFLAGS+=--enable-pythoninterp=dynamic --with-python-config-dir=$(shell python-config --configdir)
#ALLINTERPFLAGS+=--enable-python3interp=dynamic --with-python3-config-dir=$(shell python3-config --configdir)

dpkg-buildpackage -us -uc
cd ..
sudo dpkg -i vim-gnome_*_amd64.deb vim-common_*_amd64.deb vim-gui-common_*_all.deb vim-runtime_*_all.deb
rm -rf vim*
vim --version | grep python
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
