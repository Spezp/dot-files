set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*/node_modules/*,bower_components/*
"------------------------------------------------------------
"" Swap file settings
syntax on

"
set directory^=$HOME/.vim_swap//   "put all swap files together in one place
"
set cursorline

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden
"
" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see
" the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
set nomodeline
set formatoptions-=cro
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"------------------------------------------------------------
" Indentation options
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set shiftwidth=2
set tabstop=2

" Set the working directory to wherever the open file lives
set autochdir



"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
nmap <Leader><C-f> :Ack
nmap <Leader><C-t> :AckG 
" ctrlp.vim shortcuts
nmap <Leader><C-t> :CtrlP<CR>
let mapleader = ";"
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-bufferline'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" doing pathogen as well to get ack working -_-
if empty(glob('~/.vim/autoload/pathogen.vim'))
  silent !curl -fLo ~/.vim/autoload/pathogen.vim --create-dirs
    \ https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
endif
execute pathogen#infect()
filetype plugin indent on
let g:coc_global_extensions = [ 'coc-tsserver' ]
" run prettier via Coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" CTRL P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules     " Linux/MacOSX-
set runtimepath^=~/.vim/bundle/ctrlp.vim
set diffopt+=vertical
map <C-n> :NERDTreeToggle<CR>
" fugitive
command Greview :Gdiff --staged
nnoremap <leader>gr :Greview<cr>

