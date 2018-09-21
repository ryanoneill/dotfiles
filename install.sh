# Apt Installs
# TODO: Make this a list and feed them through 'sudo apt install'
sudo apt install konsole
sudo apt install neovim
sudo apt install tmux
sudo apt install wget
sudo apt install smlnj
sudo apt install bubblewrap
sudo apt install rlwrap
sudo apt install make
sudo apt install gcc
sudo apt install m4
sudo apt install mercurial
sudo apt install darcs

# Setup Path
echo -e '\nexport PATH=~/.local/bin:$PATH' >> ~/.profile
echo "alias workspace='cd ~/workspace'" >> ~/.profile
echo "alias playground='cd ~/workspace/playground'" >> ~/.profile

# Setup Git
git config --global user.name "Ryan O'Neill"
git config --global user.email "ryanoneill@gmail.com"
git config --global core.editor nvim

# Get DotFiles
mkdir -p ~/workspace/playground
cd ~/workspace
git clone git@github.com:ryanoneill/dotfiles.git

# Configure tmux
ln -s -f ~/workspace/dotfiles/tmux.conf ~/.tmux.conf

# Install Vim-Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Configure Neovim - Don't forget to :PlugInstall
mkdir -p ~/.config/nvim
ln -s -f ~/workspace/dotfiles/init.vim ~/.config/nvim

# Setup Font (FiraCode)
# TODO: Abstract Version Number
mkdir -p ~/dist
wget https://github.com/tonsky/FiraCode/releases/download/1.205/FiraCode_1.205.zip --directory-prefix=dist
unzip ~/dist/FiraCode_1.205.zip -d ~/firacode-1.205
mkdir -p ~/.local/share/fonts
cp ~/firacode-1.205/ttf/* ~/.local/share/fonts

# Setup Konsole
# TODO: Setting of default profile seems to get lost
ln -s -f ~/workspace/dotfiles/konsolerc ~/.config
mkdir -p ~/.local/share/konsole
ln -s -f ~/workspace/dotfiles/rhino.profile ~/.local/share/konsole

# Setup BashIt
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
mkdir -p ~/.bash_it/custom/themes
ln -s ~/workspace/dotfiles/ryano-powerline ~/.bash_it/custom/themes/
sed -i'' "s/export\ BASH_IT_THEME=.*/export\ BASH_IT_THEME='ryano-powerline'/" .bashrc

# Setup Opam
sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)

# Setup Coq
# TODO: This has issues.
# TODO: Abstract Version Number
export OPAMROOT=~/opam-coq.8.8.1 # installation directory
opam init -n --comp=4.02.3 -j 4 # 2 is the number of CPU cores
eval $(opam env)
opam repo add coq-released http://coq.inria.fr/opam/released
opam install coq.8.8.1 && opam pin add coq 8.8.1

# Setup Haskell Stack
curl -sSL https://get.haskellstack.org/ | sh

# Setup Rust
curl https://sh.rustup.rs -sSf | sh
