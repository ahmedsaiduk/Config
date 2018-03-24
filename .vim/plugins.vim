filetype off                  " required

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

"----------------- navigation ---------------------
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'arithran/vim-delete-hidden-buffers'

"---------------- System-------------------------
Plug 'tpope/vim-dispatch'  "work with tmux for runninig command on vim 
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim' 	"line lengtt

"----------------- code analysis ----------------------  
Plug 'scrooloose/syntastic'

"------------------- completion ---------------------
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'

"------------------- format ----------------------------
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
"---------------------------- git ----------------------------
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

"-------------------- Test --------------------------
Plug 'janko-m/vim-test'

"-------------------- Themes --------------------------
Plug 'mhinz/vim-janah'

"-------------------- Languages --------------------------
" rails
Plug 'tpope/vim-rails', { 'for' : ['ruby'] }
Plug 'tpope/vim-bundler', { 'for' : ['ruby'] }
Plug 'ngmy/vim-rubocop', { 'for' : ['ruby'] }
Plug 'tpope/vim-endwise'
" css
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax', { 'for' : ['css', 'less', 'scss'] }

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
