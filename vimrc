"------------------------------------------------------------------------------
"   Name Of File: .vimrc
"
"    Description: Personal Vim initialization file.
"
"         Author: Sebastien Watteau (swatteau@gmail.com)
"
"    Last Change: 2013-05-01
"------------------------------------------------------------------------------

" Bundles Configuration (Vundle) {{{1
"------------------------------------------------------------------------------

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'derekwyatt/vim-fswitch'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'sjl/gundo.vim'
Bundle 'swatteau/vim-pml'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'travitch/hasksyn'
Bundle 'tsaleh/vim-matchit'
Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'vim-scripts/UltiSnips'

"}}}

"******************************************************************************
" General Settings
"******************************************************************************

" General Options: {{{1
"------------------------------------------------------------------------------

" Theme and font
set background=dark
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_visibility="low"
colorscheme solarized
set guifont=Inconsolata\ 12

" No need to be vi-compatible
set nocompatible

" Enable filetype detection
filetype on
filetype plugin on
filetype indent on

" Hide the tool bar and the menu bar in gVim and reduce the size of tab pages
set guioptions-=T
set guioptions-=m
set guioptions-=e
" Get rid of vertical scrollbars
set guioptions-=L
set guioptions-=R
set guioptions-=r

" Allow hidden buffers
set hidden

" Setup the cursor appearance in GUI mode
set guicursor+=a:blinkwait750-blinkoff500-blinkon500
" Highlight the current line
set cursorline

" Always show the current mode and typed commands
set showmode
set showcmd

" Use the wild menu for command completion
set wildmenu

" Set the status line information.
set stl=%m\ %#StatusLineFile#%f%*\ %r\ %y\ %p%%\ (%l,%c)%=%{&fenc}\ %{&ff}\ [0x%B]
set laststatus=2

" Set fill characters for splits and folds
set fillchars=

" Set display for special characters
"set listchars=eol:¬,tab:›·,trail:␣,extends:»,precedes:«
set listchars=eol:¬,tab:›\ ,trail:·,extends:»,precedes:«
set list

" Do not update the display while executing macros
set lazyredraw

" Turn on syntax highlighting
syntax on

" Time out on mappings after 2 seconds
set timeout timeoutlen=2000

" Enable incremental search and search highlighting.  Do not wrap around
" the file when scanning.
set incsearch
set hlsearch
set nowrapscan

" Indent with 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set shiftround

" Indent automatically
set autoindent

" No text wrapping
set nowrap

" Show line numbers
set nu
set rnu

" Keep the cursor 2 lines from the top and bottom when scrolling
set scrolloff=2

" Allow backspacing over indent, eol and start
set bs=indent,eol,start

" Split vertically when diffing and do not show the foldcolumn
set diffopt+=vertical,foldcolumn:0

" Redefine the mapleader to something more friendly to AZERTY keyboard users
let mapleader="_"

" General Keyboard Mappings: {{{1
"------------------------------------------------------------------------------

" In normal mode, use the <Tab> key to perform buffer movements.
nmap <silent> <Tab>   :bn<CR>
nmap <silent> <S-Tab> :bp<CR>
nmap <silent> <C-Tab> :b#<CR>

" In insert mode, <Ctrl-L> goes back to Normal mode. This is coherent with
" what i_CTRL-L is supposed to do when Vim is used as a modeless editor.
imap <C-l> <Esc>
vmap <C-l> <Esc>

" In insert mode, <C-j> opens a new line above the cursor
imap <C-j> <C-O>O

" In insert mode, <Ctrl-Del> deletes the word after the cursor
imap <C-Del> <C-O>de

" <Control-Alt-d> toggles diff highlighting
nmap <silent> <C-A-d> :set invdiff<CR>
imap <silent> <C-A-d> <C-O>:set invdiff<CR>

" <Control-Alt-h> removes search highlighting
nmap <silent> <C-A-h> :nohlsearch<CR>
imap <silent> <C-A-h> <C-O>:nohlsearch<CR>

" <Space> clears the highlighting from searches
nmap <silent> <Space> :nohlsearch<CR>

" <Control-Alt-i> toggles the case sensitivity
nmap <silent> <C-A-i> :set invignorecase<CR>:set ignorecase?<CR>
imap <silent> <C-A-i> <C-O>:set invignorecase<CR>:set ignorecase?<CR>

" <Control-Alt-l> toggles the display of line numbers in the current buffer
nmap <silent> <C-A-l> :set invnumber<CR>
imap <silent> <C-A-l> <C-O>:set invnumber<CR>

" <Control-Alt-w> toggles text wrapping
nmap <silent> <C-A-w> :set invwrap<CR>:set wrap?<CR>
imap <silent> <C-A-w> <C-O>:set invwrap<CR><C-O>:set wrap?<CR>

" Edit this .vimrc file
nmap <silent> <Leader>_ :e $MYVIMRC<CR>

" Change to the directory of the current buffer
nmap <silent> <Leader>cd :lcd %:p:h<CR>

"}}}

"******************************************************************************
" Plugin Settings
"******************************************************************************

" CuteErrorMarker {{{1
"------------------------------------------------------------------------------

" Reset background color
hi! link SignColumn Normal

" DiffChanges {{{1
"------------------------------------------------------------------------------

" Use default options for this plugin

" FSwitch {{{1
"------------------------------------------------------------------------------

" Tell FSwitch my prefered order of C++ file extensions and where companion
" files should be searched for.
augroup cxx_extensions
    au!
    au BufEnter *.h,*.hh,*.hpp,*.hxx,*.H let b:fswitchdst = 'cc,cpp,cxx,C,c'
    au BufEnter *.h,*.hh,*.hpp,*.hxx,*.H let b:fswitchlocs = 'reg:/include/src,.'
    au BufEnter *.c,*.cc,*.cpp,*.cxx,*.C let b:fswitchdst = 'h,hh,hpp,hxx,H'
    au BufEnter *.c,*.cc,*.cpp,*.cxx,*.C let b:fswitchlocs = 'reg:/src/include,.'
augroup END

" Switch to the file and load it into the current window
nmap <silent> <Leader>ff :FSHere<cr>

" Switch to the file and load it into the window on the right
nmap <silent> <Leader>fl :FSRight<cr>

" Switch to the file and load it into a new window split on the right
nmap <silent> <Leader>fL :FSSplitRight<cr>

" Switch to the file and load it into the window on the left
nmap <silent> <Leader>fh :FSLeft<cr>

" Switch to the file and load it into a new window split on the left
nmap <silent> <Leader>fH :FSSplitLeft<cr>

" Switch to the file and load it into the window above
nmap <silent> <Leader>fk :FSAbove<cr>

" Switch to the file and load it into a new window split above
nmap <silent> <Leader>fK :FSSplitAbove<cr>

" Switch to the file and load it into the window below
nmap <silent> <Leader>fj :FSBelow<cr>

" Switch to the file and load it into a new window split below
nmap <silent> <Leader>fJ :FSSplitBelow<cr>

" Gundo {{{1
"------------------------------------------------------------------------------

" Keyboard mappings
nmap <silent> <F4> :GundoToggle<cr> 

" PML {{{1
"------------------------------------------------------------------------------

set runtimepath+=~/.vim/bundle/pml,~/.vim/bundle/pml/after,~/.vim/bundle/pml/syntax

" Tagbar {{{1
"------------------------------------------------------------------------------

" Open/Close
nmap <silent> <F3> :TagbarToggle<cr>

let g:tagbar_type_pml = {
    \ 'ctagstype' : 'PML',
    \ 'kinds'     : [
        \ 'c:objects',
        \ 'm:members',
        \ 'f:methods',
    \ ],
    \ 'deffile' : '~/.vim/bundle/pml/ctags-pml.cnf'
\ }

"}}}
" UltiSnips {{{1
"------------------------------------------------------------------------------

" Define triggers
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"}}}

" vim:fdm=marker:tw=80:ff=unix

