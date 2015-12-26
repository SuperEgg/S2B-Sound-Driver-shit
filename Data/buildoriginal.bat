@echo off
echo Build started...
;asm68k /o ae- /p unknow.asm,unknow.bin
asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- unknow.asm,unknow.bin>error.log
IF NOT EXIST unknow.bin goto LABLERR
rem rompad unknow.bin 255 0
rem fixheadr.exe unknow.bin

echo Build succeeded

goto LABLDONE

:LABLERR
echo Build failed
pause
:LABLDONE
pause