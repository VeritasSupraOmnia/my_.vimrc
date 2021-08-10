"SETTINGS
	"generic options
	set tabstop=4
	set shiftwidth=4
	set foldmethod=marker
	set splitright
	set lazyredraw
	syntax on
	colorscheme basic

"COMMANDS
	command! Vimrc :vs $MYVIMRC
"BINDS
	"split focus jumping binds
	:nmap <C-h> <C-W>h
	:nmap <C-l> <C-W>l
	:nmap <C-j> <C-W>j
	:nmap <C-k> <C-W>k
	"fast split
	:nmap <F2> :vsplit<Return>
	"fast write
	:nnoremap <C-s> :w<Enter>

	"assembles a single C function to various levels of optimization
	"also cleans output somewhat
	
	"TODO: Assemble the whole file and then reduce to the function level so that no context is lost
	:vmap w y:vnew<CR>pggVG:'<,'>!gcc -xc - -S -masm=intel -o /dev/stdout<CR>gg/:\n<CR>kdggG?.LFE<CR>dGgg/.LFB<CR>dd
	:vmap W1 y:vnew<CR>pggVG:'<,'>!gcc -xc - -S -masm=intel -O1 -o /dev/stdout<CR>gg/:\n<CR>kdggG?.LFE<CR>dGgg/.LFB<CR>dd
	:vmap W2 y:vnew<CR>pggVG:'<,'>!gcc -xc - -S -masm=intel -O2 -o /dev/stdout<CR>gg/:\n<CR>kdggG?.LFE<CR>dGgg/.LFB<CR>dd
	:vmap W3 y:vnew<CR>pggVG:'<,'>!gcc -xc - -S -masm=intel -O3 -o /dev/stdout<CR>gg/:\n<CR>kdggG?.LFE<CR>dGgg/.LFB<CR>dd
	:vmap Wf y:vnew<CR>pggVG:'<,'>!gcc -xc - -S -masm=intel -Ofast -o /dev/stdout<CR>gg/:\n<CR>kdggG?.LFE<CR>dGgg/.LFB<CR>dd
	:vmap Wg y:vnew<CR>pggVG:'<,'>!gcc -xc - -S -masm=intel -g -Og -o /dev/stdout<CR>gg/:\n<CR>kdggG?.LFE<CR>dGgg/.LFB<CR>dd

	"TODO: Make an assembler command (a function) that assembles the whole file and removes gcc assembler junk that doesn't belong, and maybe adds the original comments.
	"This might have to be done in C.
