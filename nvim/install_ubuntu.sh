source $DOTFILES/util.sh

if ! [ -x "$(command -v pip)" ]; then
  echo 'Error: pip is not installed.' >&2
  exit 1
fi

sudo apt install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install python-dev python-pip python3-dev python3-pip
sudo apt install neovim

# Install VimPlug
curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link config
link $COMPONENT_DIR/files/.vimrc $NVIMCONFIG/init.vim
link $COMPONENT_DIR/files/third_party_plugins.vim $NVIMCONFIG/third_party_plugins.vim
link $COMPONENT_DIR/files/plugin $NVIMCONFIG/plugin


# Install python deps
pip install pynvim
pip install neovim-remote

# Install plugins
nvim +PlugInstall +qall

