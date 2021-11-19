brew uninstall --force neovim
brew uninstall efm-langserver

pip uninstall pynvim
pip install neovim-remote

npm uninstall -g typescript-language-server
npm uninstall -g eslint_d

rm $XDG_DATA_HOME/nvim/site/autoload/plug.vim

rm $NVIMCONFIG/init.vim
rm $NVIMCONFIG/third_party_plugins.vim
rm $NVIMCONFIG/plugins
