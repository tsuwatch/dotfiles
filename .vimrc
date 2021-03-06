" モードライン無効化
set modelines=0
" not vi
set nocompatible
set errorformat=\ \ File\ \"%f\"\\,\ line\ %l,
set t_Co=256
syntax enable
set encoding=utf-8
set showtabline=2
"set autoread
set noswapfile
" インデント
set autoindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
" 編集
set whichwrap=b,s,h,l,[,],<,>
set backspace=2		" more powerful backspacing
" 現在のモードを表示
set showmode
" 右下に入力中のコマンドを表示
set showcmd
" 括弧の対応の報告
set showmatch
set number
set list
set listchars=eol:¬,tab:▸\ 
set title
set scrolloff=5
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=4
" Solarized
set background=dark
colorscheme solarized
" 検索
set ignorecase
set wrapscan
set smartcase
set incsearch
set hlsearch

nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
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
" prefix
nnoremap [prefix] <nop>
nmap <Space> [prefix]
nnoremap [subprefix] <nop>
nmap , [subprefix]
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'mac' : 'make -f make_mac.mak',
			\     'unix' : 'make -f make_unix.mak',
			\    }
			\ }
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'basyura/unite-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'rhysd/vim-textobj-ruby'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'scrooloose/syntastic' " {{{
  let g:syntastic_mode_map = { 'mode': 'active',
                             \ 'active_filetypes': ['ruby', 'javascript'],
                             \ 'passive_filetypes': [] }
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_javascript_checkers = ['eslint']
"}}}

NeoBundle 'wavded/vim-stylus'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'deris/vim-shot-f'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'kannokanno/previm'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'k0kubun/vim-open-github'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'fleischie/vim-styled-components'
NeoBundleLazy 'flowtype/vim-flow', {
          \ 'autoload': {
          \     'filetypes': 'javascript'
          \ }}

" Scala {{{
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'derekwyatt/vim-sbt'
NeoBundle 'gre/play2vim'
" }}}

call neobundle#end()
" 起動時に未インストールプラグインをインストールする
NeoBundleCheck
" ファイルタイプ別のプラグイン、インデントを有効にする
filetype plugin on
filetype indent on

" Vim-Latex {{{
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
"}}}


" neocomplcache {{{
let g:neocomplcache_enable_at_startup = 1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 1000
" 補完検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case= 1
" 大文字が入力されている場合、大文字・小文字を区別する
let g:neocomplcache_enable_smart_case = 1

inoremap <expr><TAB> pumvisible() ? "<C-n>" : "<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "<S-TAB>"
"inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "<CR>"
"}}}


" unite {{{
nnoremap [unite] <nop>
nmap <space> [unite]

let g:unite_source_history_yank_enable = 1
let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'

nnoremap <silent> [unite]b :Unite buffer<CR>
nnoremap <silent> [unite]f :Unite file<CR>
nnoremap <silent> [unite]m :Unite file_mru<CR>
nnoremap <silent> [unite]d :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]t :Unite tab<CR>
nnoremap <silent> [unite]w :Unite window<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]o :Unite outline<CR>
nnoremap <silent> [unite]s :Unite snippet<CR>
nnoremap <silent> [unite]y :Unite history/yank<CR>
nnoremap <silent> [unite]r :Unite file_rec/async<CR>

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
"}}}


" vimfiler {{{
if has('macunix')
	let g:vimfiler_data_directory = '/Volumes/Macintosh\ HD/.vimfiler'
endif

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! s:my_vimfiler_settings()
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

" key bindings
nnoremap <silent> [subprefix]f :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<CR>
"}}}

" vimshell {{{
let g:vimshell_interactive_update_time = 10
call unite#custom_default_action('vimshell/history', 'insert')

" key mapping
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
"}}}


" lightline {{{
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
			\ 'colorscheme': 'solarized',
			\ 'active': {
			\ 	'left': [ [ 'mode', 'paste'],
			\ 						[ 'fugitive', 'gitgutter', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\ 	'fugitive': 'MyFugitive',
			\ 	'gitgutter': 'MyGitGutter'
			\ }
			\ }

function! MyFugitive()
	return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyGitGutter()
	if ! exists('*GitGutterGetHunkSummary')
				\ || ! get(g:, 'gitgutter_enabled', 0)
				\ || winwidth('.') <= 90
		return ''
	endif
	let symbols = [
				\ g:gitgutter_sign_added . ' ',
				\ g:gitgutter_sign_modified . ' ',
				\ g:gitgutter_sign_removed . ' '
				\ ]
	let hunks = GitGutterGetHunkSummary()
	let ret = []
	for i in [0, 1, 2]
		if hunks[i] > 0
			call add(ret, symbols[i] . hunks[i])
		endif
	endfor
	return join(ret, ' ')
endfunction
"}}}


" gitgutter {{{
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
"}}}


" Open nerdtree if no args
autocmd VimEnter * if !argc() | NERDTree | endif

" Automatically open quickfix-window
autocmd QuickFixCmdPost *grep* cwindow

" previm {{{
let g:previm_open_cmd='open -a Google\ Chrome'
"}}}

" vim-jsx {{{
let g:jsx_ext_required = 0
"}}}


function! s:unite_gitignore_source()
  let sources = []
  if filereadable('./.gitignore')
    for file in readfile('./.gitignore')
      if file !~ "^#\\|^\s\*$"
        call add(sources, file)
      endif
    endfor
  endif

  if isdirectory('./.git')
    call add(sources, '.git')
  endif
  let pattern = escape(join(sources, '|'), './|')
  call unite#custom#source('file_rec', 'ignore_pattern', pattern)
  call unite#custom#source('grep', 'ignore_pattern', pattern)
endfunction
call s:unite_gitignore_source()
