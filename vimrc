"------------------------------------------------------------------------------
"   Name Of File: .vimrc
"
"    Description: Personal Vim initialization file.
"
"         Author: Sebastien Watteau
"------------------------------------------------------------------------------

" Bundles Configuration (Vundle) {{{1
"------------------------------------------------------------------------------

" No need to be vi-compatible
set nocompatible

" This is required and will be turned back on after Vundle has done its job
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Generic plug-ins
Plugin 'derekwyatt/vim-fswitch'
Plugin 'easymotion/vim-easymotion'
Plugin 'edsono/vim-matchit'
Plugin 'godlygeek/tabular'
Plugin 'kana/vim-arpeggio'
Plugin 'kien/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Twinside/vim-cuteErrorMarker'

" Language specific plug-ins
Plugin 'cespare/vim-toml'
Plugin 'dag/vim2hs'
Plugin 'OrangeT/vim-csharp'
Plugin 'swatteau/vim-pml'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tikhomirov/vim-glsl'
Plugin 'rust-lang/rust.vim'

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()
"}}}

"******************************************************************************
" General Settings
"******************************************************************************

" General Options: {{{1
"------------------------------------------------------------------------------

" Enable filetype detection
filetype on
filetype plugin on
filetype indent on

" Theme and font
set guifont=Source\ Code\ Pro\ Medium\ 13
" set guifont=Fira\ Mono\ Medium\ 13
" set guifont=Fantasque\ Sans\ Mono\ 13

" Gruvbox settings
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="soft"
" PaperColor settings
let g:PaperColor_Dark_Override = { 'background' : '#181818' }
let g:PaperColor_Light_Override = { 'background' : '#e8e8e8' }

set background=dark
colorscheme PaperColor

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

" In insert mode, <C-l> opens a new line above the cursor
imap <C-l> <C-O>O

" Edit this .vimrc file
nmap <silent> <Leader>\ :e $MYVIMRC<CR>

" Change to the directory of the current buffer
nmap <silent> <Leader>cd :lcd %:p:h<CR>

"}}}

"******************************************************************************
" Plugin Settings
"******************************************************************************

" Arpeggio {{{1
"------------------------------------------------------------------------------
let g:arpeggio_timeoutlen=80
call arpeggio#map('i', '', 0, 'fd', '<Esc>')
call arpeggio#map('v', '', 0, 'fd', '<Esc>')

" CuteErrorMarker {{{1
"------------------------------------------------------------------------------

" Reset background color
hi! link SignColumn Normal

" DelimitMate {{{1
"------------------------------------------------------------------------------

let delimitMate_expand_cr=1

" EasyMotion {{{1
"------------------------------------------------------------------------------

" Search for a single character
nmap <Space> <Plug>(easymotion-s)

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

" Put the preview window below the current window instead of the undo graph
let g:gundo_preview_bottom=1

" Rainbow {{{1
"------------------------------------------------------------------------------

let g:rainbow_active = 1

" Rust {{{1
"------------------------------------------------------------------------------

if executable('rustfmt')
    let g:rustfmt_autosave = 1
endif

" Tagbar {{{1
"------------------------------------------------------------------------------

" Open/Close
nmap <silent> <F3> :TagbarToggle<cr>

" UltiSnips {{{1
"------------------------------------------------------------------------------

" Define triggers
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"}}}

" vim:fdm=marker:tw=80:ff=unix

