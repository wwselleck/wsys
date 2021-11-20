source $WSYS/util.sh

# Link config
wlink $COMPONENT_DIR/files/.vimrc $NVIMCONFIG/init.vim
wlink $COMPONENT_DIR/files/third_party_plugins.vim $NVIMCONFIG/third_party_plugins.vim
wlink $COMPONENT_DIR/files/plugin $NVIMCONFIG/plugin
wlink $COMPONENT_DIR/files/lua $NVIMCONFIG/lua
