syntax on

set tabstop=4
set shiftwidth=4
set nocompatible
set number
set ruler
set relativenumber
set conceallevel=1
set backspace=indent,eol,start
set incsearch
set ignorecase
set smartcase
set scrolloff=3
set splitbelow
set splitright
set noshowmode

augroup markdownSpell
	autocmd!
	autocmd FileType markdown setlocal spell spelllang=es
	autocmd BufRead,BufNewFile *.md setlocal spell spelllang=es
augroup END

augroup latexSpell
	autocmd!
	autocmd FileType latex setlocal spell spelllang=es
	autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=es
augroup END

augroup my_colours
  autocmd!
  autocmd ColorScheme solarized hi SpellBad cterm=reverse
augroup END


call plug#begin('~/.vim/plugged')
filetype off

"manejo
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-unimpaired'
"Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'

"sintaxis
Plug 'SirVer/ultisnips'
Plug 'ycm-core/YouCompleteMe'
Plug 'honza/vim-snippets'

"visual
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/everforest'

"codigo
Plug 'lervag/vimtex'
Plug 'jpalardy/vim-slime'
Plug 'hanschen/vim-ipython-cell'
Plug 'FredKSchott/CoVim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

"Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"Debug
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

call plug#end()

"Powerline
set rtp+=/usr/local/lib/python3.8/dist-packages/powerline/bindings/vim
set laststatus=2
"Slime
let g:slime_target = "vimterminal"
"UltiSnipets
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"Latex
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
\}
let g:tex_flavor = 'latex'
let g:vimtex_view_method= 'zathura'
let g:tex_conceal = 'abdmg'
let g:vimtex_view_forward_search_on_start = 0

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_hover = ''

"Vimspector
let g:vimspector_enable_mappings = 'HUMAN'

"ColorSchemes

"solarized
"set background=light
"colorscheme solarized
"let g:solarized_termcolors=''

"Dracula
"colorscheme dracula
"let g:dracula_italic = 0
"let g:dracula_colorterm = 0

"everforest
" Important!!
if has('termguicolors')
		set termguicolors
endif
" For dark version.
set background=dark
"set background=light
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'
colorscheme everforest

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" Toggle NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>

" 
nnoremap <leader>gs :G<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap ]c :execute "normal! /#%%\<lt>cr>" <CR>
nnoremap [c :execute "normal! ?#%%\<lt>cr>" <CR>
vnoremap ac :<C-U>silent! normal ]cmm[cV`m<CR>
omap ac :normal Vac<CR>

" vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" otros
nnoremap <Leader>s :w<CR> 
nnoremap <Leader>t :tabe<CR> 


function! CorregirUltimoError()
        :normal! mm[s1z=`m
endfunction

nnoremap <leader>sp :call CorregirUltimoError()<CR>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


nnoremap <Leader>cc :w <bar> !g++ -g % -o a.out<CR>
nnoremap <Leader>cr :!./a.out<CR>

imap jj <Esc>

nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
