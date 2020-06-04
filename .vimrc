"Plug-in loaders
execute pathogen#infect()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/Plugins')
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-rooter'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'fatih/vim-go'
Plugin 'Yggdroot/indentLine'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'

Plugin 'yuezk/vim-js'
Plugin 'MaxMEllon/vim-jsx-pretty'

call vundle#end()

filetype plugin indent on

syntax on
"Set line numbers
set nu rnu

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

let g:rooter_manual_only = 1

"Navigate with guides
"inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

"Spell check
set spelllang=en_gb spell

"Tab to spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType html           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType xhtml          setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType php            setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType css            setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType sass           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType scss           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType js             setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType javascript     setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType cpp            setlocal shiftwidth=4 tabstop=4 expandtab smarttab
autocmd FileType c              setlocal shiftwidth=4 tabstop=4 expandtab smarttab
autocmd FileType hs             setlocal shiftwidth=4 tabstop=4 expandtab smarttab
autocmd FileType go             setlocal shiftwidth=4 tabstop=4 expandtab smarttab
autocmd FileType dart           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType yaml           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType make           setlocal noexpandtab

"Java auto complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java Rooter
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

"You complete me configuration
highlight Pmenu ctermfg=249 ctermbg=57

"Dart configuration
let dart_html_in_string=v:true
let dart_style_guide = 2

"Indent line
let g:indentLine_char = ''
