" dein.vim
" https://github.com/Shougo/dein.vim/blob/master/README.md
" let $CACHE = expand('~/.cache')
" if !($CACHE->isdirectory())
"   call mkdir($CACHE, 'p')
" endif
" if &runtimepath !~# '/dein.vim'
"   let s:dir = 'dein.vim'->fnamemodify(':p')
"   if !(s:dir->isdirectory())
"     let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
"     if !(s:dir->isdirectory())
"       execute '!git clone https://github.com/Shougo/dein.vim' s:dir
"     endif
"   endif
"   execute 'set runtimepath^='
"         \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
" endif


if &compatible
set nocompatible
endif 
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', { 'build': 'make'} )

call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#end()

" call vundle#end()
" Vundle end ----------------------------


" Vim-Plug install start ----------------
" call plug#begin()
" call plug#begin(~/.vim/plugged')
" Plug 'tpope/vim-sensible'

" https://github.com/xuhdev/vim-latex-live-preview
" A Vim Plugin for Lively Previewing LaTeX PDF Output
" Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex' }
" call plug#end()
" Vim-Plug install end ------------------



"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#load_toml('~/.vim/dein.toml', {'lazy': 0})

  " Add or remove your plugins here:
  " call dein#add('Shougo/neocomplete.vim')
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  " call dein#add('vim-latex/vim-latex')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
call dein#begin($HOME . '/.cache/dein')

" Let dein manage dein
" Required:
call dein#add($HOME . '/.cache/dein/repos/github.com/Shougo/dein.vim')
" call dein#add('tyrannicaltoucan/vim-deep-space')

" if !has('nvim')
"   call dein#add('roxma/nvim-yarp')
"   call dein#add('roxma/vim-hug-neovim-rpc')
" endif

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Asynchronous Lint Engine (ALE)
" https://rcmdnk.com/blog/2017/09/25/computer-vim/
" if has('job') && has('channel') && has('timers')
"     call dein#add('dense-analysis/ale')
" else
"     call dein#add('vim-syntastic/syntastic')
" endif


" deoplete
" https://rcmdnk.com/blog/2017/11/16/computer-vim/
" if ((has('nvim')  || has('timers')) && has('python3')) && system('pip3 show neovim') !=# ''
"   call dein#add('Shougo/deoplete.nvim')
"   if !has('nvim')
"     call dein#add('roxma/nvim-yarp')
"     call dein#add('roxma/vim-hug-neovim-rpc')
"   endif
" elseif has('lua')
"   call dein#add('Shougo/neocomplete.vim')
" endif



" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable


" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"End dein Scripts-------------------------



" Snippet begin--------------------------------------

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

" Snippet end --------------------------------------



" Gorilla -----------------------------------------

" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

" Gorilla end ----------------------------------------



" to install using Vundle
" add this line to your .vimrc file
" Plugin 'mattn/emmet-vim'

" to install using Vim-Plug
" add this line to your .vimrc file
" Plug 'mattn/emmet-vim'


" neocomplete ----------------------------------------------------------------------------------------
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
" http://engineerspirit.com/2016/12/03/post-216/

" 起動時に有効
" let g:neocomplete#enable_at_startup = 1
" ポップアップメニューで表示される候補の数
" let g:neocomplete#max_list = 50
" キーワードの長さ、デフォルトで80
" let g:neocomplete#max_keyword_width = 80
" let g:neocomplete#enable_ignore_case = 1
" highlight Pmenu ctermbg=6
" highlight PmenuSel ctermbg=3
" highlight PMenuSbar ctermbg=0
" inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : “<CR>”

" neocomplete
" ----------------------------------------------------------------------------------------


" tmux
" https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
syntax on
set termguicolors
colorscheme deep-space



" setting ALE option ----------------------------------------
" https://qiita.com/kaityo256/items/cb76c3f73753fe921e7b
let g:ale_cpp_clang_options = "-stdc++=17"
let g:ale_cpp_gcc_options = "-stdc++=17"
" ----------------------------------------------------------

set number

syntax enable

set wildmenu

" カラースキーム
" https://github.com/tyrannicaltoucan/vim-deep-space
"
set background=dark
set termguicolors
" colorscheme darkblue
colorscheme deep-space

set showmatch matchtime=1

" 全角の設定??
set ambiwidth=double


" マウス有効化
if has('mouse')
	set mouse=a
	if has('mouse_sgr')
		set ttymouse=sgr
	elseif v:version > 703 || v:version is 703 && has('patch632')
		set ttymouse=sgr
	else
		set ttymouse=xterm2

	endif
endif


" うるさい音を消す
set visualbell t_vb=

" 改行時前のインデントを継続
set autoindent

" 開業時に末尾に合わせて行のインデントを増減
set smartindent

" 賢いインデント
" set cindent

" インデント
set shiftwidth=4


" クリップボードからコピペできるようにする
set clipboard=unnamedplus

" Tab
set tabstop=4


" タブ可視化
set list listchars=tab:>_,space:_

" タブ文字設定 (SpecialKey)
highlight SpecialKey ctermfg=120


set statusline+=%#warningmsg#
set statusline+=%*

set title

" 現在の行を強調表示
set cursorline

" 現在の行を強調表示（縦）
set cursorcolumn


set wildmenu

" カーソルをもう一文字行けるようにする
set virtualedit=onemore



" https://note.com/yasukotelin/n/na87dc604e042
" vim neosnippet
set completeopt=longest,menuone

" 補完表示時の Enter で改行をしない
" inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"


" =================== C++ ====================================
" https://osyo-manga.hatenadiary.org/entry/20131219/1387465034
function! s:cpp()
	"include
	setlocal path+=/usr/include
endfunction
" ============================================================



" tex の preamble を折りたたまない
" let g:Tex_AutoFolding=0

" tex の変な表示を無効化
setlocal conceallevel=0


" vim-latex-live-preview
let g:livepreview_previewer='evince'

let g:livepreview_engine='lualatex'

