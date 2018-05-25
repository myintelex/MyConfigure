"str_send""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
filetype off                                    " 这是必需的 
Plug 'tomasr/molokai'                           " molokai主题
Plug 'altercation/vim-colors-solarized'         " solarized主题
Plug 'scrooloose/nerdtree'                      " 侧边文件栏
Plug 'kien/ctrlp.vim'                           " 文件搜索
Plug 'ludovicchabant/vim-gutentags'             " ctags自动更新
Plug 'w0rp/ale'                                 " 动态检查
if has('win32')
    Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }  " tags列表
elseif has('unix')
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }  " tags列表
endif
Plug 'mhinz/vim-startify'                        " 启动界面
Plug 'Shougo/echodoc.vim'                        " 参数列表
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

set runtimepath+=~\github\vim\YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>　主题配置------------------------------------------------------------------"
set background=dark
colorscheme molokai

" =>　NERD tree 配置------------------------------------------------------------"
map <f2> :NERDTreeToggle<cr>                    " 将F2设置为开关NERDTree的快捷键
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'         " 修改树的显示图标
let g:NERDTreeWinPos='left'                     " 窗口位置
let g:NERDTreeSize=30                           " 窗口尺寸
let g:NERDTreeShowLineNumbers=0                 " 窗口是否显示行号
let g:NERDTreeHidden=0                          " 不显示隐藏文件
"autocmd vimenter * if !argc()|NERDTree|endif    " 打开vim没有文件自动打开NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
                                                " 当NERDTree为唯一窗口时自动关闭
""autocmd vimenter * NERDTree</cr></f2>           " 打开vim时自动打开NERDTree

" =>　ctrlp配置-----------------------------------------------------------------"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'                       " <Leader>p搜索当前目录下文件

" =>　vim-gutentags 配置--------------------------------------------------------"
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

" =>　ALE 动态检查配置----------------------------------------------------------"
let g:ale_sign_column_always = 1                " 始终显示提示
let g:ale_sign_error = 'X'                      " 设置错误图标
let g:ale_sign_warning = '!!'                   " 设置警告图标
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" =>　Startify 配置--------------------------------------------------------------"
"设置书签
let g:startify_bookmarks            = [
            \ '~/Project/test.cpp',
            \]
"起始页显示的列表长度
let g:startify_files_number = 10
"自动加载session
let g:tsartify_session_autoload = 1
"过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '^/tmp',
       \ ]
"自定义Header和Footer
let g:startify_custom_header = [
            \ '+-------------------------------------------------------------------------+',
            \ '|                            ---KEEP CODING!---                           |',
            \ '+-------------------------------------------------------------------------+',
            \]
let g:startify_custom_footer = [
            \ '+-------------------------------------------------------------------------+',
            \ '|   SHORTCUT KEY DESCRIPTION                                              |',
            \ '|   F2         :  Open the NERDTree                                       |',
            \ '|   leader     :  the leader is " "                                       |',
            \ '|   leader <cr>:  :noh                                                    |',
            \ '|   leader    P:  ctrlP-show the files                                    |',
            \ '|   leader    w:  :w!                                                     |',
            \ '|   leader    w:  :w!                                                     |',
            \ '|   leader    q:  :q!                                                     |',
            \ '|   leader   bd:  buff delete                                             |',
            \ '|   leader    ]:  buff next                                               |',
            \ '|   leader    [:  buff prev                                               |',
            \ '|   ctrl      h:  move h                                                  |',
            \ '|   ctrl      j:  move j                                                  |',
            \ '|   ctrl      k:  move k                                                  |',
            \ '|   ctrl      l:  move l                                                  |',
            \ '|   ctrl      l:  move l                                                  |',
            \ '|   ctrl    tab:  tab prev                                                |',
            \ '|   ctrl      k:  ALE-errorCheck next                                     |',
            \ '|   ctrl      j:  ALE-errorChec before                                    |',
            \ '|   ctrl      P:  ctrlP-show                                              |',
            \ '|   ctrl      n:  LeaderF-Most recent used                                |',
            \ '|   alt       p:  LeaderF-function                                        |',
            \ '|   alt       n:  LeaderF-buffer                                          |',
            \ '|   alt       m:  LeaderF-Tag                                             |',
            \ '|   alt       +:  font zoom in                                            |',
            \ '|   alt       -:  font zoom out                                           |',
            \ '|   alt       0:  font recovery                                           |',
            \ '|   alt   [num]:  tab [num]                                               |',
            \ '|   tab       h:  split window h                                          |',
            \ '|   tab       j:  split window j                                          |',
            \ '|   tab       l:  split window l                                          |',
            \ '|   tab       k:  split window k                                          |',
            \ '|   tab       w:  split window w                                          |',
            \ '|   tab       m:  tab new                                                 |',
            \ '|   tab       e:  tab close                                               |',
            \ '|   tab       n:  tab next                                                |',
            \ '|   tab       p:  tab prev                                                |',
            \ '|   \t         :  tab new                                                 |',
            \ '|   \g         :  tab close                                               |',
            \ '+-------------------------------------------------------------------------+',
            \]

" =>　echodoc 配置--------------------------------------------------------------"
set noshowmode
 
" =>　AirLine配置---------------------------------------------------------------"
let g:airline_theme="solarized"                 " 设置主题
let g:airline_solarized_bg='light'              " 设置主题背景

let g:airline#extensions#tabline#enabled = 1    " 打开tabline功能
let g:airline#extensions#tabline#buffer_nr_show = 1
    
set guifont=DejaVuSansMonoForPowerline_Nerd:h9:cANSI:qDRAFT
                                                " 设置gui字体
" =>　guifont配置---------------------------------------------------------------"
let guifontpp_size_increment=1                  " 每次更改的字号
let guifontpp_smaller_font_map="<M-+>"          " 放大
let guifontpp_larger_font_map="<M-->"           " 缩小
let guifontpp_original_font_map="<M-0>"         " 默认大小
 
" =>　ycm配置-------------------------------------------------------------------"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_global_ycm_extra_conf = '~\github\vim\YouCompleteMe\third_party\ycmd\cpp\ycm\.ycm_extra_conf.py'
set completeopt=menu,menuone
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

" =>　LeaderF 配置--------------------------------------------------------------"
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
 
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
 
let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'],
    \            ["<F6>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'] ],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'],
    \            ["<F6>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'] ],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
