set nocompatible        "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限

set noeb
set et
set lbr
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
set showcmd
"set foldenable         "允许折叠
"set foldmethod=manual  "手动折叠

filetype on             "侦测文件类型
filetype plugin on		"载入文件类型插件
filetype indent on		"为特定文件类型载入相关缩进文件

"状态行显示的内容 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}    
" 启动显示状态行(1),总是显示状态行(2)  
set laststatus=2    
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set cindent
set hidden

"tab settings {
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab         "不要用空格代替制表符
set smarttab            "在行和段开始处使用制表符            
"}

set cursorline			"设置光标高亮显示
set cursorcolumn		"光标垂直高亮
set ruler

syntax enable
let g:solarized_termcolors=256
colorscheme desert 

set number          "显示行号
"set undofile        "无限undo

set history=1000


"相对行号，要想相对行号起作用要放在显示行号后面
"set relativenumber

"自动换行
set wrap

"GUI界面里的字体，默认有抗锯齿
set guifont=Inconsolata:h15

set ignorecase      "设置大小写敏感和聪明感知（小写全搜，大写完全匹配）
set smartcase
set incsearch
set showmatch
set hlsearch

set numberwidth=4       "行号栏的宽度

" 记住上次打开位置
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal g`\"" |
     \ endif

"让退格、空格、上下箭头遇到行首行尾时自动移到下一行(包括insert模式)
set whichwrap=b,s,<,>,[,],h,l 

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-f> <right>
inoremap <c-b> <left>

"修改leader键为逗号
let mapleader=","
imap jj <esc>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"修改vim的正则表达式
nnoremap / /\v
vnoremap / /\v

"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %


"设置当文件被改动时自动载入
set autoread
"quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全
set completeopt=longest,menu
"在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile

set linespace=0
"增强模式中的命令行自动完成操作
set wildmenu
set nocompatible
"使用退格键正常处理indent,eol,start等
set backspace=2


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" 相较于 Command-T 等查找文件的插件，ctrlp.vim 最大的好处在于没有依赖，干净利落
Bundle 'ctrlp.vim'

" 此插件最好不要开启，否则在插入模式使用方向键时会出现A,B,C,D乱码
" 在输入()，""等需要配对的符号时，自动帮你补全剩余半个
"Bundle 'AutoClose'

" 神级插件，ZenCoding 可以让你以一种神奇而无比爽快的感觉写HTML、CSS
Bundle 'ZenCoding.vim'

"在()、""甚至HTML标签之间快速中转
Bundle 'matchit.zip'

"显示行末的空格
Bundle 'ShowTrailingWhitespace'

"JS代码格式化插件
Bundle '_jsbeautify'

"用全新的方式在文档中高效的移动光标，革命性的突破
Bundle 'EasyMotion'

"自动识别文件编码
Bundle 'FencView.vim'

"必不可少，在VIM的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'

"NERD出口的快速给代码加注释插件，选中，`ctrl+h`即可注释多种语言代码
Bundle 'The-NERD-Commenter'

"解放生产力的神器，简单配置，就可以按照自己的风格快速输入大段代码
Bundle 'UltiSnips'

"让代码更加易于纵向排版，以=或,符号对齐
Bundle 'Tabular'

"迄今为止最好的自动VIM自动补全插件
Bundle 'Valloric/YouCompleteMe'

Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '|'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'python-imports.vim'
Bundle 'last_edit_marker.vim'
Bundle 'synmark.vim'
Bundle 'SQLComplete.vim'
Bundle 'JavaScript-Indent'
Bundle 'Better-Javascript-Indentation'
Bundle 'jslint.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Vim-Script-Updater'
Bundle 'jsbeautify'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'

" YouCompleteMe 补全配置
let g:ycm_global_ycm_extra_conf='~/workspace/.ycm_extra_conf.py'
let g:ycm_filetype_whitelist = { 
		\ 'cpp': 1,
		\ 'python': 1,
		\}
let g:Powerline_symbols = 'fancy'

"kien/rainbow_parentheses.vim 配置
