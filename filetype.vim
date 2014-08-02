if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect

    " File type detection for the GNU Assembler
    au! BufRead,BufNewFile *.s setfiletype gas

    " File type detection for NSIS
    au! BufRead,BufNewFile *.nsh setfiletype nsis

    " File type detection for Asciidoc
    au! BufRead,BufNewFile *.ad,*.adoc,*.asciidoc setfiletype asciidoc

augroup END

