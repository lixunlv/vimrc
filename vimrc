"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" shell CTRL-T 此目录下及子目录文件
" shell CTRL-R 历史命令
" shell ALT-C 进入子目录

Plug 'valloric/youcompleteme'

Plug 'WolfgangMehner/bash-support'

" 自动补全提示
Plug 'Shougo/neocomplete.vim'

" 代码模板
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

" 注释
Plug 'scrooloose/nerdcommenter'

" 自动加括号, 注意:输入右边括号,会自动跳到已有的右边括号
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Color themems
Plug 'altercation/vim-colors-solarized'

" 多光标(选中多个后，可以批量更改，重构用）
Plug 'terryma/vim-multiple-cursors'

" 文件搜索跳转
Plug 'Shougo/unite.vim'
" <c-g> exit

" 多文件内批量替换
Plug 'thinca/vim-qfreplace'
" 1.用unite搜索f/
" 2.用空格选择搜索结果
" 3.按a，选replace
" 4.编辑结果，,w存盘

" 目录
Plug 'Shougo/vimfiler.vim'

" 拷贝历史
Plug 'Shougo/neoyank.vim'
" <D-y>

" tag跳转 leader.
Plug 'tsukkee/unite-tag'

" 多文件中搜索字符串
Plug 'rking/ag.vim'

" 显示todo列表
Plug 'vim-scripts/TaskList.vim'

" function 列表
Plug 'vim-scripts/taglist.vim'

" 开关quickfix窗口
Plug 'milkypostman/vim-togglelist'
" ,q 打开quickfix

" svn插件
Plug 'vim-scripts/vcscommand.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'

" ruby代码合规检查
Plug 'ngmy/vim-rubocop'

" markdown实时预览
Plug 'suan/vim-instant-markdown'

" 搜索api
Plug 'rizzatti/dash.vim'
" <leader>d



call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" 快速保存
nmap <leader>w :w!<cr>
nmap <c-q> g;

" 拷贝文件路径
nmap cp :let @+ = expand("%")

" 用超级权限save
cmap w!! w !sudo tee >/dev/null

" 退出并删除buffer, <bar>用来分隔命令
"nmap <F5> :wa<Bar>exe "mksession! " . v:this_session<Bar>:qa<CR>
"nmap <F5> :wa<Bar>:bd *<c-a><Bar>:qa<cr>

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>

"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

nmap <silent> <leader>d <Plug>DashSearch

noremap H ^
" 拷贝不带回车
noremap L g_

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>
inoremap <c-v> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 当用j/k上下移动时，光标最少保持离上下边界7行
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
"set wildignore=*.o,*~,*.pyc

" 命令行补全方式（第一个tab列出可选项并匹配，后面循环匹配所有可选项）
set wildmode=list:longest,full

"Always show current position, 有statusline了
"set ruler

set colorcolumn=80

" Height of the command bar
set cmdheight=2

" 启用回退键
"set backspace=eol,start,indent

" h,l到行尽头时，可以继续移到上(下)一行
set whichwrap+=<,>,h,l

" 搜索
set ignorecase
set smartcase
set hlsearch
set incsearch

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" ctrl+c to toggle highlight.
"let hlstate=0
"nnoremap <c-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" 显示行号
set number

"在状态栏显示正在输入的命令
set showcmd

" 不自动折行
set nowrap

" 用纵向打开比较窗口
set diffopt=vertical

"set relativenumber
"set undofile


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax enable

colorscheme solarized
call togglebg#map("<F5>")
set t_Co=256
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t
endif

"set guifont=DejaVu_Sans_Mono:h14          " 字体 && 字号
"set guifont=Monaco:h13          " 字体 && 字号
set guifont=Meslo\ LG\ M:h12         " 字体 && 字号

" 自动判断编码时，依次尝试以下编码：
set fileencodings=utf-8,ucs-bom,cp936,gbk,gb2312,big5,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac

"Action Script 语法高亮
"augroup filetypedetect
 "au! BufNewFile,BufRead *.as set filetype=actionscript
 "au! BufNewFile,BufRead *.md set filetype=markdown
 "au! BufNewFile,BufRead *.hbs set filetype=mustache
"augroup END

"autocmd FileType actionscript setlocal shiftwidth=4 tabstop=4

"autocmd FileType actionscript set omnifunc=actionscriptcomplete#CompleteAS
"autocmd FileType actionscript :set dictionary=~/.vim/dict/actionscript.dict

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always uses spaces instead of tab characters
" 用空格替换tab
set expandtab
map <F10> :retab <CR> :%s:\s\+$::<CR>

" 保存文件时自动删除行尾空格或Tab
au BufWritePre * sil %s/\s\+$//e

" Be smart when using tabs ;)
set smarttab

set shiftwidth=2
set softtabstop=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif

" 标记
set viminfo^='1000

" Remember info about open buffers on close
set viminfo^=%

"set sessionoptions-=folds
set sessionoptions-=options
set foldmethod=indent
set foldlevel=9999

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert Mode Ctrl Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-q: Quoted insert. Useful for doing key binding
" Ctrl-w: Delete previous word, create undo point
inoremap <c-d> <c-g>u<c-w>

" Ctrl-e: to end of line
inoremap <c-e> <esc>A

" Ctrl-r: Insert register

" Ctrl-t: Indent shiftwidth

" Ctrl-u: Delete til beginning of line, create undo point
inoremap <c-u> <c-g>u<c-u>

" Ctrl-i: Tab

" Ctrl-o: Execute one normal mode command

" Ctrl-p: Auto complete previous

" Ctrl-a: Go to begin of line
inoremap <c-a> <esc>I

" Ctrl-d: Unindent shiftwidth

" Ctrl-f: Move cursor left
inoremap <c-h> <c-o>h

" Ctrl-g: Move cursor right
inoremap <c-l> <c-o>l

" Ctrl-b: Move word left
inoremap <c-b> <c-o>b

" Ctrl-w: Move word right
inoremap <c-w> <c-o>w

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l,%c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy selection to OS X clipboard
set clipboard=unnamed

" 加快搜索替换
noremap ,, :%s:::g<Left><Left><Left>
cmap ;\ \(\)<Left><Left>

" 上下移动行
nnoremap <D-j> :m .+1<CR>==
nnoremap <D-k> :m .-2<CR>==
inoremap <D-j> <Esc>:m .+1<CR>==gi
inoremap <D-k> <Esc>:m .-2<CR>==gi
vnoremap <D-j> :m '>+1<CR>gv=gv
vnoremap <D-k> :m '<-2<CR>gv=gv

"普通模式下，用拷贝的替换
nnoremap S "_ciw<c-r>0<Esc>

"用拷贝的替换
vnoremap Z "_c<c-r>0<Esc>

" 插入空行，但不进入插入模式
"nmap <F8> o<Esc>
"nmap <F9> O<Esc>

nmap <F8> <c-w><
nmap <F9> <c-w>>

" 拷贝搜索匹配的行
command! -register CopyMatches call CopyMatches(<q-reg>)

" 退出输入状态后，自动切到英文键盘
"set noimdisable
"autocmd! InsertLeave * set imdisable"|set iminsert=0
"autocmd! InsertEnter * set noimdisable"|set iminsert=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
	return 'PASTE MODE  '
    en
    return ''
endfunction

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:neocomplete#cursor_hold_i_time = 1
"let g:neocomplete#enable_at_startup = 0
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#max_list = 5
"let g:neocomplete#max_keyword_width = 30
"let g:neocomplete#enable_fuzzy_completion = 1

"" close preview window
"set completeopt-=preview

"" buffer的优先级提高
"call neocomplete#custom#source('nsnip', 'rank' , 1200)
"call neocomplete#custom#source('buffer', 'rank' , 1000)

"" Plugin key-mappings.
"inoremap <expr><C-g> neocomplete#undo_completion()
"inoremap <expr><C-l> neocomplete#complete_common_string()

"" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

"" <BS>: close popup and delete backword char.
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<BS>"

"inoremap <expr><C-y> neocomplete#close_popup()

"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
 "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction

" ruby completion
"if !exists('g:neocomplete#force_omni_input_patterns')
  "let g:neocomplete#force_omni_input_patterns = {}
"endif

"let g:neocomplete#force_omni_input_patterns.ruby =
     "\ '[^. *\t]\.\w*\|\h\w*::'

"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimFiler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F1> :VimFiler<CR>
map <F2> :VimFilerExplorer -toggle -find<CR>
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" m :move
" c :copy
" d :delete
" r :rename
" K :make directory
" N :new file
" enter :cd or edit
" backspace :to parent
" h :smart close or up to parent
" l :smart expand or edit
" o :expand or edit
" ~ :to home
" \ :to root
" & :to project root
" q :hide
" Q :exit
" yy :yank full path
" gr :grep
" gf :find

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => multi_cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

let g:multi_cursor_exit_from_insert_mode = 0

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neosnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoClose
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:AutoClosePairs_del = "'"
" v->select->,a( 选中增加()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ysiw' 增加单引号 csw == ysiw
" ysiW) 右边括号内部不增加空格
" v->select->S( 选中增加()
" cs(' 替换(为'
" ds' 删除引号

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 注释
" ,cA 在末尾后面加注释
" ,c$ 从这里注释到行末
" ,cy 注释前先拷贝
" ,ci 反转注释
" ,cl 左对齐注释
" command-/ 根据首行反转注释
map <D-/> <Leader>c<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" glob setting
" Press <C-l> refresh candidate window
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])
call unite#custom#profile('default', 'context', {
     \   'start_insert' : 1
     \ })
"call unite#custom#source('file,file/new,buffer,file_rec/async',
      "\ 'matchers', 'matcher_fuzzy')

"call unite#custom#source('buffer,file,file_rec/async',
      "\ 'sorters', 'sorter_selecta')

nnoremap <leader>ll :<C-u>UniteResume<CR>
nnoremap <D-e> :<C-u>Unite buffer<CR>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  map <silent><buffer><expr> <C-s> unite#do_action('split')
  map <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

" === grep
nnoremap f/ :Unite grep:!<cr>
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '-i -f --nocolor --nogroup --hidden -U ' .
      \ '--ignore *.log --ignore tags --ignore *.svn --ignore *.png --ignore *.jpg --ignore *.pl'
let g:unite_source_grep_recursive_opt = ''

" === find file
nnoremap <c-m> :<C-u>Unite -start-insert file_rec/async<CR>

"let g:unite_source_rec_async_command = ['ag', '-i', '-f', '-U', '--nocolor', '--nogroup', '-g', '']
set wildignore=.svn,.svn/**,*.log,*.png,*.jpg,*.pl,swf_debug/*,flash_icons/*,*.un~,tmp/**,node_modules/**,.idea/**,dist/**,360/order/**,.sass-cache/**
call unite#custom#source('file_rec/async', 'ignore_globs', split(&wildignore, ','))

" === yank history
let g:unite_source_history_yank_enable = 1
nnoremap <D-y> :<C-u>Unite history/yank<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tag跳转
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>. :<C-u>Unite -start-insert tag<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ag_highlight=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TaskList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tlTokenList = ['TODO', 'FIXME', 'OPTIMIZE', 'HACK', 'REVIEW']
nmap <F4> :TaskList <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimshell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F7> :VimShell <CR>

let g:vimshell_use_terminal_command = '/bin/bash --login'

set shell=/bin/bash\ --login

"function! s:pushEnv(shname)
  "if a:shname == 'bash'
    "let l:envs = split(system('bash -c "source ~/.bashrc; source ~/.profile; export"'))
  "else
    "return
  "endif

  "for l:env in l:envs
    "unlet! l:envkeyval
    "unlet! l:envkey
    "unlet! l:envval
    "let l:envkeyval = split(l:env, '=')
    "let l:envkey = l:envkeyval[0]
    "unlet l:envkeyval[0]
    "let l:envval = join(l:envkeyval, '=')

    "if l:envkeyval == []
      "continue
    "endif

    "if l:envval[len(l:envval)-1] != '"'
      "let l:envval = l:envval . '"'
    "endif
    "echo

    ""echo l:envkey. '='. l:envval
    "execute 'let $' . l:envkey . '=' . l:envval . ''
  "endfor
"endfunction
"call s:pushEnv('bash')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => RuboCop
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vimrubocop_keymap = 0
"nmap <Leader>ru :RuboCop<CR>

"o    to open (same as enter)
"go   to preview file (open but maintain focus on ack.vim results)
"t    to open in new tab
"T    to open in new tab silently
"h    to open in horizontal split
"H    to open in horizontal split silently
"v    to open in vertical split
"gv   to open in vertical split silently
"q    to close the quickfix window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F3> :TlistToggle <CR>
nmap <F6> :!ripper-tags -R <CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_WinWidth = 40
let Tlist_Inc_Winwidth = 1
"autocmd BufWritePost * :TlistUpdate
:set noballooneval
:set balloondelay=100000
:setlocal balloonexpr=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vcscommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let VCSCommandMapPrefix = '<Leader>z'
let VCSCommandSVNDiffOpt = 'w'
nmap <leader>zR :VCSRevert <CR>
nmap <leader>zc :VCSCommit! <CR>

"|<Leader>|za VCSAdd
"|<Leader>|zs VCSStatus
"|<Leader>|zu VCSUpdate
"|<Leader>|zv VCSVimDiff
"|<Leader>|zc VCSCommit
"|<Leader>|zD VCSDelete
"|<Leader>|zg VCSGotoOriginal
"|<Leader>|zr VCSReview
"|<Leader>|zn VCSAnnotate
"|<Leader>|zN VCSAnnotate!
"|<Leader>|zd VCSDiff
"|<Leader>|zG VCSGotoOriginal!
"|<Leader>|zi VCSInfo
"|<Leader>|zl VCSLog
"|<Leader>|zL VCSLock
"|<Leader>|zU VCSUnlock

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ngmy/vim-rubocop
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:instant_markdown_slow = 1
"去除json文件自动隐藏引号
set conceallevel=0

" 终端里面自动根据状态不同而切换光标
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"let g:Fzf_launcher = "~/scripts/fzf_launcher"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tabular_loaded = 1


