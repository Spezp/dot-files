" Search Ignore
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd,*/node_modules/*,bower_components/*

" Basics ---------------------------------------------------
syntax on
" vertical diff by default
set diffopt+=vertical
set cursorline
" Easier buffer switching
set hidden
" Better menu
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Highlight search
set hlsearch
" No comment autowrap, no comment continuation with o / O. This is likely
" being overwritten by a plugin.
set formatoptions-=cro
" Uses case sensitivity only when uppercase letters are present (not vi
" standard)
set ignorecase
set smartcase
" Allow backspacing over autoindent, line breaks and start of insert action
" set backspace=indent,eol,start

set nowrap
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Use visual bell instead of beeping when doing something wrong
set visualbell
" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set shiftwidth=2
set tabstop=2


" Advanced more custom --------------------------------------------------

" known security vulnerability
set nomodeline
" Prevent the cursor from changing the current column when jumping to 
" other lines within the window. 
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Keep status line even when empty
set laststatus=2
" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=
" Enable use of the mouse for all modes
set mouse=a
" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2
" Sets numbers to be relative to the cursors position.
set number relativenumber
" Sets non active panes to norelativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
" Set the working directory to wherever the open file lives
set autochdir

"------------------------------------------------------------
" Mappings 
"
" Useful mappings
" ? Is this useful ? 
nmap <Leader><C-f> :Ack
nmap <Leader><C-t> :AckG 
let mapleader = ";"
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

"------------------------------------------------------------
"Bootstrapping 
"
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

" Install pathogen if missing
if empty(glob('~/.vim/autoload/pathogen.vim'))
  silent !curl -fLo ~/.vim/autoload/pathogen.vim --create-dirs
    \ https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
endif
execute pathogen#infect()
" ----------------------------------------------------------------------
" Plugin Mappings / Custom settings
"
" CTRL P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set runtimepath^=~/.vim/bundle/ctrlp.vim

" COC
" Do indentation according to filetype 
" ? is this useful ? 
filetype plugin indent on
" global settings for coc extenstions
let g:coc_global_extensions = [ 'coc-tsserver' ]
" run prettier via Coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" fugitive
" I don't know if I want this
command Greview :Gdiff --staged
nnoremap <leader>gr :Greview<cr>

