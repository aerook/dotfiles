set t_Co=256
syntax enable

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

filetype plugin indent on

set guifont=Menlo:h14\ Regular

set number
set cursorline
set lazyredraw
set showmatch

set foldmethod=indent
set foldlevel=100

set noswapfile

set incsearch
set hlsearch

set wrap
set linebreak

set textwidth=0
set wrapmargin=0

autocmd Filetype * match Error /\s\+$/

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:autotagExcludeSuffixes="tml.xml.text.txt.vim.swp.swo"
let mapleader=","

" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,f <C-]>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

set mouse=a
set colorcolumn=80

set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

execute pathogen#infect()
colorscheme candycode
