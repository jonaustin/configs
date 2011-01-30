" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell syntax=vim:
"
" }

" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
	runtime! autoload/pathogen.vim
	silent! call pathogen#runtime_append_all_bundles()
	silent! call pathogen#helptags()
" }

" Basics {
	set nocompatible 		" must be first line
	set background=dark     " Assume a dark background
	:let mapleader = ","
" }
 
" General {
  runtime! macros/matchit.vim
	filetype plugin indent on  	" Automatically detect file types.
	syntax on 					        " syntax highlighting
	set mouse=					        " disable mouse..add =a to enable
	set autochdir 				      " always switch to the current file directory.. 
	" not every vim is compiled with this, use the following line instead
     "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
	scriptencoding utf-8
	set autowrite
	set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
	" set spell 		 	     	" spell checking on
	
	" Setting up the directories {
		set backup 						" backups are nice ...
		set backupdir=$HOME/.vimbackup  " but not when they clog .
		set directory=$HOME/.vimswap 	" Same for swap files
		set viewdir=$HOME/.vimviews 	" same but for view files
		
		" Creating directories if they don't exist
		silent execute '!mkdir -p $HOME/.vimbackup'
		silent execute '!mkdir -p $HOME/.vimswap'
		silent execute '!mkdir -p $HOME/.vimviews'
    " note these two below were causing rails.vim to not be able to find files
    " in 'path' so replaced with the autocmd
		"au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		"au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif
	" }
" }

" Vim UI {
	color zenburn_jon     	       		" load a colorscheme
    " stop shoddy gvim only-aware colorschemes from screwing up the cursorline
  highlight CursorLine cterm=NONE cterm=235

	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	set cursorline  				" highlight current line
	hi cursorline guibg=#333333 	" highlight bg color of current line
	hi CursorColumn guibg=#333333   " highlight cursor

	if has('cmdline_info')
		set ruler                  	" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd                	" show partial commands in status line and
									" selected characters/lines in visual mode
	endif

	if has('statusline')
		set laststatus=1           	" show statusline only if there are > 1 windows
		" Use the commented line if fugitive isn't installed
      "set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
		set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
	endif

	set backspace=indent,eol,start 	" backspace for dummys
	set linespace=0 				" No extra spaces between rows
	set nu 							" Line numbers on
	set showmatch                  	" show matching brackets/parenthesis
	set incsearch 					" find as you type search
	set hlsearch 					" highlight search terms
	set winminheight=0 				" windows can be 0 line high 
	set ignorecase 					" case insensitive search
	set smartcase 					" become temporarilly case sensitive when any uppercase letters present in search string
	set wildmenu 					" show list instead of just completing
	set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
	set foldenable  				" auto fold code
	set gdefault					" the /g flag on :s substitutions by default

" }

" Formatting {
	set wrap                      	   " wrap long lines
	set autoindent                 	   " indent at the same level of the previous line
	set shiftwidth=2               	   " use indents of 2 spaces
	set expandtab 	       	  	       " tabs should be spaces for sanity
	set tabstop=2 					           " an indentation every 2 columns
  set matchpairs+=<:>               " match, to be used with % 
	set pastetoggle=<F10>          	   " pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/    " auto format comment blocks
  set encoding=utf-8                 " no junk chars
" }

" Key Mappings {

	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_  
	"map <S-C-j> <C-W>j :res 35<cr>
	map <C-K> <C-W>k<C-W>_
	"map <S-C-k> <C-W>k :res 35<cr>
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <S-H> gT
	map <S-L> gt

	" shift key fixes
	"cmap W w 						
	"cmap WQ wq
	"cmap wQ wq
	"cmap Q q
	"cmap Tabe tabe

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	" Shortcuts
	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h

	" remap jj to escape
	inoremap jj <ESC>

  " split windows
  noremap <leader>o :only<cr>
  noremap <leader>O :only<cr>:tabonly<cr>

  " buffers
    " i.e buffer next
  :noremap <leader>bn :bn<cr>
    " i.e buffer prev
  :noremap <leader>bp :bp<cr>

	" NERDTree
	map <S-w> :NERDTreeToggle<cr>

	" TagList
	map <S-t> :TlistToggle<cr>

	" Conque Bash
	map <leader>bb :ConqueTerm bash<cr>
	map <leader>bsp :ConqueTermSplit bash<cr>

  " quit!
  map <leader>qq :q!<cr>
  map <leader>qqa :qall!<cr>

" }

" Plugins {

	" VCSCommand {
	"	let b:VCSCommandMapPrefix=',v'
	"	let b:VCSCommandVCSType='git'
		""let mapleader = "-"
	" } 
	
	" PIV {
		let g:DisableAutoPHPFolding = 0
	" }
	
	" Supertab {
		"let g:SuperTabDefaultCompletionType = "context"
		let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
	" }

	" Misc { 
		":map <C-F10> <Esc>:vsp<CR>:VTree<CR>
		" map Control + F10 to Vtree

		let g:checksyntax_auto = 1

		"comment out line(s) in visual mode
		vmap  o  :call NERDComment(1, 'toggle')<CR>
		let g:NERDShutUp=1

		let b:match_ignorecase = 1
	" }

	" ShowMarks {
		let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		" Don't leave on by default, use :ShowMarksOn to enable
		let g:showmarks_enable = 0
		" For marks a-z
		highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
		" For marks A-Z
		highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
		" For all other marks
		highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
		" For multiple marks on the same line.
		highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
	" }
	
	" OmniComplete {
		"if has("autocmd") && exists("+omnifunc")
			"autocmd Filetype *
				"\if &omnifunc == "" |
				"\setlocal omnifunc=syntaxcomplete#Complete |
				"\endif
		"endif

		" Popup menu hightLight Group
		"highlight Pmenu 	ctermbg=13 	guibg=DarkBlue
		highlight PmenuSel 	ctermbg=7 	guibg=DarkBlue 		guifg=LightBlue
		"highlight PmenuSbar ctermbg=7 	guibg=DarkGray
		"highlight PmenuThumb 			guibg=Black

		hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
		hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
		hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

		" some convenient mappings 
" commented as this was causing pumvisible()... to show up every time enter is hit..
		"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
		"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
		"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
		"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
		"inoremap <expr> <C-d> 	   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
		"inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

		" automatically open and close the popup menu / preview window
		au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
		set completeopt=menu,longest,preview
	" }
	
	" Ctags {
		set tags=./tags;/	
	" }

	" Delimitmate {
		au FileType * let b:delimitMate_autoclose = 1

		" If using html auto complete (complete closing tag)
        au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
	" }
	
	" AutoCloseTag {
		" Make it so AutoCloseTag works for xml and xhtml files as well
		au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
	" }

	" SnipMate {
		" Setting the author var
		let g:snips_author = 'Jon Austin <jon.i.austin@gmail.com>'
		" Shortcut for reloading snippets, useful when developing
		nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
	" }

	" dbext {
		let g:dbext_default_SQLITE_bin='sqlite3'
	" }

" GUI Settings {
	" GVIM- (here instead of .gvimrc)
	if has('gui_running')
		set guioptions-=T          	" remove the toolbar
		set lines=40               	" 40 lines of text instead of 24,
	endif
" }

" Windows Compatible {
	" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
	" across (heterogeneous) systems easier. 
	if has('win32') || has('win64')
	  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
	endif
" }

" Ack {
  map <leader>a :Ack<space>
"}

" }

" Various {
	if has("autocmd")
	  " Restore cursor position (initially for IRB<->Vim integration, if obnoxious for other things, put in ftdetect or somesuch)
	  autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
	endif	
" }

" Testing {
  set scrolloff=999 " causes current line to always be vertically centered
" }

" File Types {
"" Filetype detection
augroup filetypedetect
    "" Detect .txt as 'text'
    autocmd! BufNewFile,BufRead *.txt setfiletype text
    "" cakephp
    autocmd! BufNewFile,BufRead *.thtml setfiletype php
    autocmd! BufNewFile,BufRead *.ctp setfiletype php
    autocmd! BufNewFile,BufRead *.scss setfiletype sass
    autocmd! BufReadCmd   *.epub      call zip#Browse(expand("<amatch>"))
augroup END

" }
" Languages {
" Ruby
nmap <leader>rci :%!ruby-code-indenter<cr> 
"}

