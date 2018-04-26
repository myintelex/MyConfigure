"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
filetype off                                    " 这是必需的 
Plug 'tomasr/molokai'                           " molokai主题
Plug 'altercation/vim-colors-solarized'         " solarized主题
Plug 'scrooloose/nerdtree'                      " 侧边文件栏
Plug 'kien/ctrlp.vim'                           " 文件搜索
Plug 'majutsushi/tagbar'                        " tags列表 
Plug 'ludovicchabant/vim-gutentags'             " ctags自动更新
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/schmich/vim-guifont'
Plug 'rhysd/vim-clang-format' 
Plug 'asins/vimcdoc'

call plug#end()
filetype plugin indent on                       " 恢复文件类型匹配

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set tags=./.tags;,.tags
nmap <silent> <F4> :TagbarToggle<CR>            " 设置触发快捷键

" =>　vim-gutentags 配置---------------------------------------------------------------"
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" =>　AirLine配置---------------------------------------------------------------"
let g:airline_theme="solarized"                 " 设置主题
let g:airline_solarized_bg='light'              " 设置主题背景
let g:airline_powerline_fonts = 1               " 设置使用powerline字体            

let g:airline#extensions#tabline#enabled = 1    " 打开tabline功能
let g:airline#extensions#tabline#buffer_nr_show = 1
    
set guifont=DejaVuSansMonoForPowerline_Nerd:h9:cANSI:qDRAFT
                                                " 设置gui字体
" =>　guifont配置---------------------------------------------------------------"
let guifontpp_size_increment=1                  " 每次更改的字号
let guifontpp_smaller_font_map="<M-+>"          " 放大
let guifontpp_larger_font_map="<M-->"           " 缩小
let guifontpp_original_font_map="<M-0>"         " 默认大小

