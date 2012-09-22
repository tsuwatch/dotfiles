set modelines=0		" CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Edit -------------------
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
set shiftwidth=2
"set textwidth=80
set whichwrap=b,s,[,],<,>

" View--------------------
" 現在のモードを表示
set showmode
" 右下に入力中のコマンドを表示
set showcmd
" 括弧の対応の報告
set showmatch
"set number
set title
syntax enable
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=4

" Solarized
set background=dark
let g:solarized_termcolors=256
"let g:solarized_degrade=0
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=1
"let g:solarized_termtrans=0
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
colorscheme solarized

" Searching ----------------
set ignorecase
set wrapscan
set incsearch
set hlsearch

" Mapping ------------------
imap <C-j> <C-[>
imap <C-k> <C-m>

" インサートモード、コマンドモード時はEmacsキーバインドを使う
inoremap <C-a> <Home>
"inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
"inoremap <C-n> <Down>
"inoremap <C-p> <Up>
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
inoremap <C-h> <BS>
inoremap <C-d> <Del>

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
NeoBundle 'altercation/vim-colors-solarized'


filetype plugin on
filetype indent on

" Vim-Latex-----------------
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'



let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_dvi = '/usr/texbin/platex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = '/usr/texbin/dvipdfmx $*.dvi'
let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_dvi = '/usr/texbin/pxdvi -watchfile 1 -editor "vim --servername vim-latex -n --remote-silent +\%l \%f"'
let g:Tex_ViewRule_dvi = '/usr/bin/open -a PictPrinter.app'
"let g:Tex_ViewRule_dvi = '/usr/bin/open -a Mxdvi.app'
let g:Tex_ViewRule_ps = '/usr/local/bin/gv --watch'
let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
""let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXworks.app'

" neocom ---------------------------------------
let g:neocomplcache_enable_at_startup = 1 
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" 自動補完を行なう入力数
let g:neocomplcache_auto_completion_start_length = 3
" 手動補完時に補完を行なう入力数を制限
let g:neocomplcache_manual_completion_start_length = 3
" 補完検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case= 1
" 大文字が入力されている場合、大文字・小文字を区別する
let g:neocomplcache_enable_smart_case = 1

" 補完するためのキーワードパターンを指定
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><CR> neocomplcache#close_popup() . "\<CR>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<UP>" : "\<S-TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-g> neocomplcache#undo_completion()
"inoremap <C-p><UP>
" 補完候補の共通文字列を補完
inoremap <expr><C-l> neocomplcache#complete_common_string()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" unite ------------------------
noremap [unite] <Nop>
nmap <Space>f [unite]

let g:unite_enable_start_insert = 0

let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'
" 現在開いているファイルのディレクトリ下のファイル一覧
noremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" バッファ一覧
noremap <silent> [unite]b :<C-u>Unite buffer<CR>
" レジスタ一覧
noremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" ファイル閲覧履歴
noremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" ブックマーク一覧
noremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" ブックマークに追加
noremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" uniteを開いている間のキーマッピング
augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  noremap <silent> <buffer> <expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent> <buffer> <expr> s unite#smart_map('s', unite#do_action('split'))
  noremap <silent> <buffer> <expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent> <buffer> <expr> v unite#smart_map('v', unite#do_action('vsplit'))
  noremap <silent> <buffer> <expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent> <buffer> <expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction

" vimfiler --------------------
if has('macunix')
  let g:vimfiler_data_directory = '/Volumes/Macintosh\ HD/.vimfiler'
endif

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
noremap <silent> <Leader>e :<C-u>VimFilerBufferDir<CR>

"autocmd FileType vimfiler nnoremap <buffer> / /^\s*\(\|-\\|\|+\\|+\\|-\) \zs


let twitvim_count = 40
