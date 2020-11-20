#!/bin/sh
set -e

now=$(date +"%Y%m%d%H%M%S")

mkdir ~/vim.bak.$now
if [ -e ~/.vim ]; then
    mv ~/.vim ~/vim.bak.$now
fi
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/vim.bak.$now
fi
cd ~/.vim_runtime

echo '"set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
try
source ~/.vim_runtime/vimrcs/my_configs.vim
catch
endtry' > ~/.vimrc

vim +PlugInstall +qall

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
echo " - The original .vimrc has been backed up to ~/.vimrc.$now.bak"
echo " - Put your custom configuration in ~/.vim_runtime/vimrcs/my_configs.vim"
echo " - Put your custom plugin in ~/.vim_runtime/vimrcs/my_plugins.vim. e.g., Plug 'junegunn/vim-easy-align'"

