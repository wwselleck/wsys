if ! [ -x "$(command -v asdf)" ]; then
  echo 'asdf is not installed, installing'
  wsys asdf install
fi

wsys python install_deps

asdf plugin-add python
asdf install python latest
asdf global python latest

asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git


