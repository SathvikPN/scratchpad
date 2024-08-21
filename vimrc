" Enable syntax highlighting
syntax on

inoremap jj <Esc>

" For Python
filetype plugin indent on
set completeopt=menuone,noinsert,noselect


" Set file type based on file extension
filetype plugin indent on

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

set smartindent

" Use 4 spaces for indentation
set tabstop=2
set expandtab

" Enable line numbers
set number

" Enable relative line numbers
" set relativenumber

" Show matching brackets
set showmatch

" Highlight current line
set cursorline
set showcmd
" Set color scheme
colorscheme elflord

" Enable auto-completion for Python, Golang, and Bash
if executable('vim-go')
    let g:go_auto_type_info = 1
    let g:go_fmt_command = "goimports"
    autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
endif

if executable('python')
    autocmd FileType python setlocal omnifunc=syntaxcomplete#Complete
endif

if executable('bash')
    autocmd FileType sh setlocal omnifunc=syntaxcomplete#Complete
endif

" Enable code folding
set foldmethod=syntax
set foldlevelstart=99

" Set searching options
set hlsearch
set incsearch
set ignorecase
set smartcase

" Enable mouse support
set mouse=a

" Set clipboard to use system clipboard
set clipboard=unnamedplus

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
