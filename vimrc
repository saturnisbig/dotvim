"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          _
"      __ | \
"     /   | /
"     \__ | \
" by Amix - http://amix.dk/
"
" Maintainer:	Amir Salihefendic <amix3k at gmail.com>
" Version: 2.7
" Last Change: 12/10/06 00:09:21
"
" Sections:
" ----------------------
"   *> General
"   *> Colors and Fonts
"   *> Fileformats
"   *> VIM userinterface
"   ------ *> Statusline
"   *> Visual
"   *> Moving around and tabs
"   *> General Autocommands
"   *> Parenthesis/bracket expanding
"   *> General Abbrevs
"   *> Editing mappings etc.
"   *> Command-line config
"   *> Buffer realted
"   *> Files and backups
"   *> Folding
"   *> Text options
"   ------ *> Indent
"   *> Spell checking
"   *> Plugin configuration
"   ------ *> Yank ring
"   ------ *> File explorer
"   ------ *> Minibuffer
"   ------ *> Tag list (ctags) - not used
"   ------ *> LaTeX Suite things
"   *> Filetype generic
"   ------ *> Todo
"   ------ *> VIM
"   ------ *> HTML related
"   ------ *> Ruby & PHP section
"   ------ *> Python section
"   ------ *> Cheetah section
"   ------ *> Vim section
"   ------ *> Java section
"   ------ *> JavaScript section
"   ------ *> C mappings
"   ------ *> SML
"   ------ *> Scheme bindings
"   *> Snippets
"   ------ *> Python
"   ------ *> javaScript
"   *> Cope
"   *> MISC
"
"  Tip:
"   If you find anything that you can't understand than do this:
"   help keyword OR helpgrep keywords
"  Example:
"   Go into command-line mode and type helpgrep nocompatible, ie.
"   :helpgrep nocompatible
"   then press <leader>c to see the results, or :botright cw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for tpl
"runtime bundles/tplugin_vim/macros/tplugin.vim
" use pathogen.vim to manage plugins
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
execute pathogen#infect()

fun! MySys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfun



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"add file encode related
" see http://edyfox.codecarver.org/html/vim_fileencodings_detection.html 
set encoding=utf-8
" 避免Windows下菜单及系统提示乱码，可作如下设置
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,GB18030,big5,euc-jp,euc-kr,gbk,latin1

"Get out of VI's compatible mode..
set nocompatible

"Sets how many lines of history VIM har to remember
set history=400

filetype off
"Enable filetype plugin
:filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

"Fast reloading of the .vimrc
"map <leader>s :source! ~/.vim/vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vim/vimrc

" syntastic checker 2013-09-30 13:26:06 Teddy Fish 
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['flake8', 'pylint']

" set 256 colors 
set t_Co=256
set magic

" Vimwiki to use markdow syntax to replace wiki syntax
let g:vimwiki_list = [
      \{'path': '~/Dropbox/Wiki_ios/Default/',
      \ 'path_html': '~/Documents/Wiki/Sites/wiki/',
      \ 'html_footer': '~/Documents/Wiki/Default/footer.tpl',
      \ 'html_header': '~/Documents/Wiki/Default/header.tpl',
      \ 'syntax': 'markdown',
      \ 'auto_export': 0}
      \]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
"syntax enable
syntax on

""syntax": "markdown"

let g:molokai_original=0
let g:rehash256=1

"Set font to Monaco 10pt
if MySys() == "mac"
  set gfn=Bitstream\ Vera\ Sans\ Mono:h14
  set nomacatsui
  set termencoding=macroman
elseif MySys() == "linux"
  "set gfn=Monospace\ 11
  "set gfn=Inconsolata-g\ 12
  "set gfn=Panic\ Sans\ 12
  "set gfn=Monaco\ 12
  set gfn=Anonymous\ Pro\ 12
  set guifontwide=WenQuanYi\ Zen\ Hei\ 12
  "set guifontwide=WenQuanYi\ Micro\ Hei\ 11
elseif MySys() == "windows"
  "set guifont=Courier_New:h12:cANSI
  au BufRead set guifontwide=Consolas:h12
  set guifont=Consolas:h12,\ Courier_New:h12:cANSI
  "set guifont=Courier_New:h12:cANSI
  "au GUIEnter * simalt ~x "maxize
  "set gfn=Consolas\ 14
  "set gfn=Inconsolata\ 14
endif

if has("gui_running")
  set guioptions-=T
  set background=dark
  "let psc_style='cool'
  "colorscheme ps_color
  "colorscheme wombat
  "set background=light
  "colorscheme solarized
  colorscheme molokai
else
  "set background=light
  set background=dark
  "colorscheme zellner
  "colorscheme wombat
  "let g:solarized_termcolors=256
  "colorscheme solarized
  "colorscheme peaksea 
  colorscheme molokai
endif

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set syntax=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>
map <leader>5 :set syntax=markdown<cr>
map <leader>6 :set syntax=htmldjango<cr>

autocmd BufEnter * :syntax sync fromstart

"Highlight current
if has("gui_running")
  set cursorline
  hi cursorline guibg=#333333 
  hi CursorColumn guibg=#333333
endif

"Omni menu colors
"hi Pmenu guibg=#333333
"hi PmenuSel guibg=#555555 guifg=#ffffff

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
"set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
"set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
  "let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
  let curdir = substitute(getcwd(), '/Users/teddy/', "~/", "g")
  return curdir
endfunction

"Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
" 2011年10月30日 10:47:48  add the fileencoding support http://vim.wikia.com/wiki/Show_fileencoding_and_bomb_in_the_status_line
"set statusline=\ %f%m%r%h\ %y%{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\"}\ \ CWD:\ %r%{CurDir()}%h\ \ Line:\ %l/%L:%c



""""""""""""""""""""""""""""""
" => Visual
""""""""""""""""""""""""""""""
"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
map <c-space> ?

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Actually, the tab does not switch buffers, but my arrows
"Bclose function ca be found in "Buffer related" section
"map <leader>bd :Bclose<cr>
"map <down> <leader>bd
"Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
")
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
inoremap $1 ()<esc>:let leavechar=")"<cr>i
inoremap $2 []<esc>:let leavechar="]"<cr>i
inoremap $4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap $3 {}<esc>:let leavechar="}"<cr>i
inoremap $q ''<esc>:let leavechar="'"<cr>i
inoremap $w ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab tdate <c-r>=strftime("=%d%m%Y")<cr>

"iab xname Amir Salihefendic
"iab xdate <c-r>=strftime("%Y年%m月%d日 %H:%M:%S")<cr>
iab xname Teddy Fish


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using control
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set nofen
set fdl=1
set fdm=indent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>
au FileType vim,javascript setl shiftwidth=2
au FileType vim,javascript setl tabstop=2
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4
" for Markdown syntax 
autocmd FileType markdown,html setl shiftwidth=4 sts=4 ts=4
" Teddy Fish added for python indent
autocmd FileType python setl ts=4 et sta sw=4 sts=4
" turn on python syntax highlight 2012年04月12日 01:04:17 
let python_highlight_all=1
"set iskeyword+=:

set smarttab
set lbr
set tw=500
"Teddy Fish 2011年05月28日 15:17:31 
set list
set listchars=tab:▸\ ,eol:¬
"set listchars=tab:>- ,eol:<

""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

"Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
"Run the current buffer in python - ie. on leader+space
"au FileType python so ~/vim_local/syntax/python.vim
autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
"autocmd FileType python so ~/vim_local/plugin/python_fold.vim

"Set some bindings up for 'compile' of python
autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"Run in the Python interpreter
function! Python_Eval_VSplit() range
  let src = tempname()
  let dst = tempname()
  execute ": " . a:firstline . "," . a:lastline . "w " . src
  execute ":!python " . src . " > " . dst
  execute ":pedit! " . dst
endfunction
au FileType python vmap <F7> :call Python_Eval_VSplit()<cr> 
" use templates for new .py file
"autocmd BufNewFile *.py 0r ~/.vim/templates/python/tpl.py

"""""""""""""""""""""""""""""""
" => Vim section
"""""""""""""""""""""""""""""""
autocmd FileType vim set nofen

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript so ~/.vim/bundle/javascript.vim/syntax/javascript.vim
function! JavaScriptFold() 
  setl foldmethod=syntax
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

au FileType javascript imap <c-t> console.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi
au FileType javascript setl nocindent
au FileType javascript inoremap <buffer> $r return 

au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space> 
au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka


""""""""""""""""""""""""""""""
" => HTML
"""""""""""""""""""""""""""""""
"au FileType html,cheetah set ft=xml
"au FileType html,cheetah set syntax=html


""""""""""""""""""""""""""""""
" => C mappings
"""""""""""""""""""""""""""""""
autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc %<cr>

""""""""""""""""""""""""""""""
" => Scheme bidings
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.scm map <buffer> <leader><space> <leader>cd:w<cr>:!petite %<cr>
autocmd BufNewFile,BufRead *.scm inoremap <buffer> <C-t> (pretty-print )<esc>i
autocmd BufNewFile,BufRead *.scm vnoremap <C-t> <esc>`>a)<esc>`<i(pretty-print <esc>


""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""
"You can use <c-j> to goto the next <++> - it is pretty smart ;)

  """""""""""""""""""""""""""""""
  " => Python
  """""""""""""""""""""""""""""""
  autocmd FileType python inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\nreturn <++>")<cr>
  autocmd FileType python inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++>:\n<++>")<cr>
  autocmd FileType python inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<cr>
  autocmd FileType python inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>")<cr>
  autocmd FileType python inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<cr>
  "autocmd FileType python source ~/.vim/bundle/vim-snipmate/snippets/python.snippets
  
  """""""""""""""""""""""""""""""
  " => JavaScript
  """""""""""""""""""""""""""""""
  autocmd FileType cheetah,javascript inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("function <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
  autocmd filetype cheetah,javascript inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr>
  autocmd FileType cheetah,javascript inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr>
  autocmd FileType cheetah,javascript inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>
  
  
  """""""""""""""""""""""""""""""
  " => HTML
  """""""""""""""""""""""""""""""
  "autocmd FileType cheetah,html inorea <buffer> cahref <c-r>=IMAP_PutTextWithMovement('<a href="<++>"><++></a>')<cr>
  "autocmd FileType cheetah,html inorea <buffer> cbold <c-r>=IMAP_PutTextWithMovement('<b><++></b>')<cr>
  "autocmd FileType cheetah,html inorea <buffer> cimg <c-r>=IMAP_PutTextWithMovement('<img src="<++>" alt="<++>" />')<cr>
  "autocmd FileType cheetah,html inorea <buffer> cpara <c-r>=IMAP_PutTextWithMovement('<p><++></p>')<cr>
  "autocmd FileType cheetah,html inorea <buffer> ctag <c-r>=IMAP_PutTextWithMovement('<<++>><++></<++>>')<cr>
  "autocmd FileType cheetah,html inorea <buffer> ctag1 <c-r>=IMAP_PutTextWithMovement("<<++>><cr><++><cr></<++>>")<cr>
  

  """""""""""""""""""""""""""""""
  " => Java
  """""""""""""""""""""""""""""""
  autocmd FileType java inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("public<++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr> 
  autocmd FileType java inorea <buffer> cfunpr <c-r>=IMAP_PutTextWithMovement("private<++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr> 
  autocmd FileType java inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr> 
  autocmd FileType java inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr> 
  autocmd FileType java inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>
  autocmd FileType java inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++> <++> {\n<++>\n}")<cr>
  autocmd FileType java inorea <buffer> cmain <c-r>=IMAP_PutTextWithMovement("public static void main(String[] argv) {\n<++>\n}")<cr>
  
  
  "Presse c-q insted of space (or other key) to complete the snippet
  imap <C-q> <C-]>
  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For Cope
map <silent> <leader><cr> :noh<cr>

"Orginal for all
map <leader>n :cn<cr>
map <leader>p :cp<cr>
map <leader>c :botright cw 10<cr>
map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"A function that inserts links & anchors on a TOhtml export.
" Notice:
" Syntax used is:
"   *> Link
"   => Anchor
function! SmartTOHtml()
  TOhtml
  try
    %s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
  catch
  endtry
  exe ":write!"
  exe ":bd"
endfunction

" Add for read PDF by Teddy 11-01-22
autocmd BufReadPre *.pdf set ro nowrap
autocmd BufReadPost *.pdf silent %!pdftotext "%" -nopgbrk -layout -q -eol unix -

" Wed Feb  9 21:54:15 CST 2011
" map added to quick insert current time
map <F6> <Esc>a<c-r>=strftime("%Y-%m-%d %H:%M:%S") 

let g:snipMate = {}
source ~/.vim/bundle/vim-snipmate/plugin/snipMate.vim
"2011年06月01日 21:36:24 Teddy Fish -- set snipMate
"let g:snippets_dir='~/.vim/bundle/snipMate/snippets/'
"autocmd FileType html set ft=html.markdown

" add php zend snippets 2011年07月22日 21:34:51 
" ExtractSnipsFile('~/.vim/bundle/snipMate/snippets/zend', 'php') 
"let g:snips_author = 'Teddy'
"indent with lispindent.lisp 2011年06月18日 11:13:02 
"autocmd FileType lisp,scheme,art setlocal equalprg=lispindent.lisp
"set equalprg=lispindent.lisp

" Zen coding
"let g:user_zen_settings = {
"      \ 'indentation' : ' ',
"      \ 'perl' : {
"      \   'alias' : {
"      \     'req' : 'require'
"      \   },
"      \   'snippets' : {
"      \    'use':'use strict\n use warnings\n\n',
"      \     'warn': "warn \"|\";",
"      \  }
"      \}
"      \}
"let g:user_zen_expandabbr_key='<c-y>'
"let g:user_zen_complete_tag=1
" Teddy Fish 2012年03月31日 20:02:58 
" When quit and reopen the file, return to the last edit place when quit.
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" airline plugin
let g:airline#extension#tabline#enabled = 1
