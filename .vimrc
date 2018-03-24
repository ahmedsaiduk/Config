set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

let mapleader= ';'				"the default leader is \, but a comma is much better.
set number					"Let's activate line numbers.



"--------------Key Notaions---------------------"

imap <C-e> <M-e>

"----------------mov up/down---------------------"
nmap <leader>s :m+1<CR>
nmap <leader>w :m-2<CR>  



"----------------------- Default 'let'----------------"

let g:auto_save = 1			"auto save.
let NERDTreeShowHidden=1		"show hidden files in nerdtree.
let g:ctrlp_show_hidden = 1		"show hidden files in ctrlp.
let g:notes_suffix = '.txt'
let NERDTreeHijackNetrw = 0		"to remove \-\ from nerdtree

"----------------------- Visuals----------------"


set guifont=Monaco:h20



"----------------------- Search----------------"

set hlsearch
set incsearch
set ic
"----------------------- Split Management----------------"

set splitbelow					"to make a default split below

set splitright					 "to make a default split right

nmap <C-J> <C-W><C-J>

nmap <C-K> <C-W><C-K>

nmap <C-H> <C-W><C-H>

nmap <C-L> <C-W><C-L>


"----------------------- Mappings----------------"

"Make it easy to edit the vimrc file.
"open new vim tab 
nmap <Leader>te :tabedit<cr>	
"close current tab
nmap <leader>tc :tabc<cr>		
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>nn :set nonumber<cr>
nmap <Leader>n :set number<cr>

nmap <Leader>f1 :vsp ~/.vimrc<cr>
nmap <leader>f2 :vsp ~/Documents/Books/CLI/linux.txt<cr>

"make NERDTreeToggle easier to toggle.

nmap <leader>1 :NERDTreeToggle<cr>

nmap <leader>t :CtrlPBufTag<cr>
nmap <leader>r :CtrlPMRUFiles<cr> 
"for tag search
nmap <leader>f :tag<space>

"-------------------------Auto-Commands--------------------------"

 
"Automatically source the Vimrc file on save.

augroup autosourcing
					"clear the autogroup.	
	autocmd!  
	
	autocmd BufWritePost .vimrc source %

augroup END

if has("gui_running")
	
			"conditions
endif
"##############################################################################
"### Bundle Configs ###########################################################
"##############################################################################

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "atomic"
set laststatus=2 


autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" vim test
let test#strategy = "dispatch"

" Go Vim
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" Emmet
autocmd FileType html,css,javascript.jsx EmmetInstall
let g:user_emmet_leader_key='<C-X>'

" Taboo
set guioptions-=e
"let g:taboo_tab_format = ' %N-%f%m '

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,react,requirejs'

" "vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1

" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <silent> <F8> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$', '\.bak$', 'node_modules']
let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen=1

" TAGBAR
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_left = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_indent = 1
let g:tagbar_expand = 1
let g:tagbar_autopreview = 1

" Python.vim
let python_highlight_all = 1 

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Surround - Django
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" YCM
" Settings from https://code.djangoproject.com/wiki/UsingVimWithDjango
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

command! -bang -nargs=* GitAg
  \ call fzf#vim#ag(<q-args>, {'dir': systemlist('git rev-parse --show-toplevel')[0]}, <bang>0)

" CtrlSF
let g:ctrlsf_default_root='project'
let g:ctrlsf_auto_close = 1
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_mapping = {
    \ "split"   : "i",
    \ "vsplit"  : "s",
    \ "tab"     : "t",
    \ }
let g:ctrlsf_ignore_dir = ["node_modules", "coverage", "dist", "vendor", "target", "build"]

" Taboo
set ssop-=folds      " do not store folds
set ssop+=tabpages,globals

" vim-go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" NeoFormat
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_ruby = ['rubocop']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_sass = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_less = ['prettier']
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" ### My Personal Config
" ######################

set clipboard=unnamedplus

" Tabs
":set guitablabel=%N\ %f

set ignorecase

" Better copy & paste
set pastetoggle=<F3>
"set clipboard=unnamed

" Ignore some file
set wildignore+=*.swp,*.bak,*.pyc,*.class
set cursorline
set nowrap

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

" Foldmethod
set foldmethod=indent
set foldlevel=99

set incsearch
set hlsearch
set noshowmatch
let loaded_matchparen = 1
set ttyfast
set backspace=indent,eol,start
set smartcase
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

syntax enable
"set gfn=Ubuntu\ Mono\ 13
"set gfn=Consolas\ 11
set gfn=Fira\ Mono\ Medium\ 11
set nu
set relativenumber
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown,ctp set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType javascript setl sw=2 sts=2 et
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php,ctp set omnifunc=phpcomplete#CompletePHP
"autocmd FileType vim set omnifunc=syntaxcomplete#Complete

autocmd BufEnter * silent! lcd %:p:h

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

if has('gui_running')
    "colorscheme solarized
    "set background=dark
    "set background=light
    "colorscheme zenburn
    "colorscheme herald
    "colorscheme mustang
    colorscheme railscasts
    "set lines=43 columns=140
    set lines=999 columns=999
    set mousehide
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set ghr=0
else
    "colorscheme seoul256
    colorscheme janah
    "let g:seoul256_background = 235
    set background=dark
    let g:solarized_termcolors=256
    "hi TabLineFill ctermfg=LightGreen ctermbg=NONE
    "hi TabLine ctermfg=Grey ctermbg=NONE
    "hi TabLineSel ctermfg=White ctermbg=NONE
endif

"set colorcolumn=80 
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"let &colorcolumn=join(range(81,999),",")

" RST
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : '~/bin/rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""

" Expand tabs to 2 spaces
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab
set textwidth=79
set softtabstop=2
set shiftround
set autoread                    " Automatically read changed files
set noerrorbells                " No beeps
set encoding=utf-8              " Set default encoding to UTF-8
set showcmd                     " Show me what I'm typing
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
"set nocursorcolumn              " Do not highlight column (speeds up highlighting)
"set nocursorline                " Do not highlight cursor (speeds up highlighting)
"set lazyredraw                  " Wait to redraw

set nobackup
set nowritebackup
set noswapfile

" keep at least 5 lines below the cursor
set scrolloff=5

" enable mouse support
"set mouse=a
"if &term =~ '^screen'
    " tmux knows the extended mouse mode
    "set ttymouse=xterm2
"endif

" close buffer when tab is closed
"set nohidden
set hidden

" better moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Useful when moving accross long lines
map j gj
map k gk

" shortcuts to common commands
let mapleader = ","

" ### MY KEY MAPPINGS
" ###################

map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>

nnoremap ,c :let @+ = expand("%:p").":".line('.')<cr>
"nnoremap ,h :bprevious<CR>
nnoremap ,d :NERDTreeToggle<CR>
"nnoremap ,e :tabnew<CR>
tnoremap ,e <C-\><C-n> 
nnoremap ,n :NERDTreeFind<CR>
"nnoremap ,t :TagbarToggle<CR>
nnoremap ,tt :TagbarToggle<CR>
nnoremap ,f :CtrlSF 
nnoremap ,,f :CtrlSFToggle<CR>
vmap     ,f <Plug>CtrlSFVwordExec
"nnoremap <F5> :GundoToggle<CR>
nmap s <Plug>(easymotion-overwin-f)
nnoremap ,l :Lines<CR>
nnoremap ,a :GitAg!<CR>
nmap ; :Buffers<CR>
nmap ,ev :tabedit ~/.vimrc <CR>
nmap ,t :GFiles<CR>
nmap ,r :Tags<CR>
nmap ,j ::m +1<CR>
nmap ,k :m -2<CR>
nmap <SPACE> :noh<CR>

nnoremap ,ga :Git add %<CR>
nnoremap ,gs :Gstatus<CR>
nnoremap ,gc :Gcommit<CR>
nnoremap ,gp :Gpush<CR>
nnoremap ,gb :Gblame<CR>
nnoremap ,gd :Gdiff<CR>

nnoremap ,w :ImportJSWord<CR>

nnoremap ,pc :CtrlPClearAllCaches<CR>

" ,cd to change to current file dir & print pwd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"=====================================Notes===========================================

"on terminal run $ctags -R for creating 'tags' file.
":tag <function> , for view all use :ts  for all :tn for next :tp for previous. 
"[ctrlp.vim] Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.

"===== rearrange tabs=================
"You can relocate a tab with :tabm using either relative or zero-index
"absolute arguments.
"
"absolute:
"
"Move tab to position i: :tabm i
"relative:
"
"Move tab i positions to the right: :tabm +i
"Move tab i positions to the left:  :tabm -i

"============= rearrange splits================
"Ctrl W gives you the "windows command mode", allowing the following
"modifiers:

"Ctrl W + R - To rotate windows up/left.
"Ctrl W + r - To rotate windows down/right.
"You can also use the "windows command mode" with navigation keys to change a
"window's position:
"
"Ctrl W + L - Move the current window to the "far right"
"Ctrl W + H - Move the current window to the "far left"
"Ctrl W + J - Move the current window to the "very bottom"
"Ctrl W + K - Move the current window to the "very top"

"=================================jumb to { ========================
"[{

"======================== jumb to <tages> ===================
" put currser at tag then v+a+t or v+a+i
