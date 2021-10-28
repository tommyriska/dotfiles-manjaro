" Note that the plugin file location might be different. You might want to recheck it manually.
call plug#begin("~/.config/nvim/plugged")
  " Plugin Section
  " Retro groove color theme
  Plug 'morhetz/gruvbox'
  " NERDTree filesystem explorer
  Plug 'preservim/nerdtree'
  " Extra syntax and highlights for nerdtree files
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " NERDTree plugin that shows git status flags
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Adds filetype icons to multiple plugins, e.g for NERDTree
  Plug 'ryanoasis/vim-devicons'
  " Commandline fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Light and configurable status/tab line 
  Plug 'itchyny/lightline.vim'
  " Language pack
  Plug 'sheerun/vim-polyglot'
  " Undo history visualizer
  Plug 'mbbill/undotree'
  " Extended commenting powers 
  Plug 'preservim/nerdcommenter'
  " Git wrapper for Vim
  Plug 'tpope/vim-fugitive'
  " Handles surrounding parenteses and tags
  Plug 'tpope/vim-surround'
  " Fancy start screen
  Plug 'mhinz/vim-startify'
  " Go development plugin
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " NodeJs extension for Vim, load extensions such as VSCode and host language
  " servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" Everything after this line will be the config section

" Nvim config
syntax enable
syntax on
set number
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set nowritebackup
set noswapfile
set nobackup
set breakindent
set smartindent
set smartcase
set incsearch
set hidden
set updatetime=250
set noshowmode
let mapleader=" "

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" " Panel splitting
nnoremap <leader>v <c-w>v
nnoremap <leader>s <c-w>s

" " Map yanked to clipboard
vnoremap <C-c> "*y

" " Line moving
" " " Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" " Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Theme config
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme gruvbox

" NERDTree
let g:NERDTreeShowHidden = 1 " Show hidden files in tree
let g:NERDTreeMinimalUI = 1 " Hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " Ignore node modules to increase load speed
let g:NERDTreeStatusLine = '' " Set to empty to use lightline
" toggle
noremap <silent> <C-n> :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NerdTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Fzf plugin configuration
nnoremap <C-p> :Files<CR>
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
	\}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Lightline
let g:lightline = {
  \     'colorscheme': 'seoul256',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" Undotree configuration
set undodir=~/.config/nvim/undodir " set undotree file directory
set undofile " set undotree to save to file

" " Map show undo tree
nnoremap <leader>u :UndotreeShow<CR>

" Nerd Commenter
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings 
" " to bind Ctmd+/ to ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Vim-Go
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" vim-polyglot configuration

" Disable python 2
let g:python_version_2 = 0
" Enable syntax highlighting
let g:python_highlight_all = 1


" Coc configuration

" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>
" Format action on <leader>f
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Goto action
nmap <silent> gd <Plug>(coc-definition)
" Open definition in a split window
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L


