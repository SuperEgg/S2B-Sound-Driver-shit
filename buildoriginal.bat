@echo off
echo Build started...

call Assemble.bat

echo Build succeeded

@echo off
echo Build started...
;asm68k /o ae- /p Sonic2B.asm,s2beta.bin
asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- Sonic2B.asm,s2beta.bin>error.log, , s2beta.lst
IF NOT EXIST s2beta.bin goto LABLERR
rem rompad s2beta.bin 255 0
rem fixheadr.exe s2beta.bin

echo Build succeeded

goto LABLDONE

:LABLERR
echo Build failed
pause
:LABLDONE
pause