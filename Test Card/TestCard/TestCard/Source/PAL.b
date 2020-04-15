REM Original Copyright, (C)2002 Barry Walker, G0LCU.
REM Compiled under ~ACE Basic Compiler~, (C) David Benn.
REM Set up screen for the testcard.
  SCREEN 1,640,256,4,2
  WINDOW 1,,(0,0)-(640,256),32,1


REM Set up the correct colors and check for any errors.
setup:
  FONT "topaz.font",8
  GOSUB clear_palette16:
  CLS
  GOSUB set_palette:

REM Set up variables.
  LET a$="(C) B.Walker, (G0LCU)."
  LET h=0
  LET n=0
  LET x=0
  LET y=0

REM Set up credits and run program proper.
  COLOR 2,0
  LOCATE 4,33
  PRINT "***  WARNING!  ***"
  COLOR 9,0
  LOCATE 6,9
  PRINT "Lethal voltages exist inside colour television sets and monitors."
  LOCATE 7,9
  PRINT "Any repairs or alterations must be  done by a qualified engineer."
  LOCATE 8,9
  PRINT "This version is for  PAL televisions  and monitors  only with UHF"
  LOCATE 9,9
  PRINT "CVBS or SCART RGB analogue inputs.It is assumed that a manual for"
  LOCATE 10,9
  PRINT "the television or monitor under test is available. Happy testing."
  LOCATE 12,9
  PRINT "This  program is freeware along with a standard ~IBM~ PC version."
  LOCATE 13,9
  PRINT "It is assumed that all the computer hardware is working properly."
  LOCATE 19,35
  PRINT "(C) B.WALKER."
  LOCATE 20,32
  PRINT "70 KING GEORGE ROAD."
  LOCATE 21,35
  PRINT "LOUGHBOROUGH."
  LOCATE 22,34
  PRINT "LEICESTERSHIRE."
  LOCATE 23,37
  PRINT "LE11 2PA."
  LOCATE 26,22
  PRINT "Press the SPACE bar to exit any screen."
  LOCATE 28,25
  PRINT "Press the ENTER key to continue:-"
warning_flash:
  COLOR 2,0
  LOCATE 4,33
  PRINT "***  WARNING!  ***"
  SLEEP FOR 0.5
  LET a$=INKEY$
  IF a$=CHR$(13) THEN GOTO clearstart:
  COLOR 0,0
  LOCATE 4,33
  PRINT "(C) B.WALKER G0LCU"
  SLEEP FOR 0.5
  LET a$=INKEY$
  IF a$=CHR$(13) THEN GOTO clearstart:
  GOTO warning_flash:
clearstart:
  COLOR 0,0
  CLS
  GOTO testcard:

REM This is the startup box.
start:
  GOSUB clear_palette16:
  CLS
  GOSUB set_palette:
  COLOR 7,0
  LOCATE 5,7
  PRINT "TESTCARD GENERATOR BY B.WALKER, FOR ALL PAL TELEVISIONS AND MONITORS."
  LOCATE 9,25
  PRINT "Press the highlighted character."
  LOCATE 11,25
  PRINT "W";
  COLOR 11,0
  PRINT "hite raster check."
  LOCATE 12,25
  COLOR 7,0
  PRINT "P";
  COLOR 11,0
  PRINT "urity check."
  LOCATE 13,25
  COLOR 7,0
  PRINT "S";
  COLOR 11,0
  PRINT "tatic convergence."
  LOCATE 14,25
  COLOR 7,0
  PRINT "D";
  COLOR 11,0
  PRINT "ynamic convergence."
  LOCATE 15,25
  COLOR 7,0
  PRINT "F";
  COLOR 11,0
  PRINT "ocus dots."
  LOCATE 16,25
  COLOR 7,0
  PRINT "B";
  COLOR 11,0
  PRINT "eam limiter and sync check."
  LOCATE 17,25
  COLOR 7,0
  PRINT "V";
  COLOR 11,0
  PRINT "ertical sync check."
  LOCATE 18,25
  COLOR 7,0
  PRINT "H";
  COLOR 11,0
  PRINT "orizontal sync check."
  LOCATE 19,25
  COLOR 7,0
  PRINT "I";
  COLOR 11,0
  PRINT "nterference test."
  LOCATE 20,25
  COLOR 7,0
  PRINT "G";
  COLOR 11,0
  PRINT "ratings for frequency response."
  LOCATE 21,25
  COLOR 7,0
  PRINT "C";
  COLOR 11,0
  PRINT "olour bar test."
  LOCATE 22,25
  COLOR 7,0
  PRINT "L";
  COLOR 11,0
  PRINT "evels of grey.
  LOCATE 23,25
  COLOR 7,0
  PRINT "T";
  COLOR 11,0
  PRINT "estcard."
  LOCATE 24,25
  COLOR 7,0
  PRINT "A";
  COLOR 11,0
  PRINT "udio test screen."
  LOCATE 26,25
  COLOR 7,0
  PRINT "Q";
  COLOR 11,0
  PRINT "uit."
  COLOR 7,0
  LINE (20,20)-(619,20),7
  LINE (618,20)-(618,235),7
  LINE (619,20)-(619,235),7
  LINE (619,235)-(20,235),7
  LINE (21,235)-(21,20),7
  LINE (20,235)-(20,20),7
  GOTO main_loop:


audio_screen:
  COLOR 0,0
  FOR n=11 TO 24
  LOCATE n,24
  PRINT "                                    "
  NEXT n
  LOCATE 11,25
  COLOR 11,0
  PRINT "For stereo checks only:-"
  LOCATE 12,25
  COLOR 7,0
  PRINT "1";
  COLOR 11,0
  PRINT " Left 400 Hz. Right 1000 Hz."
  LOCATE 13,25
  COLOR 7,0
  PRINT "2";
  COLOR 11,0
  PRINT " Left 1000 Hz. Right 400 Hz."
  LOCATE 14,25
  COLOR 7
  PRINT "3";
  COLOR 11,0
  PRINT " Left and Right 1000 Hz."
  LOCATE 15,25
  COLOR 7,0
  PRINT "4";
  COLOR 11,0
  PRINT " Left and Right 400 Hz."
  LOCATE 17,25
  PRINT "For mono checks only:-"
  LOCATE 18,25
  COLOR 7,0
  PRINT "5";
  COLOR 11,0
  PRINT " 1000 Hz."
  LOCATE 19,25
  COLOR 7,0
  PRINT "6";
  COLOR 11,0
  PRINT " 400 Hz."
  LOCATE 24,25
  COLOR 7,0
  PRINT "V";
  COLOR 11,0
  PRINT "ideo test screen."
  GOTO audio_loop:

REM This is the main control loop.
main_loop:
  LET a$=INKEY$
  IF a$="p" THEN GOTO purity_adjustment:
  IF a$="P" THEN GOTO purity_adjustment:
  IF a$="w" THEN GOTO white_raster:
  IF a$="W" THEN GOTO white_raster:
  IF a$="d" THEN GOTO crosshatch:
  IF a$="D" THEN GOTO crosshatch:
  IF a$="s" THEN GOTO static_convergence:
  IF a$="S" THEN GOTO static_convergence:
  IF a$="f" THEN GOTO focus_dots:
  IF a$="F" THEN GOTO focus_dots:
  IF a$="b" THEN GOTO beam_limiter:
  IF a$="B" THEN GOTO beam_limiter:
  IF a$="v" THEN GOTO vertical_sync:
  IF a$="V" THEN GOTO vertical_sync:
  IF a$="h" THEN GOTO horiz_sync:
  IF a$="H" THEN GOTO horiz_sync:
  IF a$="i" THEN GOTO interference:
  IF a$="I" THEN GOTO interference:
  IF a$="g" THEN GOTO freq_response:
  IF a$="G" THEN GOTO freq_response:
  IF a$="c" THEN GOTO colour_bar:
  IF a$="C" THEN GOTO colour_bar:
  If a$="t" THEN GOTO testcard:
  IF a$="T" THEN GOTO testcard:
  IF a$="a" THEN GOTO audio_screen:
  IF a$="A" THEN GOTO audio_screen:
  IF a$="l" THEN GOTO greyscale:
  IF a$="L" THEN GOTO greyscale:
  IF a$="q" THEN GOTO finish:
  IF a$="Q" THEN GOTO finish:
  GOTO main_loop:

audio_loop:
  LET a$=INKEY$
  IF a$="1" THEN GOTO sound_setup1:
  IF a$="2" THEN GOTO sound_setup2:
  IF a$="3" THEN GOTO sound_setup3:
  IF a$="4" THEN GOTO sound_setup4:
  IF a$="5" THEN GOTO sound_setup3:
  IF a$="6" THEN GOTO sound_setup4:
  IF a$="v" THEN GOTO start:
  IF a$="V" THEN GOTO start:
  IF a$="q" THEN GOTO finish:
  IF a$="Q" THEN GOTO finish:
  GOTO audio_loop:

sound_setup1:
ASSEM
   move.w   #554,d0
   move.w   d0,sine_one
   move.w   #222,d0
   move.w   d0,sine_two
   even
END ASSEM
GOTO audio_generator:

sound_setup2:
ASSEM
   move.w   #222,d0
   move.w   d0,sine_one
   move.w   #554,d0
   move.w   d0,sine_two
   even
END ASSEM
GOTO audio_generator:

sound_setup3:
ASSEM
   move.w   #222,d0
   move.w   d0,sine_one
   move.w   d0,sine_two
   even
END ASSEM
GOTO audio_generator:

sound_setup4:
ASSEM
   move.w   #554,d0
   move.w   d0,sine_one
   move.w   d0,sine_two
   even
END ASSEM

audio_generator:
ASSEM
   movea.l  $4,a6
   moveq #16,d0
   moveq #2,d1
   jsr   -198(a6)
   beq   error_exit

   move.l   d0,a0
   lea.l audio_data_start,a1
   moveq #15,d1

Loop:
   move.b   (a1)+,(a0)+
   dbf   d1,Loop

   lea   $dff000,A5
   move.w   #$000f,$96(a5)
   move.l   d0,$a0(a5)
   move.w   #8,$a4(a5)
   move.w   #32,$a8(a5)
   move.w   sine_one,$a6(a5)
   move.w   #$00ff,$9e(a5)
   move.l   d0,$b0(a5)
   move.w   #8,$b4(a5)
   move.w   #32,$b8(a5)
   move.w   sine_two,$b6(a5)
   move.w   #$00ff,$9e(a5)

   move.w   #$8203,$96(a5)

error_exit:
   clr.l d0
   bra   audio_out

audio_data_start:
   dc.b  0,49
   dc.b  90,117
   dc.b  127,117
   dc.b  90,49
   dc.b  0,-49
   dc.b  -90,-117
   dc.b  -127,-117
   dc.b  -90,-49
sine_one:
   dc.b  "G0"
sine_two:
   dc.b  "LC"
   dc.b  "U."
audio_out:
   nop
   even
END ASSEM
GOTO testcard:

audio_off:
ASSEM
   lea   $dff000,a5
   move.w   #$0003,$96(a5)
   even
END ASSEM
GOTO start:


REM This is the purity adjustment routine.
purity_adjustment:
  COLOR 0,0
  CLS
  PALETTE 0,1,0,0
  PALETTE 1,1,0,0
  COLOR 0,0
  CLS
  GOSUB key_hold:
  PALETTE 0,0,1,0
  PALETTE 1,0,1,0
  COLOR 0,0
  CLS
  GOSUB key_hold:
  PALETTE 0,0,0,1
  PALETTE 1,0,0,1
  COLOR 0,0
  CLS
  GOSUB key_hold:
  PALETTE 0,0,0,0
  PALETTE 1,0,0,0
  CLS
  GOTO start:


REM This is the bright white raster EHT regulation check.
white_raster:
  COLOR 0,0
  CLS
  COLOR 10,10
  CLS
  GOSUB key_hold:
  COLOR 9,9
  CLS
  GOSUB key_hold:
  COLOR 7,7
  CLS
  GOSUB key_hold:
  COLOR 0,0
  CLS
  GOTO start:


REM This is the crosshatch routine.
crosshatch:
  COLOR 7,0
  CLS
  FOR n=0 TO 576 STEP 64
  LINE (n,0)-(n,255),7
  LINE ((n+1),0)-((n+1),255),7
  NEXT n
  LINE (638,0)-(638,255),7
  LINE (639,0)-(639,255),7
  FOR n=0 TO 224 STEP 32
  LINE (0,n)-(639,n),7
  NEXT n
  LINE (0,255)-(639,255),7
  GOSUB key_hold:
  CLS
  GOTO start:


REM The static convergence centre cross.
static_convergence:
  COLOR 7,0
  CLS
  LINE (300,127)-(340,127),7
  LINE (320,118)-(320,138),7
  LINE (319,118)-(319,138),7
  GOSUB key_hold:
  CLS
  GOTO start:


REM This is the focus test routine.
focus_dots:
  COLOR 7,0
  CLS
  FOR y=0 TO 250 STEP 10
  FOR x=0 TO 620 STEP 20
  PSET (x,y),7
  PSET ((x+1),y),7
  PSET (x,(y+1)),7
  PSET ((x+1),(y+1)),7
  NEXT x
  PSET (638,y),7
  PSET (639,y),7
  PSET (638,(y+1)),7
  PSET (639,(y+1)),7
  NEXT y
  GOSUB key_hold:
  CLS
  GOTO start:


REM This checkerboard routine checks beam limiter and sync pulling.
beam_limiter:
  COLOR 7,0
  CLS
  FOR y=0 TO 240 STEP 16
  FOR h=0 TO 608 STEP 32
  FOR x=0 TO 15
  LINE ((x+h),y)-((x+h),(y+7)),7
  LINE ((x+16+h),(y+8))-((x+16+h),(y+15)),7
  NEXT x
  NEXT h
  NEXT y
  GOSUB key_hold:
  CLS
  GOTO start:


REM Vertical sync test and LF test.
vertical_sync:
  COLOR 7,0
  CLS
  LINE (0,63)-(639,63),7
  FOR y=127 TO 255
  LINE (0,y)-(639,y),7
  NEXT y
  GOSUB key_hold:
  CLS
  GOTO start:


REM Horizontal sync and vertical striation test and MF test.
horiz_sync:
  COLOR 7,0
  CLS
  FOR y=0 TO 255
  LINE (0,y)-(3,y),7
  LINE (320,y)-(639,y),7
  NEXT y
  GOSUB key_hold:
  CLS
  GOTO start:


REM Interference gratings to check colour modulation.
interference:
  COLOR 7,0
  CLS
  FOR x=0 TO 636 STEP 4
  LINE (x,0)-(x,255),7
  LINE ((x+1),0)-((x+1),255),7
  NEXT x
  GOSUB key_hold:
  CLS
  FOR x=0 TO 638 STEP 2
  LINE (x,0)-(x,255),7
  NEXT x
  GOSUB key_hold:
  CLS
  GOTO start:


REM Frequency gratings to check bandwidth.
freq_response:
  COLOR 7,0
  CLS
  FOR h=0 TO 608 STEP 32
  FOR x=0 TO 15
  LINE ((x+h),0)-((x+h),50),7
  NEXT x
  NEXT h
  FOR h=0 TO 624 STEP 16
  FOR x=0 TO 7
  LINE ((x+h),51)-((x+h),100),7
  NEXT x
  NEXT h
  FOR h=0 TO 632 STEP 8
  FOR x=0 TO 3
  LINE ((x+h),101)-((x+h),150),7
  NEXT x
  NEXT h
  FOR h=0 TO 636 STEP 4
  FOR x=0 to 1
  LINE ((x+h),151)-((x+h),200),7
  NEXT x
  NEXT h
  FOR h=0 TO 638 STEP 2
  LINE (h,201)-(h,255),7
  NEXT h
  GOSUB key_hold:
  CLS
  GOTO start:


REM Greyscale test.
greyscale:
  COLOR 0,0
  CLS
  GOSUB set_palette_greyscale:
  FOR x=0 TO 79
  LINE (x,0)-(x,255),0
  LINE ((x+80),0)-((x+80),255),2
  LINE ((x+160),0)-((x+160),255),4
  LINE ((x+240),0)-((x+240),255),6
  LINE ((x+320),0)-((x+320),255),8
  LINE ((x+400),0)-((x+400),255),10
  LINE ((x+480),0)-((x+480),255),12
  LINE ((x+560),0)-((x+560),255),14
  NEXT x
  GOSUB key_hold:
  CLS
  GOTO start:


REM Colour bar flaring test.
colour_bar:
  COLOR 0,0
  CLS
  FOR x=0 TO 79
  LINE (x,0)-(x,255),7
  LINE ((x+80),0)-((x+80),255),6
  LINE ((x+160),0)-((x+160),255),5
  LINE ((x+240),0)-((x+240),255),3
  LINE ((x+320),0)-((x+320),255),4
  LINE ((x+400),0)-((x+400),255),2
  LINE ((x+480),0)-((x+480),255),8
  LINE ((x+560),0)-((x+560),255),1
  NEXT x
  GOSUB key_hold:
  CLS
  GOTO start:


REM Main testcard for basic setup.
testcard:
  GOSUB clear_palette16:
  CLS
  IFF OPEN #1,"640x256x16"
  IF ERR<>0 THEN GOTO errorexit:
  IFF READ #1,1
  GOSUB set_palette16:
  GOSUB key_hold:
errorexit:
  IFF CLOSE #1
  GOSUB clear_palette16:
  CLS
  GOSUB set_palette:
  GOTO audio_off:


REM Press a key at any stage to continue.
key_hold:
  LET a$=INKEY$
  IF a$=" " THEN GOTO exit_key_hold:
  GOTO key_hold:
exit_key_hold:
  RETURN


REM Set or clear all of the OCS palette registers.
clear_palette16:
  FOR n=0 TO 15
  PALETTE n,0,0,0
  NEXT n
  RETURN
set_palette16:
  PALETTE 1,0,0,0.66
  PALETTE 2,0,0.66,0
  PALETTE 3,0,0.66,0.66
  PALETTE 4,0.66,0,0
  PALETTE 5,0.66,0,0.66
  PALETTE 6,0.66,0.33,0
  PALETTE 7,0.66,0.66,0.66
  PALETTE 8,0.33,0.33,0.33
  PALETTE 9,0,0,1
  PALETTE 10,0,1,0
  PALETTE 11,0,1,1
  PALETTE 12,1,0,0
  PALETTE 13,1,0,1
  PALETTE 14,1,1,0
  PALETTE 15,1,1,1
  RETURN
set_palette:
  PALETTE 1,0,0,0
  PALETTE 2,1,0,0
  PALETTE 3,0,1,0
  PALETTE 4,1,0,1
  PALETTE 5,0,1,1
  PALETTE 6,1,1,0
  PALETTE 7,1,1,1
  PALETTE 8,0,0,1
  PALETTE 9,0.66,0.66,0.66
  PALETTE 10,0.4,0.4,0.4
  PALETTE 11,0.53,0.53,0.53
  RETURN
set_palette_greyscale:
  PALETTE 0,0,0,0
  PALETTE 2,0.14,0.14,0.14
  PALETTE 4,0.27,0.27,0.27
  PALETTE 6,0.4,0.4,0.4
  PALETTE 8,0.54,0.54,0.54
  PALETTE 10,0.67,0.67,0.67
  PALETTE 12,0.8,0.8,0.8
  PALETTE 14,0.94,0.94,0.94
  RETURN


REM Exit the program proper.
finish:
  COLOR 0,0
  CLS
  COLOR 7,0
  LOCATE 15,22
  PRINT "Are you sure you want to Quit, (Y/N)."
quitloop:
  LET a$=INKEY$
  IF a$="Y" THEN GOTO exit_Program:
  IF a$="y" THEN GOTO exit_Program:
  IF a$="N" THEN GOTO start:
  IF a$="n" THEN GOTO start:
  GOTO quitloop:
exit_program:
  CLS
  COLOR 7,0
  LOCATE 15,10
  PRINT "Do you want to REBOOT the machine or QUIT the program, (R/Q)."
exitloop:
  LET a$=INKEY$
  IF a$="R" THEN GOTO reboot_quit:
  IF a$="r" THEN GOTO reboot_quit:
  IF a$="Q" THEN GOTO close_down:
  IF a$="q" THEN GOTO close_down:
  GOTO exitloop:
close_down:
WINDOW CLOSE 1
SCREEN CLOSE 1
SYSTEM 0
END
reboot_quit:
CLS
COLOR 7,0
LOCATE 15,16
PRINT "Remove floppy disk(s) from floppy disk drive(s)."
LOCATE 17,22
PRINT "Press C to continue with Coldboot:-"
coldbootloop:
LET a$=INKEY$
IF a$="C" THEN GOTO reset:
IF a$="c" THEN GOTO reset:
GOTO coldbootloop:
reset:
COLOR 0,0
CLS
ASSEM
   movea.l  4,a6
   lea.l Magicresetcode(pc),a5
   jmp   -$1e(a6)
   cnop  0,4
Magicresetcode:
   lea.l 2,a0
   reset
   jmp   (a0)
END ASSEM
