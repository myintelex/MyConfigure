"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 总体设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost $MYVIMRC source $MYVIMRC   " 让配置变更立即生效  

" =>　文件相关设置----------------------------------------------------------------"
filetype on                                     " 开启文件类型检测
filetype plugin on                              " 允许文件类型检测插件
filetype indent on                              " 允许缩进
set nobackup                                    " 关闭备份和缓存区
set nowb                                        " 关闭备份和缓存区
set noswapfile                                  " 关闭备份和缓存区
set autoread                                    " 设置自动更新文件
set hid                                         " 自动卸载缓存区

" =>　字符格式配置--------------------------------------------------------------"
set encoding=utf-8                              " 设置编码格式 
set fileencodings=utf-8,chinese,latin-1         " 文件编码格式 
source $VIMRUNTIME/delmenu.vim                  " 解决菜单乱码  
source $VIMRUNTIME/menu.vim                     " 解决菜单乱码  
language messages zh_CN.utf-8                   " 解决consle输出乱码
set ffs=unix,dos,mac                            " 设置换行符格式

" =>　键盘鼠标设置----------------------------------------------------------------"
set backspace=eol,start,indent                  " 退格键使用
set winaltkeys=no								" 禁用Alt键
if has('mouse')
	set mouse=c
endif											" 鼠标仅在命令行下使用
set whichwrap+=<,>,h,l                          " 光标移动折行功能

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 界面设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>　命令行相关设置----------------------------------------------------------------"
set wildmenu                                    " 设置命令补全
set wildignore=*.swp,*.bak,*.obj,*.o,*.class	" 文件补全忽略编译文件
set history=700                                 " 设置历史记录长度
set cmdheight=2                                 " 命令行高度
set ruler                                       " 显示标尺 
set showcmd                                     " 显示指令输入
set showmode                                    " 显示模式

" =>　编辑区配置------------------------------------------------------------------"
set textwidth=80                                " 设置最大字符限制
set colorcolumn=81                              " 设置最大字符限制
set so=7                                        " 设置光标上下最少显示的行数   
set number                                      " 设置显示行号
set numberwidth=5                               " 设置行号宽度
set relativenumber                              " 设置相对行号
set scrolloff=5                                 " 设置屏幕滚动保留行数

" =>　光标配置------------------------------------------------------------------"
au winLeave * set nocursorline nocursorcolumn   " 高亮光标的行列
au winEnter * set cursorline cursorcolumn       " 高亮光标的行列
set cursorline cursorcolumn                     " 高亮光标的行列

" =>　GUI配置------------------------------------------------------------------"
if has("gui_running")                           " 如果是gvim
  au GUIEnter * simalt ~x                       " 窗口启动时自动最大化
  set guioptions-=m                             " 隐藏菜单栏
  set guioptions-=T                             " 隐藏工具栏
  set guioptions-=L                             " 隐藏左侧滚动条
  set guioptions-=r                             " 隐藏右侧滚动条
  set guioptions-=b                             " 隐藏底部滚动条
 endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                                       " 语法高亮

" =>　搜索设置----------------------------------------------------------------"
set ignorecase                                  " 搜索忽略大小写
set smartcase                                   " 智能匹配,小写自动大写精确
set incsearch                                   " 实时匹配搜索
set hlsearch                                    " 高亮搜索结果
set magic                                       " 搜索时本意字符的匹配

" =>　括号匹配相关设置----------------------------------------------------------------"
set showmatch                                   " 插入括号时短暂跳转匹配的另一半
set mat=2                                       " 设置跳转时间（十分之一秒）
set matchpairs={:},(:)                          " 设置匹配的对象

" =>　报警配置------------------------------------------------------------------"
set noerrorbells                                " 设置没有声音报警
set novisualbell                                " 设置没有闪屏报警
set tm=500

" =>　缩进样式设置--------------------------------------------------------------"
set tabstop=4                                   " tab长度设置1 tab == 4 spaces
set shiftwidth=4                                " 设置自动缩进长度 == 4 spaces
set softtabstop=4								" 设置软件缩进组合
set expandtab                                   " 使用空格代替tab
set cindent										" 使用C语言缩进
set autoindent									" 使用自动缩进
set smarttab                                    " 智能缩进
set lbr                                         " 自动换行
set ai "Auto indent                             " 自动缩进
set si "Smart indent                            " 智能缩进
set wrap "Wrap lines                            " 自动换行

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" =>　leader配置----------------------------------------------------------------"
" 定义leader变量
let mapleader = " "
" 定义全局leader变量
let g:mapleader = " "

" =>　功能映射------------------------------------------------------------------"
" 使用<leader>和回车消除高亮
map <silent> <leader><cr> :noh<cr>
" 映射窗口切换按键 
noremap <tab>h <c-w>h
noremap <tab>j <c-w>j
noremap <tab>k <c-w>k
noremap <tab>l <c-w>l
noremap <tab>w <c-w>w

" =>　括号匹配------------------------------------------------------------------"
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

" =>　全局方向键 ----------------------------------------------------------------"
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" =>　tab相关------------------------------------------------------------------"
noremap <silent><tab> <nop>
noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
noremap <silent><tab>f <c-i>
noremap <silent><tab>b <c-o>
noremap <silent>\t :tabnew<cr>:Startify<cr>
noremap <silent>\g :tabclose<cr>
noremap <silent>\1 :tabn 1<cr>
noremap <silent>\2 :tabn 2<cr>
noremap <silent>\3 :tabn 3<cr>
noremap <silent>\4 :tabn 4<cr>
noremap <silent>\5 :tabn 5<cr>
noremap <silent>\6 :tabn 6<cr>
noremap <silent>\7 :tabn 7<cr>
noremap <silent>\8 :tabn 8<cr>
noremap <silent>\9 :tabn 9<cr>
noremap <silent>\0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>


" keymap to switch tab in both gui and terminal (need config)
if has('gui_running')
	noremap <silent><c-tab> :tabprev<CR>
	inoremap <silent><c-tab> <ESC>:tabprev<CR>
	noremap <silent><m-1> :tabn 1<cr>
	noremap <silent><m-2> :tabn 2<cr>
	noremap <silent><m-3> :tabn 3<cr>
	noremap <silent><m-4> :tabn 4<cr>
	noremap <silent><m-5> :tabn 5<cr>
	noremap <silent><m-6> :tabn 6<cr>
	noremap <silent><m-7> :tabn 7<cr>
	noremap <silent><m-8> :tabn 8<cr>
	noremap <silent><m-9> :tabn 9<cr>
	noremap <silent><m-0> :tabn 10<cr>
	inoremap <silent><m-1> <ESC>:tabn 1<cr>
	inoremap <silent><m-2> <ESC>:tabn 2<cr>
	inoremap <silent><m-3> <ESC>:tabn 3<cr>
	inoremap <silent><m-4> <ESC>:tabn 4<cr>
	inoremap <silent><m-5> <ESC>:tabn 5<cr>
	inoremap <silent><m-6> <ESC>:tabn 6<cr>
	inoremap <silent><m-7> <ESC>:tabn 7<cr>
	inoremap <silent><m-8> <ESC>:tabn 8<cr>
	inoremap <silent><m-9> <ESC>:tabn 9<cr>
	inoremap <silent><m-0> <ESC>:tabn 10<cr>
endif

" cmd+N to switch tab quickly in macvim
if has("gui_macvim")
	set macmeta
	noremap <silent><c-tab> :tabprev<CR>
	inoremap <silent><c-tab> <ESC>:tabprev<CR>
	noremap <silent><d-1> :tabn 1<cr>
	noremap <silent><d-2> :tabn 2<cr>
	noremap <silent><d-3> :tabn 3<cr>
	noremap <silent><d-4> :tabn 4<cr>
	noremap <silent><d-5> :tabn 5<cr>
	noremap <silent><d-6> :tabn 6<cr>
	noremap <silent><d-7> :tabn 7<cr>
	noremap <silent><d-8> :tabn 8<cr>
	noremap <silent><d-9> :tabn 9<cr>
	noremap <silent><d-0> :tabn 10<cr>
	inoremap <silent><d-1> <ESC>:tabn 1<cr>
	inoremap <silent><d-2> <ESC>:tabn 2<cr>
	inoremap <silent><d-3> <ESC>:tabn 3<cr>
	inoremap <silent><d-4> <ESC>:tabn 4<cr>
	inoremap <silent><d-5> <ESC>:tabn 5<cr>
	inoremap <silent><d-6> <ESC>:tabn 6<cr>
	inoremap <silent><d-7> <ESC>:tabn 7<cr>
	inoremap <silent><d-8> <ESC>:tabn 8<cr>
	inoremap <silent><d-9> <ESC>:tabn 9<cr>
	inoremap <silent><d-0> <ESC>:tabn 10<cr>
	noremap <silent><d-o> :browse tabnew<cr>
	inoremap <silent><d-o> <ESC>:browse tabnew<cr>
endif

" =>　buff相关------------------------------------------------------------------"
" 使用<leader>w 快速保存
nmap <leader>w :w!<cr>
" 使用<leader>bd 删除缓存 
nmap <leader>bd :bd<cr>
" 使用<leader>q 快速退出
nmap <leader>q :q!<cr>
" 使用<leader>[ 向前切换buff
nnoremap <leader>] :bn<CR>
" 使用<leader>] 向后切换buff
nnoremap <leader>[ :bp<CR>
" 映射buff跳转按键
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
" 映射buff删除按键
map <leader>0 :bdelete!<CR>
