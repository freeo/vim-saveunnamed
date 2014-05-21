vim-saveunnamed
===============

Adds a function to save a new, unnamed buffer to a default location.

*Best practice*: Bind the function Autosave() to be executed right before
`:bnext` and `:bprevious` , i.e.  switching away from the unnamed buffer.  
    ```VimL
    nnoremap <C-TAB> :call Autosave()<CR><bar>:bnext<CR>
    nnoremap <C-S-TAB> :call Autosave()<CR><bar>:bprevious<CR>
    ```

The automatic filename has the following structure:  
```
      yyyymmdd hhmmss.txt
 f.e. 20140510 145317.txt
```

*Default directories*:  
Win32: `g:auto_save_path = ~/vimfiles/backup`
Unix: `g:auto_save_path = ~/.vim/backup`

Requires *python 2*!
