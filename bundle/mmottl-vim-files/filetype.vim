if exists("did_load_filetypes")
 finish
endif

augroup markdown
  au BufRead,BufNewFile *.md setfiletype markdown
augroup END

augroup omake
  au BufRead,BufNewFile OMakefile,OMakeroot setfiletype omake
augroup END
