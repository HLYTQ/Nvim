

source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/configs.vim

" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('~/.config/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim',{'branch':'release'}
"文件树
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
"<c-j>向后跳转 <c-k>向后跳转
Plug 'honza/vim-snippets'
"fzf
Plug 'usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" Status line
Plug 'theniceboy/eleline.vim', { 'branch': 'no-scrollbar' }
" General Highlighter
Plug 'RRethy/vim-illuminate'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" File navigation
Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'theniceboy/nvim-deus'
Plug 'Mofiqul/dracula.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Editor
"Plug 'mg979/vim-visual-multi' 
Plug 'Yggdroot/indentLine'
call plug#end()

" ==================== Dress up my vim ====================
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
silent! color deus
      
"hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" let g:SnazzyTransparent = 0
" colorscheme snazzy 

" Load the colorscheme
" colorscheme dracula
"
"let g:tokyonight_style = "night"
"let g:tokyonight_italic_functions = 1
"let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
"
"" Change the "hint" color to the "orange" color, and make the "error" color bright red
"let g:tokyonight_colors = {
"  \ 'hint': 'orange',
"  \ 'error': '#ff0000'
"\ } "" Load the colorscheme
"colorscheme tokyonight

" ==================== eleline.vim ====================
let g:airline_powerline_fonts = 1

" ==================== nvim-treesitter ====================
"if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'nvim-treesitter.configs'.setup {
-- one of "all", "language", or a list of languages
ensure_installed = {"typescript", "dart", "java", "c","rust", "bash", "go","cpp","javascript"},
    highlight = {
        enable = true,  
        disable = { "rust" },  
    },
    incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
}
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I', focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
EOF
"endif

"_____________________indentLine____________"

let g:indentLine_enabled = 1
let g:indentLine_char = "┃"
let g:indentLine_conceallevel = 2

"-----------------------Coc.nvim---------------------------------------------------"

"Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnosti cs` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use Leader+h to show documentation in preview window.<LEADER>h
nnoremap <leader>doc:call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


let g:coc_disable_startup_warning = 1
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" ==================== FZF ====================
let g:fzf_preview_window = 'right:40%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

"--------------------------------------------------------------------------------------------------"

let g:rainbow_active = 1

let g:startify_change_to_dir = 0

let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_dracula'

if !exists('g:airline_symbols')
		let g:airline_symbols = {}
endif

let Tlist_Show_One_File=1     "不同时显示多个文件的tag
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1 

