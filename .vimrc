set nocompatible
let $LANG = 'en'
set langmenu=en
set tabstop=2
set softtabstop=2
set shiftwidth=2
source $VIMRUNTIME/vimrc_example.vim
set gfn=΢���ź�:h12
" colorscheme desert

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
colorscheme desert
set nu

set fileencodings=utf-8,chinese
"??????
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif

"???????????????
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

if has("autocmd")
	  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
		  au InsertEnter,InsertChange *
			    \ if v:insertmode == 'i' | 
			    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
			    \ elseif v:insertmode == 'r' |
			    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
			    \ endif
			  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
			endif
