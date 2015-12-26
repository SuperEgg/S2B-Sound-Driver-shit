@echo off
echo Build started...

call Assemble.bat

echo Build succeeded

@echo off
vasmm68k_mot -Fbin Sonic2B.asm -o s2beta.bin>error.log
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