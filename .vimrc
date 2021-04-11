set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'PeterRincker/vim-argumentative'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'

"Plug 'sbdchd/neoformat'

Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'thosakwe/vim-flutter', { 'for': 'dart' }

Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'

Plug 'fatih/vim-go'

Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
call plug#end()

filetype plugin indent on

syntax on
" Set line numbers
set nu rnu
" Change cursor hold to 1 second
set updatetime=1000

let g:netrw_liststyle = 3
let g:netrw_banner = 0

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

" neomake
" update on writing reading, changes in insert, and normal node after 500ms
"call neomake#configure#automake('nrwi', 500)

" Navigate with guides
"inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Spell check
set spelllang=en_gb
autocmd FileType Text set spell

" Tab to spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
autocmd FileType html           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType xhtml          setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType php            setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType cs             setlocal shiftwidth=4 tabstop=4 expandtab smarttab
autocmd FileType css            setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType sass           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType scss           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType js             setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType javascript     setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType java           setlocal shiftwidth=4 tabstop=4 expandtab smarttab
autocmd FileType cpp            setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType c              setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType hs             setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType go             setlocal shiftwidth=2 tabstop=4 expandtab smarttab
autocmd FileType dart           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType yaml           setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType verilog        setlocal shiftwidth=4 tabstop=4 expandtab smarttab
autocmd FileType specman        setlocal shiftwidth=2 tabstop=2 expandtab smarttab
autocmd FileType make           setlocal noexpandtab

" Neoformat
"augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
"augroup END
"let g:neoformat_basic_format_align = 1
"let g:neoformat_basic_format_retab = 1
"let g:neoformat_basic_format_trim = 1

"You complete me configuration
highlight Pmenu ctermfg=249 ctermbg=57

"Dart configuration
let dart_html_in_string=v:true
let dart_style_guide = 2
let dart_format_on_save = 1

"Indent line
let g:indentLine_char = ''

"JavaScript
let g:vim_jsx_pretty_highlight_close_tag = 1

" YCM
"let g:ycm_language_server = [
"            \   {
"            \     'name': 'dart',
"            \     'cmdline': [ 'dart', '/opt/dart-sdk/bin/snapshots/analysis_server.dart.snapshot', '--lsp' ],
"            \     'filetypes': [ 'dart' ],
"            \   },
"            \ ]

"coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

autocmd FileType c nmap H :CocCommand clangd.switchSourceHeader<CR>
autocmd FileType cpp nmap H :CocCommand clangd.switchSourceHeader<CR>

autocmd FileType scss setl iskeyword+=@-@

" Flutter
let g:flutter_show_log_on_run = 0
let g:dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" Vim-sneak
let g:sneak#label = 1

" fzf
nnoremap <C-p> :Files<Cr>
