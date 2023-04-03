" the file setting my config

filetype on
"编码设置
set enc=utf-8
set fencs=utf-8
set viminfo='100,n$HOME/.config/nvim/files/info/viminfo
set wrap 
set number 
set hidden
"set listset number
set indentexpr=
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
set relativenumber
set cursorline
set mouse=a
"set signcolumn=number
set showcmd
set wildmenu
set scrolloff=4
exec "nohlsearch"
set hlsearch
set backspace=indent,eol,start
set tw=0
set laststatus=1
set autochdir
set ignorecase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set noshowmode
set visualbell
set colorcolumn=100
set updatetime=100
set virtualedit=block
set updatetime=100
set shortmess+=c
set completeopt=preview,menu
set completeopt=longest,menu
set noed
set cmdheight=1
set autochdir
set clipboard+=unnamed 
set nobackup
set noswapfile
set ruler
set cindent
set smartindent

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!
 
  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile
 
  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
 
  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
 
  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END


" ==================== Setting neovide ===================
if exists("g:neovide")
set guifont=JetBrainsMono\ Nerd\ Font:h18
endif

let bclose_multiple = 0

" ==================== Terminal Colors ====================
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

