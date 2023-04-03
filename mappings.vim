" This file contain my keybind, all the user map should use prefix:<leader>
" Those config are imitate spacemacs

" map leader to comma let 
let mapleader = "\<Space>"
nnoremap <leader>noh :noh<CR>
" select all
nnoremap <leader><C-a> ggvG
" read buffer chars to command
vnoremap <leader><CR> "+d:read !<C-r>"<CR>
" read from linux command
vnoremap <leader>rd :r !
" the switch of set spell
nnoremap <leader>sp :call WetherSetSpell()<CR>
" paste to system board
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+P
vnoremap <leader>d "+d
nnoremap <leader>y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" move line with Ctrl + (shift) + J/K
nnoremap <C-j> :m +1<CR>
nnoremap <C-k> :m -2<CR>
inoremap <C-j> <Esc>:m +1<CR>i
inoremap <C-k> <Esc>:m -2<CR>i
vnoremap <C-j> :m '>+1<CR>gvgv
vnoremap <C-k> :m '<-2<CR>gvgv

" paste to vim command 
vnoremap <leader>! "+y:<C-r>"
" paste to vim command and search
vnoremap <leader>/ "+y:/<C-r>"<CR>

" basic move config
noremap <Up> <c-y>
noremap <Down> <c-e>

" file operations -- it seems like emacs
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>


" ==================== Terminal Behaviors ====================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

" ==================== Tab management ====================
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tH :-tabmove<CR>
noremap tL :+tabmove<CR>

" nnoremap <leader>doc:call <SID>show_documentation()<CR>

nnoremap ,s :Startify<CR>
nnoremap <leader>bb :buffers<CR>:buffer 
nnoremap <leader>bd :bd<CR>
nnoremap <leader>BD :bd!<CR>
nnoremap tt :NERDTree<CR>
nnoremap ,v :NERDTreeFind<CR>
nnoremap ,g :NERDTreeToggle<CR>

" jump to slides
nmap <F9> :call JumpFirstBuffer()<CR> :redraw!<CR>
nmap <F10> :call JumpSecondBuffer()<CR> :redraw!<CR>
nmap <F11> :call JumpLastBuffer()<CR> :redraw!<CR>

" 函数跳转
nnoremap <F12> <C-]>

nnoremap L :bn<CR>
nnoremap H :bp<CR>

" 调整分屏大小
map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> :vertical resize+5<CR>
map <C-right> :vertical resize-5<CR>

" 终端
nnoremap <leader>' :set splitbelow<CR>:split<CR>:res -5<CR>:term<CR>

" move between windows
nnoremap <leader>l <C-w>l
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j

nnoremap <F5> :call CompileRunGcc()<CR>
nnoremap <F8> :call Rungdb()<CR> 

" FZF
nnoremap <silent> <C-f> :GFiles<CR>
