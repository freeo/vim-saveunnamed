if !has('python')
    echo "Error: Require Vim compiled with +python."
    finish
endif

" Set path and suffix for auto save file.
if !exists("g:auto_save_path") 
    if has("win32")
        let g:auto_save_path = expand("~/vimfiles/backup")
    elseif has("unix")
        let g:auto_save_path = expand("~/.vim/backup")
    endif
endif

if !exists("g:auto_save_suffix")
    let g:auto_save_suffix = ".txt"
endif

" Check whether the path exists, create the directory when it doesn't exist.
if !isdirectory(g:auto_save_path)
    silent! call mkdir(g:auto_save_path, "p")
endif


function! GetDatetime()
python << monty
import vim
from datetime import datetime

def GetDatetime():
    # Get current time stamp.
    time = datetime.now().strftime("%Y%m%d %H%M%S")
    vim.command('return "%s"' % time)
GetDatetime()
monty
endfunction

function! Autosave()
  if &ft != 'startify'
    echom(GetDatetime())
    let a:filename = GetDatetime()
    if bufname("%")==''
        " exec 'w /path/note_'.localtime()
        exec 'w '.g:auto_save_path.'/'.a:filename.g:auto_save_suffix
        echom("Autosaved!")
    else
        update
    endif
  endif
endfunction

" if has("autocmd") && len(expand('%:t')) == 0
"
" autocmd BufNewFile * call Autosave(s:auto_save_path, s:auto_save_suffix)
" autocmd BufWritePre * call Autosave(s:auto_save_path, s:auto_save_suffix)
" autocmd BufWriteCmd,BufWritePre,BufLeave,FocusLost * call Autosave(s:auto_save_path, s:auto_save_suffix)
" autocmd BufWriteCmd * call Autosave()

" endif
