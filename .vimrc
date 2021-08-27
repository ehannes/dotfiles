" It is recommended to make changes after sourcing debian.vim
" since it alters the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"""""""""
" VUNDLE
"""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plugin 'airblade/vim-gitgutter'

" precision colorscheme for the vim text editor
Plugin 'altercation/vim-colors-solarized'

" Full path fuzzy file, buffer, mru, tag, ... finder
Plugin 'ctrlpvim/ctrlp.vim'

" Cutting-edge vim css syntax file
Plugin 'JulesWang/css.vim'

" Vim syntax file for scss (Sassy CSS)
Plugin 'cakebaker/scss-syntax.vim'

" CoffeeScript support for vim
Plugin 'kchmck/vim-coffee-script'

" HTML5 omnicomplete and syntax
Plugin 'othree/html5.vim'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'

" A universal set of defaults that (hopefully) everyone can agree on.
Plugin 'tpope/vim-sensible'

" bundler.vim: Lightweight support for Ruby's Bundler
Plugin 'tpope/vim-bundler'

" rails.vim: Ruby on Rails power tools
Plugin 'tpope/vim-rails'

" surround.vim: quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

" Wisely add 'end' in ruby, endfunction/endif/more in vim script.
" (Also Bourne shell, VB (don't ask), C/C++ preprocessor, and Lua support).
Plugin 'tpope/vim-endwise'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vastly improved Javascript indentation and syntax support in Vim
Plugin 'pangloss/vim-javascript'

" Yet Another TypeScript Syntax
Plugin 'HerringtonDarkholme/yats.vim'

" vim-jsx-pretty
Plugin 'maxmellon/vim-jsx-pretty'

" Prettier is an opinionated code formatter.
Plugin 'prettier/vim-prettier'

" HTML and CSS hi-speed coding
Plugin 'mattn/emmet-vim'

" Elm plugin for vim
Plugin 'elmcast/elm-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""
" Own config
"""""""""""""
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab " Expand tabs to spaces
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set showmatch		" Show matching brackets.

" Line numbering
set relativenumber
highlight CursorLineNr ctermfg=darkyellow
highlight LineNr ctermfg=darkgrey

" solarized theme
" how to enable this correct?
set background=light
" colorscheme solarized

" Enable project specific configurations
set exrc
set secure

" Tell vim to ignore uninteresting files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"""""""""""""
" ctrlp.vim
"""""""""""""
" Set root path to path from where vim was started
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

" Ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"""""""""""""
" html5.vim
"""""""""""""
" Exclude html tags from indentation
let g:html_exclude_tags = ['path', 'polygon']


""""""""""""
" Prettier
""""""""""""
" Run Prettier without requiring the `@format` doc tag
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html Prettier

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'false'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'es5'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'babylon'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'always'

" css|strict|ignore
let g:prettier#config#html_whitespace_sensitivity = 'ignore'
