set nocompatible
set nowrap
set nolinebreak
set expandtab
set splitbelow
set splitright
set rnu
set nu
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set foldmethod=marker
set backspace=indent,eol,start
set laststatus=2
set colorcolumn=80,140
set textwidth=0

if executable('ag')
  " Ag is an external dependency, not a Plugin
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Plugins ----------------------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

filetype off
syntax off

"Vundle Configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'maralla/completor.vim'

Plugin 'haya14busa/incsearch.vim'

" Project Management
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf',
\ {'dir': '/usr/local/opt/fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'           " Fuzzy Search (files/content)
Plugin 'tpope/vim-vinegar'          " FileBrowser Plugin
Plugin 'tpope/vim-fugitive'         " Git integration
Plugin 'w0rp/ale'                   " Linting

" JavaScript
Plugin 'othree/yajs.vim'

" Angular Development
Plugin 'Quramy/tsuquyomi'           " TypeScript
" Plugin 'leafgarland/typescript-vim' " TS Syntax Highlighting
Plugin 'Quramy/vim-js-pretty-template' "Template String Highlighting
Plugin 'othree/html5.vim'           " HTML5

" Cool stuff
" Plugin 'tpope/vim-surround'
Plugin 'gko/vim-coloresque'         " Pigment style HiLite
" Plugin 'SirVer/ultisnips'
Plugin 'joshdick/onedark.vim'       " Color scheme
Plugin 'kergoth/vim-hilinks'

call vundle#end()
  " Local Plugins {{{
  " set rtp+=,~/repos/typescript-vim
  set rtp+=,~/repos/ts-vim
  set rtp+=/usr/local/opt/fzf       " FZF is installed globally
  " }}}
filetype plugin indent on
syntax on
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
" }}}

" Basic Syntax Highlighting Overrides -------- {{{
hi Normal ctermbg=none ctermfg=7 cterm=none
hi Type ctermbg=none ctermfg=228 cterm=none
hi Keyword ctermbg=none ctermfg=5 cterm=none
hi Constant ctermbg=none ctermfg=3 cterm=none
hi String ctermbg=none ctermfg=2 cterm=none
hi Number ctermbg=none ctermfg=3 cterm=none
hi Boolean ctermbg=none ctermfg=3 cterm=none
hi Identifier ctermbg=none ctermfg=1 cterm=none
hi Function ctermbg=none ctermfg=4 cterm=none
hi Statement ctermbg=none ctermfg=15 cterm=none
hi MatchParen ctermbg=26 ctermfg=none cterm=none
hi Special ctermbg=none ctermfg=12 cterm=none
hi Comment ctermbg=none ctermfg=066 cterm=none
hi PreProc ctermbg=none ctermfg=7 cterm=none
hi Todo ctermbg=233 ctermbg=5 cterm=italic
hi Underlined ctermbg=none ctermfg=none cterm=underline
hi Error ctermbg=124 ctermfg=15 cterm=none
hi SpellBad ctermbg=124 ctermfg=15 cterm=underline
hi SpellCap ctermbg=220 ctermfg=0 cterm=underline
hi DiffAdd ctermbg=2 ctermfg=0 cterm=none
hi DiffChange ctermbg=3 ctermfg=0 cterm=none
hi DiffDelete ctermbg=1 ctermfg=0 cterm=none
" }}}

" Window Edge Highlighting ------------------ {{{
hi LineNr ctermfg=7 ctermbg=0 cterm=none
hi VertSplit ctermfg=0 ctermbg=233 cterm=none
hi ColorColumn ctermbg=0 ctermfg=none
hi CursorLine ctermbg=232 ctermfg=none cterm=none
hi Folded ctermbg=234 ctermfg=15

hi TabLine ctermbg=233 ctermfg=7 cterm=underline
hi TabLineSel ctermbg=233 ctermfg=10 cterm=underline
hi TabLineFill ctermbg=233 ctermfg=8 cterm=none

hi StatusLine ctermbg=232
hi StatusLineNC ctermfg=0 ctermbg=233 cterm=none
hi StatusLineBufferNumber ctermbg=232 ctermfg=12 cterm=bold
hi StatusLineFileName ctermbg=232 ctermfg=10
hi StatusLineAuxData ctermbg=232 ctermfg=6
hi StatusLineGitInfo ctermbg=232 ctermfg=5
hi StatusLineGitBranch ctermbg=232 ctermfg=1 cterm=bold

function! Git()
  let l:branch=system('git rev-parse --abbrev-ref HEAD')
  if (match(l:branch,'^fatal:',) < 0)
    return substitute(l:branch,'\n','','')
  else
    return ''
  endif
endfunction

if has('statusline')
  let s:GitBranch=Git()
  set statusline=%#StatusLineBufferNumber#     " set highlighting
  set statusline+=%5.5n\                       " buffer number
  if (strlen(s:GitBranch)>0)
    set statusline+=%#StatusLineGitInfo#
    set statusline+=(
    set statusline+=%#StatusLineGitBranch#
    set statusline+=%{Git()}
    set statusline+=%#StatusLineGitInfo#
    set statusline+=)\                         " set Git branch
  endif
  set statusline+=%#StatusLineFileName#        " set highlighting
  set statusline+=%t\                          " file name
  set statusline+=%#StatusLineAuxData#         " set highlighting
  set statusline+=%h%m%r%w\                    " flags
  set statusline+=%{strlen(&ft)?&ft:'none'},   " file type
  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}, " encoding
  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
  set statusline+=%{&fileformat},              " file format
  set statusline+=%{&spelllang},               " language of spelling checker
  set statusline+=%=                           " ident to the right
  set statusline+=0x%-8B\                      " character code under cursor
  set statusline+=@%-7.(%l,%c%V%)\ %<%P        " cursor position/offset
endif

augroup CursorLine
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
" }}}

" Mappings ---------------------------------------------- {{{
nnoremap ,+ :vertical resize +5<CR>" increase pane by 2
nnoremap ,- :vertical resize -5<CR>" decrease pane by 2
nnoremap ++ :resize +5<CR>"          increase pane by 2 vertically
nnoremap -- :resize -5<CR>"          decrease pane by 2 vertically
nnoremap == <C-W><C-=>"              equalize panes
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" ** File Management
fun! FileSearch()
  " Some other things are reliant on fugutive, so this seems safe enough
  if (strlen(fugitive#statusline()) > 0)
    call fzf#run({'source': 'git ls-files', 'down': '40%'})
  else
    call fzf#run({'source': 'find .', 'down': '40%'})
  endif
endfun
noremap <expr> <C-P> FileSearch()
noremap <C-\> :Explore<CR>

" ** Searching
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)
" }}}

" AutoCommands ------------------------------------------ {{{
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }}}

" Netrw ----------------------------------------------- {{{
let g:netrw_liststyle = 3
" }}}
