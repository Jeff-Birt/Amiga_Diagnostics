                                    ;Assembler source to switch video
                                    ;to NTSC format.
                                    ;Compiled under ~DevPac3~.
      move.w   #0,$dff1dc           ;Set hardware to NTSC mode.
      move.l   #0,d0                ;Set return code as OK.
      rts                           ;Exit program.
