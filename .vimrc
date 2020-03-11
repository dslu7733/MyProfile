set nocompatible	      " be iMproved, required 
filetype off                  " required  

" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/vundle
call vundle#begin() 
" alternatively, pass a path where Vundle should install plugins 
"call vundle#begin('~/some/path/here')  

" let Vundle manage Vundle, required 
Plugin 'VundleVim/Vundle.vim'

"Plugin 'bling/vim-airline'
"set laststatus=2

Plugin 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
"当NERDTree为剩下的唯一窗口时自动关闭 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_start_word_key      = '<C-n>'     
let g:multi_cursor_select_all_word_key = '<A-n>'     
let g:multi_cursor_start_key           = 'g<C-n>'     
let g:multi_cursor_select_all_key      = 'g<A-n>'     
let g:multi_cursor_next_key            = '<C-n>'     
let g:multi_cursor_prev_key            = '<C-p>'     
let g:multi_cursor_skip_key            = '<C-x>'     
let g:multi_cursor_quit_key            = '<Esc>'


Plugin 'tpope/vim-surround'


Plugin 'tpope/vim-commentary'


Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'


" All of your Plugins must be added before the following line 
call vundle#end()            " required 
filetype plugin indent on    " required 

" To ignore plugin indent changes, instead use: 
"filetype plugin on 
"
" Brief help 
" :PluginList       - lists configured plugins 
" :PluginInstall    - installs plugins; append `!` to update or just 
" :PluginUpdate " :PluginSearch foo - searches for foo; append `!` to refresh local cache 
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal 
"
" see :h vundle for more details or wiki for FAQ 
" Put your non-Plugin stuff after this line


"set scrolloff=999
set mouse=a
set hidden

autocmd BufWritePost * call system("ctags -R")
:nnoremap <F5>  :!ctags -R<CR>

let Tlist_Show_One_File=1		" 不同时显示多个文件的tag，只显示当前文件的
let Tlsit_Exit_OnlyWindow=1		" 如果taglist是最后一个窗口，则退出vim


" Convert certain unicode characters to ASCII equivalents in range " from

function! ToAscii(firstLine, lastLine)
   	let prefix = "silent " . a:firstLine . "," . a:lastLine . "s"      
	" Spaces of non-zero width.     
	execute prefix . '/[\u2000-\u200a\u202f]/ /ge'      " Zero-width spaces and joiners.     
	execute prefix . '/[\u200b-\u200d]//ge'      " "M" dash converts to a double-dash.     
	execute prefix . '/[\u2014]/--/ge'      " Remaining hyphens and short dashes.     
	execute prefix . '/[\u2010-\u2015\u2027]/-/ge'      " Apostrophes.     
	execute prefix . '/[\u2018-\u201b]/' . "'" . '/ge'      " Double-quotes.     
	execute prefix . '/[\u201c-\u201f]/"/ge'      " Bullets.     
	execute prefix . '/[\u2022-\u2023\u204c\u204d]/-/ge'      " One-dot leader.     
	execute prefix . '/[\u2024]/./ge'      " Two-dot leader.     
	execute prefix . '/[\u2025]/../ge'      " Ellipsis.     
	execute prefix . '/[\u2026]/.../ge'      " Prime.     
	execute prefix . '/[\u2032]/' . "'" . '/ge'      " Double-prime.     
	execute prefix . '/[\u2033]/' . "''" . '/ge'      " Triple-prime.     
	execute prefix . '/[\u2034]/' . "'''" . '/ge'      " Reversed Prime.     
	execute prefix . '/[\u2035]/`/ge'      " Reversed double-prime.     
	execute prefix . '/[\u2036]/``/ge'      " Reversed triple-prime.     
	execute prefix . '/[\u2037]/```/ge'      " Caret     
	execute prefix . '/[\u2038]/^/ge'      " Left angle quotation mark.     
	execute prefix . '/[\u2039]/</ge'      " Right angle quotation mark.     
	execute prefix . '/[\u203a]/>/ge'      " Double exclamation mark.     
	execute prefix . '/[\u203c]/!!/ge'  
	
endfunction  " Convert certain unicode characters to ASCII equivalents. 
command! -range=% ToAscii  call ToAscii(<line1>, <line2>)




"quickly run
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec '!gcc % -o %<'
		exec '! ./%<'
	elseif &filetype == 'cpp'
		exec '!g++ % -o %<' 
		exec '! ./%<'
	elseif &filetype == 'python'
		exec '! python %' 
	elseif &filetype == 'sh'
		:! bash %
	endif
endfunc












