if ! [ -x "$(command -v asdf)" ]; then
  echo 'asdf is not installed, installing'
  wsys asdf install
fi

sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

asdf plugin-add python
asdf install python latest
asdf global python latest

asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git


