@Echo Off

EXE\asl -cpu Z80 -gnuerrors -c -A -L -xx Z80.asm
EXE\p2bin Z80.p Z80.bin -r 0x-0x
IF NOT EXIST Z80.p goto DPERROR
KENS\KensSharp.exe -n -c Saxman Z80.bin Z80.sax
 
:DPERROR
DEL Z80.p
DEL Z80.h

Pause

:END