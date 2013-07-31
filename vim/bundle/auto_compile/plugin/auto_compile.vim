"=====================================================================
" File:			auto_compile.vim
" Description:	vim global plugin that support auto make
" Maintainer:	Dianchun Huang <simpleotter23@gmail.com>
" Last Change:	27 July, 2013
"=====================================================================

if exists("loaded_auto_compile")
	finish
endif

if !has( 'python' )
	echohl WarningMsg |
				\ echoerr "auto_compile unavailable: requires python 2.x" |
				\echohl None
	finish
endif

let s:running_windows = has('win16') || has('win32') || has('win64')
if s:running_windows
	echoerr "Sorry, We don't support windows yet."
endif

let loaded_auto_compile = 1
let g:AutoCompileMaxDepth = 3

" Funtion: AutoCompile() function {{{2
" This function is used to call :make command if it find the build
" directory in current work directory or parent directory
function! AutoCompile()
" Python code section
python << EOF

import os
import re
import vim

def findMakefile(dir, depth = 0):
	"""Find Makefile in specified directory
	:dir: The directory where looking for
	:depth: The depth of parent directory
	:returns: True when found, otherwise False
	"""
	found_path = ''
	max_depth = vim.eval("g:AutoCompileMaxDepth")
	find_file = re.compile(r'^Makefile$')
	find_walk = os.walk(dir)
	for path, dirs, files in find_walk:
		for file in files:
			if find_file.search(file):
				return path

	if depth < int(max_depth):
		found_path = findMakefile(dir + '../', depth + 1)

	return found_path

try:
	found_path = findMakefile('./')
	if len(found_path) > 0:
		print 'We found a Makefile ', found_path
		cmd = "! cd %s; make" % found_path
		vim.command(cmd)
	else:
		vim.command("echoerr \'No Makefile has been found!\'")
except Exception, e:
	print e
EOF
" End of Python code section
endfunction

map <F5> :call AutoCompile()<CR>
imap <F5> :call AutoCompile()<CR>
vmap <F5> :call AutoCompile()<CR>
