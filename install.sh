#!/bin/sh
set -e

now=$(date +"%Y%m%d%H%M%S")

cp ~/.vimrc ~/.vimrc.$now.bak
cd ~/.vim_runtime

echo '"set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
try
source ~/.vim_runtime/vimrcs/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
echo " - The original .vimrc has been backed up to ~/.vimrc.$now.bak"
echo " - Put your custom configuration in ~/.vim_runtime/vimrcs/my_configs.vim"
echo " - Put your custom plugin in ~/.vim_runtime/my_plugins"

