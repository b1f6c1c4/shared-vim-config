set nocompatible

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

call pathogen#infect('~/.vim/bundle/{}')

filetype plugin indent on
syntax on

let mapleader = "\<Space>"
set laststatus=2

set encoding=utf-8

let g:airline_theme='sol'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_detect_iminsert=1
let g:airline_inactive_collapse=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

set backspace=indent,eol,start

if has("vms")
	set nobackup	  " do not keep a backup file, use versions instead
else
	set backup		  " keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" inoremap <C-U> <C-G>u<C-U>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\	exe "normal! g`\"" |
					\ endif

	augroup END

else

	set autoindent		  " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

source $VIMRUNTIME/vimrc_example.vim

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set undofile

nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

set foldenable
set foldmethod=syntax
set foldlevelstart=10
set foldnestmax=15

set fileencodings=ucs-bom,utf-8,utf-16,cp936,gbk,big5,gb18030,latin1

autocmd BufNewFile,BufRead *.v,*.sv set shiftwidth=3
autocmd BufNewFile,BufRead *.v,*.sv set tabstop=3
autocmd BufNewFile,BufRead *.v,*.sv set softtabstop=3
autocmd BufNewFile,BufRead *.js set shiftwidth=2
autocmd BufNewFile,BufRead *.yml set shiftwidth=2
autocmd BufNewFile,BufRead .babelrc set filetype=json5

autocmd BufNewFile,BufRead *.txt set noexpandtab
autocmd BufNewFile,BufRead *.go set noexpandtab

augroup YourGroup
	autocmd!
	autocmd User ALELintPre echo 'ALELintPre'
	autocmd User ALELintPost echo 'ALELintPost'
augroup END

set hidden
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\vnode_modules|build|coverage',
            \ 'file': '\v\~$|\.swp$',
            \ }
let g:tex_flavor = 'latex'
let g:jsx_ext_required = 0

let g:ale_linters = {
\    'python': ['pylint'],
\    'javascript': ['eslint'],
\}
let g:ale_sign_column_always = 0
let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:wordmotion_prefix = '<Leader>'

let g:editorconfig_core_mode = 'python_builtin'

let g:EasyClipShareYanks = 1
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs <plug>XEasyClipPaste

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command WQa wqa
:command Wqa wqa
:command Wa wa
:command Qa qa

set autowrite

nmap <F9> vi]JJkJ%%hhx
nmap <F10> vi}JJkJ%%hhx
nmap <F11> vi]mi<CR><ESC>:let @z = substitute(@", ',\s*', ',\n', 'g')<CR>:let @z = substitute(@z, ' $', '', 'g') . ','<CR>:put! z<CR>vi]=
nmap <F12> vi}mi<CR><ESC>:let @z = substitute(@", ',\s*', ',\n', 'g')<CR>:let @z = substitute(@z, ' $', '', 'g') . ','<CR>:put! z<CR>vi}=

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

color ir_black
colorscheme ir_black
let g:airline_theme='light'
