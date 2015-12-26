@echo off
echo Build started...

asm68k /o ae- /p cZ80.asm,z80.bin

IF NOT EXIST z80.bin goto LABLERR
rem rompad z80.bin 255 0
rem fixheadr.exe z80.bin

echo Build succeeded

goto LABLDONE

:LABLERR
echo Build failed
pause
:LABLDONE
pause