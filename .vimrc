set nocompatible " iMproved
filetype off	 " required

" START Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' " Git tools
Plugin 'tpope/vim-rails.git' " Rails
Plugin 'tomtom/tcomment_vim' " Comment/uncomment
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs' " Autogenerate bracket pairs
Plugin 'kien/ctrlp.vim' " Fuzzy finder
Plugin 'janko-m/vim-test' " Tests
Plugin 'scrooloose/nerdtree' " Navigation tree
Plugin 'tpope/vim-dispatch' " Dispatches test runner to tmux pane
Plugin 'plasticboy/vim-markdown' " Markdown syntax
Plugin 'ervandew/supertab' " Autocomplete
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ntpeters/vim-better-whitespace' " Strip whitespace

if executable('ruby')
    Plugin 'vim-ruby/vim-ruby' " Vim ruby
endif
if executable('rustc')
    Plugin 'rust-lang/rust.vim' " Vim rust
    Plugin 'racer-rust/vim-racer'
endif

" Theme
set termguicolors
Plugin 'tomasr/molokai' " Molokai theme
Plugin 'vim-airline/vim-airline' " Powerline status bar
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='peaksea'
Plugin 'edkolev/tmuxline.vim'
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'win': ['#I', '#W'],
        \ 'cwin': ['#I', '#W'],
        \ 'x': ['#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load --colors --powerline-right -i 3 -g 0 -a 0)'],
        \ 'y': ['%a', '%R']}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" END Vundle

set tags=./tags
set autoindent
set tabstop=4 " 4-wide tabs
set expandtab " Tab spaces
set formatoptions-=t " Disable line break insertion
let g:strip_whitespace_on_save=1

let mapleader=","

" Molokai
syntax enable
set background=dark
" let g:molokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <Leader><CR> :nohlsearch<cr> " Remove highlights with leader + enter

set cursorline " Underline cursor line
set nu " Line numbers"

" No arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Nerdtree
map <Leader>q :NERDTreeToggle<CR>

" Autoreload vim changes
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
	 autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	 autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
 augroup END
endif " has autocmd

""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
" Copied from: https://github.com/janjiss/rcfiles/blob/master/vim/vimrc
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif
