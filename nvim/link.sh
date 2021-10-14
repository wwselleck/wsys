source $DOTFILES/util.sh

# Link config
link $COMPONENT_DIR/files/.vimrc $NVIMCONFIG/init.vim
link $COMPONENT_DIR/files/third_party_plugins.vim $NVIMCONFIG/third_party_plugins.vim
link $COMPONENT_DIR/files/plugin $NVIMCONFIG/plugin
