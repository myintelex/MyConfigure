source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       if empty(&shellxquote)
"         let l:shxq_sav = ''
"         set shellxquote&
"       endif
"       let cmd = '"' . $VIMRUNTIME . '\diff"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"   if exists('l:shxq_sav')
"     let &shellxquote=l:shxq_sav
"   endif
" endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" =>　插件列表------------------------------------------------------------------"
set nocompatible                                " 关闭兼容模式
filetype off                                    " 这是必需的 
set rtp+=~/.vim/bundle/Vundle.vim               " 设置运行时的路径
call vundle#begin()                             " vundle初始化 

Plugin 'gmarik/Vundle.vim'                      " 这应该始终是第一个 
Plugin 'tomasr/molokai'                         " molokai主题
Plugin 'altercation/vim-colors-solarized'             
                                                " solarized主题
Plugin 'scrooloose/nerdtree'                    " 侧边文件栏
Plugin 'kien/ctrlp.vim'                         " 文件搜索
Plugin 'majutsushi/tagbar'          
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'https://github.com/Valloric/YouCompleteMe.git'
"Plugin 'vim-syntastic/syntastic'
" Plugin 'SirVer/ultisnips'
"Plugin 'powerline/powerline'

call vundle#end()                               " 每个插件都应该在这一行之前  
filetype plugin indent on                       " 恢复文件类型匹配

" =>　插件配置------------------------------------------------------------------"
" =>　主题配置------------------------------------------------------------------"
set background=dark
colorscheme solarized

" =>　NERD tree 配置------------------------------------------------------------"
map <f2> :NERDTreeToggle<cr>                    " 将F2设置为开关NERDTree的快捷键
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'         " 修改树的显示图标
let g:NERDTreeWinPos='left'                     " 窗口位置
let g:NERDTreeSize=30                           " 窗口尺寸
let g:NERDTreeShowLineNumbers=0                 " 窗口是否显示行号
let g:NERDTreeHidden=0                          " 不显示隐藏文件
autocmd vimenter * if !argc()|NERDTree|endif    " 打开vim没有文件自动打开NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
                                                " 当NERDTree为唯一窗口时自动关闭
autocmd vimenter * NERDTree</cr></f2>           " 打开vim时自动打开NERDTree

" =>　ctrlp配置-----------------------------------------------------------------"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'                       " <Leader>p搜索当前目录下文件

" =>　tagbar 配置---------------------------------------------------------------"
nmap <silent> <F4> :TagbarToggle<CR>            " 设置触发快捷键

" =>　AirLine配置---------------------------------------------------------------"
let g:airline_theme="solarized"                 " 设置主题
let g:airline_solarized_bg='light'              " 设置主题背景
let g:airline_powerline_fonts = 1               " 设置使用powerline字体            

set guifont=DejaVuSansMonoForPowerline_Nerd:h9:cANSI:qDRAFT
                                                " 设置gui字体


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 总体设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost $MYVIMRC source $MYVIMRC   " 让配置变更立即生效  
set history=700                                 " 设置历史记录长度
filetype plugin on                              " 允许文件类型检测
filetype indent on                              " 允许缩进
set autoread                                    " 设置自动更新文件
set hid                                         " 自动卸载缓存区
set wildignore=*.o,*~,*.pyc                     " 文件补全忽略编译文件
set ignorecase                                  " 搜索忽略大小写
set magic                                       " 搜索时本意字符的匹配

set noerrorbells                                " 设置没有声音报警
set novisualbell                                " 设置没有闪屏报警
set tm=500

set showmatch                                   " 插入括号时短暂跳转匹配的另一半
set mat=2                                       " 设置跳转时间（十分之一秒）
set matchpairs={:},(:)                          " 设置匹配的对象

set wildmenu                                    " 设置命令补全
set backspace=eol,start,indent                  " 退格键使用
set whichwrap+=<,>,h,l                          " 光标移动
set smartcase                                   " 智能匹配,小写自动大写精确

set nobackup                                    " 关闭备份和缓存区
set nowb                                        " 关闭备份和缓存区
set noswapfile                                  " 关闭备份和缓存区

" =>　字符格式配置--------------------------------------------------------------"
set encoding=utf-8                              " 设置编码格式 
set fileencodings=utf-8,chinese,latin-1         " 文件编码格式 
if has("win32")  
 set fileencoding=chinese  
else  
 set fileencoding=utf-8  
endif  
  
source $VIMRUNTIME/delmenu.vim                  " 解决菜单乱码  
source $VIMRUNTIME/menu.vim                     " 解决菜单乱码  
language messages zh_CN.utf-8                   " 解决consle输出乱码
set ffs=unix,dos,mac                            " 设置换行符格式

" =>　缩进样式设置--------------------------------------------------------------"
set expandtab                                   " 使用空格代替tab
set smarttab                                    " 智能缩进
set shiftwidth=4                                " tab长度设置1 tab == 4 spaces
set tabstop=4                                   " tab长度设置1 tab == 4 spaces
set lbr                                         " 自动换行
set ai "Auto indent                             " 自动缩进
set si "Smart indent                            " 智能缩进
set wrap "Wrap lines                            " 自动换行
" set fdm=indent                                " 设置自动折叠

" =>　界面配置------------------------------------------------------------------"
syntax enable                                   " 语法高亮
set hlsearch                                    " 高亮搜索结果
set incsearch                                   " 实时匹配搜索
set cmdheight=2                                 " 命令行高度

au winLeave * set nocursorline nocursorcolumn   " 高亮光标的行列
au winEnter * set cursorline cursorcolumn       " 高亮光标的行列
set cursorline cursorcolumn                     " 高亮光标的行列

set textwidth=80                                " 设置最大字符限制
set colorcolumn=81                              " 设置最大字符限制

set so=7                                        " 设置光标上下最少显示的行数
set ruler                                       " 始终显示当前行号
set number                                      " 设置显示行号
set numberwidth=5                               " 设置行号宽度
set relativenumber                              " 设置相对行号

" =>　快捷键配置----------------------------------------------------------------"
let mapleader = " "                             " 定义leader变量
let g:mapleader = " "                           " 定义全局leader变量

nmap <leader>w :w!<cr>                          " 使用<leader>w 快速保存
nmap <leader>q :q!<cr>                          " 使用<leader>q 快速退出
inoremap jj <ESC>                               " 使用jj 映射esc
map <silent> <leader><cr> :noh<cr>              " 使用<leader>和回车消除高亮

vnoremap <silent> * :call VisualSelection('f')<CR>
                                                " 使用*可视模式下进行当前单词搜索
vnoremap <silent> # :call VisualSelection('f')<CR>
                                                " 使用#可视模式下进行当前单词搜索
