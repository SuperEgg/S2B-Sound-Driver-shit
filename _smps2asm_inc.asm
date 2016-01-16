; =============================================================================================
; Created by Flamewing, based on S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================
SonicDriverVer:	equ	5
align0	macro	val
	cnop	0,\val
    endm
	
smpsWeirdD1LRR macro
	if SonicDriverVer>=3
		; Emulate it in S3/S&K/S3D driver
		smpsFMICommand $88,$0F
		smpsFMICommand $8C,$0F
	else
		dc.b	$F9
	endif
	endm
; ---------------------------------------------------------------------------------------------
; Note Duration equates
; ---------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------
; Standard Octave Pitch Equates
smpsPitch10lo:	EQU -120	; $88
smpsPitch09lo:	EQU -108	; $94
smpsPitch08lo:	EQU  -96	; $A0
smpsPitch07lo:	EQU  -84	; $AC
smpsPitch06lo:	EQU  -72	; $B8
smpsPitch05lo:	EQU  -60	; $C4
smpsPitch04lo:	EQU  -48	; $D0
smpsPitch03lo:	EQU  -36	; $DC
smpsPitch02lo:	EQU  -24	; $E8
smpsPitch01lo:	EQU  -12	; $F4
smpsPitch00:	EQU    0	; $00
smpsPitch01hi:	EQU  +12	; $0C
smpsPitch02hi:	EQU  +24	; $18
smpsPitch03hi:	EQU  +36	; $24
smpsPitch04hi:	EQU  +48	; $30
smpsPitch05hi:	EQU  +60	; $3C
smpsPitch06hi:	EQU  +72	; $48
smpsPitch07hi:	EQU  +84	; $54
smpsPitch08hi:	EQU  +96	; $60
smpsPitch09hi:	EQU +108	; $6C
smpsPitch10hi:	EQU +120	; $78

; ---------------------------------------------------------------------------------------------
; Note Equates
nRst:	EQU $80		; $80
nC0:	EQU $81		; $81
nCs0:	EQU nC0+1	; $82
nD0:	EQU nCs0+1	; $83
nEb0:	EQU nD0+1	; $84
nE0:	EQU nEb0+1	; $85
nF0:	EQU nE0+1	; $86
nFs0:	EQU nF0+1	; $87
nG0:	EQU nFs0+1	; $88
nAb0:	EQU nG0+1	; $89
nA0:	EQU nAb0+1	; $8A
nBb0:	EQU nA0+1	; $8B
nB0:	EQU nBb0+1	; $8C
nC1:	EQU nB0+1	; $8D
nCs1:	EQU nC1+1	; $8E
nD1:	EQU nCs1+1	; $8F
nEb1:	EQU nD1+1	; $90
nE1:	EQU nEb1+1	; $91
nF1:	EQU nE1+1	; $92
nFs1:	EQU nF1+1	; $93
nG1:	EQU nFs1+1	; $94
nAb1:	EQU nG1+1	; $95
nA1:	EQU nAb1+1	; $96
nBb1:	EQU nA1+1	; $97
nB1:	EQU nBb1+1	; $98
nC2:	EQU nB1+1	; $99
nCs2:	EQU nC2+1	; $9A
nD2:	EQU nCs2+1	; $9B
nEb2:	EQU nD2+1	; $9C
nE2:	EQU nEb2+1	; $9D
nF2:	EQU nE2+1	; $9E
nFs2:	EQU nF2+1	; $9F
nG2:	EQU nFs2+1	; $A0
nAb2:	EQU nG2+1	; $A1
nA2:	EQU nAb2+1	; $A2
nBb2:	EQU nA2+1	; $A3
nB2:	EQU nBb2+1	; $A4
nC3:	EQU nB2+1	; $A5
nCs3:	EQU nC3+1	; $A6
nD3:	EQU nCs3+1	; $A7
nEb3:	EQU nD3+1	; $A8
nE3:	EQU nEb3+1	; $A9
nF3:	EQU nE3+1	; $AA
nFs3:	EQU nF3+1	; $AB
nG3:	EQU nFs3+1	; $AC
nAb3:	EQU nG3+1	; $AD
nA3:	EQU nAb3+1	; $AE
nBb3:	EQU nA3+1	; $AF
nB3:	EQU nBb3+1	; $B0
nC4:	EQU nB3+1	; $B1
nCs4:	EQU nC4+1	; $B2
nD4:	EQU nCs4+1	; $B3
nEb4:	EQU nD4+1	; $B4
nE4:	EQU nEb4+1	; $B5
nF4:	EQU nE4+1	; $B6
nFs4:	EQU nF4+1	; $B7
nG4:	EQU nFs4+1	; $B8
nAb4:	EQU nG4+1	; $B9
nA4:	EQU nAb4+1	; $BA
nBb4:	EQU nA4+1	; $BB
nB4:	EQU nBb4+1	; $BC
nC5:	EQU nB4+1	; $BD
nCs5:	EQU nC5+1	; $BE
nD5:	EQU nCs5+1	; $BF
nEb5:	EQU nD5+1	; $C0
nE5:	EQU nEb5+1	; $C1
nF5:	EQU nE5+1	; $C2
nFs5:	EQU nF5+1	; $C3
nG5:	EQU nFs5+1	; $C4
nAb5:	EQU nG5+1	; $C5
nA5:	EQU nAb5+1	; $C6
nBb5:	EQU nA5+1	; $C7
nB5:	EQU nBb5+1	; $C8
nC6:	EQU nB5+1	; $C9
nCs6:	EQU nC6+1	; $CA
nD6:	EQU nCs6+1	; $CB
nEb6:	EQU nD6+1	; $CC
nE6:	EQU nEb6+1	; $CD
nF6:	EQU nE6+1	; $CE
nFs6:	EQU nF6+1	; $CF
nG6:	EQU nFs6+1	; $D0
nAb6:	EQU nG6+1	; $D1
nA6:	EQU nAb6+1	; $D2
nBb6:	EQU nA6+1	; $D3
nB6:	EQU nBb6+1	; $D4
nC7:	EQU nB6+1	; $D5
nCs7:	EQU nC7+1	; $D6
nD7:	EQU nCs7+1	; $D7
nEb7:	EQU nD7+1	; $D8
nE7:	EQU nEb7+1	; $D9
nF7:	EQU nE7+1	; $DA
nFs7:	EQU nF7+1	; $DB
nG7:	EQU nFs7+1	; $DC
nAb7:	EQU nG7+1	; $DD
nA7:	EQU nAb7+1	; $DE
nBb7:	EQU nA7+1	; $DF

; ---------------------------------------------------------------------------------------------
; PSG envelope equates
sTone_00:	EQU $00
sTone_01:	EQU $01
sTone_02:	EQU $02
sTone_03:	EQU $03
sTone_04:	EQU $04
sTone_05:	EQU $05
sTone_06:	EQU $06
sTone_07:	EQU $07
sTone_08:	EQU $08
sTone_09:	EQU $09
sTone_0A:	EQU $0A
sTone_0B:	EQU $0B
sTone_0C:	EQU $0C
sTone_0D:	EQU $0D
sTone_0E:	EQU $0E
sTone_0F:	EQU $0F
sTone_10:	EQU $10
sTone_11:	EQU $11
sTone_12:	EQU $12
sTone_13:	EQU $13
sTone_14:	EQU $14
sTone_15:	EQU $15
sTone_16:	EQU $16
sTone_17:	EQU $17
sTone_18:	EQU $18
sTone_19:	EQU $19
sTone_1A:	EQU $1A
sTone_1B:	EQU $1B
sTone_1C:	EQU $1C
sTone_1D:	EQU $1D
sTone_1E:	EQU $1E
sTone_1F:	EQU $1F
sTone_20:	EQU $20
sTone_21:	EQU $21
sTone_22:	EQU $22
sTone_23:	EQU $23
sTone_24:	EQU $24
sTone_25:	EQU $25
sTone_26:	EQU $26
sTone_27:	EQU $27
fTone_00:	EQU $28
fTone_01:	EQU fTone_00+1
fTone_02:	EQU fTone_01+1
fTone_03:	EQU fTone_02+1
fTone_04:	EQU fTone_03+1
fTone_05:	EQU fTone_04+1
fTone_06:	EQU fTone_05+1
fTone_07:	EQU fTone_06+1
fTone_08:	EQU fTone_07+1
fTone_09:	EQU fTone_08+1
fTone_0A:	EQU fTone_09+1
fTone_0B:	EQU fTone_0A+1
fTone_0C:	EQU fTone_0B+1
; ---------------------------------------------------------------------------------------------
; DAC Equates
dSnareS3:		EQU $81				; $81
dHighTom:		EQU dSnareS3+1			; $82
dMidTomS3:		EQU dHighTom+1			; $83
dLowTomS3:		EQU dMidTomS3+1			; $84
dFloorTomS3:		EQU dLowTomS3+1			; $85
dKickS3:		EQU dFloorTomS3+1		; $86
dMuffledSnare:		EQU dKickS3+1			; $87
dCrashCymbal:		EQU dMuffledSnare+1		; $88
dRideCymbal:		EQU dCrashCymbal+1		; $89
dLowMetalHit:		EQU dRideCymbal+1		; $8A
dMetalHit:		EQU dLowMetalHit+1		; $8B
dHighMetalHit:		EQU dMetalHit+1			; $8C
dHigherMetalHit:	EQU dHighMetalHit+1		; $8D
dMidMetalHit:		EQU dHigherMetalHit+1		; $8E
dClapS3:		EQU dMidMetalHit+1		; $8F
dElectricHighTom:	EQU dClapS3+1			; $90
dElectricMidTom:	EQU dElectricHighTom+1		; $91
dElectricLowTom:	EQU dElectricMidTom+1		; $92
dElectricFloorTom:	EQU dElectricLowTom+1		; $93
dTightSnare:		EQU dElectricFloorTom+1		; $94
dMidpitchSnare:		EQU dTightSnare+1		; $95
dLooseSnare:		EQU dMidpitchSnare+1		; $96
dLooserSnare:		EQU dLooseSnare+1		; $97
dHiTimpaniS3:		EQU dLooserSnare+1		; $98
dLowTimpaniS3:		EQU dHiTimpaniS3+1		; $99
dMidTimpaniS3:		EQU dLowTimpaniS3+1		; $9A
dQuickLooseSnare:	EQU dMidTimpaniS3+1		; $9B
dClick:			EQU dQuickLooseSnare+1		; $9C
dPowerKick:		EQU dClick+1			; $9D
dQuickGlassCrash:	EQU dPowerKick+1		; $9E
dGlassCrashSnare:	EQU dQuickGlassCrash+1		; $9F
dGlassCrash:		EQU dGlassCrashSnare+1		; $A0
dGlassCrashKick:	EQU dGlassCrash+1		; $A1
dQuietGlassCrash:	EQU dGlassCrashKick+1		; $A2
dOddSnareKick:		EQU dQuietGlassCrash+1		; $A3
dKickExtraBass:		EQU dOddSnareKick+1		; $A4
dComeOn:		EQU dKickExtraBass+1		; $A5
dDanceSnare:		EQU dComeOn+1			; $A6
dLooseKick:		EQU dDanceSnare+1		; $A7
dModLooseKick:		EQU dLooseKick+1		; $A8
dWoo:			EQU dModLooseKick+1		; $A9
dGo:			EQU dWoo+1			; $AA
dSnareGo:		EQU dGo+1			; $AB
dPowerTom:		EQU dSnareGo+1			; $AC
dHiWoodBlock:		EQU dPowerTom+1			; $AD
dLowWoodBlock:		EQU dHiWoodBlock+1		; $AE
dHiHitDrum:		EQU dLowWoodBlock+1		; $AF
dLowHitDrum:		EQU dHiHitDrum+1		; $B0
dMetalCrashHit:		EQU dLowHitDrum+1		; $B1
dEchoedClapHit:		EQU dMetalCrashHit+1		; $B2
dLowerEchoedClapHit:	EQU dEchoedClapHit+1		; $B3
dHipHopHitKick:		EQU dLowerEchoedClapHit+1	; $B4
dHipHopHitPowerKick:	EQU dHipHopHitKick+1		; $B5
dBassHey:		EQU dHipHopHitPowerKick+1	; $B6
dDanceStyleKick:	EQU dBassHey+1			; $B7
dHipHopHitKick2:	EQU dDanceStyleKick+1		; $B8
dHipHopHitKick3:	EQU dHipHopHitKick2+1		; $B9
dReverseFadingWind:	EQU dHipHopHitKick3+1		; $BA
dScratchS3:		EQU dReverseFadingWind+1	; $BB
dLooseSnareNoise:	EQU dScratchS3+1		; $BC
dPowerKick2:		EQU dLooseSnareNoise+1		; $BD
dCrashingNoiseWoo:	EQU dPowerKick2+1		; $BE
dQuickHit:		EQU dCrashingNoiseWoo+1		; $BF
dKickHey:		EQU dQuickHit+1			; $C0
dPowerKickHit:		EQU dKickHey+1			; $C1
dLowPowerKickHit:	EQU dPowerKickHit+1		; $C2
dLowerPowerKickHit:	EQU dLowPowerKickHit+1		; $C3
dLowestPowerKickHit:	EQU dLowerPowerKickHit+1	; $C4
dKick:			EQU dLowestPowerKickHit+1	; $C5
dSnare:			EQU dKick+1	; $C6
dClap:			EQU dSnare+1	; $C7
dScratch:		EQU dClap+1	; $C8
dTimpani:		EQU dScratch+1	; $C9
dHiTom:			EQU dTimpani+1	; $CA
dVLowClap:		EQU dHiTom+1	; $CB
dHiTimpani:		EQU dVLowClap+1	; $CC
dMidTimpani:	EQU dHiTimpani+1	; $CD
dLowTimpani:	EQU dMidTimpani+1	; $CE
dVLowTimpani:	EQU dLowTimpani+1	; $CF
dMidTom:		EQU dVLowTimpani+1	; $D0
dLowTom:		EQU dMidTom+1	; $D1
dFloorTom:		EQU dLowTom+1	; $D2
dHiClap:		EQU dFloorTom+1	; $D3
dMidClap:		EQU dHiClap+1	; $D4
dLowClap:		EQU dMidClap+1	; $D5
dFinalFightMetalCrash:	EQU dLowClap+1	; $D6
dIntroKick:			EQU dFinalFightMetalCrash+1	; $D7
dEchoedClapHit_S3:		EQU dIntroKick+1	; $D8
dLowerEchoedClapHit_S3:	EQU dEchoedClapHit_S3+1	; $D9
dBassD:					EQU	dLowerEchoedClapHit_S3+1
dSnareD:				EQU	dBassD+1
dBassCrash:				EQU dSnareD+1
; ---------------------------------------------------------------------------------------------
; Channel IDs for SFX
cPSG1				EQU $80
cPSG2				EQU $A0
cPSG3				EQU $C0
cNoise				EQU $E0	; Not for use in S3/S&K/S3D
cFM3				EQU $02
cFM4				EQU $04
cFM5				EQU $05
cFM6				EQU $06	; Only in S3/S&K/S3D, overrides DAC

; ---------------------------------------------------------------------------------------------
;---------------------------------------------
; SMPS F_Tone Equates 
;---------------------------------------------	
f_tone01 = $01
f_tone02 = $02
f_tone03 = $03
f_tone04 = $04
f_tone05 = $05
f_tone06 = $06
f_tone07 = $07
f_tone08 = $08
f_tone09 = $09
f_tone0A = $0A
f_tone0B = $0B
f_tone0C = $0C
; ---------------------------------------------------------------------------------------------
; PSG conversion to S3/S&K/S3D drivers require a tone shift of 12 semi-tones.
conv0To256  macro val 
	if val<$01
		dc.b (256-val+$FF)&$FF
	else	
		dc.b (256-val)&$FF	
	endc
	endm
SMPSModFix:	macro steps
	dc.b (steps/(speed-1))
	endm	
psgdelta	EQU $0C
PSGPitch macro pitch
		dc.b	(pitch+psgdelta)&$FF
	endm

s1TempotoS2 macro tmod
	if tmod<$01
		dc.b ((($FF+tmod-1)*256+($FF+tmod/2))/$FF+tmod)&$FF 	
	else
		dc.b (((tmod-1)*256+(tmod/2))/tmod)&$FF
	endc
	endm
	
s3TempotoS2 macro tmod
	if tmod<$01
		dc.b (256-tmod+$FF)&$FF
	else	
		dc.b (256-tmod)&$FF	
	endc
	endm
	
convertMainTempoMod	macro tmod
	if 		smpsHeaderStartSong=2
		dc.b tmod
	elseif 		smpsHeaderStartSong<2
		s1TempotoS2 	\tmod
	elseif	smpsHeaderStartSong>2
		s3TempotoS2  	\tmod
	endc
	endm	
; ---------------------------------------------------------------------------------------------
;smpsHeaderStartSong = 0

smpsHeaderVoiceNull macro
	dc.w	$0000
	endm

; Header - Set up Voice Location
; Common to music and SFX
smpsHeaderVoice macro loc
	romptr_z80	\loc
	endm

; Header - Set up Voice Location as S3's Universal Voice Bank
; Common to music and SFX
smpsHeaderVoiceUVB macro
	;dc.w	little_endian(z80_UniVoiceBank)
	romptr_z80	z80_UniVoiceBank
	endm

; Header macros for music (not for SFX)
; Header - Set up Channel Usage
smpsHeaderChan macro fm,psg
	dc.b	fm,psg
	endm

; Header - Set up Tempo
smpsHeaderTempo macro tdiv,tmod
	dc.b	tdiv
	convertMainTempoMod  \tmod
	endm
; Header - Set up DAC Channel

smpsHeaderDAC macro loc,pitch,vol
	romptr_z80	\loc
	if narg>=2
		dc.b	\pitch
	else
		dc.b	$00
	endc
	if narg>=3
		dc.b	\vol
	else
		dc.b	$00
	endc
	endm

; Header - Set up FM Channel
smpsHeaderFM macro loc,pitch,vol
	romptr_z80	\loc
	dc.b	pitch,vol
	endm

; Header - Set up PSG Channel
smpsHeaderPSG macro loc,pitch,vol,mod,voice
	romptr_z80	\loc
	if smpsHeaderStartSong<3
		PSGpitch \pitch
	else
		dc.b    pitch
	endc	
	dc.b   vol,mod,voice
	endm
; Header macros for SFX (not for music)
; Header - Set up Tempo
smpsHeaderTempoSFX macro div
	dc.b	div
	endm

; Header - Set up Channel Usage
smpsHeaderChanSFX macro chan
	dc.b	chan
	endm

; Header - Set up FM Channel
smpsHeaderSFXChannel macro chanid,loc,pitch,vol
	if (chanid=cNoise)
		fail "Using channel ID of cNoise ($E0) in Sonic 3 driver is dangerous. Fix the song so that it turns into a noise channel instead."
	endc
	dc.b	$80,chanid
		romptr_z80	\loc
	if (chanid&$80)<>0
		PSGPitch \pitch
	else
		dc.b	pitch
	endif
	dc.b 	vol
	endm


; ---------------------------------------------------------------------------------------------
; Co-ord Flag Macros and Equates
; E0xx - Panning, AMS, FMS
smpsPan macro direction,amsfms
panNone set $00
panRight set $40
panLeft set $80
panCentre set $C0
panCenter set $C0 ; silly Americans :U
	dc.b $E0,direction+amsfms
	endm

; E1xx - Set channel frequency displacement to xx
smpsAlterNote macro val
	dc.b	$E1,val
	endm

; E2xx - Useless
smpsNop macro val
	if smpsHeaderStartSong<3
		dc.b	$E9,val
	endc
	endm
smpsReturn	macro	offset
	dc.b $F9
	endm	

; Fade in previous song (ie. 1-Up)
smpsFade macro val
		dc.b	$E2
	endm

; E6xx - Alter Volume by xx
smpsAlterVol macro val
	dc.b	$E4,val
	endm	
; E6xx - Alter Volume by xx
smpsAlterVol2 macro val
	dc.b	$FF,val
	endm		
; E5xx - Set channel tempo divider to xx
smpsChanTempoDiv macro val
;	if SonicDriverVer=5
;		; New flag unique to Flamewing's modified S&K driver
;		dc.b	$FF,$08,val
;	elseif SonicDriverVer=3
;		fail "Coord. Flag to set tempo divider of a single channel does not exist in S3 driver. Use Flamewing's modified S&K sound driver instead."
;	else
		dc.b	$E5,val
;	endc
	endm

sVol  macro val
	$E6,val
	endm
; E7 - Prevent attack of next note
smpsNoAttack	EQU $E7

; E8xx - Set note fill to xx
smpsNoteFill macro val
		dc.b	$E8,val
	endm
smpsAlterPitch 	macro	value
	dc.b $FB,value
	endm

smpsSetTempoMod macro tmod
	dc.b	$EA
	convertMainTempoMod	\tmod
	endm

; Set music tempo divider to xx
smpsSetTempoDiv macro val
	dc.b	$EB,val
	endm

; ECxx - Set Volume to xx
smpsSetVol macro val
	dc.b	$E4,val
	endm

; Works on all drivers
smpsPSGAlterVol macro vol
	dc.b	$EC,vol
	endm

; Clears pushing sound flag in S1
smpsClearPush macro
		dc.b	$ED

	endm

; Stops special SFX (S1 only) and restarts overridden music track
smpsStopSpecial macro
;	if SonicDriverVer=1
;		dc.b	$EE
;	else
;		message "Coord. Flag to stop special SFX does not exist in S2 or S3 drivers. Complain to Flamewing to add it. With adequate caution, smpsStop can do this job."
;		dc.b	$F2
;	endc
	fail "Coord. Flag to stop special SFX does not exist in S2 or S3 drivers. Complain to Flamewing to add it. With adequate caution, smpsStop can do this job."
	endm

; EFxx[yy] - Set Voice of FM channel to xx; xx < 0 means yy present
smpsSetvoice macro voice,songID
	if narg<=1
		dc.b	$EF,voice
	else
		dc.b	$EF,voice|$80,songID+$81
	endc
	endm

; F0wwxxyyzz - Modulation - ww: wait time - xx: modulation speed - yy: change per step - zz: number of steps
smpsModSet macro wait,speed,change,step
	dc.b	$F0
	if smpsHeaderStartSong>=3
		dc.b	wait-1,speed,change
		dc.b	((256+step)/(256-speed)-1)&$FF
	else
		dc.b	wait,speed,change,step
	endif
	endm

; Turn on Modulation
smpsModChange2 macro fmmod,psgmod
	dc.b	$F1,fmmod,psgmod
	endm	
	
; F2 - End of channel
smpsStop macro
	dc.b	$F2
	endm

; F3xx - PSG waveform to xx
smpsPSGform macro form
	dc.b	$F3,form
	endm

; Turn on Modulation
smpsModOn macro
	dc.b	$F4
	endm		

; F5xx - PSG voice to xx
smpsPSGvoice macro voice
	dc.b	$F5,voice
	endm

; F6xxxx - Jump to xxxx
smpsJump macro loc
	dc.b	$F6
	romptr_z80	\loc
	endm

; F7xxyyzzzz - Loop back to zzzz yy times, xx being the loop index for loop recursion fixing
smpsLoop macro index,loops,loc
	dc.b	$F7
	dc.b	index,loops
	romptr_z80	\loc
	endm

; F8xxxx - Call pattern at xxxx, saving return point
smpsCall macro loc
	dc.b	$F8
	romptr_z80	\loc
	endm
; Turn off Modulation
smpsModOff macro
	dc.b	$FA
	endm	
; ---------------------------------------------------------------------------------------------
; Alter Volume
smpsFMAlterVol macro val
	dc.b	$E4,val
	endm

; S3/S&K/S3D-only coordination flags
; Silences FM channel then stops as per smpsStop
smpsStopFM macro
	dc.b	$E3
	endm

; Spindash Rev
smpsSpindashRev macro
	dc.b	$E9
	endm
	
smpsPlayDACSample macro sample
	dc.b	$EA,sample
	endm
	
smpsConditionalJump macro index,loc
	dc.b	$EB
	dc.b	index
	romptr_z80	\loc
	endm

; Set note values to xx-$40
smpsSetNote macro val
	dc.b	$ED,val
	endm

smpsFMICommand macro reg,val
	dc.b	$EE,reg,val
	endm

; Set Modulation
smpsModChange macro val
	dc.b	$F4,val
	endm

; FCxxxx - Jump to xxxx
smpsContinuousLoop macro loc
	dc.b	$FC
	romptr_z80	\loc
	endm

smpsAlternateSMPS macro flag
	dc.b	$FD,flag
	endm

smpsFM3SpecialMode macro ind1,ind2,ind3,ind4
	dc.b	$FE,ind1,ind2,ind3,ind4
	endm

smpsPlaySound macro index
	dc.b	$FF,$01,index
	endm

smpsHaltMusic macro flag
	dc.b	$FF,$02,flag
	endm

smpsCopyData macro data,len
	fail "Coord. Flag to copy data should not be used. Complain to Flamewing if any music uses it."
	dc.b	$FF,$03
	;dc.w	little_endian(data)
	z80_ptr	data
	dc.b	len
	endm

smpsSSGEG macro op1,op2,op3,op4
	dc.b	$FF,$05,op1,op3,op2,op4
	endm

smpsFMFlutter macro tone,mask
	dc.b	$FF,$06,tone,mask
	endm

smpsResetSpindashRev macro val
	dc.b	$FF,$07
	endm

; ---------------------------------------------------------------------------------------------
; Macros for FM instruments
; Voices - Feedback
smpsVcFeedback macro val
vcFeedback set \val
	endm

; Voices - Algorithm
smpsVcAlgorithm macro val
vcAlgorithm set \val
	endm

smpsVcUnusedBits macro val
vcUnusedBits set \val
	endm

; Voices - Detune
smpsVcDetune macro op1,op3,op2,op4
vcDT1 set \op1
vcDT2 set \op2
vcDT3 set \op3
vcDT4 set \op4
	endm

; Voices - Coarse-Frequency
smpsVcCoarseFreq macro op1,op3,op2,op4
vcCF1 set \op1
vcCF2 set \op2
vcCF3 set \op3
vcCF4 set \op4
	endm

; Voices - Rate Scale
smpsVcRateScale macro op1,op3,op2,op4
vcRS1 set \op1
vcRS2 set \op2
vcRS3 set \op3
vcRS4 set \op4
	endm

; Voices - Attack Rate
smpsVcAttackRate macro op1,op3,op2,op4
vcAR1 set \op1
vcAR2 set \op2
vcAR3 set \op3
vcAR4 set \op4
	endm

; Voices - Amplitude Modulation
smpsVcAmpMod macro op1,op3,op2,op4
vcAM1 set \op1
vcAM2 set \op2
vcAM3 set \op3
vcAM4 set \op4
	endm

; Voices - First Decay Rate
smpsVcDecayRate1 macro op1,op3,op2,op4
vcD1R1 set \op1
vcD1R2 set \op2
vcD1R3 set \op3
vcD1R4 set \op4
	endm

; Voices - Second Decay Rate
smpsVcDecayRate2 macro op1,op3,op2,op4
vcD2R1 set \op1
vcD2R2 set \op2
vcD2R3 set \op3
vcD2R4 set \op4
	endm

; Voices - Decay Level
smpsVcDecayLevel macro op1,op3,op2,op4
vcDL1 set \op1
vcDL2 set \op2
vcDL3 set \op3
vcDL4 set \op4
	endm

; Voices - Release Rate
smpsVcReleaseRate macro op1,op3,op2,op4
vcRR1 set \op1
vcRR2 set \op2
vcRR3 set \op3
vcRR4 set \op4
	endm

; Voices - Total Level
smpsVcTotalLevel macro op1,op3,op2,op4
vcTL1 set \op1
vcTL2 set \op2
vcTL3 set \op3
vcTL4 set \op4
	dc.b	(vcUnusedBits<<6)+(vcFeedback<<3)+vcAlgorithm
;   0     1     2     3     4     5     6     7
;%1000,%1000,%1000,%1000,%1010,%1110,%1110,%1111
vcTLMask4 set ((vcAlgorithm=7)<<7)
vcTLMask3 set ((vcAlgorithm>=4)<<7)
vcTLMask2 set ((vcAlgorithm>=5)<<7)
vcTLMask1 set $80
;	dc.b	(vcDT4<<4)+vcCF4 ,(vcDT3<<4)+vcCF3 ,(vcDT2<<4)+vcCF2 ,(vcDT1<<4)+vcCF1
;	dc.b	(vcRS4<<6)+vcAR4 ,(vcRS3<<6)+vcAR3 ,(vcRS2<<6)+vcAR2 ,(vcRS1<<6)+vcAR1
;	dc.b	(vcAM4<<5)+vcD1R4,(vcAM3<<5)+vcD1R3,(vcAM2<<5)+vcD1R2,(vcAM1<<5)+vcD1R1
;	dc.b	vcD2R4           ,vcD2R3           ,vcD2R2           ,vcD2R1
;	dc.b	(vcDL4<<4)+vcRR4 ,(vcDL3<<4)+vcRR3 ,(vcDL2<<4)+vcRR2 ,(vcDL1<<4)+vcRR1
;	dc.b	vcTL4|vcTLMask4  ,vcTL3|vcTLMask3  ,vcTL2|vcTLMask2  ,vcTL1|vcTLMask1
	dc.b	(vcDT4<<4)+vcCF4,(vcDT3<<4)+vcCF3,(vcDT2<<4)+vcCF2,(vcDT1<<4)+vcCF1
	dc.b	(vcRS4<<6)+vcAR4,(vcRS3<<6)+vcAR3,(vcRS2<<6)+vcAR2,(vcRS1<<6)+vcAR1
	dc.b	(vcAM4<<5)+vcD1R4,(vcAM3<<5)+vcD1R3,(vcAM2<<5)+vcD1R2,(vcAM1<<5)+vcD1R1
	dc.b	vcD2R4,vcD2R3,vcD2R2,vcD2R1
	dc.b	(vcDL4<<4)+vcRR4,(vcDL3<<4)+vcRR3,(vcDL2<<4)+vcRR2,(vcDL1<<4)+vcRR1
	dc.b	vcTL4|vcTLMask4,vcTL3|vcTLMask3,vcTL2|vcTLMask2,vcTL1|vcTLMask1
	endm

