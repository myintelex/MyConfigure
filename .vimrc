"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>　插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""
" vundle 设置
""""""""""""""""""""""""""
" 关闭兼容模式
set nocompatible

filetype off  " 这是必需的 

" 设置运行时的路径
set rtp+=~/.vim/bundle/Vundle.vim   

" vundle初始化 
call vundle#begin()  

" 这应该始终是第一个 
Plugin 'gmarik/Vundle.vim' 
" 插件列表 
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'https://github.com/Valloric/YouCompleteMe.git'
"Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'

"每个插件都应该在这一行之前  
call vundle#end() 
" 恢复文件类型匹配
filetype plugin indent on

""""""""""""""""""""""""""
" 插件配置
""""""""""""""""""""""""""
" molokai
let g:rehash256 = 1
colorscheme molokai

" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" ctrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" tagbar
nmap <silent> <F4> :TagbarToggle<CR>

" ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" powerline
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 总体设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置历史记录长度
set history=700

" 允许文件类型检测和文件类型相关的插件和缩进
filetype plugin on
filetype indent on

" 设置自动更新文件
set autoread

" 设置，映射\
let mapleader = ","
let g:mapleader = ","

" 使用,w 快速保存
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 界面显示
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置光标上下最少显示的行数
set so=7

" 设置命令补全
set wildmenu

" 显示行号
set nu

" 文件补全忽略编译文件
set wildignore=*.o,*~,*.pyc

" 始终显示当前行号
set ruler

" 命令行高度
set cmdheight=2

" 自动卸载缓存区
set hid

" 退格键使用
set backspace=eol,start,indent

" 光标移动
set whichwrap+=<,>,h,l

" 搜索忽略大小写
set ignorecase

" 智能匹配大小写，小写自动匹配，大写精确匹配
set smartcase

" 高亮搜索结果
set hlsearch

" 实时匹配搜索
set incsearch

" 搜索时本意字符的匹配
set magic

" 插入括号时短暂跳转匹配的另一半
set showmatch
" 设置跳转时间（十分之一秒）
set mat=2
" 设置匹配的对象
set matchpairs={:},(:)

" 设置警告
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" 高亮光标的行列
au winLeave * set nocursorline nocursorcolumn
au winEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" 设置最大字符限制
set textwidth=80
set colorcolumn=81

" 设置显示行号和行号宽度
set number
set numberwidth=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 状态行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 总是显示状态行
set laststatus=2

" 状态行格
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l[%L]

" Returns true if paste mode is abled
function HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
    z
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 颜色和文本
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语法高亮
syntax enable

" 设置字符编码格式
set encoding=utf8

" 设置换行符格式
set ffs=unix,dos,mac

" 使用空格代替tab
set expandtab

" 智能缩进
set smarttab

" tab长度设置1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" 自动换行
set lbr

" 自动缩进，智能缩进(真正的智能)，自动换行
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" 设置自动折叠
set fdm=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 缓存区，备份
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭备份和缓存区
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>　快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用*和#在可视模式下进行当前单词搜索
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('f')<CR>

" 使用，和回车消除高亮
map <silent> <leader><cr> :noh<cr>

