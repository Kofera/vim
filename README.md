vim
===

vim configurations and plugins

YouCompleteMe 插件的编译：
-------------------------

1、mkdir ~/yum\_build  
2、cd ~/yum\_build  
3、cmake -G "Unix Makefiles" -DUSE\_SYSTEM\_LIBCLANG=ON -DEXTERNAL\_LIBCLANG\_PATH=/usr/lib/llvm/libclang.so . ~/.vim/bundle/YouCompleteMe/cpp  
4、make  

配色
----

vim/bundle/colors -> bundle/vim-colorschemes/colors
