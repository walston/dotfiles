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

filetype on
syntax on

if executable('ag')
  " Ag is an external dependency, not a Plugin
  set grepprg=ag\ --nogroup\ --nocolor
endif

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
