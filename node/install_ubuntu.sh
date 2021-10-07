if ! [ -x "$(command -v asdf)" ]; then
  echo 'Error: asdf is not installed.' >&2
  exit 1
fi

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest


