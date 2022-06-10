" SPEZPS .vimrc
"------------ VIM SET -------------
set confirm
set cursorline
set diffopt+=vertical
"filetype plugin on
set autoindent
""filetype plugin indent on
set cmdheight=2
set expandtab
"set formatoptions-=cro
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
set omnifunc=ale#completion#OmniFunc
set undodir=~/.vim/undo
"set path+=**
" terminal bell
set t_vb=
set visualbell
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd,*/node_modules/*,bower_components/*
set wildmenu

set backup
set backupdir=$HOME/temp/vim_backups/       "where to put those backups
set directory=$HOME/temp/vim_swp/           "this is for swp files   

let g:ale_completion_autoimport = 0
let g:ale_fixers = ['tsserver']

syntax on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Sets non active panes to norelativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Wrap lines when in Markdown
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

autocmd FileType typescript* setlocal formatprg=npx\ prettier\ --parser\ typescript
autocmd FileType typescript* setlocal formatexpr=
"------------ PLUGINS ------------

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-bufferline'
Plug 'leafgarland/typescript-vim' " syntax hi
Plug 'peitalin/vim-jsx-typescript' " syntax hi
"Plug 'maxmellon/vim-jsx-pretty'   " syntax hi
Plug 'dense-analysis/ale'
"Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'
call plug#end()

"-------- PLUGIN CONFIGS ---------
"let g:coc_global_extensions = [ 'coc-prettier', 'coc-eslint' ]
"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } } 
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
let NERDTreeQuitOnOpen=1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ------------ MAPPING ------------
let mapleader = " "
" editing

"nmap <leader>w :w<CR> :Prettier<CR>jk
" git
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>

" navigate
map <C-p> :Rg<CR>
map <Leader>b :Buffers<CR>
map <Leader>n :bn<CR>
map <Leader>p :bp<CR>
map <leader>tp :tabprevious <CR>
map <leader>tn :tabnext <CR>
map <C-n> :Exp<CR>
nnoremap <Leader>d :Bdelete<CR>

" Open file under cursor in vsplit
"nnoremap gf :vertical wincmd f<CR>
command! -nargs=0 Bd :bp\|bd \#

" --------- APPEARANCE ------------
colorscheme snazzy
"hi Normal guibg=NONE ctermbg=NONE
"highlight CocErrorFloat ctermfg=15
"highlight CocErrorFloat ctermbg=164
let g:vim_markdown_fenced_languages = ['js=javascript']

" Put buffer line extension in status line :)
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()



