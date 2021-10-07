sudo apt install zsh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

mkdir -p $ZDOTDIR

link $COMPONENT_DIR/files/.zshrc $ZDOTDIR/.zshrc
link $COMPONENT_DIR/files/.zshenv $ZDOTDIR/.zshenv
link $COMPONENT_DIR/files/.zshenv $HOME/.zshenv
link $COMPONENT_DIR/files/.zprofile $ZDOTDIR/.zprofile

sh -c "$(curl -fsSL https://starship.rs/install.sh)"
