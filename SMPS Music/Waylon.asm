Waylon_Header:
smpsHeaderStartSong = 1
	smpsHeaderVoice     Snd_Waylon_Voices	
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $02, $00
	
	smpsHeaderDAC       Waylon_DAC
	smpsHeaderFM        Waylon_FM1,	$0C, $07
	smpsHeaderFM        Waylon_FM2,	$0C, $07
	smpsHeaderFM        Waylon_FM3,	$0C, $07
	smpsHeaderFM        Waylon_FM4,	$00, $07
	smpsHeaderFM        Waylon_FM5,	$00, $07
	smpsHeaderPSG       Waylon_PSG1,$E8, $02, $00, $00
	smpsHeaderPSG       Waylon_PSG2,$E8, $02, $00, $00
	smpsHeaderPSG       Waylon_PSG3,$E8, $02, $00, $00


Waylon_FM1:
	smpsStop
	smpsSetvoice 	$01	
	dc.b 	nE1,$0D,nFs1,$0D,nA1,$0D,nC2,$06,nB1,$06,nA1,$0D,nE1,$0D,nFs1,$0D
	
A_Chord_Loop:
	dc.b    nA1,$18,nE2,$18,nA1,$18,nE2,$18,nA1 
	smpsStop
Waylon_FM2:
	smpsStop
	smpsSetvoice 	$02
	dc.b 	nRst,$0D,nRst,$0D,nRst,$0D,nRst,$06,nRst,$06,nRst,$0D,nRst,$0D,nRst,$0D	
	dc.b 	nRst,$18,nA2,$18,nA2,$18,nA2,$18,nA2	
	smpsStop
Waylon_FM3:
	smpsStop
Waylon_FM4:
	smpsStop
Waylon_FM5:
	smpsStop
Waylon_PSG1:
	smpsStop
Waylon_PSG2:
	smpsStop
Waylon_PSG3:
	smpsStop
Waylon_DAC:
	dc.b	dSnareS3, $0C; $81
	dc.b	dHighTom, $0C; $82
	dc.b	dMidTomS3, $0C; $83
	dc.b	dLowTomS3, $0C; $84
	dc.b	dFloorTomS3, $0C; $85
	dc.b	dKickS3, $0C; $86
	dc.b	dMuffledSnare, $0C; $87
	dc.b	dCrashCymbal, $0C; $88
	dc.b	dRideCymbal, $0C; $89
	dc.b	dLowMetalHit, $0C; $8A
	dc.b	dMetalHit, $0C; $8B
	dc.b	dHighMetalHit, $0C; $8C
	dc.b	dHigherMetalHit, $0C; $8D
	dc.b	dMidMetalHit, $0C; $8E
	dc.b	dClapS3, $0C; $8F
	dc.b	dElectricHighTom, $0C; $90
	dc.b	dElectricMidTom, $0C; $91
	dc.b	dElectricLowTom, $0C; $92
	dc.b	dElectricFloorTom, $0C; $93
	dc.b	dTightSnare, $0C; $94
	dc.b	dMidpitchSnare, $0C; $95
	dc.b	dLooseSnare, $0C; $96
	dc.b	dLooserSnare, $0C; $97
	dc.b	dHiTimpaniS3, $0C; $98
	dc.b	dLowTimpaniS3, $0C; $99
	dc.b	dMidTimpaniS3, $0C; $9A
	dc.b	dQuickLooseSnare, $0C; $9B
	dc.b	dClick, $0C; $9C
	dc.b	dPowerKick, $0C; $9D
	dc.b	dQuickGlassCrash, $0C; $9E
	dc.b	dGlassCrashSnare, $0C; $9F
	dc.b	dGlassCrash, $0C; $A0
	dc.b	dGlassCrashKick, $0C; $A1
	dc.b	dQuietGlassCrash, $0C; $A2
	dc.b	dOddSnareKick, $0C; $A3
	dc.b	dKickExtraBass, $0C; $A4
	dc.b	dComeOn, $0C; $A5
	dc.b	dDanceSnare, $0C; $A6
	dc.b	dLooseKick, $0C; $A7
	dc.b	dModLooseKick, $0C; $A8
	dc.b	dWoo, $0C; $A9
	dc.b	dGo, $0C; $AA
	dc.b	dSnareGo, $0C; $AB
	dc.b	dPowerTom, $0C; $AC
	dc.b	dHiWoodBlock, $0C; $AD
	dc.b	dLowWoodBlock, $0C; $AE
	dc.b	dHiHitDrum, $0C; $AF
	dc.b	dLowHitDrum, $0C; $B0
	dc.b	dMetalCrashHit, $0C; $B1
	dc.b	dEchoedClapHit, $0C; $B2
	dc.b	dLowerEchoedClapHit, $0C; $B3
	dc.b	dHipHopHitKick, $0C; $B4
	dc.b	dHipHopHitPowerKick, $0C; $B5
	dc.b	dBassHey, $0C; $B6
	dc.b	dDanceStyleKick, $0C; $B7
	dc.b	dHipHopHitKick2, $0C; $B8
	dc.b	dHipHopHitKick3, $0C; $B9
	dc.b	dReverseFadingWind, $0C; $BA
	dc.b	dScratchS3, $0C; $BB
	dc.b	dLooseSnareNoise, $0C; $BC
	dc.b	dPowerKick2, $0C; $BD
	dc.b	dCrashingNoiseWoo, $0C; $BE
	dc.b	dQuickHit, $0C; $BF
	dc.b	dKickHey, $0C; $C0
	dc.b	dPowerKickHit, $0C; $C1
	dc.b	dLowPowerKickHit, $0C; $C2
	dc.b	dLowerPowerKickHit, $0C; $C3
	dc.b	dLowestPowerKickHit, $0C; $C4
	dc.b	dKick, $0C; $C5
	dc.b	dSnare, $0C; $C6
	dc.b	dClap, $0C; $C7
	dc.b	dScratch, $0C; $C8
	dc.b	dTimpani, $0C; $C9
	dc.b	dHiTom, $0C; $CA
	dc.b	dVLowClap, $0C; $CB
	dc.b	dHiTimpani, $0C; $CC
	dc.b	dMidTimpani, $0C; $CD
	dc.b	dLowTimpani, $0C; $CE
	dc.b	dVLowTimpani, $0C; $CF
	dc.b	dMidTom, $0C; $D0
	dc.b	dLowTom, $0C; $D1
	dc.b	dFloorTom, $0C; $D2
	dc.b	dHiClap, $0C; $D3
	dc.b	dMidClap, $0C; $D4
	dc.b	dLowClap, $0C; $D5
	dc.b	dFinalFightMetalCrash, $0C; $D6
	dc.b	dIntroKick, $0C; $D7
	dc.b	dEchoedClapHit_S3, $0C; $D8
	dc.b	dLowerEchoedClapHit_S3, $0C; $D9	
	
	smpsStop
	
Snd_Waylon_Voices
;	Voice $00
;	$38
;	$47, $31, $73, $41, 	$17, $11, $14, $18, 	$02, $0C, $05, $01
;	$00, $0F, $00, $00, 	$1F, $3F, $5F, $1F, 	$28, $13, $23, $81
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $07, $03, $04
	smpsVcCoarseFreq    $01, $03, $01, $07
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $18, $14, $11, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $01, $05, $0C, $02
	smpsVcDecayRate2    $00, $00, $0F, $00
	smpsVcDecayLevel    $01, $05, $03, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $01, $23, $13, $28

;	Voice $01
;	$3B
;	$47, $40, $41, $40, 	$9F, $1F, $1F, $1F, 	$0F, $0E, $09, $09
;	$00, $00, $00, $00, 	$EF, $EF, $EF, $EF, 	$24, $12, $15, $81
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $04, $04, $04
	smpsVcCoarseFreq    $00, $01, $00, $07
	smpsVcRateScale     $00, $00, $00, $02
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $09, $09, $0E, $0F
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $0E, $0E, $0E, $0E
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $01, $15, $12, $24

;	Voice $02
;	$3B
;	$7C, $19, $11, $71, 	$13, $1C, $1C, $1B, 	$0C, $09, $0A, $02
;	$00, $06, $04, $07, 	$1F, $EF, $FF, $EF, 	$23, $29, $10, $81
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $01, $01, $07
	smpsVcCoarseFreq    $01, $01, $09, $0C
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1B, $1C, $1C, $13
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $02, $0A, $09, $0C
	smpsVcDecayRate2    $07, $04, $06, $00
	smpsVcDecayLevel    $0E, $0F, $0E, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $01, $10, $29, $23

;	Voice $03
;	$34
;	$61, $01, $01, $61, 	$10, $11, $50, $D1, 	$06, $01, $01, $01
;	$08, $00, $09, $00, 	$8F, $FF, $FF, $FF, 	$19, $85, $17, $86
	smpsVcAlgorithm     $04
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $00, $00, $06
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $03, $01, $00, $00
	smpsVcAttackRate    $11, $10, $11, $10
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $01, $01, $01, $06
	smpsVcDecayRate2    $00, $09, $00, $08
	smpsVcDecayLevel    $0F, $0F, $0F, $08
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $06, $17, $05, $19

;	Voice $04
;	$1B
;	$65, $50, $20, $41, 	$1C, $18, $1A, $18, 	$0F, $0C, $0B, $07
;	$05, $01, $05, $01, 	$CF, $0F, $DF, $CF, 	$21, $19, $26, $81
	smpsVcAlgorithm     $03
	smpsVcFeedback      $03
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $02, $05, $06
	smpsVcCoarseFreq    $01, $00, $00, $05
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $18, $1A, $18, $1C
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $07, $0B, $0C, $0F
	smpsVcDecayRate2    $01, $05, $01, $05
	smpsVcDecayLevel    $0C, $0D, $00, $0C
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $01, $26, $19, $21

;	Voice $05
;	$38
;	$73, $55, $12, $31, 	$16, $15, $14, $12, 	$0E, $01, $05, $04
;	$0C, $13, $0C, $0B, 	$FF, $EF, $DF, $8F, 	$36, $38, $21, $85
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $01, $05, $07
	smpsVcCoarseFreq    $01, $02, $05, $03
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $12, $14, $15, $16
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $05, $01, $0E
	smpsVcDecayRate2    $0B, $0C, $13, $0C
	smpsVcDecayLevel    $08, $0D, $0E, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $05, $21, $38, $36
	
