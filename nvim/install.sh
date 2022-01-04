source $WSYS/util.sh

if ! [ -x "$(command -v pip)" ]; then
  echo 'Error: pip is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v npm)" ]; then
  echo 'Error: npm is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v rg)" ]; then
  echo 'rg is not installed, installing'
  wsys cli-tools install
fi

if ! [ -x "$(command -v fd)" ]; then
  echo 'fd is not installed, installing'
  wsys cli-tools install
fi

wsys nvim install_package

# Install VimPlug
curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Link config
wsys nvim link


# Install python deps
pip install pynvim
pip install neovim-remote

# Install js deps
npm install -g typescript-language-server
npm install -g eslint_d
wsys nvim install_efm

# Install plugins
nvim +PlugInstall +qall

