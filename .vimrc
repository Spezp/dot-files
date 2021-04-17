" SPEZPS .vimrc
"------------ VIM SET -------------
set confirm
set cursorline
set diffopt+=vertical

filetype plugin on
set autoindent
set cmdheight=2
set expandtab
set formatoptions-=cro
set hlsearch
set hidden
set ignorecase
set laststatus=2
set mouse=a
set nomodeline
set nostartofline
set nowrap
set number relativenumber
set ruler
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set tabstop=2
set undofile
set undodir=~/.vim/undo
" terminal bell
set t_vb=
set visualbell
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd,*/node_modules/*,bower_components/*
set wildmenu
syntax on

" Sets non active panes to norelativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
augroup WrapLineInMDFile
    autocmd!
    autocmd FileType md setlocal wrap
augroup END

"--------- BOOTSTRAPPING ---------
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


"------------ PLUGINS ------------
"
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-bufferline'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'mbbill/undotree'
call plug#end()

"-------- PLUGIN CONFIGS ---------
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier' ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let NERDTreeQuitOnOpen=1
" ------------ MAPPING ------------
let mapleader = ";"

" navigate
map <C-p> :Rg<CR>
map <Leader>b :Buffers
map <Leader>n :bn
map <Leader>p :bp
map <C-n> :NERDTreeToggle<CR>

" Open file under cursor in vsplit
nnoremap gf :vertical wincmd f<CR>
command! -nargs=0 Bd :bp\|bd \#

" --------- APPEARANCE ------------
colorscheme snazzy
hi Normal guibg=NONE ctermbg=NONE
highlight CocErrorFloat ctermfg=15
highlight CocErrorFloat ctermbg=164
let g:vim_markdown_fenced_languages = ['js=javascript']

" Put buffer line extension in status line :)
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()


