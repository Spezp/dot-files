" SPEZPS .vimrc
"------------ VIM SET -------------
set confirm
set cursorline
set diffopt+=vertical
" formatoptions - No comment autowrap, no comment continuation with o / O. This is likely
" being overwritten by a plugin. Try to fix this shit.
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

"--------- BOOTSTRAPPING ---------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


"------------ PLUGINS ------------
call plug#begin('~/.vim/plugged')
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
Plug 'mbbill/undotree'
call plug#end()

"-------- PLUGIN CONFIGS ---------
let g:coc_global_extensions = [ 'coc-tsserver' ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ------------ MAPPING ------------
let mapleader = ";"

map <C-p> :GFiles<CR>
map <C-n> :NERDTreeToggle<CR>

" Open file under cursor in vsplit
nnoremap gf :vertical wincmd f<CR>


" --------- APPEARANCE ------------
colorscheme snazzy
hi Normal guibg=NONE ctermbg=NONE
highlight CocErrorFloat ctermfg=15
highlight CocErrorFloat ctermbg=164




