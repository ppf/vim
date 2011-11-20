" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
scriptencoding utf-8
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

if has("autocmd")
  "Drupal *.module and *.install files.
    augroup module
        autocmd BufRead,BufNewFile *.module set filetype=php
        autocmd BufRead,BufNewFile *.install set filetype=php
        autocmd BufRead,BufNewFile *.test set filetype=php
        autocmd BufRead,BufNewFile *.inc set filetype=php
        autocmd BufRead,BufNewFile *.profile set filetype=php
        autocmd BufRead,BufNewFile *.view set filetype=php
    augroup END
endif
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif  
:se expandtab
:se shiftwidth=2
:se softtabstop=2
:se cindent
:set nobomb
:set nowrap
colo asmdev 
set incsearch
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif
nmap <silent> <F3> <Plug>ToggleProject
let Tlist_Use_Right_Window = 1
filetype on
nnoremap <silent> <F8> :TlistToggle<CR>
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"Dopełnianie za pomoca klawisza TAB
imap <F2> <c-r>=CleverTab()<cr>
source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 
"zakres przeszukiwania przy dopełnianiu
set complete=.,w,s,i,k,b,i,t


"Dodatkowo można ustawić słownik i słownik wyrazów bliskoznacznych w których VIM ma szukać: 
"dopelnianie z menu rozwijanego
set wildmenu 

"Piszemy początek nazwy funkcji i naciskamy F2.
"Pojawi się lista propozycji do dopełnienia (po wybraniu opcji "pojawi sie prototyp funkcji z parametrami)

function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^s*$'
  return "\<Tab>"
  else
  return "\<C-N>"
  endfunction
  au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
  au BufRead,BufNewFile *.css set ft=css syntax=css3
  au BufRead,BufNewFile *.php set ft=php syntax=php
  au BufRead,BufNewFile *.js set ft=javascript syntax=javascript
  au BufRead,BufNewFile *.html set ft=html syntax=html
  au FileType php setlocal dict+=~/.vim/dictionary/PHP.dict
  au FileType html setlocal dict+=~/.vim/dictionary/html.dict
  au FileType css setlocal dict+=~/.vim/dictionary/css.dict
  au FileType javascript setlocal dict+=~/.vim/dictionary/javascript.dict
  au BufRead,BufNewFile *.txt setlocal spell spelllang+=~/.vim/spell/pl.utf-8.spl
