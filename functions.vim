" my vimscript function file

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        set splitbelow
		:sp
		:res -5
		terminal gcc -std=cpp20 % -o %< && time ./%<    
    elseif &filetype == 'cpp'
        set splitbelow
		exec "!g++ -std=c++20 % -Wall -o %<"
		:sp
		:res -5
		:term ./%<    
    elseif &filetype == 'java' 
        set splitbelow
		:sp
		:res -5
		term javac % && time java %<
    elseif &filetype == 'sh'
        :!time bash %
	elseif &filetype == 'python'
        set splitbelow
		silent! exec "!clear"
		:sp
		:term python3 %
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run %
	elseif &filetype == 'markdown'
		exec "!Typora % &"
	elseif &filetype == 'html'
		exec "!firefox % &"
    elseif &filetype == 'rs'
        set splitbelow
        exec "!rustc %<"
        :sp
        :term
    else
        set splitbelow
        :sp
        :res-5
        :term
    endif
endfunc

"C,C++的调试
func! Rungdb()
    "set splitbelow
    exec "!g++ -std=c++20 % -g -o %<"
    ":sp
    ":res -5 
    "term  gdbtui -q ./%<
    :packadd termdebug
    :Termdebug
endfunc

let s:spell_value = 1
function! WetherSetSpell()
    if s:spell_value == 1
        set spell
        let s:spell_value = 0
    else
        set nospell
        let s:spell_value = 1
    endif
endfunction

function! JumpFirstBuffer()
  execute "buffer 1"
endfunction

function! JumpSecondToLastBuffer()
  execute "buffer " . (len(Buffers()) - 1)
endfunction

function! JumpLastBuffer()
  execute "buffer " . len(Buffers())
endfunction

function! Buffers()
  let l:buffers = filter(range(1, bufnr('$')), 'bufexists(v:val)')
  return l:buffers
endfunction

" Automatically source an eponymous <file>.vim or <file>.<ext>.vim if it exists, as a bulked-up
" modeline and to provide file-specific customizations.
function! s:AutoSource()
    let l:testedScripts = ['syntax.vim']
    if expand('<afile>:e') !=# 'vim'
        " Don't source the edited Vimscript file itself.
        call add(l:testedScripts, 'syntax.vim')
    endif

    for l:filespec in l:testedScripts
        if filereadable(l:filespec)
            execute 'source' fnameescape(l:filespec)
        endif
    endfor

    call FindExecuteCommand()
endfunction
augroup AutoSource
    autocmd! BufNewFile,BufRead * call <SID>AutoSource()
augroup END


set foldtext=SimpleFoldText()
set fillchars=fold:\ 
function SimpleFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return sub . ' >>>>>>'
endfunction

set foldlevelstart=20
set foldmethod=expr
set foldexpr=ListFolds()

function! ListFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^- ') >= 0
    return ">1"
  elseif match(thisline, '^  - ') >= 0
    return ">2"
  elseif match(thisline, '^    - ') >= 0
    return ">3"
  elseif match(thisline, '^      - ') >= 0
    return ">4"
  elseif match(thisline, '^        - ') >= 0
    return ">5"
  endif
  return "0"
endfunction


let g:presentationBoundsDisplayed = 0
function! DisplayPresentationBoundaries()
  if g:presentationBoundsDisplayed
    match
    set colorcolumn=0
    let g:presentationBoundsDisplayed = 0
  else
    highlight lastoflines ctermbg=darkred guibg=darkred
    match lastoflines /\%23l/
    set colorcolumn=80
    let g:presentationBoundsDisplayed = 1
  endif
endfunction

function! FindExecuteCommand()
  let line = search('\S*!'.'!:.*')
  if line > 0
    let command = substitute(getline(line), "\S*!"."!:*", "", "")
    execute "silent !". command
    execute "normal gg0"
    redraw
  endif
endfunction
