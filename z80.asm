	cpu 68000
	padding off
	listing purecode
	page	0	; Don't want form feeds
	supmode on
	include "DisassemblySettings.asm"
; ===========================================================================
; ---------------------------------------------------------------------------
; "Sonic 2 beta" Sound Driver
; ---------------------------------------------------------------------------
; AS crap
; ---------------------------------------------------------------------------

	cpu z80undoc						; Assemble z80 functions with undocumented instructions
	listing purecode					; Turn off listings
	phase	0					; Set offset to $0000

; ---------------------------------------------------------------------------
; Macro to align data using 00 ("align" uses FF)
; ---------------------------------------------------------------------------

pad		macro	Offset
	rept	Offset-$
	db	000h
	endm
	endm

zmake68kBank function addr,(((addr&3F8000h)/zROMWindow))

; ===========================================================================
zTrackPlaybackControl	= 0
zTrackVoiceControl		= 1
zTrackTempoDivider		= 2
zTrackDataPointerLow	= 3
zTrackDataPointerHigh	= 4
zTrackKeyOffset			= 5
zTrackVolume			= 6
zTrackAMSFMSPan			= 7
zTrackVoiceIndex 		= 8
zTrackVolFlutter		= 9
zTrackStackPointer		= 0Ah
zTrackDurationTimeout	= 0Bh
zTrackSavedDuration		= 0Ch
; ---------------------------------
; Alternate names for same offset:
zTrackSavedDAC 			= 0Dh				; For DAC channel
; ---------------------------------
zTrackFreqLow      	 	= 0Dh				; For FM/PSG channels
; ---------------------------------
zTrackFreqHigh      	= 0Eh				; For FM/PSG channels
; ---------------------------------
zTrackSetNoteFill		= 0Fh
zTrackResetNoteFill		= 10h
zTrackModulationPtrLow	= 11h
zTrackModulationPtrHigh	= 12h
zTrackModulationWait	= 13h
zTrackModulationSpeed	= 14h
; ---------------------------------
zTrackFreqFlutterIndex 	= 15h
; ---------------------------------
zTrackModulationDelta 	= 15h
zTrackModulationSteps	= 16h
zTrackModulationValLow	= 17h
; ---------------------------------
zTrackFreqFlutterSens	= 17h
; ---------------------------------
zTrackModulationValHigh	= 18h
zTrackFreqDisplacement 	= 19h
zTrackSetVolumeMasks	= 1Ah
zTrackPSGNoise			= 1Bh
zTrackCSFXPointerLow	= 1Ch
zTrackCSFXPointerHigh	= 1Dh
zTrackTLPtrLow     		= 1Eh
zTrackTLPtrHigh			= 1Fh
zTrackLoopCounters		= 20h
zTrackStack		= 2Ah
; ===========================================================================
zYM2612_A0 =	4000h
zYM2612_D0 =	4001h
zYM2612_A1 =	4002h
zYM2612_D1 =	4003h
zBankRegister =	6000h
zPSG =		7F11h
zROMWindow =	8000h

zComRange =	1B80h ; most communication between Z80 and 68k happens in here, among other things (like stack storage)

z1upBackupSourceStart = zComRange
zVariablesStart = z1upBackupSourceStart
zSFXPriorityVal = zVariablesStart+0
zTempoTimeout =	zVariablesStart+1
zCurrentTempo =	zVariablesStart+2	; Stores current tempo value here
zStopMusic =	zVariablesStart+3	; Set to 7Fh to pause music, set to 80h to unpause. Otherwise 00h
zFadeOutCounter = zVariablesStart+4
zFadeOutDelay = zVariablesStart+5
zCommunication = zVariablesStart+6	; Unused byte used to synchronise gameplay events with music
zDACUpdating =	zVariablesStart+7 ; Set to FFh while DAC is updating, then back to 00h
zQueueToPlay =  zVariablesStart+8	; if NOT set to 80h, means new index was requested by 68K
zSFXToPlay =	zVariablesStart+9	; When Genesis wants to play "normal" sound, it writes it here
zSFXStereoToPlay = zVariablesStart+0Ah	; When Genesis wants to play alternating stereo sound, it writes it here
zSFXUnknown =	zVariablesStart+0Bh ; Unknown type of sound queue, but it's in Genesis code like it was once used
zVoiceTblPtr =	zVariablesStart+0Ch	; address of the voices
zFadeInFlag =	zVariablesStart+0Eh
zFadeInDelay =	zVariablesStart+0Fh
zFadeInCounter = zVariablesStart+10h
z1upPlaying =	zVariablesStart+11h
zTempoMod =	zVariablesStart+12h
zTempoTurbo =	zVariablesStart+13h	; Stores the tempo if speed shoes are acquired (or 7Bh is played anywho)
zSpeedUpFlag =	zVariablesStart+14h
zDACEnabled =	zVariablesStart+15h
zMusicBankNumber = zVariablesStart+16h
zIsPalFlag =	zVariablesStart+17h	; I think this flags if system is PAL
zVariablesEnd =	zVariablesStart+18h

zTracksSongStart =	zVariablesEnd	; This is the beginning of all BGM track memory
zSongFMDACStart = zTracksSongStart+(zTrackSz*0)
zSongDAC =	zSongFMDACStart+(zTrackSz*0)
zSongFMStart =	zSongFMDACStart+(zTrackSz*1)
zSongFM1 =	zSongFMStart+(zTrackSz*0)
zSongFM2 =	zSongFMStart+(zTrackSz*1)
zSongFM3 =	zSongFMStart+(zTrackSz*2)
zSongFM4 =	zSongFMStart+(zTrackSz*3)
zSongFM5 =	zSongFMStart+(zTrackSz*4)
zSongFM6 =	zSongFMStart+(zTrackSz*5)
zSongFMEnd =	zSongFMStart+(zTrackSz*6)
zSongFMDACEnd =	zSongFMEnd
zSongPSGStart =	zSongFMDACEnd
zSongPSG1 =	zSongPSGStart+(zTrackSz*0)
zSongPSG2 =	zSongPSGStart+(zTrackSz*1)
zSongPSG3 =	zSongPSGStart+(zTrackSz*2)
zSongPSGEnd =	zSongPSGStart+(zTrackSz*3)
zTracksSongEnd =	zSongPSGEnd
z1upBackupSourceEnd =	zTracksSongEnd

zTracksSFXStart =	zTracksSongEnd	; This is the beginning of all BGM track memory
zSFXFMStart =	zTracksSFXStart+(zTrackSz*0)
zSFXFM3 =	zSFXFMStart+(zTrackSz*0)
zSFXFM4 =	zSFXFMStart+(zTrackSz*1)
zSFXFM5 =	zSFXFMStart+(zTrackSz*2)
zSFXFMEnd =	zSFXFMStart+(zTrackSz*3)
zSFXPSGStart =	zSFXFMEnd
zSFXPSG1 =	zSFXPSGStart+(zTrackSz*0)
zSFXPSG2 =	zSFXPSGStart+(zTrackSz*1)
zSFXPSG3 =	zSFXPSGStart+(zTrackSz*2)
zSFXPSGEnd =	zSFXPSGStart+(zTrackSz*3)
zTracksSFXEnd =	zSFXPSGEnd

z1upBackup =	zTracksSFXEnd	; When extra life plays, it backs up a large amount of memory (all track data plus 36 bytes)

FirstSong   = 01h
zSongBank   = zMusicBankNumber
zTrackSz = 2Ah				; Size of all tracks
; see the very end for another set of variables
; ===========================================================================
; ---------------------------------------------------------------------------
; Start of code
; ---------------------------------------------------------------------------

	di						; disable interrupts
	di						; disable interrupts
	im 	1
	jp	InitDriver					; continue to main sound driver code

; ===========================================================================
	zPalModeByte:
	db	0

; ===========================================================================
; ---------------------------------------------------------------------------
; (rst 08) Subroutine to bankswitch to sound bank
; ---------------------------------------------------------------------------
	pad	00008h	
; ---------------------------------------------------------------------------

zBankSwitchToSound:
	ld	a,zmake68kBank(SoundIndex)
	jp	zBankSwitch

; ===========================================================================
; ---------------------------------------------------------------------------
; (rst 10) Subroutine to check which part of the YM2612 needs writing to
; ---------------------------------------------------------------------------
	pad	00010h	
; ---------------------------------------------------------------------------

WriteYM2612:
	bit	2,(ix+zTrackVoiceControl)				; is the channel from FM 1 to 3?
	jr	z,zWriteFMI			; if so, branch to write to YM2612 part 01
	jr	zWriteFMII				; if it's FM 4 to 6, write to YM2612 part 02

; ===========================================================================
; ---------------------------------------------------------------------------
; (rst 18) Subroutine to write data to the YM2612 in part 01
; ---------------------------------------------------------------------------
	pad	00018h	
; ---------------------------------------------------------------------------

zWriteFMI:
	; Write reg/data pair to part I; 'a' is register, 'c' is data
	ld	(zYM2612_A0),a
	push	af
	ld	a,c
	ld	(zYM2612_D0),a
	pop	af
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; (rst 28) Subroutine to write data to the YM2612 in part 02
; ---------------------------------------------------------------------------
	pad	00028h	
; ---------------------------------------------------------------------------

zWriteFMII:
	; Write reg/data pair to part II; 'a' is register, 'c' is data
	ld	(zYM2612_A1),a
	push	af
	ld	a,c
	ld	(zYM2612_D1),a
	pop	af
	ret				; return

; ===========================================================================
; ---------------------------------------------------------------------------
; (V-Blank 38) Main routine to run the tracker of all channels
; ---------------------------------------------------------------------------
	pad	00038h	
; ---------------------------------------------------------------------------

V_Int: 
	push	af				; store current possible sample byte
	exx						; exchange registers (store away DPCM register data)
	call	SetMusicBanks	; set the bank address
	xor	a					; clear SFX playing flag
	ld	(RunningSFX),a		; Not updating SFX (updating music)
	ld	ix,zVariablesStart		; ix points to zVariablesStart
	ld	a,(zStopMusic)		; Get pause/unpause flag
	or	a					; test 'a'
	jr	z,zUpdateEverything	; If zero, go to zUpdateEverything
	call	zPauseMusic
	jp	zUpdateDAC			; Now update the DAC

zUpdateEverything:
	dec	(ix+zTrackVoiceControl)	
	call	z, sub_AF4
	ld	a, (zFadeOutCounter)
	or	a
	call	nz, zUpdateFadeout
	ld	a, (zFadeInFlag)
	or	a
	call	nz, zUpdateFadeIn
	ld	a, (zSFXToPlay)
	or	(ix+zTrackStackPointer)
	or	(ix+zTrackDurationTimeout)
	call	nz, zCycleQueue
	ld	a,(zQueueToPlay)
; Apparently if this is 80h, it does not play anything new,
; otherwise it cues up the next play (flag from 68K for new item)		
	cp	080h
	call	nz,zPlaySoundByIndex

	ld	hl,zPalModeByte
	ld	a,(zIsPalFlag)		; Get zIsPalFlag -> 'a'
	and	(hl)
	jr	z,+
	ld	hl,zPALUpdTick
	dec	(hl)
	jr	nz,+
	ld	(hl),5				; every 6 frames (0-5) you need to "double update" to sort of keep up
	call	zUpdateMusic
+
	call	zUpdateMusic

	; Now all of the SFX tracks are updated in a similar manner to "zUpdateMusic"...	
	rst	zBankSwitchToSound

	ld	a,080h					; set the SFX playing flag
	ld	(RunningSFX),a			; Set zDoSFXFlag = 80h (updating sound effects)

	; FM SFX channels
	ld	b,(zSFXFMEnd-zSFXFMStart)/zTrackSz	; set number of SFX FM channels to read

loc_C7:
	push	bc					; store counter
	ld	de,zTrackSz				; prepare channel size
	add	ix,de					; advance to next channel's RAM
	bit	7,(ix+zTrackPlaybackControl)				; is the channel running?
	call	nz,FM_Run				; if so, run FM routine
	pop	bc					; restore counter
	djnz	loc_C7

	; PSG SFX channels	
	ld	b,(zSFXPSGEnd-zSFXPSGStart)/zTrackSz	; set number of SFX PSG channels to read

loc_D9:
	push	bc					; store counter
	ld	de,zTrackSz				; prepare channel size
	add	ix,de					; advance to next channel's RAM
	bit	7,(ix+zTrackPlaybackControl)				; is the channel running?
	call	nz,PSG_Run				; if so, run PSG routine
	pop	bc					; restore counter
	djnz	loc_D9
; ---------------------------------------------------------------------------
; Now we update the DAC... this only does anything if there's a new DAC 
; sound to be played.  This is called after updating the DAC track.
; Otherwise it just mucks with the timing loop, forcing an update.
; ---------------------------------------------------------------------------
; DPCM sample data load
; ---------------------------------------------------------------------------	
zUpdateDAC:		
	ld	a,02Ah					; set YM2612 address to DAC port
	ld	(zYM2612_A0),a				; ''
	ld	a,(zCurDAC)				; Get currently playing DAC sound
	or	a
	jp	m,+						; If one is queued (80h+), go to it!
	ld	a,(DAC_BankID)			; Get current DAC bank
	call	zBankSwitch				; Switch to current DAC sample's bank
	exx							; Otherwise restore registers from mirror regs
	ld	b,1						; b=1 (initial feed to the DAC "djnz" loops, i.e. UPDATE RIGHT AWAY)
	pop	af
	ei		; enable interrupts
	ret
+
	; If you get here, it's time to start a new DAC sound...
	ld	hl,zCurDAC			; Get address of 'current DAC sound' value
	res	7,(hl)				; Subtract 80h (first DAC index is 80h)
	ld	a,(hl)				; Get current DAC sound value
	ld	c,a
	ld	b,0
	ld	hl,DAC_Banks
	add	hl,bc
	ld	a,(hl)				; Get DAC's bank value
	ld	(DAC_BankID),a
	call	zBankSwitch
	ld	a,80h
	ex	af,af'	;'
	ld	a,(zCurDAC)				; Get currently playing DAC sound
	ld	c,a
	ld	b,0
	ld	hl,zDACPtrTbl
	add	hl,bc					; Each entry in zDACPtrTbl is 4 bytes bit, so add the index 4 times.
	add	hl,bc					; Stock S2B used two 'add a,a' instructions, which was dangerous,
	add	hl,bc					; and limited the number of DAC samples to 40h.
	add	hl,bc
	ld	(DPCM_Address+001h),hl			; store sample address (relative to bank)
	inc	hl
	inc	hl
	ld	(DPCM_Size+002h),hl			; store sample length
	pop	af					; restore possible current sample byte
	ld	hl,DPCM_PlaySample			; set return address to the start of the DPCM playback routine (so the sample starts properly)
	ex	(sp),hl					; ''

DPCM_Address:
	ld	hl,(zDACPtrTbl)			; load address/location of the DPCM sample

DPCM_Size:
	ld	de,(zDACPtrTbl+002h)			; load size of the DPCM sample

DPCM_Pitch:
	ld	bc,00100h				; prepare pitch delay values (this is changed by a routing below)
	ei						; enable interrupts
	ret						; return to start of DPCM playback loop
; ===========================================================================
DAC_Banks:
	db	1Bh	;80
	db	1Bh	;81
	db	1Bh	;82
	db	1Bh	;83 
 	db	1Bh ;84
 	db 	1Bh	;85
 	db	1Bh	;86
 	db	1Bh	;87
	db	1Bh ;88 
	db	1Bh ;89
 	db	1Bh ;8A
 	db	1Bh ;8B
 	db	1Bh ;8C
 	db	1Bh ;8D
	db	1Bh ;8E 
 	db	1Bh ;8F

	db	1Bh ;90 
 	db	1Bh ;91
 	db	1Bh ;92
 	db	1Bh ;93
 	db	1Bh ;94
 	db	1Bh ;95
 	db	1Bh ;96
 	db	1Bh ;97
 	db	1Bh ;98
	db	1Bh ;99
	db	1Bh ;9A
	db	1Bh ;9B
	db	1Bh ;9C
	db	1Bh ;9D
	db	1Bh ;9E
	db	1Bh ;9F   
	
	db	1Ch ;A0 
 	db	1Ch ;A1
 	db	1Ch ;A2
 	db	1Ch ;A3
 	db	1Ch ;A4
 	db	1Ch ;A5
 	db	1Ch ;A6
 	db	1Ch ;A7
 	db	1Ch ;A8
	db	1Ch ;A9
	db	1Ch ;AA
	db	1Ch ;AB
	db	1Dh ;AC
	db	1Dh ;AD
	db	1Dh ;AE
	db	1Dh ;AF   
	
	db	1Dh ;B0 
 	db	1Dh ;B1
 	db	1Dh ;B2
 	db	1Dh ;B3
 	db	1Dh ;B4
 	db	1Dh ;B5
 	db	1Dh ;B6
 	db	1Dh ;B7
 	db	1Dh ;B8
	db	1Dh ;B9
	db	1Dh ;BA
	db	1Dh ;BB
	db	1Dh ;BC
	db	1Dh ;BD
	db	1Dh ;BE
	db	1Dh ;BF   	

	db	1Dh ;C0 
 	db	1Dh ;C1
 	db	1Dh ;C2
 	db	1Dh ;C3
 	db	1Dh ;C4
 	db	1Eh ;C5
 	db	1Eh ;C6
 	db	1Eh ;C7
 	db	1Eh ;C8
	db	1Eh ;C9
	db	1Eh ;CA
	db	1Eh ;CB
	db	1Eh ;CC
	db	1Eh ;CD
	db	1Eh ;CE
	db	1Eh ;CF   	

	db	1Eh ;D0 
 	db	1Eh ;D1
 	db	1Eh ;D2
 	db	1Eh ;D3
 	db	1Eh ;D4
 	db	1Eh ;D5
 	db	1Eh ;D6
 	db	1Eh ;D7
 	db	1Eh ;D8
	db	1Eh ;D9 			
; ===========================================================================
zUpdateMusic:		
	call 	TempoWait			; This is a tempo waiting function
	
	; DAC updates
	ld	a,0FFh					; set the DAC channel running flag
	ld	(zDACUpdating),a				; ''
	ld	ix,zTracksSongStart				; load start of channel RAM
	bit	7,(ix+zTrackPlaybackControl)				; is the DAC channel running?
	call	nz,DAC_Run				; if so, run DAC routine
	xor	a					; clear the DAC channel running flag
	ld	(zDACUpdating),a				; ''
	ld	b,(zSongFMEnd-zSongFMStart)/zTrackSz	; set number of BGM FM channels to check

TR_NextFM:
	push	bc					; store counter
	ld	de,zTrackSz				; prepare channel size
	add	ix,de					; advance to next channel's RAM
	bit	7,(ix+zTrackPlaybackControl)				; is the channel running?
	call	nz,FM_Run				; if so, run FM routine
	pop	bc					; restore counter
	djnz	TR_NextFM				; repeat for all FM channels
	
	ld	b,(zSongPSGEnd-zSongPSGStart)/zTrackSz					; set number of PSG channels to check

TR_NextPSG:
	push	bc					; store counter
	ld	de,zTrackSz				; prepare channel size
	add	ix,de					; advance to next channel's RAM
	bit	7,(ix+zTrackPlaybackControl)				; is the channel running?
	call	nz,PSG_Run				; if so, run PSG routine
	pop	bc					; restore counter
	djnz	TR_NextPSG				; repeat for all BGM PSG channels

	ret
; ===========================================================================
TempoWait:
	; Tempo works as divisions of the 60Hz clock (there is a fix supplied for
	; PAL that "kind of" keeps it on track.)  Every time the internal music clock
	; overflows, it will update.  So a tempo of 80h will update every other
	; frame, or 30 times a second.

	ld	ix,zVariablesStart
	ld	a,(ix+zTrackTempoDivider)
	add	a,(ix+zTrackVoiceControl)
	ld	(ix+zTrackVoiceControl),a
	ret	c						; If addition did not overflow (answer lower than 100h), return
	
	; So if adding tempo value DID overflow, then we add 1 to all durations
	ld	hl,zTracksSongStart+zTrackDurationTimeout
	ld	de,zTrackSz
	ld	b,(zTracksSongEnd-zTracksSongStart)/zTrackSz
TempoDelayLoop:
	inc	(hl)
	add	hl,de
	djnz	TempoDelayLoop
	
	ret
; End of function TempoWait	
; ===========================================================================	
; ---------------------------------------------------------------------------
; The main DPCM playback loop
; ---------------------------------------------------------------------------

InitDriver:
	ld	sp,zComRange				; set stack address
	call	zClearTrackPlaybackMem
	ei
	jp	zPlayDigitalAudio
; ---------------------------------------------------------------------------
; Nybble to Byte conversion table for DPCM decompression
; ---------------------------------------------------------------------------
	pad 	10h
	; The following two tables are used for when an SFX terminates
	; its track to properly restore the music track it temporarily took
	; over.  Note that an important rule here is that no SFX may use
	; DAC, FM Channel 1, FM Channel 2, or FM Channel 6, period.
	; Thus there's also only SFX tracks starting at FM Channel 3.
	
	; The zeroes appear after FM 3 because it calculates the offsets into
	; these tables by their channel assignment, where between Channel 3
	; and Channel 4 there is a gap numerically.

; ===========================================================================
	pad 	10h
zMusicTrackOffs:	
	dw	zSongFM3
	dw	0000h
	dw	zSongFM4
	dw	zSongFM5
	dw	zSongPSG1
	dw	zSongPSG2
	dw	zSongPSG3
	dw	zSongPSG3	; PSG4/Noise

	pad 	10h
zSFXTrackOffs:
	dw	zSFXFM3
	dw	0000h
	dw	zSFXFM4
	dw	zSFXFM5
	dw	zSFXPSG1
	dw	zSFXPSG2
	dw	zSFXPSG3
	dw	zSFXPSG3	; PSG4/Noise

; ===========================================================================
; ---------------------------------------------------------------------------
; DAC channel running routine
; ---------------------------------------------------------------------------

DAC_Run:
	dec	(ix+zTrackDurationTimeout)				; decrease current timer
	ret	nz					; if it hasn't reached 00 yet, return
	ld	l,(ix+zTrackDataPointerLow)				; load tracker address
	ld	h,(ix+zTrackDataPointerHigh)				; ''

DAC_NextNote:
	ld	a,(hl)					; load note
	inc	hl					; increase tracker address
	cp	0E0h					; is it a flag?
	jr	c,DAC_NoFlag				; if not, branch
	call	SMPS_Flags				; run the correct flag
	jp	DAC_NextNote				; continue to next note

DAC_NoFlag:
	or	a					; is the ID a timer?
	jp	p,DAC_UpdateTimer			; if so, branch
	ld	(ix+0Dh),a				; otherwise update the note ID
	ld	a,(hl)					; load next note
	or	a					; is it another note?
	jp	p,DAC_NewTimer				; if not, branch
	ld	a,(ix+0Ch)				; otherwise load previous note
	ld	(ix+zTrackDurationTimeout),a				; set as current note timer
	jp	DAC_UpdateSample			; continue

DAC_NewTimer:
	inc	hl					; increase tracker address

DAC_UpdateTimer:
	call	TR_SetTimer				; set the timer correctly

DAC_UpdateSample:
	ld	(ix+zTrackDataPointerLow),l				; update tracker address
	ld	(ix+zTrackDataPointerHigh),h				; ''
	bit	2,(ix+zTrackPlaybackControl)
	ret	nz
	ld	a,(ix+0Dh)				; load note
	cp	080h					; is it a rest note?
	ret	z					; if so, return
	sub	081h					; subtract starting ID
	add	a,a					; multiply by 2
	add	a,zDPCM_Notes&0FFh			; advance to table address
	ld	(DAC_ChangeSample+002h),a		; change sample ID values address

DAC_ChangeSample:
	ld	bc,(zDPCM_Notes)				; load correct sample ID and pitch to use
	ld	a,c					; set sample note for DPCM loop to play
	ld	(zCurDAC),a			; ''
	ld	a,b					; set pitch for DPCM loop to play (alters ld  bc,00100h instruction)
	ld	(DPCM_Pitch+001h),a			; ''
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; FM channel running routine
; ---------------------------------------------------------------------------

FM_Run:
	dec	(ix+zTrackDurationTimeout)				; decrease current timer
	jr	nz,loc_210				; if it hasn't reached 00 yet, jump
	res	4,(ix+zTrackPlaybackControl)
	call	FM_Tracker				; Handle coordination flags, get next note and duration
	call	zFMPrepareNote			; Prepares to play next note
	call	zFMNoteOn				; Actually key it (if allowed)
	call	zDoModulation			; Update modulation (if modulation doesn't change, we do not return here)
	jp		zFMUpdateFreq			; Applies frequency update from modulation
; ---------------------------------------------------------------------------

loc_210:
	call	zNoteFillUpdate
	call	zDoModulation
	jp	zFMUpdateFreq

; ---------------------------------------------------------------------------
; FM tracker running
; ---------------------------------------------------------------------------

FM_Tracker:
	ld	l,(ix+zTrackDataPointerLow)				; load tracker address
	ld	h,(ix+zTrackDataPointerHigh)				; ''
	res	1,(ix+zTrackPlaybackControl)

FM_NextNote:
	ld	a,(hl)					; load note
	inc	hl					; increase tracker address
	cp	0E0h					; is it a flag?
	jr	c,FM_NoFlag				; if not, branch
	call	SMPS_Flags				; run the correct flag
	jp	FM_NextNote				; continue to next note

FM_NoFlag:
	push	af
	call	sub_BAC
	pop	af
	or	a
	jp	p, loc_241
	call	zFMSetFreq
	ld	a, (hl)
	or	a
	jp	m, zFinishTrackUpdate
	inc	hl

loc_241:
	call	TR_SetTimer
	jp	zFinishTrackUpdate

zFMSetFreq:
	sub	80h ; '€'
	jr	z, zFMDoRest
	add	a, (ix+zTrackKeyOffset)
	add	a, a
	add	a, zFMFrequencies&0FFh	
	ld	(loc_254+2), a; store into the instruction after zloc_292 (self-modifying code)
	ld	d,a
	adc	a,(zFMFrequencies&0FF00h)>>8
	sub	d
	ld	(loc_254+3),a	; this is how you could store the high byte of the pointer too (unnecessary if it's in the right range)

loc_254:
	ld	de, (zFMFrequencies)
	ld	(ix+0Dh), e
	ld	(ix+zTrackFreqHigh), d
	ret

zFMDoRest:
	set	1, (ix+zTrackPlaybackControl)
	xor	a
	ld	(ix+0Dh), a
	ld	(ix+zTrackFreqHigh), a
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Setting the timer (this is basically a tempo multiplication routine)
; ---------------------------------------------------------------------------

TR_SetTimer:
	ld	c,a					; copy timer to c
	ld	b,(ix+zTrackTempoDivider)				; load tempo

TR_ST_Count:
	djnz	TR_ST_Multiply				; multiply timer by tempo amount
	ld	(ix+0Ch),a				; update timer
	ld	(ix+zTrackDurationTimeout),a				; update current timer
	ret						; return

TR_ST_Multiply:
	add	a,c					; multiply timer by tempo
	jp	TR_ST_Count				; continue

; ===========================================================================


; START	OF FUNCTION CHUNK FOR FM_Tracker

zFinishTrackUpdate:				; CODE XREF: FM_Tracker+24j FM_Tracker+2Bj ...
	ld	(ix+zTrackDataPointerLow),	l
	ld	(ix+zTrackDataPointerHigh),	h
	ld	a, (ix+zTrackSavedDuration)
	ld	(ix+zTrackDurationTimeout), a
	bit	4, (ix+zTrackPlaybackControl)
	ret	nz
	ld	a, (ix+zTrackResetNoteFill)
	ld	(ix+zTrackSetNoteFill), a
	ld	(ix+zTrackVolFlutter),	0
	bit	3, (ix+zTrackPlaybackControl)
	ret	z
	ld	l, (ix+zTrackModulationPtrLow)
	ld	h, (ix+zTrackModulationPtrHigh)
	jp	zPrepareModulation
	ret
; END OF FUNCTION CHUNK	FOR FM_Tracker

; =============== S U B	R O U T	I N E =======================================


zNoteFillUpdate:				; CODE XREF: FM_Run:loc_210p
				; PSG_Run:loc_4A8p
	ld	a, (ix+zTrackSetNoteFill)
	or	a
	ret	z
	dec	(ix+zTrackSetNoteFill)
	ret	nz
	set	1, (ix+zTrackPlaybackControl)
	pop	de
	bit	7, (ix+zTrackVoiceControl)
	jp	nz, zPSGNoteOff
	jp	sub_BAC
; End of function zNoteFillUpdate


; =============== S U B	R O U T	I N E =======================================


zDoModulation:				; CODE XREF: FM_Run+15p PSG_Run+18p
	pop	de
	
	bit	1, (ix+zTrackPlaybackControl)
	ret	nz				; If so, quit 		;jp	nz, zDoFrequencyFlutter
	bit	3, (ix+zTrackPlaybackControl)
	ret	z
	ld	a, (ix+zTrackModulationWait)
	or	a
	jr	z, loc_2D2
	dec	(ix+zTrackModulationWait)
	ret
; ---------------------------------------------------------------------------

loc_2D2:				; CODE XREF: zDoModulation+Fj
	dec	(ix+zTrackModulationSpeed)
	ret	nz
	ld	l, (ix+zTrackModulationPtrLow)
	ld	h, (ix+zTrackModulationPtrHigh)
	inc	hl
	ld	a, (hl)
	ld	(ix+zTrackModulationSpeed), a
	ld	a, (ix+zTrackModulationSteps)
	or	a
	jr	nz, zDoFrequencyFlutter_cont
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(ix+zTrackModulationSteps), a
	ld	a, (ix+zTrackModulationDelta)
	neg
	ld	(ix+zTrackModulationDelta), a
	ret
; ---------------------------------------------------------------------------

;zDoFrequencyFlutter:				; CODE XREF: zDoModulation+28j
;	add a,a
;	add a,a
;	add	a,z80_FreqFlutterPointers&0FFh			; advance to table address
;	jr	zFreqFlutterSetIndex
zDoFrequencyFlutter_cont:
	dec	(ix+zTrackModulationSteps)
zFreqFlutterSetIndex:		
	ld	l, (ix+zTrackFreqFlutterSens)
	ld	h, (ix+zTrackModulationValHigh)
	ld	b, 0
	ld	c, (ix+15h)
	bit	7, c
	jp	z, loc_30B
	;cp	82h								; Is it 82h?
	;jr	z, zlocChangeFlutterIndex		; Branch if yes	
	;cp	80h								; Is it 80h?
	;jr	z, zlocResetFlutterMod			; Branch if yes		
	;cp	84h								; Is it 84h?
	;jr	z, zlocFlutterIncMultiplier		; Branch if yes			
	ld	b, 0FFh

loc_30B:				; CODE XREF: zDoModulation+49j
	add	hl, bc
	ld	(ix+zTrackFreqFlutterSens), l
	ld	(ix+zTrackModulationValHigh), h
	ld	c, (ix+0Dh)
	ld	b, (ix+zTrackFreqHigh)
	add	hl, bc
	ex	de, hl
	jp	(hl)
; End of function zDoModulation
; ---------------------------------------------------------------------------		
zlocChangeFlutterIndex:
	inc	bc
	ld	a, (bc)
	jp	zDoFrequencyFlutter_cont
; ---------------------------------------------------------------------------	
zlocResetFlutterMod:			
	xor	a
	jp	zDoFrequencyFlutter_cont
; ---------------------------------------------------------------------------
zlocFlutterIncMultiplier:
	inc	bc								; Increment bc
	add	a, (ix+zTrackVoiceControl)	; Add flutter sensibility to a...
	ld	(ix+zTrackVoiceControl), a	; ... then store new value
	inc	(ix+zTrackFreqDisplacement)		; Advance flutter modulation...
	inc	(ix+zTrackFreqDisplacement)		; ... twice.
	jr	zDoFrequencyFlutter_cont		
; ===========================================================================
; ---------------------------------------------------------------------------
; PSG Frequency list (unlike the FM list, this one doesn't include note 80)
; ---------------------------------------------------------------------------

;		     C | C# | D  | D# |  E | F  |  F#  |  G   |  G#  |  A   |  A#  |  B

zPSGFrequencies:	
	; This table starts with 12 notes not in S1 or S2:
	dw 3FFh,3FFh,3FFh,3FFh,3FFh,3FFh,3FFh,3FFh,3FFh,3F7h,3BEh,388h
	; The following notes are present on S1 and S2 too:
	dw 356h,326h,2F9h,2CEh,2A5h,280h,25Ch,23Ah,21Ah,1FBh,1DFh,1C4h
	dw 1ABh,193h,17Dh,167h,153h,140h,12Eh,11Dh,10Dh,0FEh,0EFh,0E2h
	dw 0D6h,0C9h,0BEh,0B4h,0A9h,0A0h,097h,08Fh,087h,07Fh,078h,071h
	dw 06Bh,065h,05Fh,05Ah,055h,050h,04Bh,047h,043h,040h,03Ch,039h
	dw 036h,033h,030h,02Dh,02Bh,028h,026h,024h,022h,020h,01Fh,01Dh
	dw 1Bh,01Ah,018h,017h,016h,015h,013h,012h,011h,010h,000h,000h
	; Then, it falls through to the 12 base notes from FM octaves.
; ===========================================================================

zFMPrepareNote:				; CODE XREF: FM_Run+Cp
	bit	1, (ix+zTrackPlaybackControl)
	ret	nz
	ld	e, (ix+0Dh)
	ld	d, (ix+zTrackFreqHigh)
	ld	a, d
	or	e
	jp	z, loc_542

zFMUpdateFreq:				; CODE XREF: FM_Run+18j
	bit	2, (ix+zTrackPlaybackControl)
	ret	nz
	ld	h, 0		
	ld	l, (ix+zTrackFreqDisplacement)
	bit	7, l
	jr	z, loc_3FB	
	ld	h, 0FFh

loc_3FB:				; CODE XREF: zFMPrepareNote+1Cj
	add	hl, de
	ld	c, h
	ld	a, (ix+zTrackVoiceControl)
	and	3
	add	a, 0A4h	; '¤'
	rst	WriteYM2612
	ld	c, l
	sub	4
	rst	WriteYM2612
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; YM2612 FM Frequency list (The frequency 0025E does not run as it's note 80)
; ---------------------------------------------------------------------------

;			  C   |  C#  |  D   |  D#  |  E   |  F   |  F#  |  G   |  G#  |  A   |  A#  |  B

zFMFrequencies:	
	dw  25Eh, 284h,	2ABh, 2D3h, 2FEh, 32Dh,	35Ch, 38Fh, 3C5h, 3FFh,	43Ch, 47Ch
				; DATA XREF: RAM:loc_254r
	dw 0A5Eh,0A84h,0AABh,0AD3h,0AFEh,0B2Dh,0B5Ch,0B8Fh,0BC5h,0BFFh,0C3Ch,0C7Ch
	dw 125Eh,1284h,12ABh,12D3h,12FEh,132Dh,135Ch,138Fh,13C5h,13FFh,143Ch,147Ch
	dw 1A5Eh,1A84h,1AABh,1AD3h,1AFEh,1B2Dh,1B5Ch,1B8Fh,1BC5h,1BFFh,1C3Ch,1C7Ch
	dw 225Eh,2284h,22ABh,22D3h,22FEh,232Dh,235Ch,238Fh,23C5h,23FFh,243Ch,247Ch
	dw 2A5Eh,2A84h,2AABh,2AD3h,2AFEh,2B2Dh,2B5Ch,2B8Fh,2BC5h,2BFFh,2C3Ch,2C7Ch
	dw 325Eh,3284h,32ABh,32D3h,32FEh,332Dh,335Ch,338Fh,33C5h,33FFh,343Ch,347Ch
	dw 3A5Eh,3A84h,3AABh,3AD3h,3AFEh,3B2Dh,3B5Ch,3B8Fh,3BC5h,3BFFh,3C3Ch,3C7Ch
; ===========================================================================
; ---------------------------------------------------------------------------
; PSG channel running routine
; ---------------------------------------------------------------------------

PSG_Run:				; CODE XREF: V_Int+73p V_Int+ABp
	dec	(ix+zTrackDurationTimeout)
	jr	nz, loc_4A8
	res	4, (ix+zTrackPlaybackControl)
	call	zPSGDoNext
	call	zPSGDoNoteOn
	call 	zDoFlutter
	call	zDoModulation			; Update modulation (if modulation doesn't change, we do not return here)		
	jp	zPSGUpdateFreq
; ---------------------------------------------------------------------------

loc_4A8:				; CODE XREF: PSG_Run+3j
	call	zNoteFillUpdate
	call	zDoFlutterSetValue
	call	zDoModulation
	jp	zPSGUpdateFreq
; End of function PSG_Run


; =============== S U B	R O U T	I N E =======================================


zPSGDoNext:				; CODE XREF: PSG_Run+9p
	ld	l, (ix+zTrackDataPointerLow)
	ld	h, (ix+zTrackDataPointerHigh)
	res	1, (ix+zTrackPlaybackControl)

loc_4BE:				; CODE XREF: zPSGDoNext+13j
	ld	a, (hl)
	inc	hl
	cp	0E0h ; 'à'
	jr	c, loc_4CA
	call	SMPS_Flags
	jp	loc_4BE
; ---------------------------------------------------------------------------

loc_4CA:				; CODE XREF: zPSGDoNext+Ej
	or	a
	jp	p, loc_4D7
	call	zPSGSetFreq
	ld	a, (hl)
	or	a
	jp	m, zFinishTrackUpdate
	inc	hl

loc_4D7:				; CODE XREF: zPSGDoNext+17j
	call	TR_SetTimer
	jp	zFinishTrackUpdate
; End of function zPSGDoNext

; ---------------------------------------------------------------------------

zPSGSetFreq:				; CODE XREF: zPSGDoNext+1Ap
	sub	81h ; ''
	jr	c, loc_4F5
	add	a, (ix+zTrackKeyOffset)
	add	a, a
	add	a, zPSGFrequencies&0FFh
	ld	(loc_4EA+2), a
	ld	d,a
	adc	a,(zPSGFrequencies)>>8
	sub	d
	ld	(loc_4EA+3),a	; this is how you could store the high byte of the pointer too (unnecessary if it's in the right range)
	
loc_4EA:				; DATA XREF: ROM:04E7w
	ld	de, (zPSGFrequencies)
	ld	(ix+0Dh), e
	ld	(ix+zTrackFreqHigh), d
	ret
; ---------------------------------------------------------------------------

loc_4F5:				; CODE XREF: ROM:04DFj
	set	1, (ix+zTrackPlaybackControl)
	ld	a, 0FFh
	ld	(ix+0Dh), a
	ld	(ix+zTrackFreqHigh), a
	jp	zPSGNoteOff

; =============== S U B	R O U T	I N E =======================================


zPSGDoNoteOn:				; CODE XREF: PSG_Run+Cp
	bit	7, (ix+zTrackFreqHigh)
	jr	nz, loc_542
	ld	e, (ix+0Dh)
	ld	d, (ix+zTrackFreqHigh)

zPSGUpdateFreq:				; CODE XREF: PSG_Run+1Bj
	ld	a, (ix+zTrackPlaybackControl)
	and	6
	ret	nz
	ld	h, 0
	ld	l, (ix+zTrackFreqDisplacement)
	bit	7, l
	jr	z, loc_521
	ld	h, 0FFh

loc_521:				; CODE XREF: zPSGDoNoteOn+19j
	add	hl, de
	ld	a, (ix+zTrackVoiceControl)
	cp	0E0h ; 'à'
	jr	nz, loc_52B
	ld	a, 0C0h	; 'À'

loc_52B:				; CODE XREF: zPSGDoNoteOn+23j
	ld	b, a
	ld	a, l
	and	0Fh
	or	b
	ld	(zPSG), a
	ld	a, l
	srl	h
	rra
	srl	h
	rra
	rra
	rra
	and	3Fh ; '?'
	ld	(zPSG), a
	ret
; ---------------------------------------------------------------------------

loc_542:				; CODE XREF: zFMPrepareNote+Dj zPSGDoNoteOn+4j
	set	1, (ix+zTrackPlaybackControl)
	ret
; End of function zPSGDoNoteOn


; =============== S U B	R O U T	I N E =======================================


zDoFlutterSetValue:				; CODE XREF: PSG_Run+15p
	ld	a, (ix+zTrackVoiceIndex)
	or	a
	ret	z

zDoFlutter:				; CODE XREF: PSG_Run+Fj
	ld	b, (ix+zTrackVolume)
	ld	a, (ix+zTrackVoiceIndex)
	or	a
	jr	z, zPSGUpdateVol
	ld	hl, PSG_Tones
	dec	a
	add	a, a
	ld	e, a
	ld	d, 0
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	add	a, (ix+zTrackVolFlutter)
	ld	l, a
	adc	a, h
	sub	l
	ld	h, a
PSGDoVolFX_Loop:		
	ld	a, (hl)		
	inc	(ix+zTrackVolFlutter)
	or	a
	jp	p, zDoFlutterAdvance
	cp	83h ; '€'
	jr	z, zDoFlutterFullRest
	cp	81h ; '€'
	jr	z, VolEnv_Off
	cp	80h ; '€'
	jr	z, VolEnv_Reset		

zDoFlutterAdvance:				; CODE XREF: zDoFlutterSetValue+26j
	add	a, b
	cp	10h
	jr	c, loc_57B
	ld	a, 0Fh

loc_57B:				; CODE XREF: zDoFlutterSetValue+30j
	ld	b, a
; End of function zDoFlutterSetValue


; =============== S U B	R O U T	I N E =======================================


zPSGUpdateVol:				; CODE XREF: zDoFlutterSetValue+Cj zUpdateFadeout+57p ...
	ld	a, (ix+zTrackPlaybackControl)
	and	6
	ret	nz
	bit	4, (ix+zTrackPlaybackControl)
	jr	nz, loc_592

loc_588:				; CODE XREF: zDoFlutterAdvance+1Aj zDoFlutterAdvance+20j
	ld	a, (ix+zTrackVoiceControl)
	or	b
	add	a, 10h
	ld	(zPSG), a
	ret
; ---------------------------------------------------------------------------

loc_592:				; CODE XREF: zDoFlutterAdvance+Aj
	ld	a, (ix+zTrackResetNoteFill)
	or	a
	jr	z, loc_588
	ld	a, (ix+zTrackSetNoteFill)
	or	a
	jr	nz, loc_588
	ret
; End of function zDoFlutterAdvance
; ---------------------------------------------------------------------------
zDoFlutterFullRest:
	dec	(ix+zTrackVolFlutter)
	jp 	zPSGNoteOff
; ---------------------------------------------------------------------------
VolEnv_Reset:
	ld (ix+zTrackVolFlutter),0
	jp PSGDoVolFX_Loop		
; ---------------------------------------------------------------------------
	
VolEnv_Off:				; CODE XREF: zDoFlutterSetValue+2Bj
	; This just decrements the flutter to keep it in place; no more volume changes in this list
	dec	(ix+zTrackVolFlutter)
	dec	(ix+zTrackVolFlutter)				; Put index back (before final volume value)
	jr	zDoFlutter				; Loop back and update volume 
; ---------------------------------------------------------------------------
; END OF FUNCTION CHUNK	FOR zDoFlutterSetValue

; =============== S U B	R O U T	I N E =======================================


zPSGNoteOff:				; CODE XREF: zNoteFillUpdate+12j ROM:0501j ...
	bit	2, (ix+zTrackPlaybackControl)
	ret	nz
	ld	a, (ix+zTrackVoiceControl)		; Add in the PSG channel selector
	or	a					; Is it an actual PSG channel?
	ret	p					; Branch if not
	or	1Fh					; Set volume to zero on PSG channel
	ld	(zPSG), a				; Silence this channel
	cp	0DFh					; Is this a noise channel?
	ret	nz					; Return if not
	ld	a, 0FFh					; Command to silence PSG3/Noise channel
	ld	(zPSG), a				; Do it
	ret
; End of function zPSGNoteOff	
;                 |a| |1Fh|
; VOL1    0x90	= 100 1xxxx	vol 4b xxxx = attenuation value
; VOL2    0xb0	= 101 1xxxx	vol 4b
; VOL3    0xd0	= 110 1xxxx	vol 4b
	
zSilencePSG:			
	ld	hl, zPSG
	ld	(hl), 9Fh
	ld	(hl), 0BFh
	ld	(hl), 0DFh
	ld	(hl), 0FFh
	ret
; END OF FUNCTION CHUNK	FOR zClearTrackPlaybackMem

; =============== S U B	R O U T	I N E =======================================


zPauseMusic:				; CODE XREF: V_Int+13p
	jp	m, loc_5CD
	cp	2
	ret	z
	ld	(ix+zTrackDataPointerLow),	2
	call	zSilenceFM
	jp	zSilencePSG
; ---------------------------------------------------------------------------

loc_5CD:				; CODE XREF: zPauseMusicj
	ld	(ix+zTrackDataPointerLow),	0
	ld	ix, zSongFMDACStart
	ld	b, (zSongFMDACEnd-zSongFMDACStart)/zTrackSz
	call	sub_5FA
	rst	zBankSwitchToSound	; Now for SFX
	ld	ix, zSFXFMStart
	ld	b, (zSongPSGEnd-zSongPSGStart)/zTrackSz
	call	sub_5FA
	ret
; End of function zPauseMusic


; =============== S U B	R O U T	I N E =======================================


sub_5FA:				; CODE XREF: zPauseMusic+1Cp zPauseMusic+34p ...
	bit	7, (ix+zTrackPlaybackControl)
	jr	z, loc_619
	bit	2, (ix+zTrackPlaybackControl)
	jr	nz, loc_619
	push	bc
	ld	a, (ix+zTrackVoiceIndex)
	call	zSetVoiceMusic
	pop	bc

loc_619:				; CODE XREF: sub_5FA+4j sub_5FA+Aj
	ld	de, zTrackSz	; '*'
	add	ix, de
	djnz	sub_5FA
	ret
; End of function sub_5FA


; =============== S U B	R O U T	I N E =======================================


zCycleQueue:				; CODE XREF: V_Int+36p
	ld	a, (zQueueToPlay)
	cp	80h ; '€'
	ret	nz
	ld	hl, zSFXToPlay
	ld	a, (zSFXPriorityVal)
	ld	c, a
	ld	b, 3

loc_630:				; CODE XREF: zCycleQueue:loc_65Bj
	ld	a, (hl)
	ld	e, a
	ld	(hl), 0
	inc	hl
	cp	FirstSong ; ''
	jr	c, loc_65B
	sub	0A0h ; ' '
	jr	nc, loc_642
	ld	a, e
	ld	(zQueueToPlay), a
	ret
; ---------------------------------------------------------------------------

loc_642:				; CODE XREF: zCycleQueue+1Aj
	push	hl
	add	a,SFX_Priorities&0FFh	; a = low byte of pointer to SFX priority
	ld	l,a					; l = low byte of pointer to SFX priority
	adc	a,(SFX_Priorities&0FF00h)>>8	; a = low byte of pointer to SFX priority + high byte of same pointer
	sub	l
	ld	h, a
	ld	a, (hl)
	cp	c
	jr	c, loc_653
	ld	c, a
	ld	a, e
	ld	(zQueueToPlay), a

loc_653:				; CODE XREF: zCycleQueue+2Bj
	pop	hl
	ld	a, c
	or	a
	ret	m
	ld	(zSFXPriorityVal), a
	ret
; ---------------------------------------------------------------------------

loc_65B:				; CODE XREF: zCycleQueue+16j
	djnz	loc_630
	ret
; End of function zCycleQueue


; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to play
; ---------------------------------------------------------------------------

zPlaySoundByIndex:				; CODE XREF: V_Int+3Ep

	or	a
	jp	z, zClearTrackPlaybackMem		
	cp	FirstSong-1
	ret	c		; return if id is less than the first music id
	ld	(ix+zTrackVoiceIndex),	80h ; '€'
	
	cp	0A0h ; ' '
	jp	c, zPlayMusic
	cp	0A0h ; ' '
	ret	c
	cp	0E1h ; 'á'
	jp	c, loc_895
	cp	0F8h ; 'ù'
	ret	c
	cp	0FEh ; 'þ'
	ret	nc
	sub	0F8h ; 'ù'
	ld	c, a
	add	a, a
	add	a, c
	ld	(loc_681+1), a

loc_681:				; CODE XREF: zPlaySoundByIndex:loc_681j
				; DATA XREF: zPlaySoundByIndex+20w
	jr	$
; ---------------------------------------------------------------------------
	jp	zStopSoundEffects ; sound test index 78
; ---------------------------------------------------------------------------
	jp	zFadeOutMusic	; 79
; ---------------------------------------------------------------------------		
	jp	zPlaySegaSound	;7A
; ---------------------------------------------------------------------------		
	jp	zSpeedUpMusic 	;7B
; ---------------------------------------------------------------------------		
	jp	zSlowDownMusic
; ---------------------------------------------------------------------------		
	jp	zClearTrackPlaybackMem
; ---------------------------------------------------------------------------
zPlaySegaSound:				; CODE XREF: zPlaySoundByIndex+29j
	; reset panning (don't want Sega sound playing on only one speaker)
	ld	a,0B6h			; Set Panning / AMS / FMS
	ld	c,0C0h			; default Panning / AMS / FMS settings (only stereo L/R enabled)
	rst	zWriteFMII		; Set it!

	ld	a, 2Bh ; '+'
	ld	c, 80h ; '€'
	rst	zWriteFMI ; Sega sound
	
	ld	a,zmake68kBank(Snd_Sega)	; Want Sega sound
	call	zBankSwitch
	
	ld	hl, 8000h
	ld	de, 30BAh
	ld	a, 2Ah ; '*'
	ld	(zYM2612_A0), a
	ld	c, 80h ; '€'

loc_6B8:				; CODE XREF: zPlaySoundByIndex+77j
	ld	a, (hl)
	ld	(zYM2612_D0), a
	inc	hl
	nop
	ld	b, 0Ch

loc_6C0:				; CODE XREF: zPlaySoundByIndex:loc_6C0j
	djnz	$
	ld	a, (zQueueToPlay)
	cp	c
	jr	nz, loc_6D8
	ld	a, (hl)
	ld	(zYM2612_D0), a
	inc	hl
	nop
	ld	b, 0Ch

loc_6D0:				; CODE XREF: zPlaySoundByIndex:loc_6D0j
	djnz	$
	dec	de
	ld	a, d
	or	e
	jp	nz, loc_6B8

loc_6D8:				; CODE XREF: zPlaySoundByIndex+68j
	call	SetMusicBanks				; set the bank address
	ld	a, (zDACEnabled)
	ld	c, a
	ld	a, 2Bh ; '+'
	rst	zWriteFMI
	ret
; ---------------------------------------------------------------------------
zPlayMusicCredits:
	ld	a, 23h							; Credits music is the last entry on the music table
	push	af							; Save af
	call	zStopSoundEffects		; Stop all sounds before starting BGM
	pop	af		
	jp	zClearSoundEffects				; Continue as music
; ---------------------------------------------------------------------------

zPlayMusic:				; CODE XREF: zPlaySoundByIndex+Bj
	push	af
	call	zStopSoundEffects		; Stop all sounds before starting BGM
	pop	af
	ld	(zCurSong), a		
	cp	MusID_ExtraLife ; '˜'
	jr	nz, zClearSoundEffects	
	ld	a, (z1upPlaying)
	or	a
	jr	nz, zBGMLoad
	ld	ix, zTracksSongStart
	ld	de, zTrackSz	; '*'
	ld	b, (zTracksSongEnd-zTracksSongStart)/zTrackSz

loc_6F9:				; CODE XREF: zPlaySoundByIndex+A1j
	res	2, (ix+zTrackPlaybackControl)
	add	ix, de
	djnz	loc_6F9
	ld	ix, zTracksSFXStart
	ld	b, (zTracksSFXEnd-zTracksSFXStart)/zTrackSz

loc_707:				; CODE XREF: zPlaySoundByIndex+AFj
	res	7, (ix+zTrackPlaybackControl)
	add	ix, de
	djnz	loc_707
	ld	de, z1upBackup
	ld	hl, z1upBackupSourceStart
	ld	bc, (z1upBackupSourceEnd-z1upBackupSourceStart)-1
	ldir
	ld	a, 80h ; '€'
	ld	(z1upPlaying), a
	xor	a
	ld	(zSFXPriorityVal), a
	jr	zBGMLoad
; ---------------------------------------------------------------------------

zClearSoundEffects:				; CODE XREF: zPlaySoundByIndex+8Aj
	xor	a
	ld	(z1upPlaying), a
	ld	(zFadeInCounter), a

zBGMLoad:				; CODE XREF: zPlaySoundByIndex+90j zPlaySoundByIndex+C5j
	call	sub_AAE
	ld	a, (zCurSong)
	sub	FirstSong ; ''
	ld	e, a
	ld	d, 0
zBankList:		
	ld	hl, zSong_Banklist
	add	hl, de
	ld	a, (hl)
	ld	(zMusicBankNumber),a				; save as bank offset to read 0000 - 7FFF or 8000 - FFFF
zMusicList:		
	ld	hl, zMusicPlaylist
	add	hl, de
	add	hl, de
	push	hl
	call	SetMusicBanks				; set the bank address
	pop	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
Track_Init:		
	push	de
	pop	ix
	ld	e, (ix+0)
	ld	d, (ix+1)
	ld	(zVoiceTblPtr), de
	ld	a, (ix+5)
	ld	(zTempoMod), a
	ld	b, a
	ld	a, (zSpeedUpFlag)
	or	a
	ld	a, b
	jr	z, loc_779
	ld	a, (zTempoTurbo)

loc_779:				; CODE XREF: zPlaySoundByIndex+116j
	ld	(zCurrentTempo), a
	ld	(zTempoTimeout), a
	ld	a,5
	ld	(zPALUpdTick),a		; reset PAL update tick to 5 (update immediately)		
	push	ix
	pop	hl
	ld	de, 6
	add	hl, de
	ld	a, (ix+2)
	or	a
	jp	z, loc_7F9
	ld	b, a
	push	iy
	ld	iy, zSongFMDACStart
	ld	c, (ix+4)
	ld	de, zFMDACInitBytes

loc_79A:				; CODE XREF: zPlaySoundByIndex+16Ej
	set	7, (iy+zTrackPlaybackControl)
	ld	a, (de)
	inc	de
	ld	(iy+zTrackVoiceControl),	a
	ld	(iy+zTrackTempoDivider),	c
	ld	(iy+zTrackStackPointer), zTrackStack ;	'*'
	ld	(iy+zTrackAMSFMSPan),	0C0h ; 'À'
	ld	(iy+zTrackDurationTimeout), 1
	push	de
	push	bc
	ld	a, iyl
	add	a, 3
	ld	e, a
	adc	a, iyu
	sub	e
	ld	d, a
	ld	bc,4
	ldir						; while (bc-- > 0) *de++ = *hl++; (copy track address, default key offset, default volume)
	ld	de, zTrackSz	; '*'
	add	iy, de
	pop	bc
	pop	de
	djnz	loc_79A
	pop	iy
	ld	a, (ix+2)
	cp	7
	jr	nz, loc_7DB
	xor	a
	jr	loc_7F3
; ---------------------------------------------------------------------------

loc_7DB:				; CODE XREF: zPlaySoundByIndex+177j
	ld	a, 42h ; 'B'
	ld	c, 0FFh
	ld	b, 4

loc_7E6:				; CODE XREF: zPlaySoundByIndex+18Bj
	rst	zWriteFMII
	add	a, 4
	djnz	loc_7E6
	ld	a, 0B6h	; '¶'
	ld	c, 0C0h	; 'À'
	rst	zWriteFMII
	ld	a, 80h ; '€'

loc_7F3:				; CODE XREF: zPlaySoundByIndex+17Bj
	ld	c, a
	ld	(zDACEnabled), a
	ld	a, 2Bh ; '+'
	rst	zWriteFMI

loc_7F9:				; CODE XREF: zPlaySoundByIndex+12Cj
	ld	a, (ix+3)
	or	a
	jp	z, loc_845
	ld	b, a
	push	iy
	ld	iy, zSongPSGStart
	ld	c, (ix+4)
	ld	de, zPSGInitBytes

loc_80D:				; CODE XREF: zPlaySoundByIndex+1E3j
	set	7, (iy+zTrackPlaybackControl)
	ld	a, (de)
	inc	de
	ld	(iy+zTrackVoiceControl),	a
	ld	(iy+zTrackTempoDivider),	c
	ld	(iy+zTrackStackPointer), zTrackStack ;	'*'
	ld	(iy+zTrackDurationTimeout), 1
	push	de
	push	bc
	ld	a, iyl
	add	a, 3
	ld	e, a
	adc	a, iyu
	sub	e
	ld	d, a
	ld	bc,4
	ldir						; while (bc-- > 0) *de++ = *hl++; (copy track address, default key offset, default volume)
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	(iy+8),	a
	ld	de, zTrackSz	; '*'
	add	iy, de
	pop	bc
	pop	de
	djnz	loc_80D
	pop	iy

loc_845:				; CODE XREF: zPlaySoundByIndex+19Fj
	ld	ix, zTracksSFXStart
	ld	b, (zTracksSFXEnd-zTracksSFXStart)/zTrackSz
	ld	de, zTrackSz	; '*'

loc_84E:				; CODE XREF: zPlaySoundByIndex+214j
	bit	7, (ix+zTrackPlaybackControl)
	jr	z, loc_870
	ld	a, (ix+zTrackVoiceControl)
	or	a
	jp	m, loc_860
	sub	2
	add	a, a
	jr	loc_866
; ---------------------------------------------------------------------------

loc_860:				; CODE XREF: zPlaySoundByIndex+1FAj
	rra
	rra
	rra
	rra
	and	0Fh

loc_866:				; CODE XREF: zPlaySoundByIndex+200j
	add	a, zMusicTrackOffs&0FFh ; '‰'
	ld	(loc_86B+1), a

loc_86B:				; DATA XREF: zPlaySoundByIndex+20Aw
	ld	hl, (zMusicTrackOffs)
	set	2, (hl)

loc_870:				; CODE XREF: zPlaySoundByIndex+1F4j
	add	ix, de
	djnz	loc_84E
	ld	ix, zSongFMStart
	ld	b, (zSongFMEnd-zSongFMStart)/zTrackSz

loc_87A:				; CODE XREF: zPlaySoundByIndex+221j
	call	sub_BAC
	add	ix, de
	djnz	loc_87A
	ld	b, (zSongPSGEnd-zSongPSGStart)/zTrackSz

loc_883:				; CODE XREF: zPlaySoundByIndex+22Aj
	call	zPSGNoteOff
	add	ix, de
	djnz	loc_883
	ret
; ---------------------------------------------------------------------------
zFMDACInitBytes:
	db 6
	db 0
	db 1
	db 2
	db 4
	db 5
	db 6
zPSGInitBytes:
	db 80h
	db 0A0h
	db 0C0h
; ---------------------------------------------------------------------------

loc_895:				; CODE XREF: zPlaySoundByIndex+13j
	ld	c, a
	ld	a, (ix+zTrackModulationPtrLow)
	or	(ix+zTrackDataPointerHigh)
	or	(ix+zTrackFreqHigh)
	jp	nz, zloc_KillSFXPrio
	ld	a, c
	cp	0B5h ; 'µ'
	jr	nz, zPlaySound_CheckGloop
	ld	a, (byte_11AB)
	or	a
	jr	nz, loc_8AF
	ld	c, 0CEh	; 'Î'

loc_8AF:				; CODE XREF: zPlaySoundByIndex+24Dj
	cpl
	ld	(byte_11AB), a
	jp	loc_8C5
; ---------------------------------------------------------------------------

zPlaySound_CheckGloop:				; CODE XREF: zPlaySoundByIndex+247j
	cp	0A7h ; '§'
	jr	nz, loc_8C5
	ld	a, (byte_11AC)
	or	a
	ret	nz
	ld	a, 80h ; '€'
	ld	(byte_11AC), a

loc_8C5:				; CODE XREF: zPlaySoundByIndex+255j zPlaySoundByIndex+25Bj
	rst	zBankSwitchToSound
	ld	hl, 8000h
	ld	a, c
	sub	0A0h ; ' '
	add	a, a
	ld	e, a
	ld	d, 0
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	(loc_967+1), de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl

loc_8EF:				; CODE XREF: zPlaySoundByIndex+314j
	push	bc
	xor	a
	ld	(loc_95E+1), a
	push	hl
	inc	hl
	ld	a, (hl)
	or	a
	jp	m, loc_901
	sub	2
	add	a, a
	jp	loc_91A
; ---------------------------------------------------------------------------

loc_901:				; CODE XREF: zPlaySoundByIndex+29Aj
	ld	(loc_95E+1), a
	cp	0C0h ; 'À'
	jr	nz, loc_914
	push	af
	or	1Fh
	ld	(zPSG), a
	xor	20h ; ' '
	ld	(zPSG), a
	pop	af

loc_914:				; CODE XREF: zPlaySoundByIndex+2A8j
	rra
	rra
	rra
	rra
	and	0Fh

loc_91A:				; CODE XREF: zPlaySoundByIndex+2A0j
	add	a, zMusicTrackOffs&0FFh ; '‰'
	ld	(loc_91F+1), a

loc_91F:				; DATA XREF: zPlaySoundByIndex+2BEw
	ld	hl, (zMusicTrackOffs)
	set	2, (hl)
	add	a, zSFXTrackOffs-zMusicTrackOffs
	ld	(loc_929+2), a

loc_929:				; DATA XREF: zPlaySoundByIndex+2C8w
	ld	ix, (zSFXTrackOffs)
	ld	e, ixl
	ld	d, ixu
	push	de
	ld	l, e
	ld	h, d
	ld	(hl), 0
	inc	de
	ld	bc, 29h	; ')'
	ldir
	pop	de
	pop	hl
	ldi
	ldi
	pop	bc
	push	bc
	ld	(ix+zTrackTempoDivider),	c
	ld	(ix+zTrackDurationTimeout), 1
	ld	(ix+zTrackStackPointer), zTrackStack	; '*'
	ld	a, e
	add	a, 1
	ld	e, a
	adc	a, d
	sub	e
	ld	d, a
	ld	bc,4
	ldir						; while (bc-- > 0) *de++ = *hl++; (copy track address, default key offset)

loc_95E:				; DATA XREF: zPlaySoundByIndex+293w
				; zPlaySoundByIndex:loc_901w
	ld	a, 0
	or	a
	jr	nz, loc_970
	ld	(ix+zTrackAMSFMSPan),	0C0h ; 'À'

loc_967:				; DATA XREF: zPlaySoundByIndex+289w
	ld	de, 0
	ld	(ix+zTrackCSFXPointerLow), e
	ld	(ix+zTrackCSFXPointerHigh), d

loc_970:				; CODE XREF: zPlaySoundByIndex+303j
	pop	bc
	dec	b
	jp	nz, loc_8EF
	jp	SetMusicBanks				; set the bank address
; End of function zPlaySoundByIndex


; =============== S U B	R O U T	I N E =======================================


zloc_KillSFXPrio:				; CODE XREF: zPlaySoundByIndex+241j zStopSoundEffectsp
	xor	a
	ld	(zSFXPriorityVal), a
	ret
; End of function zloc_KillSFXPrio


; =============== S U B	R O U T	I N E =======================================


zStopSoundEffects:				; CODE XREF: zPlaySoundByIndex:zFadeOutMusicp
	call	zloc_KillSFXPrio
	ld	ix, zTracksSFXStart
	ld	b, (zTracksSFXEnd-zTracksSFXStart)/zTrackSz

loc_986:				; CODE XREF: zStopSoundEffects+76j
	push	bc
	bit	7, (ix+zTrackPlaybackControl)
	jp	z, loc_9EC
	res	7, (ix+zTrackPlaybackControl)
	ld	a, (ix+zTrackVoiceControl)
	or	a
	jp	m, loc_9BF
	push	af
	call	sub_BAC
	pop	af
	push	ix
	sub	2
	add	a, a
	add	a, zMusicTrackOffs&0FFh ; '‰'
	ld	(loc_9A8+2), a

loc_9A8:				; DATA XREF: zStopSoundEffects+28w
	ld	ix, (zMusicTrackOffs)
	res	2, (ix+zTrackPlaybackControl)
	set	1, (ix+zTrackPlaybackControl)
	ld	a, (ix+zTrackVoiceIndex)
	call	zSetVoiceMusic
	pop	ix
	jp	loc_9EC
; ---------------------------------------------------------------------------

loc_9BF:				; CODE XREF: zStopSoundEffects+19j
	push	af
	call	zPSGNoteOff
	pop	af
	push	ix
	rra
	rra
	rra
	rra
	and	0Fh
	add	a, zMusicTrackOffs&0FFh ; '‰'
	ld	(loc_9D1+2), a

loc_9D1:				; DATA XREF: zStopSoundEffects+51w
	ld	ix, (zMusicTrackOffs)
	res	2, (ix+zTrackPlaybackControl)
	set	1, (ix+zTrackPlaybackControl)
	ld	a, (ix+zTrackVoiceControl)
	cp	0E0h ; 'à'
	jr	nz, loc_9EA
	ld	a, (ix+zTrackPSGNoise)
	ld	(zPSG), a

loc_9EA:				; CODE XREF: zStopSoundEffects+65j
	pop	ix

loc_9EC:				; CODE XREF: zStopSoundEffects+Ej zStopSoundEffects+3Fj
	ld	de, zTrackSz	; '*'
	add	ix, de
	pop	bc
	dec	b
	djnz	loc_986
	ret
; End of function zStopSoundEffects

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR zPlaySoundByIndex

zFadeOutMusic:				; CODE XREF: zPlaySoundByIndex+25j
	call	zStopSoundEffects
	ld	a, 3
	ld	(zFadeOutDelay), a
	ld	a, 28h ; '('
	ld	(zFadeOutCounter), a
	xor	a
	ld	(zSongDAC+zTrackPlaybackControl), a
	ld	(zSpeedUpFlag), a
	ret
; END OF FUNCTION CHUNK	FOR zPlaySoundByIndex

; =============== S U B	R O U T	I N E =======================================


zUpdateFadeout:				; CODE XREF: V_Int+23p
	ld	a, (zFadeOutDelay)
	or	a
	jr	z, loc_A15
	dec	(ix+zTrackKeyOffset)
	ret
; ---------------------------------------------------------------------------

loc_A15:				; CODE XREF: zUpdateFadeout+4j
	dec	(ix+zTrackDataPointerHigh)
	jp	z, zClearTrackPlaybackMem
	ld	(ix+zTrackKeyOffset),	3
	push	ix
	ld	ix, zSongFMStart
	ld	b, (zSongFMEnd-zSongFMStart)/zTrackSz

loc_A27:				; CODE XREF: zUpdateFadeout+38j
	bit	7, (ix+zTrackPlaybackControl)
	jr	z, loc_A3E
	inc	(ix+zTrackVolume)
	jp	p, loc_A39
	res	7, (ix+zTrackPlaybackControl)
	jr	loc_A3E
; ---------------------------------------------------------------------------

loc_A39:				; CODE XREF: zUpdateFadeout+25j
	push	bc
	call	FM_ChangeVolume
	pop	bc

loc_A3E:				; CODE XREF: zUpdateFadeout+20j zUpdateFadeout+2Cj
	ld	de, zTrackSz	; '*'
	add	ix, de
	djnz	loc_A27
	ld	b, (zSongPSGEnd-zSongPSGStart)/zTrackSz

loc_A47:				; CODE XREF: zUpdateFadeout+60j
	bit	7, (ix+zTrackPlaybackControl)
	jr	z, loc_A66
	inc	(ix+zTrackVolume)
	ld	a, 10h
	cp	(ix+zTrackVolume)
	jp	nc, loc_A5E
	res	7, (ix+zTrackPlaybackControl)
	jr	loc_A66
; ---------------------------------------------------------------------------

loc_A5E:				; CODE XREF: zUpdateFadeout+4Aj
	push	bc
	ld	b, (ix+zTrackVolume)
	ld	a,(ix+zTrackVoiceIndex)
	or	a			; Is this track using volume envelope 0 (no envelope)?
	call	z,zDoFlutterAdvance	; If so, update volume (this code is only run on envelope 1+, so we need to do it here for envelope 0)
	pop	bc

loc_A66:				; CODE XREF: zUpdateFadeout+40j zUpdateFadeout+51j
	ld	de, zTrackSz	; '*'
	add	ix, de
	djnz	loc_A47
	pop	ix
	ret
; End of function zUpdateFadeout


; =============== S U B	R O U T	I N E =======================================


zSilenceFM:				; CODE XREF: zPauseMusic+Ap zClearTrackPlaybackMem+20p ...
	ld	a, 28h ; '('
	ld	b, 3

loc_A74:				; CODE XREF: zSilenceFM+Aj
	ld	c, b
	dec	c
	rst	zWriteFMI
	set	2, c
	rst	zWriteFMI
	djnz	loc_A74
	ld	a, 30h ; '0'
	ld	c, 0FFh
	ld	b, 60h ; '`'

loc_A82:				; CODE XREF: zSilenceFM+15j
	rst	zWriteFMI
	rst	zWriteFMII
	inc	a
	djnz	loc_A82
	ret
; End of function zSilenceFM
; =============== S U B	R O U T	I N E =======================================


sub_AAE:				; CODE XREF: zPlaySoundByIndex:zBGMLoadp
	ld	ix, zVariablesStart
	ld	b, (ix+zTrackPlaybackControl)
	ld	c, (ix+zTrackModulationPtrLow)
	push	bc
	ld	b, (ix+zTrackModulationSpeed)
	ld	c, (ix+zTrackResetNoteFill)
	push	bc
	ld	b, (ix+zTrackVolFlutter)
	ld	c, (ix+zTrackStackPointer)
	push	bc
	ld	hl, z1upBackupSourceStart
	ld	de, z1upBackupSourceStart+1
	ld	(hl), 0
	ld	bc, (z1upBackupSourceEnd-z1upBackupSourceStart)-2
	ldir
	pop	bc
	ld	(ix+zTrackVolFlutter),	b
	ld	(ix+zTrackStackPointer), c
	pop	bc
	ld	(ix+zTrackModulationSpeed), b
	ld	(ix+zTrackResetNoteFill), c
	pop	bc
	ld	(ix+zTrackPlaybackControl),	b
	ld	(ix+zTrackModulationPtrLow), c
	ld	a, 80h ; '€'
	ld	(zQueueToPlay), a
	call	zSilenceFM
	jp	zSilencePSG
; End of function sub_AAE


; =============== S U B	R O U T	I N E =======================================


sub_AF4:				; CODE XREF: V_Int+1Cp
	ld	a, (zCurrentTempo)
	ld	(zTempoTimeout), a
	ld	hl, zTracksSongStart+zTrackDurationTimeout
	ld	de, zTrackSz	; '*'
	ld	b, (zTracksSongEnd-zTracksSongStart)/zTrackSz

loc_B02:				; CODE XREF: sub_AF4+10j
	inc	(hl)
	add	hl, de
	djnz	loc_B02
	ret
; End of function sub_AF4

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR zPlaySoundByIndex

zSpeedUpMusic:				; CODE XREF: zPlaySoundByIndex+2Dj
	ld	b, 80h ; '€'
	ld	a, (z1upPlaying)
	or	a
	ld	a,(zTempoTurbo)
	jr	z, zSetTempo
	jr	loc_B2C
; ---------------------------------------------------------------------------

zSlowDownMusic:				; CODE XREF: zPlaySoundByIndex+31j
	ld	b, 0
	ld	a, (z1upPlaying)
	or	a
	ld	a, (zTempoMod)
	jr	z, zSetTempo
	jr	loc_B2C
; ---------------------------------------------------------------------------

zSetTempo:				; CODE XREF: zPlaySoundByIndex+4B2j zPlaySoundByIndex+4BFj
	ld	(zCurrentTempo), a
	ld	(zTempoTimeout), a
	ld	a, b
	ld	(zSpeedUpFlag), a
	ret
; ---------------------------------------------------------------------------

loc_B2C:				; CODE XREF: zPlaySoundByIndex+4B4j zPlaySoundByIndex+4C1j
	ld	(1E39h), a
	ld	(1E38h), a
	ld	a, b
	ld	(1E4Bh), a
	ret
; END OF FUNCTION CHUNK	FOR zPlaySoundByIndex

; =============== S U B	R O U T	I N E =======================================


zUpdateFadeIn:				; CODE XREF: V_Int+2Ap
	ld	a, (zFadeInDelay)
	or	a
	jr	z, loc_B41
	dec	(ix+zTrackSetNoteFill)
	ret
; ---------------------------------------------------------------------------

loc_B41:				; CODE XREF: zUpdateFadeIn+4j
	ld	a, (zFadeInCounter)
	or	a
	jr	nz, loc_B54
	ld	a, (zSongDAC+zTrackPlaybackControl)
	and	0FBh ; 'û'
	ld	(zSongDAC+zTrackPlaybackControl), a
	xor	a
	ld	(zFadeInFlag), a
	ret
; ---------------------------------------------------------------------------

loc_B54:				; CODE XREF: zUpdateFadeIn+Ej
	dec	(ix+zTrackResetNoteFill)
	ld	(ix+zTrackSetNoteFill), 2
	push	ix
	ld	ix, zSongFMStart
	ld	b, (zSongFMEnd-zSongFMStart)/zTrackSz

loc_B63:				; CODE XREF: zUpdateFadeIn+3Fj
	bit	7, (ix+zTrackPlaybackControl)
	jr	z, loc_B71
	dec	(ix+zTrackVolume)
	push	bc
	call	FM_ChangeVolume
	pop	bc

loc_B71:				; CODE XREF: zUpdateFadeIn+30j
	ld	de, zTrackSz	; '*'
	add	ix, de
	djnz	loc_B63
	ld	b, (zSongPSGEnd-zSongPSGStart)/zTrackSz

loc_B7A:				; CODE XREF: zUpdateFadeIn+60j
	bit	7, (ix+zTrackPlaybackControl)
	jr	z, loc_B92
	dec	(ix+zTrackVolume)
	ld	a, (ix+zTrackVolume)
	cp	10h
	jr	c, loc_B8C
	ld	a, 0Fh

loc_B8C:				; CODE XREF: zUpdateFadeIn+51j
	push	bc
	ld	b, a
	ld	a,(ix+zTrackVoiceIndex)
	or	a			; Is this track using volume envelope 0 (no envelope)?
	call	z,zDoFlutterAdvance	; If so, update volume (this code is only run on envelope 1+, so we need to do it here for envelope 0)
	pop	bc

loc_B92:				; CODE XREF: zUpdateFadeIn+47j
	ld	de, zTrackSz	; '*'
	add	ix, de
	djnz	loc_B7A
	pop	ix
	ret
; End of function zUpdateFadeIn

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR FM_Run

zFMNoteOn:				; CODE XREF: FM_Run+Fj
	ld	a, (ix+zTrackPlaybackControl)
	and	6
	ret	nz
	ld	a, (ix+zTrackVoiceControl)
	or	0F0h ; 'ð'
	ld	c, a
	ld	a, 28h ; '('
	rst	zWriteFMI
	ret
; END OF FUNCTION CHUNK	FOR FM_Run

; =============== S U B	R O U T	I N E =======================================


sub_BAC:				; CODE XREF: FM_Tracker+17p zNoteFillUpdate+15j ...
	ld	a, (ix+zTrackPlaybackControl)
	and	14h
	ret	nz
	ld	a, 28h ; '('
	ld	c, (ix+zTrackVoiceControl)
	rst	zWriteFMI
	ret
; End of function sub_BAC


; =============== S U B	R O U T	I N E =======================================
; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to set the bank address to 68k offset 0F0000 or 0F8000
; ---------------------------------------------------------------------------

SetMusicBanks:
	ld	a, (zSongBank)					; Get bank ID for music
zBankSwitch:
	ld	hl,zBankRegister
	ld	(hl), a
	rept 7
		rrca
		ld	(hl), a
	endm
	xor	a
	ld	(hl), a
	ret
; End of function zBankSwitch

; ===========================================================================

; =============== S U B	R O U T	I N E =======================================
; ---------------------------------------------------------------------------
; Flags E0 - F9
; ---------------------------------------------------------------------------

SMPS_Flags:
	sub	0E0h					; subtract E0 from value
	ld	c,a
	add	a,a					; multiply by 4
	add	a,c					; multiply by 6
	ld	(TRF_Jump+001h),a			; change the jump offset
	ld	a,(hl)					; load next byte in tracker
	inc	hl					; increase to next byte

TRF_Jump:
	jr	TRF_Jump				; jump to correct jump instruction

; ---------------------------------------------------------------------------
; Jump list for flags E0 - F9
; ---------------------------------------------------------------------------

	jp	cfPanningAMSFMS		; E0: Panning
	jp	cfAlterNotes		; E1: Pitch Bend
	jp	cfFadeInToPrevious	; E2: Fade to Previous Song. Used for 1 Up mostly. Formerly E4		
	jp	cfSilenceStopTrack	; E3: Silence FM Channel. Mostly unused.
	jp	cfSetVolume		; E4 Set volume of channel	; Formerly E6
	jp	cfSetTempoDivider	; E5: Change the Tempo Divider 
	jp	cfChangeVolume		; E6: Change volume of channel
	jp	cfPreventAttack		; E7: prevent next note from attacking 
	jp	cfNoteFill		; E8: Fills note
	jp	cfSetCommunication	; E9: Unused; Ristar specific byte. Dead Code		
	jp	cfSetTempo		; EA: Set Tempo
	jp	cfSetTempoMod		; EB: Change Tempo Modifier for all channels
	jp	cfChangePSGVolume	; EC: 
	jp	cfSetKey		; ED:
	jp	cfSendFMI		; EE: FM 1 Operators 3 and 4, second amplitude high, release rate mute. Formerly F9
	jp	cfSetVoice		; EF: 
	jp	cfModulation		; F0: Set modulation
	jp	cfAlterModulation	; F1: Enable modulation
	jp	cfStopTrack		; F2: Stop Track
	jp	cfSetPSGNoise		; F3: PSG Noise
	jp	cfSetModulation		; F4: Enable modulation. Formerly F1
	jp	cfSetPSGTone		; F5: Set PSG Tone
	jp	cfJumpTo		; F6: Branch instruction
	jp	cfRepeatAtPos		; F7: Loop
	jp	cfJumpToGosub		; F8: Call instruction
	jp	cfJumpReturn		; F9: cfJumpReturn. Formally E3
	jp	cfDisableModulation	; FA: Disable modulation. Formerly F4
	jp	cfAddKey		; FB: Add key to channel. Formerly E9
	jp	cfClearPush		; FC: Formerly ED
	jp	cfClearPush		; FD: Formerly ED
	jp	cfClearPush		; FE: Formerly ED
	jp	cfSetVolume2		; FF: Formerly ED
; ===========================================================================
; ---------------------------------------------------------------------------
; Flags E0 - Panning
; ---------------------------------------------------------------------------

cfPanningAMSFMS:
	bit	7,(ix+zTrackVoiceControl)				; is the channel a PSG channel?
	ret	m					; if so, return
	ld	c,a					; store new pan value in c
	ld	a,(ix+zTrackAMSFMSPan)				; load current pan value and LFO settings
	and	037h					; clear the current pan value
	or	c					; save new pan value
	ld	(ix+zTrackAMSFMSPan),a				; save back to channel RAM
	bit	2,(ix+zTrackPlaybackControl)
	ret	nz
	ld	c,a					; save new value to c
	ld	a,(ix+zTrackVoiceControl)				; load channel ID
	and	003h					; get only ID
	add	a,0B4h					; add to correct channel's pan address
	rst	WriteYM2612				; save to YM2612
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag E1 - 
; ---------------------------------------------------------------------------

cfAlterNotes:
	ld	(ix+zTrackFreqDisplacement),a
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag E2 - 
; ---------------------------------------------------------------------------

cfSetCommunication:
	ld	(zCommunication),a
	ret						; return

; ===========================================================================
cfSilenceStopTrack:
	call	cfSendFMI
	jp	cfStopTrack
	ret
; ---------------------------------------------------------------------------
; Flag E3 - 
; ---------------------------------------------------------------------------

cfJumpReturn:
	ld	c,(ix+zTrackStackPointer)
	ld	b,0
	push	ix
	pop	hl
	add	hl,bc
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	inc	c
	inc	c
	ld	(ix+zTrackStackPointer),c
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag E4 - 
; ---------------------------------------------------------------------------

cfFadeInToPrevious:				; CODE XREF: ROM:0BFAj
	ld	hl, z1upBackup
	ld	de, z1upBackupSourceStart
	ld	bc, (z1upBackupSourceEnd-z1upBackupSourceStart)-1
	ldir
	call	SetMusicBanks				; set the bank address
	ld	a, (zSongDAC+zTrackPlaybackControl)
	or	4
	ld	(zSongDAC+zTrackPlaybackControl), a
	ld	a, (zFadeInCounter)
	ld	c, a
	ld	a, 28h ; '('
	sub	c
	ld	c, a
	ld	b, (zSongFMEnd-zSongFMStart)/zTrackSz
	ld	ix, zSongFMStart

loc_CAF:				; CODE XREF: ROM:0CD3j
	bit	7, (ix+zTrackPlaybackControl)
	jr	z, loc_CCE
	set	1, (ix+zTrackPlaybackControl)
	ld	a, (ix+zTrackVolume)
	add	a, c
	ld	(ix+zTrackVolume),	a
	bit	2, (ix+zTrackPlaybackControl)
	jr	nz, loc_CCE
	push	bc
	ld	a, (ix+zTrackVoiceIndex)
	call	zSetVoiceMusic
	pop	bc

loc_CCE:				; CODE XREF: ROM:0CB3j	ROM:0CC4j
	ld	de, zTrackSz	; '*'
	add	ix, de
	djnz	loc_CAF
	ld	b, (zSongPSGEnd-zSongPSGStart)/zTrackSz

loc_CD7:				; CODE XREF: ROM:0CF0j
	bit	7, (ix+zTrackPlaybackControl)
	jr	z, loc_CEB
	set	1, (ix+zTrackPlaybackControl)
	call	zPSGNoteOff
	ld	a, (ix+zTrackVolume)
	add	a, c
	ld	(ix+zTrackVolume),	a
	; Restore PSG noise type
	ld	a,(ix+zTrackVoiceControl)
	cp	0E0h				; Is this the Noise Channel?
	jr	nz,+				; If not, branch
	ld	a,(ix+zTrackPSGNoise)
	ld	(zPSG),a			; Restore Noise setting

loc_CEB:				; CODE XREF: ROM:0CDBj
	ld	de, zTrackSz	; '*'
	add	ix, de
	djnz	loc_CD7
	ld	a, 80h ; '€'
	ld	(zFadeInFlag), a
	ld	a, 28h ; '('
	ld	(zFadeInCounter), a
	xor	a
	ld	(z1upPlaying), a
	ld	a, (zDACEnabled)
	ld	c, a
	ld	a, 2Bh ; '+'
	rst	zWriteFMI
	pop	bc
	pop	bc
	pop	bc
	jp	zUpdateDAC

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag E5 - 
; ---------------------------------------------------------------------------

cfSetTempoDivider:
	ld	(ix+zTrackTempoDivider),a
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag E6 - Volume change
; ---------------------------------------------------------------------------
cfSetVolume:
	add	a,(ix+zTrackVolume)				; add current volume to change
	ld	(ix+zTrackVolume),a				; save new volume
	jp	FM_ChangeVolume				; write volume to the YM2612
; ===========================================================================
cfSetVolume2:
	bit	7, (ix+zTrackVoiceControl)		; Is this a PSG channel?
	jr	z, +							; Branch if not
	; The following code gets bits 3, 4, 5 and 6 from the parameter byte,
	; puts them in positions 0 to 3 and inverts them, discarding all other
	; bits in the parameter byte.
	; Shift the parameter byte 3 bits to the right
	srl	a
	srl	a
	srl	a
	xor	0Fh								; Invert lower nibble's bits
	and	0Fh								; Clear out high nibble
	jp	zStoreTrackVolume
; ---------------------------------------------------------------------------
+
	xor	7Fh								; Invert parameter byte (except irrelevant sign bit)
	and	7Fh								; Strip sign bit
	ld	(ix+zTrackVolume), a			; Set as new track volume
	jp	FM_ChangeVolume							; Begin using new volume immediately
; ---------------------------------------------------------------------------
; Flag E7 - SMPS Prevent Attack
; ---------------------------------------------------------------------------

cfPreventAttack:
	set	4,(ix+zTrackPlaybackControl)
	dec	hl
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag E8 - 
; ---------------------------------------------------------------------------

cfNoteFill:				; CODE XREF: ROM:0C0Aj
	ld	(ix+zTrackSetNoteFill), a
	ld	(ix+zTrackResetNoteFill), a
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag E9 - 
; ---------------------------------------------------------------------------

cfAddKey:				; CODE XREF: ROM:0C0Ej
	add	a, (ix+zTrackKeyOffset)
	ld	(ix+zTrackKeyOffset),	a
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag EA - 
; ---------------------------------------------------------------------------

cfSetTempo:				; CODE XREF: ROM:0C12j
	ld	(zCurrentTempo), a
	ld	(zTempoTimeout), a
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag EB - 
; ---------------------------------------------------------------------------

cfSetTempoMod:				; CODE XREF: ROM:0C16j
	push	ix
	ld	ix, zTracksSongStart
	ld	de, zTrackSz	; '*'
	ld	b, (zTracksSongEnd-zTracksSongStart)/zTrackSz

loc_D3F:				; CODE XREF: ROM:0D44j
	ld	(ix+zTrackTempoDivider),	a
	add	ix, de
	djnz	loc_D3F
	pop	ix
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag EC - 
; ---------------------------------------------------------------------------

cfChangeVolume:				; CODE XREF: ROM:0C1Aj
	add	a, (ix+zTrackVolume)
		ld	(ix+zTrackVolume), a			; Store new volume
; =============== S U B	R O U T	I N E =======================================
; Changes the track's key displacement.
;
; There is a single parameter byte, the new track key offset + 40h (that is,
; 40h is subtracted from the parameter byte before the key displacement is set)
;
;loc_D1B
cfSetKey:
	sub	40h								; Subtract 40h from key displacement
	ld	(ix+zTrackKeyOffset), a			; Store result as new key displacement
	ret		
; ---------------------------------------------------------------------------
; Flag EC - 
; ---------------------------------------------------------------------------

cfChangePSGVolume:				; CODE XREF: ROM:0C1Aj
	bit	7, (ix+zTrackVoiceControl)		; Is this a PSG channel?
	ret	z								; Return if not
	res	4, (ix+zTrackPlaybackControl)	; Clear 'track is resting' flag
	dec	(ix+zTrackVolFlutter)			; Decrement flutter index
	add	a, (ix+zTrackVolume)			; Add track's current volume
	cp	0Fh								; Is it 0Fh or more?
	jp	c, zStoreTrackVolume			; Branch if not
	ld	a, 0Fh							; Limit to 0Fh (silence)

;loc_D17
zStoreTrackVolume:
	ld	(ix+zTrackVolume), a			; Store new volume
	ret		

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag ED - 
; ---------------------------------------------------------------------------

cfClearPush:				; CODE XREF: ROM:0C1Ej
	xor	a
	ld	(byte_11AC), a
	dec	hl
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag EE - Does nothing
; ---------------------------------------------------------------------------

cfSendFMI:
	ld	a,088h					; FM 1 operator 3 - second applitude/release rate address
	ld	c,00Fh					; second amplitude high/release rate immediate
	rst	zWriteFMI				; save to YM2612
	ld	a,08Ch					; FM 1 operator 4 - second applitude/release rate address
	ld	c,00Fh					; second amplitude high/release rate immediate
	rst	zWriteFMI				; save to YM2612
	dec	hl					; decrease tracker address to directly after the flag
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag EF - 
; ---------------------------------------------------------------------------

cfSetVoice:				; CODE XREF: ROM:0C26j
	ld	(ix+zTrackVoiceIndex),	a
	ld	c, a
	bit	2, (ix+zTrackPlaybackControl)
	ret	nz
	push	hl
	call	loc_D67
	pop	hl
	ret
; ---------------------------------------------------------------------------

loc_D67:				; CODE XREF: ROM:0D62p
	ld	a,(RunningSFX)
	or	a
	ld	a, c
	jr	z, zSetVoiceMusic
	ld	l, (ix+zTrackCSFXPointerLow)
	ld	h, (ix+zTrackCSFXPointerHigh)
	jr	loc_D79

; =============== S U B	R O U T	I N E =======================================


zSetVoiceMusic:				; CODE XREF: sub_5FA+1Bp zStopSoundEffects+3Ap ...
	ld	hl, (zVoiceTblPtr)

loc_D79:				; CODE XREF: ROM:0D74j
	ld	e,a
	ld	d,0
	
	ld	b,25

-	add	hl,de
	djnz	-
	
	ld	a, (hl)
	inc	hl
	ld	(loc_DBA+1), a
	ld	c, a
	ld	a, (ix+zTrackVoiceControl)
	and	3
	add	a, 0B0h	; '°'
	rst	WriteYM2612
	sub	80h ; '€'
	ld	b, 4

loc_D9B:				; CODE XREF: zSetVoiceMusic+2Aj
	ld	c, (hl)
	inc	hl
	rst	WriteYM2612
	add	a, 4
	djnz	loc_D9B
	push	af
	add	a, 10h
	ld	b, 10h

loc_DA7:				; CODE XREF: zSetVoiceMusic+36j
	ld	c, (hl)
	inc	hl
	rst	WriteYM2612
	add	a, 4
	djnz	loc_DA7
	add	a, 24h ; '$'
	ld	c, (ix+zTrackAMSFMSPan)
	rst	WriteYM2612
	ld	(ix+zTrackTLPtrLow), l
	ld	(ix+zTrackTLPtrHigh), h

loc_DBA:				; DATA XREF: zSetVoiceMusic+15w
	ld	a, 0
	and	7
	add	a,VolumeList&0FFh
	ld	e, a
	ld	d,(VolumeList>>008h)&0FFh
	ld	a, (de)
	ld	(ix+zTrackSetVolumeMasks), a
	ld	e, a
	ld	d,(ix+zTrackVolume)				; load volume
	pop	af

; ---------------------------------------------------------------------------
; Subroutine to change the volume of an FM channnel
; ---------------------------------------------------------------------------

FM_WriteVolume:
	ld	b,004h					; set number of operators to run through

FM_WW_NextOperator:
	ld	c,(hl)					; load voice's total volume
	inc	hl					; advance tracker
	rr	e					; rotate (move bit into carry)
	jr	nc,FM_WW_NotSlot			; if the bit was not set, branch (the operator isn't slot)
	push	af					; store YM2612 address
	ld	a,d					; load volume change amount requested
	add	a,c					; add current operator total volume
	ld	c,a					; save as new total volume data
	pop	af					; restore YM2612 address

FM_WW_NotSlot:
	rst	WriteYM2612				; write new volume amount
	add	a,004h					; advance address for next operator on YM2612
	djnz	FM_WW_NextOperator			; repeat for all operators
	ret						; return

; ---------------------------------------------------------------------------
; Volume list
; ---------------------------------------------------------------------------
; Each bit in every entry represents an operator:
;		db	4321b
; Where 1 - 4 is the operator number.  Each algorithm has its own "slot"
; operators, these are the operators that need to be altered to change the
; volume.  In the list below, if the bit is 0, the operator is not a "slot"
; if the bit is 1, the operator is a "slot" and is changed for volume.
; ---------------------------------------------------------------------------

VolumeList:	
	db	1000b
	db	1000b
	db	1000b
	db	1000b
	db	1100b
	db	1110b
	db 	1110b
	db	1111b

; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to change an FM channel's volume
; ---------------------------------------------------------------------------

FM_ChangeVolume:
	bit	7,(ix+zTrackVoiceControl)				; is the channel a PSG channel?
	ret	nz					; if so, return (PSG has its own flag for volume change)
	bit	2,(ix+zTrackPlaybackControl)
	ret	nz
	ld	e,(ix+zTrackSetVolumeMasks)				; load voice's algorithm
	ld	a,(ix+zTrackVoiceControl)				; load channel value
	and	003h					; get only channel ID
	add	a,040h					; advance to "total level" address for YM2612
	ld	d,(ix+zTrackVolume)				; load volume change amount
	bit	7,d					; is the volume too high? (80+)
	ret	nz					; if so, return
	push	hl					; store tracker address
	ld	l,(ix+zTrackTLPtrLow)				; load voice's "total volume" address to hl
	ld	h,(ix+zTrackTLPtrHigh)				; ''
	call	FM_WriteVolume				; write new volume to the YM2612
	pop	hl					; restore tracker address
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F0 - Set modulation
; ---------------------------------------------------------------------------

cfModulation:
	set	3,(ix+zTrackPlaybackControl)				; enable modulation
	dec	hl					; decrease back to just after flag
	ld	(ix+zTrackModulationPtrLow),l				; store address of modulation information
	ld	(ix+zTrackModulationPtrHigh),h				; ''

zPrepareModulation:
	ld	a,ixl					; load lower byte of channel RAM address
	add	a,013h					; advance to the 13th byte of channel RAM
	ld	e,a					; save to e
	adc	a,ixu					; add upper byte of channel RAM address
	sub	e					; remove lower byte's value from it
	ld	d,a					; save to d (de = channel RAM address of modulation)
	ld	bc,3
	ldir						; while (bc-- > 0) *de++ = *hl++; (wait, modulation speed, modulation change)
	ld	a,(hl)					; load last byte of modulation information
	inc	hl					; increase tracker address to next byte
	srl	a					; shift right
	ld	(de), a							; Store in track RAM		
	bit	4,(ix+zTrackPlaybackControl)		; Is bit 4 "do not attack next note" (10h) set? 
	ret	nz				; If so, quit!		
	xor	a					; clear frequency amount
	ld	(ix+zTrackModulationValLow),a				; ''
	ld	(ix+zTrackModulationValHigh),a				; ''
	ret						; return
; =============== S U B	R O U T	I N E =======================================
; Sets modulation status according to parameter bytes.
;
; Has 2 1-byte parameters: the first byte is the new modulation state for PSG
; tracks, while the second byte is the new modulation state for FM tracks.
;
;loc_D7B
cfAlterModulation:
	inc	hl								; Advance track pointer
	bit	7, (ix+zTrackVoiceControl)		; Is this a PSG track?
	jr	nz, cfSetModulation				; Branch if yes
	ld	a, (hl)							; Get new modulation status

; =============== S U B	R O U T	I N E =======================================
; Sets modulation status.
;
; Has one parameter byte, the new modulation status.
;
;loc_D83
; ---------------------------------------------------------------------------
; Flag F1 - Enable modulation
; ---------------------------------------------------------------------------

cfSetModulation:				; CODE XREF: ROM:0C2Ej
	dec	hl
	set	3,(ix+zTrackPlaybackControl)				; enable modulation
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F2 - 
; ---------------------------------------------------------------------------

cfStopTrack:				; CODE XREF: ROM:0C32j
	res	7, (ix+zTrackPlaybackControl)
	res	4, (ix+zTrackPlaybackControl)
	bit	7, (ix+zTrackVoiceControl)
	jr	nz, zStopPSGTrack
	ld	a,(zDACUpdating)				; load DAC flag
	or	a					; is this channel a DAC channel?
	jp	m,loc_ECE				; if so, branch
	call	sub_BAC
	jr	loc_E59
; ---------------------------------------------------------------------------

zStopPSGTrack:				; CODE XREF: ROM:0E48j
	call	zPSGNoteOff

loc_E59:				; CODE XREF: ROM:0E54j
	ld	a,(RunningSFX)
	or	a
	jp	p, loc_ECD
	xor	a
	ld	(zSFXPriorityVal), a
	ld	a, (ix+zTrackVoiceControl)
	or	a
	jp	m, loc_EA5
	push	ix
	sub	2
	add	a, a
	add	a, zMusicTrackOffs&0FFh ; '‰'
	ld	(loc_E75+2), a

loc_E75:				; DATA XREF: ROM:0E72w
	ld	ix, (zMusicTrackOffs)
	bit	2, (ix+zTrackPlaybackControl)
	jp	z, loc_EA0
	call	SetMusicBanks				; set the bank address
	res	2, (ix+zTrackPlaybackControl)
	set	1, (ix+zTrackPlaybackControl)
	ld	a, (ix+zTrackVoiceIndex)
	call	zSetVoiceMusic
	rst	zBankSwitchToSound

loc_EA0:				; CODE XREF: ROM:0E7Dj
	pop	ix
	pop	bc
	pop	bc
	ret
; ---------------------------------------------------------------------------

loc_EA5:				; CODE XREF: ROM:0E68j
	push	ix
	rra
	rra
	rra
	rra
	and	0Fh
	add	a, zMusicTrackOffs&0FFh ; '‰'
	ld	(loc_EB2+2), a

loc_EB2:				; DATA XREF: ROM:0EAFw
	ld	ix, (zMusicTrackOffs)
	res	2, (ix+zTrackPlaybackControl)
	set	1, (ix+zTrackPlaybackControl)
	ld	a, (ix+zTrackVoiceControl)
	cp	0E0h ; 'à'
	jr	nz, loc_ECB
	ld	a, (ix+zTrackPSGNoise)
	ld	(zPSG), a

loc_ECB:				; CODE XREF: ROM:0EC3j
	pop	ix

loc_ECD:				; CODE XREF: ROM:0E5Dj
	pop	bc

loc_ECE:				; CODE XREF: ROM:0E4Ej
	pop	bc
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F3 - 
; ---------------------------------------------------------------------------

cfSetPSGNoise:				; CODE XREF: ROM:0C36j
	ld	(ix+zTrackVoiceControl),	0E0h ; 'à'
	ld	(ix+zTrackPSGNoise), a
	bit	2, (ix+zTrackPlaybackControl)
	ret	nz
	ld	(zPSG), a
	ret

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F4 - Disable modulation
; ---------------------------------------------------------------------------

cfDisableModulation:				; CODE XREF: ROM:0C3Aj
	dec	hl					; decrease back to just after flag
	res	3,(ix+zTrackPlaybackControl)				; disable modulation
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F5 - 
; ---------------------------------------------------------------------------

cfSetPSGTone:
	bit	7, (ix+zTrackVoiceControl)		; Is this a PSG track?
	ret	z					; Return if not
	ld	(ix+zTrackVoiceIndex),a
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F6 - Branch instruction
; ---------------------------------------------------------------------------

cfJumpTo:
	ld	h,(hl)					; load upper byte of new address
	ld	l,a					; load lower byte of new address
	ret						; return (hl has new tracker address)

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F7 - Loop
; ---------------------------------------------------------------------------

cfRepeatAtPos:
	ld	c,(hl)					; load loop count
	inc	hl					; increase tracker address
	push	hl					; store tracker address
	add	a,020h					; advance to RAM address of correct loop slot
	ld	l,a					; set address in hl
	ld	h,0					; ''
	ld	e,ixl					; load lower byte of channel RAM address
	ld	d,ixu					; load upper byte of channel RAM address
	add	hl,de					; advance to loop slot in channel RAM
	ld	a,(hl)					; load current loop amount
	or	a					; is it 00?
	jr	nz,TRF_F7_Continue			; if not, branch
	ld	(hl),c					; set new loop count (starting the loop)

TRF_F7_Continue:
	dec	(hl)					; decrease counter
	pop	hl					; restore tracker address
	jr	z,TRF_F7_Finish				; if the counter has new reached 0, branch (end of the loop)
	ld	a,(hl)					; load loop jump address to hl
	inc	hl					; ''
	ld	h,(hl)					; ''
	ld	l,a					; ''
	ret						; return

TRF_F7_Finish:
	inc	hl					; skip instruction and continue
	inc	hl					; ''
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F8 - Call instruction
; ---------------------------------------------------------------------------

cfJumpToGosub:
	ld	c,a					; load lower byte of address to c
	ld	a,(ix+zTrackStackPointer)				; load F8 stack address
	sub	002h					; move back a word
	ld	(ix+zTrackStackPointer),a				; update
	ld	b,(hl)					; load upper byte of address to b (bc = jump address)
	inc	hl					; increase tracker address
	ex	de,hl					; swap stack address with tracker address
	add	a,ixl					; add lower byte of channel RAM address
	ld	l,a					; save lower byte to l
	adc	a,ixu					; add upper byte of channel RAM address (with carry)
	sub	l					; minus address by 1
	ld	h,a					; save upper byte to h (hl = new F8 stack address in channel RAM)
	ld	(hl),e					; store current tracker address to the F8 stack
	inc	hl					; ''
	ld	(hl),d					; ''
	ld	h,b					; set new tracker address
	ld	l,c					; ''
	ret						; return

; ===========================================================================
; ---------------------------------------------------------------------------
; Flag F9 - Sets the release rate of operators 3 and 4 of FM channel 1 to immediate
; ---------------------------------------------------------------------------

TRF_FlagF9:
	dec	hl					; decrease tracker address to directly after the flag
	ret						; return

; ===========================================================================


; =============== S U B	R O U T	I N E =======================================


; ===========================================================================
; ---------------------------------------------------------------------------
; 
; ---------------------------------------------------------------------------

zClearTrackPlaybackMem:
	di									; Disable interrupts
	ld	a, 2Bh							; DAC enable/disable register
	ld	c, 0							; Value to disable DAC
	call	zWriteFMI					; Send YM2612 command

loc_1092: 
	ld	a,02Bh					; prepare YM2612 address (DAC switch port)
	ld	c,080h					; prepare YM2612 data (DAC Enabled/FM6 Disabled)
	di
	call	zWriteFMI				; enable to DAC channel
	ld	a,c
	ld	(zDACEnabled),a
	ld	a,027h					; prepare YM2612 address (Timer/FM3 & 6 Frequency setting)
	ld	c,000h					; prepare YM2612 data (Timer Halt/No dedicated frequency)
	rst	zWriteFMI				; halt the YM2612 timer
	ld	hl,zVariablesStart
	ld	de,zVariablesStart+1
	ld	(hl),000h
	ld	bc,(zTracksSFXEnd-zVariablesStart)-2
	ldir
	ld	a,080h
	ld	(zQueueToPlay),a
	call	zSilenceFM
	jp	zSilencePSG
	
zPlayDigitalAudio:	
	ld	iy,DPCM_NybbleCon			; load conversion table
	ld	de,0h				; set sample size to 0000

DPCM_WaitSample:
	ld	a,d					; is there anymore of the sample to play?
	or	e					; ''
	jr	z,DPCM_WaitSample			; if not, branch

DPCM_PlaySample:
	djnz	$					; delay for pitch (decreasing b and branching to itself for a delay)
	di						; disable interrupts (prevent tracker code from playing)
	ld	a,(hl)					; load DPCM byte
	rlca						; move the left nybble to the right
	rlca						; ''
	rlca						; ''
	rlca						; ''
	and	00Fh					; clear everything except the nybble
	ld	iyl,a					; make the nybble number an index into DPCM_NybbleCon
	ex	af,af'					; load last PCM byte
	add	a,(iy+000h)				; add correct byte from the DPCM table
	ld	(zYM2612_D0),a				; save byte to DAC port
	ex	af,af'					; store PCM byte as "last PCM byte"
	ld	b,c					; load pitch delay amount
	ei						; enable interrupts (allow tracker code to play)
	nop						; delay (probably for a precice pitch)
	djnz	$					; delay for pitch (decreasing b and branching to itself for a delay)
	di						; disable interrupts (prevent tracker code from playing)
	ld	b,c					; load pitch delay amount
	ld	a,(hl)					; load DPCM byte
	inc	hl					; advance to next DPCM byte (for next loop)
	dec	de					; decrease size
	and	00Fh					; get only the right nybble
	ld	iyl,a					; make the nybble number an index into DPCM_NybbleCon
	ex	af,af'					; load last PCM byte
	add	a,(iy+000h)				; add correct byte from the DPCM table
	ld	(zYM2612_D0),a				; save byte to DAC port
	ex	af,af'					; store PCM byte as "last PCM byte"
	ei						; enable interrupts (allow tracker code to play)
	
	bit	7,h			; has bank boundary been crossed?
	jp	nz,DPCM_WaitSample		; if not, branch
	ld	h,80h			; correct address so it points to start of bank
	di
	push	hl			
	ld	hl,DAC_BankID
	inc	(hl)			; set zCurrentDACBank to the next bank, since the boundary's been crossed
	ld	a,(hl)
	call	zBankSwitch		; bankswitch to this new bank
	pop	hl
	ei
	
	jp	DPCM_WaitSample				; loop for the next byte
; End of function zClearTrackPlaybackMem

; The way this table is accessed requires it is aligned to 100h
	align 100h
DPCM_NybbleCon:	
	db	   0,	 1,   2,   4,   8,  10h,  20h,  40h
	db	 80h,	-1,  -2,  -4,  -8, -10h, -20h, -40h
; ===========================================================================		
zCurDAC:	db	000h					; DAC Note to use (81 - 8E)
DAC_BankID: db	000h
zCurSong:	db	000h
RunningSFX:	db	000h					; 00 BGM | 80 SFX - used to tell the routines whether the channels currently read are SFX or not
byte_11AB:	db	000h
byte_11AC:	db	000h
zPALUpdTick:	db 0 ; zbyte_12FE ; This counts from 0 to 5 to periodically "double update" for PAL systems (basically every 6 frames you need to update twice to keep up)
; ===========================================================================
; ---------------------------------------------------------------------------
; I'm assuming these are music/sfx priority values 
; ---------------------------------------------------------------------------
SFX_Priorities:
	db	80h,70h,70h,70h,70h,70h,70h,70h,70h,70h,68h,70h,70h,70h,60h,70h
	db	70h,60h,70h,60h,70h,70h,70h,70h,70h,70h,70h,70h,70h,70h,70h,7Fh
	db	6Fh,70h,70h,70h,70h,70h,70h,70h,70h,70h,70h,70h,70h,6Fh,70h,70h
	db	70h,60h,60h,70h,70h,70h,70h,70h,70h,70h,60h,62h,60h,60h,60h,70h
	db	70h,70h,70h,70h,60h,60h,60h,6Fh,70h,70h,6Fh,6Fh,70h,71h,70h,70h
	db	6Fh
; ===========================================================================
; ---------------------------------------------------------------------------
; PSG Tone Instruments
; ---------------------------------------------------------------------------
PSG_Tones:
z80_PSGTonePointers:
	dw		PSGTone_00
	dw 		PSGTone_01,PSGTone_02,PSGTone_03,PSGTone_04,PSGTone_05
	dw		PSGTone_06,PSGTone_07,PSGTone_08,PSGTone_09,PSGTone_0A,PSGTone_0B
	dw		PSGTone_0C,PSGTone_0D,PSGTone_0E,PSGTone_0F,PSGTone_10,PSGTone_11
	dw		PSGTone_12,PSGTone_13,PSGTone_14,PSGTone_15,PSGTone_16,PSGTone_17
	dw		PSGTone_18,PSGTone_19,PSGTone_1A,PSGTone_1B,PSGTone_1C,PSGTone_1D
	dw		PSGTone_1E,PSGTone_1F,PSGTone_20,PSGTone_21,PSGTone_22,PSGTone_23
	dw		PSGTone_24,PSGTone_25,PSGTone_26,PSGTone_27
Old_PSG_Pointers:		
	dw  	PSG_Tone00,PSG_Tone01
	dw		PSG_Tone02,PSG_Tone03,PSG_Tone04,PSG_Tone05,PSG_Tone06,PSG_Tone07
	dw		PSG_Tone08,PSG_Tone09,PSG_Tone0A,PSG_Tone0B, PSG_Tone0C

PSGTone_00:				
PSGTone_01:
PSGTone_0E:
			db    0,   2,   4,   6,   8, 10h, 83h
PSGTone_02:		db    2,   1,   0,   0,   1,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2
			db    2,   3,   3,   3,   4,   4,   4,   5, 81h
PSGTone_03:		db    0,   0,   2,   3,   4,   4,   5,   5,   5,   6,   6, 81h
PSGTone_04:		db    3,   0,   1,   1,   1,   2,   3,   4,   4,   5, 81h
PSGTone_05:		db    0,   0,   1,   1,   2,   3,   4,   5,   5,   6,   8,   7,   7,   6, 81h
PSGTone_06:		db    1, 0Ch,   3, 0Fh,   2,   7,   3, 0Fh, 80h
PSGTone_07:		db    0,   0,   0,   2,   3,   3,   4,   5,   6,   7,   8,   9, 0Ah, 0Bh, 0Eh, 0Fh
			db  83h
PSGTone_08:		db    3,   2,   1,   1,   0,   0,   1,   2,   3,   4, 81h
PSGTone_09:		db    1,   0,   0,   0,   0,   1,   1,   1,   2,   2,   2,   3,   3,   3,   3,   4
			db    4,   4,   5,   5, 81h
PSGTone_0A:		db  10h, 20h, 30h, 40h, 30h, 20h, 10h,   0,0F0h, 80h
PSGTone_0B:		db    0,   0,   1,   1,   3,   3,   4,   5, 83h
PSGTone_0C:		db    0, 81h
PSGTone_0D:		db    2, 83h
PSGTone_0F:		db    9,   9,   9,   8,   8,   8,   7,   7,   7,   6,   6,   6,   5,   5,   5,   4
			db    4,   4,   3,   3,   3,   2,   2,   2,   1,   1,   1,   0,   0,   0, 81h
PSGTone_10:		db    1,   1,   1,   0,   0,   0, 81h
PSGTone_11:		db    3,   0,   1,   1,   1,   2,   3,   4,   4,   5, 81h
PSGTone_12:		db    0,   0,   1,   1,   2,   3,   4,   5,   5,   6,   8,   7,   7,   6, 81h
PSGTone_13:		db  0Ah,   5,   0,   4,   8, 83h
PSGTone_14:		db    0,   0,   0,   2,   3,   3,   4,   5,   6,   7,   8,   9, 0Ah, 0Bh, 0Eh, 0Fh
			db  83h
PSGTone_15:		db    3,   2,   1,   1,   0,   0,   1,   2,   3,   4, 81h
PSGTone_16:		db    1,   0,   0,   0,   0,   1,   1,   1,   2,   2,   2,   3,   3,   3,   3,   4
			db    4,   4,   5,   5, 81h
PSGTone_17:		db  10h, 20h, 30h, 40h, 30h, 20h, 10h,   0, 80h
PSGTone_18:		db    0,   0,   1,   1,   3,   3,   4,   5, 83h
PSGTone_19:		db    0,   2,   4,   6,   8, 16h, 83h
PSGTone_1A:		db    0,   0,   1,   1,   3,   3,   4,   5, 83h
PSGTone_1B:		db    4,   4,   4,   4,   3,   3,   3,   3,   2,   2,   2,   2,   1,   1,   1,   1
			db  83h
PSGTone_1C:		db    0,   0,   0,   0,   1,   1,   1,   1,   2,   2,   2,   2,   3,   3,   3,   3
			db    4,   4,   4,   4,   5,   5,   5,   5,   6,   6,   6,   6,   7,   7,   7,   7
			db    8,   8,   8,   8,   9,   9,   9,   9, 0Ah, 0Ah, 0Ah, 0Ah, 81h
PSGTone_1D:		db    0, 0Ah, 83h
PSGTone_1E:		db    0,   2,   4, 81h
PSGTone_1F:		db  30h, 20h, 10h,   0,   0,   0,   0,   0,   8, 10h, 20h, 30h, 81h
PSGTone_20:		db    0,   4,   4,   4,   4,   4,   4,   4,   4,   4,   4,   6,   6,   6,   8,   8
			db  0Ah, 83h
PSGTone_21:		db    0,   2,   3,   4,   6,   7, 81h
PSGTone_22:		db    2,   1,   0,   0,   0,   2,   4,   7, 81h
PSGTone_23:		db  0Fh,   1,   5, 83h
PSGTone_24:		db    8,   6,   2,   3,   4,   5,   6,   7,   8,   9, 0Ah, 0Bh, 0Ch, 0Dh, 0Eh, 0Fh
			db  10h, 83h
PSGTone_25:		db    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   1,   1,   1,   1,   1
			db    1,   1,   1,   1,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   3,   3
			db    3,   3,   3,   3,   3,   3,   3,   3,   4,   4,   4,   4,   4,   4,   4,   4
			db    4,   4,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   6,   6,   6,   6
			db    6,   6,   6,   6,   6,   6,   7,   7,   7,   7,   7,   7,   7,   7,   7,   7
			db    8,   8,   8,   8,   8,   8,   8,   8,   8,   8,   9,   9,   9,   9,   9,   9
			db    9,   9, 83h
PSGTone_26:		db    0,   2,   2,   2,   3,   3,   3,   4,   4,   4,   5,   5, 83h
PSGTone_27:     db	  0,   0,   0,   1,   1,   1,   2,   2,   2,   3,   3,   3,   4,   4,   4,   5
			db	  5,   5,   6,   6,   6,   7, 81h

Old_PSG_Tones:
		
PSG_Tone00:
	db   0,	 0,  0,	 1,  1,	 1,  2,	 2,  2,	 3,  3,	 3
	db	4,	 4,  4,	 5,  5,	 5,  6,	 6,  6,	 7,81h;	0

PSG_Tone01:
	db    0,   2,   4,   6,   8, 10h, 81h

PSG_Tone02:
	db	  0,   0,   1,   1,   2,   2,   3,   3,   4,   4,   5,   5,   6,   6,   7,   7, 81h

PSG_Tone03:
	db	  0,   0,   2,   3,   4,   4,   5,   5,   5,   6, 81h

PSG_Tone05:
	db   3,	 3,  3,	 2,  2,	 2,  2,	 1,  1,	 1,  0,	 0
	db	0,	 0,81h;	0

PSG_Tone04:
	db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  1,	 1
	db	1,	 1,  1,	 1,  1,	 1,  1,	 1,  1,	 1
	db	1,	 1,  2,	 2,  2,	 2,  2,	 2,  2,	 2; 0
	db   3,	 3,  3,	 3,  3,	 3,  3,	 3,  4,81h; 32

PSG_Tone06:
	db   0,	 0,  0,	 0,  0,	 0,  1,	 1,  1,	 1,  1,	 2
	db	2,	 2,  2,	 2,  3,	 3,  3,	 4,  4,	 4
	db	5,	 5,  5,	 6,  7,81h; 0

PSG_Tone07:
	db   0,	 0,  0,	 0,  0,	 1,  1,	 1,  1,	 1,  2,	 2
	db	2,	 2,  2,	 2,  3,	 3,  3,	 3,  3,	 4
	db	4,	 4,  4,	 4,  5,	 5,  5,	 5,  5,	 6
	db   6,	 6,  6,	 6,  7,	 7,  7,81h; 32

PSG_Tone08:
	db   0,	 1,  2,	 3,  4,	 5,  6,	 7,  8,	 9,0Ah,0Bh
	db	0Ch,0Dh,0Eh,0Fh,81h;	0

PSG_Tone09:
	db   0,	 0,  0,	 0,  0,	 0,  0,	 0,  0,	 0,  1,	 1
	db	1,	 1,  1,	 1; 0
	db   1,	 1,  1,	 1,  1,	 1,  1,	 1,  1,	 1,  1,	 1
	db	1,	 1,  1,	 1; 16
	db   1,	 1,  1,	 1,  1,	 1,  1,	 1,  2,	 2,  2,	 2
	db	2,	 2,  2,	 2; 32
	db   2,	 2,  3,	 3,  3,	 3,  3,	 3,  3,	 3,  3,	 3
	db	4,81h; 48

PSG_Tone0A:
	db   4,	 4,  4,	 3,  3,	 3,  2,	 2,  2,	 1,  1,	 1
	db	1,	 1,  1,	 1,  2,	 2,  2,	 2,  2,	 3
	db	3,	 3,  3,	 3,  4,81h; 0

PSG_Tone0B:
	db   4,	 4,  3,	 3,  2,	 2,  1,	 1,  1,	 1,  1,	 1
	db	1,	 1,  1,	 1; 0
	db   1,	 1,  1,	 1,  1,	 1,  1,	 1,  1,	 1,  2,	 2
	db	2,	 2,  2,	 2; 16
	db   2,	 2,  2,	 2,  2,	 2,  2,	 2,  2,	 2,  2,	 2
	db	2,	 2,  3,	 3; 32
	db   3,	 3,  3,	 3,  3,	 3,  3,	 3,  3,	 3,  3,	 3
	db	3,	 3,  3,	 3; 48
	db   3,	 3,  4,	 4,  4,	 4,  4,	 4,  4,	 4,  4,	 4
	db	4,	 4,  4,	 4; 64
	db   4,	 4,  4,	 4,  4,	 4,  5,	 5,  5,	 5,  5,	 5
	db	5,	 5,  5,	 5; 80
	db   5,	 5,  5,	 5,  5,	 5,  5,	 5,  5,	 5,  6,	 6
	db	6,	 6,  6,	 6; 96
	db   6,	 6,  6,	 6,  6,	 6,  6,	 6,  6,	 6,  6,	 6
	db	6,	 6,  7,81h; 112

PSG_Tone0C:
	db    0
	db    1
	db    3
	db  81h	; €
			

Speedup_Index:		
	db  72h	; r
	db  73h	; s
	db  26h	; &
	db  15h
	db    8
	db 0FFh
	db    5
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
	db  20h
; ---------------------------------------------------------------