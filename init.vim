" __  __ _    _
" |  \/  | | _(_)_ __   __ _
" | |\/| | |/ / | '_ \ / _` |`'
" | |  | |   <| | | | | (_| |)
" |_|  |_|_|\_\_|_| |_|\__, |
"                      |___/

set nocompatible
"colorscheme zellner
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
"set list
"set listchars=tab:▸\ ,trail:▫
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set nu
set rnu
set incsearch
set hlsearch
set scrolloff=5
set cursorline
set hidden
set pastetoggle=<f5>
set clipboard=unnamed
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
let mapleader=" "

map <leader><leader> <Esc>/<CR>:nohlsearch<CR>c4l
"窗口分屏
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sl :set splitright<CR>:vsplit<CR>
map <leader>sh :set nosplitright<CR>:vsplit<CR>
map <leader>sj :set nosplitbelow<CR>:split<CR>
map <leader>sk :set splitbelow<CR>:split<CR>

map <leader>sH <C-w>t<C-w>H
map <leader>sK <C-w>t<C-w>K
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"窗口切换
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>kk <C-w>k
map <leader>hh <C-w>h
map <leader>jj <C-w>j
map <leader>ll <C-w>l
map <leader>ww <C-w>w
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"窗口调整大小
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Up> :res +5<CR>
map <Down> :res -5<CR>
map <Left> :vertical resize-5<CR>
map <Right> :vertical resize+5<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"标签页操作
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>te :tabe<CR>
map <leader>tn :-tabnext<CR>
map <leader>tb :+tabnext<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"插入模式快捷键配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-m> <Esc>o
inoremap <C-l> <Right>
inoremap <C-f> <Left>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"普通设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>; :
map <leader>qq :bdelete<CR>
map <leader>qu :q!<Esc>
map <leader>ss :w<CR>
map <leader>sv :w!<CR>
map <leader>cw :%s/\v<<C-r><C-w>>/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Vim文件快速编辑
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>vi :e ~/.config/nvim/init.vim<CR>
map <leader>so :w<CR>:source ~/.config/nvim/init.vim<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Python快速写入
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Python快速注释
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>/ I# <Esc>
map <leader>\ :s/# //g <Esc>:nohlsearch<CR>
"启动插件
map <leader>1 :NERDTree<CR>
map <leader>2 :Tlist<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"缓冲区快速切换
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Python文件自动添加头注释
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GetSystemUname()
    let uname=system("whoami")
    if uname[strlen(uname) - 1] == "\n"
        let uname=strpart(uname, 0, strlen(uname) - 1)
    endif
    return uname
endf

function! HeaderPython()
    " let username=GetSystemUname()
    " let filename=expand('%:t')
    call setline(1, "#!/usr/bin/python3")
	" call setline(2, "# -*- coding: utf-8 -*-")
	" call setline(3, "# Author @".username)
	" call setline(4, "# Description @ ".filename)
	" call setline(5, "# CreateTime @ ".strftime('%Y-%m-%d %H:%M:%S', localtime()))
    normal G
    normal o
    normal o
endf

autocmd BufNewFile *.py call HeaderPython()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"代码快速调试
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'go'
    exec "!go run %"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "Vimwiki2HTMLBrowse"
  endif
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"安装插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-scripts/taglist-plus'
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
"
"File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }

" Taglist
 Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose'  }
"
Plug 'roxma/nvim-yarp'
"
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-github'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-pyclang'
"Plug 'ncm2/ncm2-match-highlight'
"Plug 'ncm2/ncm2-markdown-subscope'
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug']  }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less']  }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug']  }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug']  }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'  }
" markdown
"
" sudo pacman -S nodejs
" sudo npm -g install instant-markdown-d
Plug 'suan/vim-instant-markdown'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors     " enable true colors support"
"let g:airline_theme='dracula'
let g:airline_theme='luna'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {}
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
"set shortmess+=c
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"
"" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"inoremap <c-c> <ESC>
"
"" When the <Enter> key is pressed while the popup menu is visible, it only
"" hides the menu. Use this mapping to close the menu and also start a new
"" line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"
"" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"au User Ncm2Plugin call ncm2#register_source({
"        \ 'name' : 'css',
"        \ 'priority': 9,
"        \ 'subscope_enable': 1,
"        \ 'scope': ['css','scss'],
"        \ 'mark': 'css',
"        \ 'word_pattern': '[\w\-]+',
"        \ 'complete_pattern': ':\s*',
"        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"        \ })
"
"""""
""coc
"""""
"fix the most annoying bug that coc has
"autocmd WinEnter * call timer_start(1000, { tid -> execute('unmap if')})
"silent! autocmd BufEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
"silent! autocmd WinEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
silent! au BufEnter * silent! unmap if
"au TextChangedI * GitGutter
" Installing plugins
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore']
" use <tab> for trigger completion and navigate to the next complete item
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Useful commands
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
"""
"snippets
"""
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
