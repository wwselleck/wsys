source $WSYS/util.sh

if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

wlink $COMPONENT_DIR/files/.asdfrc $HOME/.asdfrc
