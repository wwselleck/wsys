sudo apt install zsh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

mkdir -p $ZDOTDIR

wsys zsh link

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

while read p; do
    echo "Installing plugin $p"
    wsys zsh install-plugin $p
done < $COMPONENT_DIR/files/plugins_list.txt

chsh -s /usr/bin/zsh
