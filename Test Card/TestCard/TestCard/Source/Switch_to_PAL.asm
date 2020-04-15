                                    ;Assembler source to switch video
                                    ;to PAL format.
                                    ;Compiled under ~DevPac3~.
      move.w   #32,$dff1dc          ;Set hardware to PAL mode.
      move.l   #0,d0                ;Set return code as OK.
      rts                           ;Exit program.
