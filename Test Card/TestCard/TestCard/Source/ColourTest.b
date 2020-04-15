REM Original Copyright, (C)2002 Barry Walker, G0LCU.
REM Compiled under ~ACE Basic Compiler~, (C) David Benn.
REM This is the testcard launcher program.

  SCREEN 1,640,200,1,2
  WINDOW 1,"           TESTCARD GENERATOR (C)B.WALKER, FOR NTSC AND PAL DEVICES.",(0,0)-(640,200),16,1
  FONT "topaz.font",8

start:
  CLS
  LOCATE 7,27
  PRINT "TestCard Program Launcher."
  LOCATE 8,27
  PRINT "--------------------------"
  LOCATE 10,29
  PRINT "Press N or n for NTSC."
  LOCATE 11,29
  PRINT "Press P or p for PAL."
  LOCATE 12,29
  PRINT "Press Q or q to Quit."

keyboard_test:
  LET a$=INKEY$
  IF a$="q" THEN GOTO exit_program:
  IF a$="Q" THEN GOTO exit_program:
  IF a$="p" THEN GOTO paltest:
  IF a$="P" THEN GOTO paltest:
  IF a$="n" THEN GOTO ntsctest:
  IF a$="N" THEN GOTO ntsctest:
  GOTO keyboard_test:

paltest:
  SYSTEM "PAL"
  GOTO keyboard_test:

ntsctest:
  SYSTEM "NTSC"
  GOTO keyboard_test:

exit_program:
  WINDOW CLOSE 1
  SCREEN CLOSE 1
  END
