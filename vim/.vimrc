set modelines=0		" CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set errorformat=\ \ File\ \"%f\"\\,\ line\ %l,
set t_Co=256
syntax enable
set encoding=utf-8
set showtabline=2


" File ------------------
"set autoread
set noswapfile

" Indent ----------------
set autoindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=0

" Edit ------------------
set whichwrap=b,s,h,l,[,],<,>
set backspace=2		" more powerful backspacing

" View--------------------
" 現在のモードを表示
set showmode
" 右下に入力中のコマンドを表示
set showcmd
" 括弧の対応の報告
set showmatch
set number
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set title
set scrolloff=5
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=4

" Solarized
let g:solarized_termcolors=256
set background=light
colorscheme solarized

" Searching ----------------
set ignorecase
set wrapscan
set smartcase
set incsearch
set hlsearch

" Mapping ------------------
" インサートモード、コマンドモード時はEmacsキーバインドを使う
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>
inoremap <C-d> <Del>

" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>

" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $
nnoremap 1 0

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" search -------------------
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" ステータス行の設定--------
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENC=%{&fenc}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" prefix -------------------
nnoremap [prefix] <nop>
nmap <Space> [prefix]
nnoremap [subprefix] <nop>
nmap , [subprefix]

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
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'git://github.com/thinca/vim-auto_source.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/ujihisa/vimshell-ssh'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'git://github.com/mattn/zencoding-vim'
NeoBundle 'git://github.com/Shougo/neosnippet'


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
let g:neocomplcache_max_list = 1000
" 補完検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case= 1
" 大文字が入力されている場合、大文字・小文字を区別する
let g:neocomplcache_enable_smart_case = 1

inoremap <expr><TAB> pumvisible() ? "<C-n>" : "<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "<S-TAB>"
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "<CR>"


" unite ------------------------
nnoremap [unite] <nop>
nmap <space> [unite]

let g:unite_source_history_yank_enable = 1
let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'

nnoremap <silent> [unite]b :Unite buffer<CR>
nnoremap <silent> [unite]t :Unite tab<CR>
nnoremap <silent> [unite]w :Unite window<CR>
nnoremap <silent> [unite]g :Unite grep<CR>
nnoremap <silent> [unite]o :Unite outline<CR>
nnoremap <silent> [unite]s :Unite snippet<CR>
nnoremap <silent> [unite]y :Unite history/yank<CR>

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

autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nnoremap <buffer>s :call vimfiler#mappings#do_action('my_split')<CR>
  nnoremap <buffer>v :call vimfiler#mappings#do_action('my_vsplit')<CR>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

" key bindings ----------------
nnoremap <silent> [subprefix]f :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<CR>

" vimshell --------------------
let g:vimshell_interactive_update_time = 10
call unite#custom_default_action('vimshell/history', 'insert')

" key mapping -----------------
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

let twitvim_count = 40
