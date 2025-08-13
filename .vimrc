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

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plugin 'airblade/vim-gitgutter'

" Color scheme
Plugin 'sainnhe/everforest'

" A collection of language packs for Vim.
Plugin 'sheerun/vim-polyglot'

" Full path fuzzy file, buffer, mru, tag, ... finder
Plugin 'ctrlpvim/ctrlp.vim'

" Cutting-edge vim css syntax file
Plugin 'JulesWang/css.vim'

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

" Prettier is an opinionated code formatter.
Plugin 'prettier/vim-prettier'

" RSpec runner for Vim
Plugin 'thoughtbot/vim-rspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set history=1000       " lines of command line history to keep"
set maxmempattern=4000
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab          " Expand tabs to spaces
set encoding=utf-8     " The encoding displayed.
set fileencoding=utf-8 " The encoding written to file.
set showmatch          " Show matching brackets.

"""""""""""""""""
" Line numbering
"""""""""""""""""
set relativenumber
highlight CursorLineNr ctermfg=darkyellow
highlight LineNr ctermfg=darkgrey

""""""""""""""
" Colorscheme
""""""""""""""
" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'
" For better performance
let g:everforest_better_performance = 1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
colorscheme everforest

""""""""""""""""""
" /Colorscheme
""""""""""""""""""

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

let mapleader = ","

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

""""""""""""
" Prettier
""""""""""""
" Run Prettier without requiring the `@format` doc tag
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.html Prettier #,*.md *.yaml

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

augroup DotenvDetect
  autocmd!
  autocmd BufRead,BufNewFile *.env,*.env.*  set filetype=dotenv

  " reset syntax highlighting
  autocmd BufReadPost *.env,*.env.* set syntax=sh
augroup END

augroup SecretDetect
  autocmd!
  autocmd BufRead,BufNewFile *secret* set filetype=secret

  " reset syntax highlighting
  autocmd BufReadPost *.yml,*.yaml set syntax=yaml
augroup END

" Copilot plugin settings (installed via pack)
let g:copilot_filetypes = {
  \ '*':      v:true,
  \ 'dotenv': v:false,
  \ 'secret': v:false,
  \ }
