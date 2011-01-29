" Avoid abbreviations!  Spelling everything out makes grepping easy.

" Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype indent plugin on


" Now you have a working Vim setup.  Customize everything from here on.

" set some directives...
syntax on
set nocompatible
set modelines=0
set hidden

set number
set ruler
set nowrap
set timeoutlen=250
set backspace=2
set autoread
" set ballooneval
"
set noswapfile

" show whitespace
set listchars=tab:→\ ,trail:·,eol:¬
set list


" set cursorline

" tab options
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set autoindent

set mouse=a

" tab completion as in bash
set wildmode=longest,list,full
set wildmenu

set noshowmatch
let loaded_matchparen = 1

set noerrorbells

" PCRE
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"

" Useful Rails commands
"
" Edit routes
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb
" Edit schema
command! Rschema :Redit db/schema.rb
command! RTschema :RTedit db/schema.rb
" Edit gemfile
command! Rgemfile :Redit Gemfile
command! RTgemfile :RTedit Gemfile

autocmd User Rails silent! Rnavcommand trait app/traits -glob=**/*.rb -suffix=.rb

command Write w 

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column --type-set=haml=.haml --type-set=sass=.sass --type-set=scss=.scss"

" status line
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2

" set incsearch         " find the next match as we type the search
" set hlsearch          " hilight searches by default
" etc.  See http://github.com/bronson/vimsy/blob/master/vimrc for inspiration

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\;'zxcvbnm\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>

" minibufexplorer configuration
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplUseSingleClick = 1

" ctrl+tab / ctrl+shift+tab switches buffers
noremap <C-tab> :bnext<CR> 
noremap <C-S-tab> :bprev<CR>

let mapleader=" "


" Enable some plugins or add some of your own!
" Remove any text (like the '#') before BUNDLE to enable a plugin.

" Generally Useful:
" # BUNDLE: git://github.com/scrooloose/nerdtree.git
" # BUNDLE: git://github.com/bronson/vim-bufexplorer.git
" # BUNDLE: git://github.com/bronson/Command-T.git
" # BUNDLE: git://github.com/bronson/vim-closebuffer.git
" # BUNDLE: git://github.com/bronson/vim-indexedsearch.git
" # BUNDLE: git://github.com/bronson/vim-scrollcolors.git
" # BUNDLE: git://github.com/bronson/vim-visual-star-search.git
" # BUNDLE: git://github.com/bronson/vim-trailing-whitespace.git
" # BUNDLE: git://github.com/bronson/vim-toggle-wrap.git
" # BUNDLE: git://github.com/Raimondi/YAIFA.git
" BUNDLE: git://github.com/mileszs/ack.vim.git
" # BUNDLE: git://github.com/vim-scripts/minibufexpl.vim.git
" # BUNDLE: git://github.com/vim-scripts/buftabs.git 
" # BUNDLE: git://github.com/vim-scripts/bufexplorer.zip.git
" BUNDLE: git://github.com/vim-scripts/LustyJuggler.git
" BUNDLE: git://github.com/vim-scripts/YankRing.vim.git
"
" Color schemes:
" BUNDLE: git://github.com/tpope/vim-vividchalk.git
" BUNDLE: git://github.com/vim-scripts/mayansmoke.git

" Programming:
" BUNDLE: git://github.com/scrooloose/nerdcommenter.git
" BUNDLE: git://github.com/tpope/vim-surround.git
" # BUNDLE: git://github.com/vim-scripts/taglist.vim
" # BUNDLE: git://github.com/msanders/snipmate.vim.git
" # BUNDLE: git://github.com/scrooloose/snipmate-snippets.git
" # BUNDLE: git://github.com/tsaleh/vim-align.git
" # BUNDLE: git://github.com/tpope/vim-endwise.git
" # BUNDLE: git://github.com/tpope/vim-repeat.git
" BUNDLE: git://github.com/tpope/vim-fugitive.git
" # BUNDLE: git://github.com/tsaleh/vim-supertab.git
" # BUNDLE: git://github.com/bronson/vim-jquery.git # is not available anymore
" BUNDLE: git://github.com/vim-scripts/jQuery.git
" BUNDLE: git://github.com/tpope/vim-git.git
" BUNDLE: git://github.com/tpope/vim-markdown.git
" # BUNDLE: git://github.com/timcharper/textile.vim.git
" # BUNDLE: git://github.com/kchmck/vim-coffee-script.git
" BUNDLE: git://github.com/vim-scripts/Rename.git
" BUNDLE: git://github.com/vim-scripts/loremipsum.git

" Ruby/Rails Programming:
" BUNDLE: git://github.com/vim-ruby/vim-ruby.git
" BUNDLE: git://github.com/leonid-shevtsov/vim-rails.git
" # BUNDLE: git://github.com/tpope/vim-rake.git
" # BUNDLE: git://github.com/bronson/vim-ruby-block-conv.git
" # BUNDLE: git://github.com/janx/vim-rubytest.git
" # BUNDLE: git://github.com/tsaleh/vim-shoulda.git
" # BUNDLE: git://github.com/tpope/vim-cucumber.git
" BUNDLE: git://github.com/tpope/vim-haml.git
" BUNDLE: git://github.com/cakebaker/scss-syntax.vim.git
" BUNDLE: git://github.com/tpope/vim-cucumber.git
" BUNDLE: git://github.com/leonid-shevtsov/vim-ruby-debugger.git
" # BUNDLE: git://github.com/taq/vim-rspec.git
" BUNDLE: git://github.com/mattn/gist-vim.git
" BUNDLE: git://github.com/csexton/rvm.vim.git
"
