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
Plugin 'leafgarland/typescript-vim' " TS Syntax Highlighting
Plugin 'Quramy/vim-js-pretty-template' "Template String Highlighting
Plugin 'othree/html5.vim'           " HTML5

" Cool stuff
Plugin 'gko/vim-coloresque'         " Pigment style HiLite
Plugin 'SirVer/ultisnips'
Plugin 'joshdick/onedark.vim'       " Color scheme
Plugin 'kergoth/vim-hilinks'

call vundle#end()
  " Local Plugins {{{
  " set rtp+=,~/repos/typescript-vim
  " set rtp+=,~/repos/typescript.vim
  " }}}
filetype plugin indent on
syntax on
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
" }}}

" Basic Syntax Highlighting Overrides -------- {{{
hi Normal ctermbg=none ctermfg=7 cterm=none
hi Type ctermbg=none ctermfg=5 cterm=none
hi Keyword ctermbg=none ctermfg=5 cterm=none
hi Constant ctermbg=none ctermfg=3 cterm=none
hi String ctermbg=none ctermfg=2 cterm=none
hi Number ctermbg=none ctermfg=3 cterm=none
hi Boolean ctermbg=none ctermfg=3 cterm=none
hi Identifier ctermbg=none ctermfg=1 cterm=none
hi Function ctermbg=none ctermfg=4 cterm=none
hi Statement ctermbg=none ctermfg=15 cterm=none
hi MatchParen ctermbg=none ctermfg=7 cterm=none
hi Special ctermbg=none ctermfg=3 cterm=none
hi Comment ctermbg=none ctermfg=066 cterm=none
hi PreProc ctermbg=none ctermfg=7 cterm=none
hi Todo ctermbg=8 ctermbg=5 cterm=italic
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
hi StatusLineNC ctermfg=0 ctermbg=8 cterm=none
hi VertSplit ctermfg=0 ctermbg=8 cterm=none
hi ColorColumn ctermbg=0 ctermfg=none
hi CursorLine ctermbg=8 ctermfg=none cterm=none
hi Folded ctermbg=8 ctermfg=15

hi TabLine ctermbg=8 ctermfg=7 cterm=underline
hi TabLineSel ctermbg=8 ctermfg=10 cterm=underline
hi TabLineFill ctermbg=8 ctermfg=8 cterm=none

hi StatusLine ctermbg=8
hi StatusLineBufferNumber ctermbg=8 ctermfg=5
hi StatusLineFileName ctermbg=8 ctermfg=10
hi StatusLineAuxData ctermbg=8 ctermfg=6
hi StatusLineGitInfo ctermbg=8 ctermfg=5

if has('statusline')
  set statusline=%#StatusLineBufferNumber#     " set highlighting
  set statusline+=%-2.2n\                      " buffer number
  set statusline+=%#StatusLineGitInfo#         " Git Branch
  set statusline+=%{fugitive#statusline()}
  set statusline+=%#StatusLineFileName#        " set highlighting
  set statusline+=\ %f\                        " file name
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
nmap ,+ :vertical resize +5<CR>" increase pane by 2
nmap ,- :vertical resize -5<CR>" decrease pane by 2
nmap ++ :resize +5<CR>"          increase pane by 2 vertically
nmap -- :resize -5<CR>"          decrease pane by 2 vertically
nmap == <C-W><C-=>"              equalize panes
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" ** File Management
map <C-P> :Files<CR>
map <C-\> :Explore<CR>
" ** Searching
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" F10 reveals which HighlightSyntax a given char belongs to
" map <F10>
      " \ :echo
      " \ 'hi<' . synIDattr(synID(line("."),col("."),1),"name") . '> ' .
      " \ 'trans<' . synIDattr(synID(line("."),col("."),0),"name") . '> ' .
      " \ 'lo<' . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . '>'
      " \<CR>
" }}}

