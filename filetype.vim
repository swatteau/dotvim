if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect

    " File type detection for the GNU Assembler
    au! BufRead,BufNewFile *.s setfiletype gas

    " File type detection for OpenGL Shading Language
    au! BufRead,BufNewFile *.frag,*.fp setfiletype glsl
    au! BufRead,BufNewFile *.vert,*.vp setfiletype glsl
    au! BufRead,BufNewFile *.glsl      setfiletype glsl

    " File type detection for NSIS
    au! BufRead,BufNewFile *.nsh setfiletype nsis

augroup END

