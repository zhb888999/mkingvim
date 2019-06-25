" __  __ _    _
" |  \/  | | _(_)_ __   __ _
" | |\/| | |/ / | '_ \ / _` |`'
" | |  | |   <| | | | | (_| |)
" |_|  |_|_|\_\_|_| |_|\__, |
"                      |___/

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set list
set listchars=tab:▸\ ,trail:▫
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
let mapleader=" "

noremap <leader><CR> :nohlsearch<CR>
map <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>c4l
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
map <leader>qq :q<Esc>
map <leader>qu :q!<Esc>
map <leader>ss :w<CR>
map <leader>sv :w!<CR>
map <leader>cw :%s/\v<<C-r><C-w>>/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"代码快速调试
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>rr :w\|!python3 %<CR>
map <leader>rcc :w\|!gcc %;./a.out<CR>
map <leader>rcp :w\|!g++ %;./a.out<CR>
map <leader>rg :w\|!go run %<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Vim文件快速编辑
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>vi :e ~/.vimrc<CR>
map <leader>so :w\|source ~/.vimrc<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Python快速写入
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ma Iif __name__ == '__main__':<Esc><<o
map <leader>df Idef ():<Esc><<f(i
map <leader>de Idef (self):<Esc>F(i
map <leader>di Idef __init__(self):<Esc>o
map <leader>dn Idef __new__(self):<Esc>o
map <leader>ds Idef __str__(self):<Esc>o
map <leader>dc Idef __call__(self):<Esc>o
map <leader>dd Idef __del__(self):<Esc>o
map <leader>dr Idef __repr__(self):<Esc>o
map <leader>cl Iclass ():<Esc><<f(i
map <leader>pp Iprint(<Esc>A)<Esc>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Python快速注释
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>/ I# <Esc>
map <leader>\ :s/# //g <Esc>:noh<Esc>
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
function GetSystemUname()
    let uname=system("whoami")
    if uname[strlen(uname) - 1] == "\n"
        let uname=strpart(uname, 0, strlen(uname) - 1)
    endif
    return uname
endf

function HeaderPython()
    let username=GetSystemUname()
    let filename=expand('%:t')
    call setline(1, "#!/usr/bin/python3")
    call setline(2, "# -*- coding: utf-8 -*-")
    call setline(3, "# Author @".username)
    call setline(4, "# Description @ ".filename)
    call setline(5, "# CreateTime @ ".strftime('%Y-%m-%d %H:%M:%S', localtime()))
    normal G
    normal o
    normal o
endf

autocmd BufNewFile *.py call HeaderPython()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"安装插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
"代码补全
Plug 'Valloric/YouCompleteMe'
" Error checking
Plug 'w0rp/ale'
"taglist
Plug 'vim-scripts/taglist-plus'
"目录树
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'vim-scripts/indentpython.vim'
"Plug 'tmhedberg/SimpylFold'
Plug 'kien/rainbow_parentheses.vim'
" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
"状态栏
Plug 'vim-airline/vim-airline'
"代码块提示线
Plug 'Yggdroot/indentLine'
Plug 'Lokaltog/vim-powerline'
"Markdowm高亮提示
Plug 'gabrielelana/vim-markdown'
"Markdowm 浏览器实时浏览,需要安装node.js,然后执行sudo npm -g install
"instant-markdown-d
Plug 'suan/vim-instant-markdown'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"YouCompleteme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion=['<C-n>','<Doown>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_min_num_of_chars_for_completion=1                 " 从第2个键入字符就开始罗列匹配项
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 主题 solarized
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" 配色方案
set background=dark
set t_Co=256
colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
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
"vim-flake8
autocmd BufWritePost &.py call Flake8()
"ale
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

