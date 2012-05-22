set modelines=0		" CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing


" Edit -------------------
set tabstop=2
set smarttab
set expandtab
set shiftwidth=2
set whichwrap=b,s,[,],<,>

" View--------------------
" 現在のモードを表示
set showmode
" 右下に入力中のコマンドを表示
set showcmd
" 括弧の対応の報告
set showmatch
set number
set title
syntax on
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=4

" Searching ----------------
set ignorecase
set wrapscan
set incsearch
set hlsearch

" Mapping ------------------
imap <C-j> <C-[>
imap <C-k> <C-m>

" インサートモード、コマンドモード時はEmacsキーバインドを使う
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" スペースを押した時、中心を保ってスクロール
noremap <Space> jzz
noremap <S-Space> kzz

noremap <Down> gj
noremap <Up> gk
noremap h <Left>
noremap j gj
noremap k gk
noremap l <Right>


" AutoCommnad --------------
set autoindent smartindent
set autochdir


set encoding=utf-8

set showtabline=2

" ステータス行の設定--------
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENC=%{&fenc}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim

  call neobundle#rc(expand('~/.vim'))
endif

NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/thinca/vim-auto_source.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/ujihisa/vimshell-ssh'


filetype plugin on
filetype indent on

let g:neocomplcache_enable_at_startup = 1 
"autocmd FileType vimfiler nnoremap <buffer> / /^\s*\(\|-\\|\|+\\|+\\|-\) \zs


let twitvim_count = 40
