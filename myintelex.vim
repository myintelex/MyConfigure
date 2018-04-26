let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '.s:home.'/'.'<args>'
exec 'set rtp+='.s:home
set rtp+=plugins

IncScript myintelex/viminit.vim
IncScript myintelex/vimmake.vim
VimmakeKeymap

IncScript myintelex/plugins.vim

