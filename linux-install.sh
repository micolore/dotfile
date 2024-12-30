# download config file 

mkdir -p ~/.config/nvim

wegt https://github.com/micolore/dotfile/archive/refs/heads/main.zip

unzip -o main.zip -d ~/.config/nvim

cd ~/.config/nvim 

mv dotfile-main/* .

# install neovim 

yum install -y neovim

# neovim upgrade not support  must compile 

# config neovim 
