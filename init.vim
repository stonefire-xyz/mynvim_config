"__     _____ __  __ ____   ____ 
"\ \   / /_ _|  \/  |  _ \ / ___|
" \ \ / / | || |\/| | |_) | |    
"  \ V /  | || |  | |  _ <| |___ 
"   \_/  |___|_|  |_|_| \_\\____|
                                
set number
set nohlsearch
set foldenable
syntax on
set cursorline
set showmatch
set wrap 
set wildmenu
set hlsearch
set incsearch
set ignorecase 
set smartcase
set matchtime=1
set scrolloff=5
set showcmd
set clipboard=unnamedplus
set autochdir
set autoindent
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set hidden
 
map K :source $MYVIMRC<CR>
nmap lh ^
nmap le $
let mapleader=' '
nmap  fw :w<CR><esc> 
nmap  ft :wq<CR> 
" Press ` to change case (instead of ~)
noremap ` ~
noremap <LEADER>m :nohlsearch<CR>
noremap Y 5j
noremap T 5k
nmap fg <esc>:q!<CR>
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" Use <space> + new arrow keys for moving the cursor around windows
noremap <leader>w <c-w>w
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l


" Compile function
noremap <leader>g :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
	        silent!	exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc

" === Ultisnips
" ===
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>


filetype plugin on
syntax enable
set background=dark
colorscheme peaksea

call plug#begin()
Plug 'junegunn/fzf'
"from lukesmith
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'maciakl/vim-neatstatus'
Plug 'vim-scripts/peaksea'
Plug 'stonefire-xyz/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'stonefire-xyz/emmet-vim'
Plug 'vim-scripts/peaksea'
Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/vim-peekaboo'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

"comment fast
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
call plug#end()





" ===
" === python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === coc
" ===
" fix the most annoying bug that coc has
silent! au bufenter,bufread,bufnewfile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint', 'coc-lists', 'coc-git', 'coc-explorer', 'coc-pyright', 'coc-sourcekit', 'coc-translator']

let g:multi_cursor_use_default_mapping=0

" default mapping
let g:multi_cursor_start_word_key      = '<C-k>'
let g:multi_cursor_select_all_word_key = '<A-k>'
let g:multi_cursor_start_key           = 'g<C-k>'
let g:multi_cursor_select_all_key      = 'g<A-k>'
let g:multi_cursor_next_key            = '<C-k>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:multi_cursor_exit_from_visual_mode= 0
source ~/.config/nvim/plugset.vim
source ~/.config/nvim/cocset.vim


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

