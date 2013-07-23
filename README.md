vim
===

手动安装
--------

1. `git clone --recursive git@github.com:pbesedm/vim.git ~/myvim`  
- `ln -s ~/myvim/vim ~/.vim`  
- `ln -s ~/myvim/vimrc ~/.vimrc`  
- `ln -s ~/myvim/ycm_extra_conf.py ~/.ycm_extra_conf.py`
- `ln -s ~/myvim/vim/bundle/vim-colorschemes/colors ~/myvim/vim/bundle/colors`  

YouCompleteMe 插件的编译和安装
------------------------------

1. `mkdir ~/yum_build`  
- `cd ~/yum_build`  
- `cmake -G "Unix Makefiles" -DUSE\_SYSTEM\_LIBCLANG=ON -DEXTERNAL\_LIBCLANG\_PATH=/usr/lib/llvm/libclang.so . ~/.vim/bundle/YouCompleteMe/cpp`  
- `make`  
- 生成的 .so 文件会输出到 ~/.vim/bundle/YouCompleteMe/python 目录下  

YouCompleteMe 配置
------------------

1. `echo | clang -std=c++11 -stdlib=libc++ -v -E -x c++ -`  
- 获得输出，类似如：/usr/local/include、/usr/bin/../lib/clang/3.2/include  
- 编辑 ~/.ycm\_extra\_conf.py 文件，参照模板文件修改，一个检验修改是否有效的方式是修改完后，打开一个C文件进行编辑，看是否有补全菜单出现  
