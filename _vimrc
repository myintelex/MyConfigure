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
" ���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" =>������б�------------------------------------------------------------------"
set nocompatible                                " �رռ���ģʽ
filetype off                                    " ���Ǳ���� 
set rtp+=~/.vim/bundle/Vundle.vim               " ��������ʱ��·��
call vundle#begin()                             " vundle��ʼ�� 

Plugin 'gmarik/Vundle.vim'                      " ��Ӧ��ʼ���ǵ�һ�� 
Plugin 'tomasr/molokai'                         " molokai����
Plugin 'altercation/vim-colors-solarized'             
                                                " solarized����
Plugin 'scrooloose/nerdtree'                    " ����ļ���
Plugin 'kien/ctrlp.vim'                         " �ļ�����
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

call vundle#end()                               " ÿ�������Ӧ������һ��֮ǰ  
filetype plugin indent on                       " �ָ��ļ�����ƥ��

" =>���������------------------------------------------------------------------"
" =>����������------------------------------------------------------------------"
set background=dark
colorscheme solarized

" =>��NERD tree ����------------------------------------------------------------"
map <f2> :NERDTreeToggle<cr>                    " ��F2����Ϊ����NERDTree�Ŀ�ݼ�
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'         " �޸�������ʾͼ��
let g:NERDTreeWinPos='left'                     " ����λ��
let g:NERDTreeSize=30                           " ���ڳߴ�
let g:NERDTreeShowLineNumbers=0                 " �����Ƿ���ʾ�к�
let g:NERDTreeHidden=0                          " ����ʾ�����ļ�
autocmd vimenter * if !argc()|NERDTree|endif    " ��vimû���ļ��Զ���NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
                                                " ��NERDTreeΪΨһ����ʱ�Զ��ر�
autocmd vimenter * NERDTree</cr></f2>           " ��vimʱ�Զ���NERDTree

" =>��ctrlp����-----------------------------------------------------------------"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'                       " <Leader>p������ǰĿ¼���ļ�

" =>��tagbar ����---------------------------------------------------------------"
nmap <silent> <F4> :TagbarToggle<CR>            " ���ô�����ݼ�

" =>��AirLine����---------------------------------------------------------------"
let g:airline_theme="solarized"                 " ��������
let g:airline_solarized_bg='light'              " �������ⱳ��
let g:airline_powerline_fonts = 1               " ����ʹ��powerline����            

set guifont=DejaVuSansMonoForPowerline_Nerd:h9:cANSI:qDRAFT
                                                " ����gui����


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost $MYVIMRC source $MYVIMRC   " �����ñ��������Ч  
set history=700                                 " ������ʷ��¼����
filetype plugin on                              " �����ļ����ͼ��
filetype indent on                              " ��������
set autoread                                    " �����Զ������ļ�
set hid                                         " �Զ�ж�ػ�����
set wildignore=*.o,*~,*.pyc                     " �ļ���ȫ���Ա����ļ�
set ignorecase                                  " �������Դ�Сд
set magic                                       " ����ʱ�����ַ���ƥ��

set noerrorbells                                " ����û����������
set novisualbell                                " ����û����������
set tm=500

set showmatch                                   " ��������ʱ������תƥ�����һ��
set mat=2                                       " ������תʱ�䣨ʮ��֮һ�룩
set matchpairs={:},(:)                          " ����ƥ��Ķ���

set wildmenu                                    " �������ȫ
set backspace=eol,start,indent                  " �˸��ʹ��
set whichwrap+=<,>,h,l                          " ����ƶ�
set smartcase                                   " ����ƥ��,Сд�Զ���д��ȷ

set nobackup                                    " �رձ��ݺͻ�����
set nowb                                        " �رձ��ݺͻ�����
set noswapfile                                  " �رձ��ݺͻ�����

" =>���ַ���ʽ����--------------------------------------------------------------"
set encoding=utf-8                              " ���ñ����ʽ 
set fileencodings=utf-8,chinese,latin-1         " �ļ������ʽ 
if has("win32")  
 set fileencoding=chinese  
else  
 set fileencoding=utf-8  
endif  
  
source $VIMRUNTIME/delmenu.vim                  " ����˵�����  
source $VIMRUNTIME/menu.vim                     " ����˵�����  
language messages zh_CN.utf-8                   " ���consle�������
set ffs=unix,dos,mac                            " ���û��з���ʽ

" =>��������ʽ����--------------------------------------------------------------"
set expandtab                                   " ʹ�ÿո����tab
set smarttab                                    " ��������
set shiftwidth=4                                " tab��������1 tab == 4 spaces
set tabstop=4                                   " tab��������1 tab == 4 spaces
set lbr                                         " �Զ�����
set ai "Auto indent                             " �Զ�����
set si "Smart indent                            " ��������
set wrap "Wrap lines                            " �Զ�����
" set fdm=indent                                " �����Զ��۵�

" =>����������------------------------------------------------------------------"
syntax enable                                   " �﷨����
set hlsearch                                    " �����������
set incsearch                                   " ʵʱƥ������
set cmdheight=2                                 " �����и߶�

au winLeave * set nocursorline nocursorcolumn   " ������������
au winEnter * set cursorline cursorcolumn       " ������������
set cursorline cursorcolumn                     " ������������

set textwidth=80                                " ��������ַ�����
set colorcolumn=81                              " ��������ַ�����

set so=7                                        " ���ù������������ʾ������
set ruler                                       " ʼ����ʾ��ǰ�к�
set number                                      " ������ʾ�к�
set numberwidth=5                               " �����кſ��
set relativenumber                              " ��������к�

" =>����ݼ�����----------------------------------------------------------------"
let mapleader = " "                             " ����leader����
let g:mapleader = " "                           " ����ȫ��leader����

nmap <leader>w :w!<cr>                          " ʹ��<leader>w ���ٱ���
nmap <leader>q :q!<cr>                          " ʹ��<leader>q �����˳�
inoremap jj <ESC>                               " ʹ��jj ӳ��esc
map <silent> <leader><cr> :noh<cr>              " ʹ��<leader>�ͻس���������

vnoremap <silent> * :call VisualSelection('f')<CR>
                                                " ʹ��*����ģʽ�½��е�ǰ��������
vnoremap <silent> # :call VisualSelection('f')<CR>
                                                " ʹ��#����ģʽ�½��е�ǰ��������
