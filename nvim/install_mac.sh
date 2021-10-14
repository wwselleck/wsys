source $DOTFILES/util.sh

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

brew install --HEAD neovim

# Install VimPlug
wsys nvim install_vimplug

# Link config
wsys nvim link


# Install python deps
wsys nvim install_python_deps

# Install js deps
wsys nvim install_language_servers

# Install plugins
nvim +PlugInstall +qall

