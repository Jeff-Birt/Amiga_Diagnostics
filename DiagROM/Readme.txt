For the Amiga32 show in Neuss/Germany I now released DiagROM V1.0
It is free to use.  but you ARE on your own..

Up to date information will be avaible at http://www.diagrom.com and sources etc on: https://github.com/chuckygang


The file DIAGROM is usable in WinUAE as a kickstart rom replacement, but might not make that much sense as it will be a working machine. 


16bit.bin is ready for 16Bit proms.  like A500/600/2000 (CD32???)
16bitHI.bin and 16bitLO.bin are for 32bit roms like A3000/4000 (and Tower)
HI ROM is to be used at: U6A - Amiga 1200, U175 - Amiga 4000, U181 - Amiga 3000
LO ROM is to be used at: U6B - Amiga 1200, U176 - Amiga 4000, U180 - Amiga 3000

.bin files are byteswapped etc ready to be burned to 27C400-105 PROMS.. so just load the files and program.

A1kEVEN.bin is to be used for EVEN prom on A1000, LIMITED EDITION
A1kODD.bin is to be used for ODD prom on A1000, LIMITED EDITION

Some A500 (rev 5 and below) will need a wire from pin 31 to 1 for make the rom work.



For CD32:
Take a 27C800 prom, either join the hi and lo files, in order first "HI" and then "LO". Or as I have a 27C4096->27C400 adapter with jumpers for banks.
Set it to bank 0, program "HI" then put adapter in bank 1 and program "LO" and it will work.

For A1000:
Use the A1k files. they might not always be the current version.. and due to spacerestrictions, some tests is removed.
use 27C256 proms for this.


Serial output is sent at 9600BPS 8N1, use a nullmodem to use this function.
Data is sent out to parallelport aswell..  actually NOT checked if it works yet.



Report ideas, bugs etc to bugreport@diagrom.com include what machine you are using and cpu/memory config (and what type of memory)
please if possible, include a dump of serialoutput.



Versionnumber is only bumped every time I think that version is kind of "Stable" but there is a date in the menu to keep track of build.
Think of that on ANY Amiga software  Versionnumber is  Version.Revision  so V0.5 is older then V0.10  (Version 0, revision 5 vs Version 0, Revision 10)
(YES! that means that V0.1 is OLDER and a DIFFERENT version than V0.10)


This is a "Run AS-IS" nothing else. OK?


KNOWN Bugs: 
* If ODD CIA is missing, machine will throw an exceptionerror at start and crash
* On some machines, serialinmput and sporadic keyboardinput is not working or at some points VERY slow.

Small flashes on screen during keypress/serialinput is for the moment normal, it is for debugging.


Please contact me on chucky@thegang.nu with ideas/bugreports.  or http://www.diagrom.com


----
Updatehistory:
2019-08-13:	Long time since last time. New Stable.
		Now Diskdrivetest should work on most machines.
		Memchecks should now detect nonworking ram better.
		Experimental CIA test added that should work on NTSC machines aswell. MIGHT give false
		results on TOD-B  tests. It will still say that IRQ is needed, this is not true :)
		Added RGB Test.
		and usual "bugfixes" pressing left mousebutton when chipmemdetect starts skips serial
		output and makes startup faster. holding down left mousebutton while doing memscan at
		start skips memtests. (good if it hangs during scan. known not found bug yet!)
		
2019-05-04:	Updated to tested values if new CIA test that should be more correct.
		Also in memoryedit mode (memtest) added pageup/down functions with Q and Z keys.
		(or Amigastandard shift+cursor keys)  also added official support to execute code
		from current locaton using the X key. (this is very much not really useful for most
		people)

2019-05-03:	New experimental CIA test should be working. This I would add much more early but due to 		some idiots having the totally wrong way of asking for a function I just simply ignored 			the request of having a CIA test that works in NTSC mode aswell. Remember HOW you ask
		for functions/features. Do not be a dick.  Anyway. it now hopefully works. I have no
		real NTSC machine to test on, so please test and report (bugreports@diagrom.com).
		remember that result is dependent on current screenmode so OK can be on the PAL side
		even on a NTSC machine.

2019-05-01:	Added a new experimental CIA test. it says however IRQ is needed but it is a lie.
		Will be changed when the old test is removed.
		it will now show number of ticks intead. and if it is ok or not in both PAL and NTSC
		modes. (still remember. pressing space in mainmenu swaps between PAL/NTSC mode on most
		Amigas).

2019-01-26:	Changed some in serial output so tests that are ok are shown in green.
		and tests failing are shown in red.
		also changed the screen if no mem was found at all that it now shows in rasterbars
		bit 31->0   Light green is a working bit.  dark green is a bad bit in memory.
		Slowly going from Address $400 and up. (4 longwords up every flash).
		where I now added a section of 4 parts:
		This is a very fast (and not very reliable) memorytest of chipmem.
		telling if it seems to have working ram in different blocks of 512k.
		so 4 lines= 2MB of ram.
		those tests are in realtime so poking around on databits will show you result 		in realtime..  This is using Raster-magic coding C64 style. So flicker is normal.

2019-01-13:	Whopsi. During my tests I disabled parts of the CIA test. now working again.
		also changed somewhat at the init output doing chipram detection.
		Now it shows binary output aswell. This made detecting MUCH slower.
		But I found out that if I write the address being tested only once.
		things got much faster.  Now it takes longer when there are errors.
		I have added (to TEST! might be removed anyday) a function that if you press
		left mousebutton, serialoutput is temporary disabled making it go much faster.

2019-01-02:	Changed memtest pattern so it is different for high/low word
2019-01-01:	HAPPY NEW YEAR! changed serial output at startup when there
		is biterrors. now also showing binary output.
		Writes address only once, this dramatically also as a bonus
		improves detectionspeed when memory is good. Slight
		different coloroutput now. (might be changed)
2018-11-17:	Added a RGB Test showing a R G and B bar.  for the moment only in OCS, AGA will come.

2018-10-27:	Version 1.1
		Changed so if chipmem is detected at early start. fastmem is detected when screen is active instead.
		this to make it more clear what is happening while scanning. IF scan hangs press left mousebutton and it
		will stop the scan.
		Some tidy up, changed timing in Autoconfig.

2018-05-20:	Did some tidying in Gayletest.  added Amiga 4000 IDE test aswell

2018-05-11:	Modified startupcode some.  added new memoryetection as default should be better at detecting fastram.
		press left mousebutton at poweron, screen will be disabled.  IF fastmem is present, fastmem will be used
		as workmem (LAST working block found will be used).
		if right mousebutton is pressed during poweron, BEGINNING of detected ram (chip or fast) will be used instead
		of default END.
		While fastmemdetecttion runs, in serialmode detected areas will be shown.

2018-05-06:	Fixed bug that gave artifacts when text scrolled out of picture.
		Adding Gayle IDE Controller-test.
		Added a new memorydetectionroutine that so far is a test-option. when tested better this will be
		also used to hande fastmem etc at startup.

2018-04-17:	Added function, in mainmenu if you press SPACE you switch between PAL and NTSC screenmode.
		Hopefully fixed issue with Autoconfigure and Z3 cards.

2018-04-06:	Easter and Revision demoparty passed.  Been working on some internal stuff. small bugfixes.
		Added a new memorydetectionrouting that for the moment only is available as a menu-choise in memtest
		menu, PLEASE report results to me, especially if it finds different amount of memory than others.
		and also false reports.. (rememember that you WILL need to do a autoconfig procerdure for autoconfig
		ram to be visible here)
		also started to plan a new memorytestroutine that handles addresserrors etc.

2018-01-27:	Added CPU detectionroutine.  Sadly the MMU detectioncode I made seemed only to work in WinUAE and not
		on real machines, so that one is temprary disabled.  so will not be able to present exact correct CPU.
		(EC, LC etc)

2018-01-05:	HAPPY NEW YEAR!
		Added ROM Checksumtest.

2017-10-27:	Amiga32 show in Neuss/Germany tomorrow.  so Time to release DiagROM V1.0 as we now have basic tests for all hardware in A500 etc.
		Added a diskdrivetest, you can step motor in/out, flip side, turn motor on off, read data to buffer, Write from buffer
		(NOTE!! write do NOT ask. it just writes. and it MIGHT screw up content on your drive.. and due to this NEVER have a disk with
		important data in your drive while doing those tests) and you can view the first sector read from disk . (this is by design random)
		Fixed bugs in manual memorytest when editing via serialconsole making backspace not working and missaligned text.
		Fixed bug so if a loopback adapter is connected it will be detected and disable console-out (noted by BPS in menu will be set to LOOP)
		so no more random menu-entries etc whith a loopbackadapter installed in the serialport.

2017-10-01:	Long time since last time:
		Added tests for Parallel and serialporttesting using SysTest compatible loopbackadapters

2017-07-30:	Added possability to run on A1000 as bootstraprom.  I have removed moduletesting and gfx test-screemn to save space.
		Some additional bugfixes.

2017-07-06:	Fixed a bug, when setting DTR high I accidentally put Dikdrive motor on!
		when no chipmem is foundand no fastmem, instead of just flashing a green screen, it now checks memaddr $400
		and shows in stripes biterrors.  bright color=bit working, dark=bit error.  evbery 15 frame it flashes and steps +4 bytes of memaddr to check
		more internal fixes.
		
2017-06-17:	Oh!  yes long time. Now DiagROM is opensource avaible at https://github.com/ChuckyGang/DiagROM
		Totally rewritten Autoconfig, now handles Z2 and Z3 and should be working. if you get stuck in a loop (autoconfig not working) it
		will halt after 32 "boards".
		Also in ManualEdit mode, I have inlcuded a function to turn on/off cache. to debug cacheissues on CPU Cards.
		BE CAREFUL!  this WILL crash if you run it on a 68000/010
		Also fixed bug of garbage in menus.

2017-04-15:	Added Support for OKI Chipset in RTC Test
		Added (somewhat experimental) support for Autoconfig for Z2 boards.
		Must say thanx to Terriblefire for autoconfig code. (with some changes by my)
		Added test at startup to see if CPU can do odd/even byte read and writes
		Bumped version to V0.9 - Next Stable release

2017-02-25:	Moved mainmenu alternatives to make space for more maintest-menus. also added some for future use.
		Started on Others tests/RTC Test for the moment only showing ricoh RTC chip (A4k etc)
		Removed temprary debugfunction added the 18:th.

2017-02-18:	Minor changes. sometimes when exiting a testscreen you got to the mainmanu instead of the submenu. cleaned up now.
		also added a fakefastmem allocation at the boot so you can run stuff in fakefast by pressing LBM at poweron if needed.
		TEMPORARY DEBUGFUNCTION: while dumping serialport at beginnning, screen also flickers while doing a serial timeout.
		this is to figure out if machine still runs to veryfy I can do serialstuff (and detect failures) if paula is missing.
		will be removed soon as it screws up onscreen colorcodes.

2017-02-16:	Minor update: just made a better testscreen

2017-02-15:	Added a testpicture, testscreen is moved in menu and will still bug. this will be reworked soon.

2017-02-04:	Simple audiotest is now improved, it now plays different waveforms, I have checked the frequencys with my Rigol scope.
		But 20.6Hz in my headphones sounds weird, maybe should remove it in the test.  the only thing not working there now is setting volume.

2017-01-30:	In Manual edit: added when using "goto memoryaddress" when pressing x it clears the string totally. Also hopefully fixed keyboardbug making
		it more or less impossible to use keyboard on some machines.
		Fixed bug showing strange flickering spritebugs random
		Changed that in initial chipmemdetecting it checks more combinations of bits, this will make detect slower (due to serial output) but will detect more
		biterrors.
		TEMPORARY function: pressing fire/mousebutton in joystickport while poweron will totally disable serialoutput. this is to be able to run with broken
		Paula.  Will look into a better solution.  so function will maybe be removed.
		Added a testmodule, A groupmember will make a chipmodule for me later to have here. Now using the classic "Echoing"
		Also noticed how to burn roms for CD32.

2017-01-06: 	Long time since last update.  Hollidays etc.  Anyway some minor internal fixes and a basic low-res testscreen added.

2016-10-22:	Fixed bugs in new Chipmemdetection that made it not detect any chipmem if there was missing/Broken chipmem in the beginning.
		Added errorhandling in the startprocess, so it can show on serialport if there was a exceptionerror. also will show colorcodes on screen.
		done some smaller bigfixes. Will bump versionnumber and this will be the stable version.  It will take a while until next stable version is
		bumped. Need to do floppy, serial, paralell tests etc before that will happen. but you always have the daily version.

2016-10-12:	New Chipmem detection now handles shadowram so it should stop detecting memory instead of giving false 2MB Chip.
		IF no Chipmem avaible and machine can detect fastmem (NON autoconfig. more or less only A3000/4000 motherboardmem) it will now
		start using fastmem only. (screen flickers in different colors instead of printing text, nullmodem only)
		Fixed addresserrorbugs at CIA and joystickport tests on machines with 68000CPU. also should have correct CIA timing on slow machines.
		IF fastmemshadowram is detected during memorytests, test will exit.  MANUAL test have a option to disable that test.

2016-10-07:	LONG time no updates.  Familystuff.  Anyway. decided to do a total redo of initcode especially chipmemdetection.
		Detection is slower, but progress is printed on serialport so you can see address checked and if failure (in the beginning of the detection)
		you will see what it wrote and what is read to help debugging of chipmemproblems. Screen should flicker in green while detecting.
		drawback is that some tests (cia and joyport tests) now generates an addresserror. Will have a look of that.

2016-08-05:	Found the very VERY interesting bug making the right mousebuttin to act like it is STUCK on some machines. As you apparently should set the
		port to OUTPUT before reading it. after doing that RMB now behaves correctly so hopefully no more "rainbow screens" and failing memorytests.
		Anyway, time to release a new Stable version. tests are now more decent, they will be improved. YES but as it seems to work now and are getting
		somewhere I decided to do this as next stable version.

2016-07-19:	Vacationtime, not so much coding done.  Found BIG bug making serial input not to work atall. also some more keyboardchanges even if keyboard is far from
		perfect it should work better now, seems to work even better with serialoutput turned off but still VERY flaky at times. (in UAE it works perfect)
		totally redesigned the inputroutine for input of hexaddresses, now not longer requiring 8 char long addresses.
		at manualmemory-edit mode, system now allows scrolling up and down and added info about current memoryaddress.
		lots of internal redesigns of routines.

2016-07-07:	Complete new keyboardroutine. Hopefully it will work better on real machines, this time coded ON my A4000 instead of in UAE.

2016-07-05:	Added a detect of working raster, if so raster will be used as a timer hopefully making keyboard and serialroutines to work better.
		Serialport is now disabled if no key is pressed during boot when prompted. (or user press RMB during prompt)
		Powerled now flashes during memorytests aswell, so user can see that something is happening on slow memory. like Chipmem.

2016-06-28:	More Changes in timingroutines. Added a IRQ Level test. IRQ7 test REQUIRES that you have a IRQ7 button hacked to your machine.

2016-06-19:	Some cosmetic changes of textoutput (added a function to center singleline-texts)
		Added simple test of joystickports

2016-06-18:	Made keyboardshortcuts in audiotests.
		Simple keyboardtest added.

2016-06-11:	Noticed that audiotestroutine was all screwed up due to my redesign of handling of inputdata.
		Should now be fixed, now also keyboard can be used here.
		due to the big bug, this will be also a "Stable" release even if I do not bump the versionnumber.

2016-06-03:	Hopefully repaired keyboard input and maybe even serial.
		Also stupid bug detected that older versions apparently sent data in 2400 BPS after a while
		Big rework done in menu and inputhandling.  Next "Stable" release

2016-05-22:	Keyboard and and serial INPUT may be damaged on some machines due to changes in handlinhgroutines and timings is a bitch. Will check
		you can now use keyboard/serial cursor up/down to select items in menus. Mousehandling also better and do not skip bottom value in menu.
		Manual memoryedit test is now operational so you can check any address in memory manually.
		ANSI bugs should now also be removed in PuTTY etc.

2016-05-08:	Serialhandling now improved, as there is no IRQ going on I have no means of do a interrupt at serialdata.
		So now simply everytime I put out a char on the serialport I also read the serialport and puts any data in a buffer.
		Now you should be able to move the cursor in manualedit mode. (that soon will be able to edit memory aswell while it reads memory
		so you can see biterrors etc on that given address.)

2016-05-08:	Serialhandlingroutine changed so now it actually uses a buffer. Hopefully you now can cancel memorytests etc.

2016-04-27:	Hopefully keyboardroutines should work now even on physical machines

2016-04-22:	First public beta. please test and come with ideas.

2016-04-21:	Getting ready for first public beta. (or alfa.. whatever)
		There is some bugs in the memorydetectionroutine. so "test detected fastmem" actually now scans the A3000/4000 complete 16MB area even if less is
		detected. (or more if you have the 64MB hack)  this will be fixed soon.
		Also: keyboard on atleast A4000 is NOT working.. works just fine in UAE, but not on real HW.

2016-04-09:	Long time struggling with bug in serialport.
		Worked more with manual editmode. you can view any memoryadress. and you can move around cursor (keyboard only so far, serialbug...)
		and memory keeps realtime-update where cursor is located.  buggy.. :)

2016-03-13:	Temporary removed RMB check at startup as it seems to require some registers set. not sure if I want to do it at that stage of startup yet.
		(as I want this to run on as many machines as possble regardelss of problems with it)
		Started to add "Manual memory edit" that let you dump and edit on ANY memoryaddress. Cursorpos will always be updated in realtime
		so you can see what is actually is writtem.  So far read-only, write will come.
		also plans of possability of sending up binary data and actually a possability of executing data. so you can code own hardware tests etc.
		(and much more easy for me in the future so I do not have to burn proms all the time as emulated is not the real thing in this case.)
		(those functions will be for much later..)
		Minor cosmetic changes done.

2016-03-04:	bugs fixed: told wrong amount of memory detected on A3000/4000 machines, reported wrong size of non usable memory at memcheck, HOPEFULLY
		fixed why serial imput was ignored on some machines.
		known bug: last entry of menus does not work with mouse.   RMB is detected as pressed down at boot (function disabled meanwhile)

2016-02-29:	Manual scan now somewhat more polished. there is a "cursor", user can delete their input. and possability of choosing fast or slow scan

2016-02-28:	Somewhat better handling of test of detected fastmem.
		Starting with code to manually test memory between selected adresses, needs to be polished alot. like adding possability of fastscan.

2016-02-23:	Fixed a bug with menus showing trash on some machines. (printing one item too much)
		Redesigning detected fastmem-routine.

2016-02-18: 	Located a bug making it crash on 68000/68010 machines (writing longword to odd adress)
		Found that on machines with 24bit adress (68000/68010/68EC20) memory detection found trash-memory. Fixed in INITPART. not memorycheck part yet.
