set nocompatible
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set laststatus=2
set splitbelow
set splitright
set rnu
set nu

filetype off
syntax off

"Vundle Configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:ycm_confirm_extra_conf = 0

Plugin 'VundleVim/Vundle.vim'
Plugin 'maralla/completor.vim'

Plugin 'haya14busa/incsearch.vim'

" Project Management
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'         " Fuzzy Search
Plugin 'scrooloose/nerdtree'        " Project Directory Tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'w0rp/ale'                   " Linting

" JavaScript
Plugin 'isRuslan/vim-es6'           " ECMAscript

" TypeScript
Plugin 'Quramy/tsuquyomi'           " TypeScript
Plugin 'leafgarland/typescript-vim' " TS Syntax Highlighting
Plugin 'Quramy/vim-js-pretty-template' "Template String Highlighting
Plugin 'othree/html5.vim'           " HTML5

" Cool stuff
Plugin 'gko/vim-coloresque'         " Pigment style HiLite
Plugin 'SirVer/ultisnips'
Plugin 'joshdick/onedark.vim'       " Color scheme

call vundle#end()
filetype plugin indent on

syntax on

"Syntax Highlighting
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
hi Comment ctermbg=none ctermfg=none cterm=none
hi PreProc ctermbg=none ctermfg=7 cterm=none
hi Todo ctermbg=8 ctermbg=5 cterm=italic
hi Underlined ctermbg=none ctermfg=none cterm=underline
hi Error ctermbg=9 ctermfg=16 cterm=none
hi DiffAdd ctermbg=2 ctermfg=0 cterm=none
hi DiffChange ctermbg=3 ctermfg=0 cterm=none
hi DiffDelete ctermbg=1 ctermfg=0 cterm=none

"Chrome Highlighting
hi LineNr ctermfg=7 ctermbg=0 cterm=none
hi StatusLineNC ctermfg=0 ctermbg=8 cterm=none
hi VertSplit ctermfg=0 ctermbg=8 cterm=none

hi TabLine ctermbg=8 ctermfg=7 cterm=underline
hi TabLineSel ctermbg=8 ctermfg=10 cterm=underline
hi TabLineFill ctermbg=8 ctermfg=8 cterm=none

hi StatusLine ctermbg=8
hi StatusLineBufferNumber ctermbg=8 ctermfg=5
hi StatusLineFileName ctermbg=8 ctermfg=10
hi StatusLineAuxData ctermbg=8 ctermfg=6

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if has('statusline')
  set statusline=%#StatusLineBufferNumber#     " set highlighting
  set statusline+=%-2.2n\                      " buffer number
  set statusline+=%#StatusLineFileName#        " set highlighting
  set statusline+=%f\                          " file name
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

" HotKeys
nmap <C-7> :res +5<CR> " increase pane by 2
nmap <C-8> :res -5<CR> " decrease pane by 2
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


let g:ctrlp_custom_ignore = { 'dir': 'node_modules$' }
