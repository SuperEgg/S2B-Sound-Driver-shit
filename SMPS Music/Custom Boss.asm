CustomBoss_Header:
smpsHeaderStartSong = 2
	smpsHeaderVoice     CustomBoss_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $09

	smpsHeaderDAC       CustomBoss_DAC
	smpsHeaderFM        CustomBoss_FM1,	$0C, $08
	smpsHeaderFM        CustomBoss_FM2,	$0C, $0D
	smpsHeaderFM        CustomBoss_FM3,	$0C, $08
	smpsHeaderFM        CustomBoss_FM4,	$00, $12
	smpsHeaderFM        CustomBoss_FM5,	$00, $12
	smpsHeaderPSG       CustomBoss_PSG1,	$E8, $04, $00, sTone_0C
	smpsHeaderPSG       CustomBoss_PSG2,	$E8, $06, $00, sTone_0C
	smpsHeaderPSG       CustomBoss_PSG3,	$E8, $08, $00, sTone_0C

; FM1 Data
CustomBoss_FM1:
		smpsSetvoice 		$00 
		smpsNoteFill 		$09 
		dc.b 	$96, $0C, nA2, nA2, $96, nA2, nA2, $96, nA2 
		smpsNoteFill 		$00 
		dc.b 	$91, $9D, $91, $9D, $91, $9D, $91, $9D 
		smpsNoteFill 		$09 
		dc.b 	$96, nA2, nA2, $96, nA2, nA2, $96, nA2
		smpsNoteFill		$00
		dc.b 	$91, $9D, $93, $9F, $94, $A0, $95, $A1

	Beta_CustomBoss_Loop01: 
			smpsCall 			Beta_CustomBoss_Call01 
			dc.b 	$94, $0C, $A0, $06, $A0, $94, $0C, $A0, $06, $A0 
			smpsCall 			Beta_CustomBoss_Call01 
			dc.b 	$91, $0C, $9D, $06, $9D, $91, $0C, $9D, $06, $9D 
			smpsLoop 			$00, $04, Beta_CustomBoss_Loop01  
			smpsJump 			CustomBoss_FM1
 
	Beta_CustomBoss_Call01:
			dc.b 	$96, $0C, nA2, $06, nA2, $96, $0C, nA2, $06, nA2
			dc.b 	$96, $0C, nA2, $06, nA2, $96, $0C, nA2, $06, nA2
			dc.b 	$94, $0C, $A0, $06, $A0, $94, $0C, $A0, $06, $A0 
			smpsReturn

; PSG1 Data
CustomBoss_PSG1:
		smpsJump 			Beta_CustomBoss_Jump01
; PSG2 Data
CustomBoss_PSG2:
		smpsAlterNote 		$01 
		dc.b 	$80, $06 
		smpsJump 			Beta_CustomBoss_Jump01

; FM2 Data
CustomBoss_FM2:
		smpsSetvoice 		$02

	Beta_CustomBoss_Jump01:
			smpsNoteFill 		$09  
			dc.b 	nA3, $0C, nE3, nE3, nA3, nE3, nE3, nA3, nE3  
			smpsNoteFill 		$00 
			dc.b 	$B0, $18, $B0, $B0, $B0 
			smpsLoop 			$00, $02, Beta_CustomBoss_Jump01

	Beta_CustomBoss_Loop02:
			smpsCall 			CustomBoss_Call01 
			smpsLoop  			$00, $04, Beta_CustomBoss_Loop02 
			smpsJump 			Beta_CustomBoss_Jump01

	CustomBoss_Call01:
			dc.b 	nA3, $0C, $B0, $B1, $18, $B3, $B1, $B0, $0C, $B1, $B0, $AC, $18, nE3, $0C, $AC, $18
			dc.b 	nA3, $0C, $B0, $B1, $18, $B3, $B1, $B0, $0C, $B1, $B3, $B4, $B5, $80, $24 
			smpsReturn

; PSG3 Data
CustomBoss_PSG3:
		smpsAlterNote 		$FF 
		dc.b 	$80, $0C  
		smpsJump 			Beta_CustomBoss_Jump01

; FM3 Data
CustomBoss_FM3:
	smpsSetvoice        $02

CustomBoss_Loop06:
	smpsNoteFill        $08
	dc.b	nC4, $0C, nA3, nA3, nC4, nA3, nA3, nC4, nA3
	smpsNoteFill        $17
	dc.b	nAb3, $18, nAb3, nAb3, nAb3
	smpsLoop            $00, $02, CustomBoss_Loop06

CustomBoss_Loop07:
	dc.b	nRst, $30
	smpsLoop            $00, $10, CustomBoss_Loop07
	smpsAlterNote       $03
	smpsAlterVol        $FC

CustomBoss_Loop08:
	smpsCall            CustomBoss_Call01
	smpsLoop            $00, $02, CustomBoss_Loop08
	smpsAlterNote       $00
	smpsAlterVol        $04
	smpsJump            CustomBoss_FM3

; FM4 Data
CustomBoss_FM4:
	smpsPan             panLeft, $00
	smpsModSet          $0C, $01, $04, $04
	smpsJump            CustomBoss_Jump00

; FM5 Data
CustomBoss_FM5:
	smpsPan             panRight, $00
	smpsModSet          $0C, $01, $FC, $04
	smpsJump            CustomBoss_Jump00
CustomBoss_Jump00:
	smpsAlterPitch 	$F4
	smpsSetvoice        $01
	dc.b	nRst, $30, nRst, $24, nD5, $06, nE5, nF5, $0C, nF5, nE5, nE5
	dc.b	nD5, nD5, nE5, nRst, nRst, $30, nRst, $24, nD5, $06, nE5, nF5
	dc.b	$0C, nE5, nEb5, nE5, nAb5, $18, nE5
	smpsAlterPitch  	$0C
CustomBoss_Loop05:
	dc.b	nRst, $30, nRst
	smpsLoop            $00, $04, CustomBoss_Loop05
	smpsModOn
	smpsAlterVol        $02
	smpsCall            CustomBoss_Call00
	dc.b	nG3
	smpsCall            CustomBoss_Call00
	dc.b	nAb3, nC5, smpsNoAttack, $18, nD5, $0C, nC5, nB4, $30, nG4, nC5, smpsNoAttack
	dc.b	$18, nD5, $0C, nC5, nB4, $30, nAb4
	smpsAlterVol        $F5
	smpsSetvoice        $02
	dc.b	nC5, $06, nRst, nD5, nRst, nE5, $18, nF5, nE5, nD5, $06, nRst
	dc.b	nE5, nRst, nD5, nRst, nB4, $18, nG4, $06, nRst, nB4, $18, nC5
	dc.b	$06, nRst, nD5, nRst, nE5, $18, nF5, nE5, nD5, $06, nRst, nE5
	dc.b	nRst, nF5, nRst, nFs5, nRst, nAb5, $0C, nRst, $24
	smpsAlterVol        $09
	smpsJump            CustomBoss_Jump00

CustomBoss_Call00:
	dc.b	nC4, $30, smpsNoAttack, $18, nD4, $0C, nC4, nB3, $30
	smpsReturn

CustomBoss_Loop0D:
	dc.b	nA5, $24, $24, $18, nRst, $30, nRst
	smpsLoop            $00, $02, CustomBoss_Loop0D

CustomBoss_Loop0E:
	dc.b	nA5, $18
	smpsLoop            $00, $40, CustomBoss_Loop0E
	smpsJump            CustomBoss_Loop0D

; DAC Data
CustomBoss_DAC:
	dc.b	dSnareS3, $0C, dSnareS3, dSnareS3, dSnareS3, dSnareS3, dSnareS3, dSnareS3, dSnareS3, dMidTimpaniS3, $0C, dLowTimpaniS3
	dc.b	dMidTimpaniS3, dLowTimpaniS3, dMidTimpaniS3, dLowTimpaniS3, dMidTimpaniS3, dLowTimpaniS3
	smpsLoop            $00, $02, CustomBoss_DAC
	dc.b	dKickS3, $0C, dSnareS3, $06, dSnareS3

CustomBoss_Loop00:
	dc.b	dKickS3, $0C, dSnareS3, $06, dSnareS3
	smpsLoop            $00, $06, CustomBoss_Loop00
	dc.b	dKickS3, $0C, dSnareS3, $02, dMidTimpaniS3, $04, dSnareS3, $02, dMidTimpaniS3, $04, dLowTimpaniS3, $0C
	dc.b	dSnareS3, $06, dSnareS3

CustomBoss_Loop01:
	dc.b	dKickS3, $0C, dSnareS3, $06, dSnareS3
	smpsLoop            $00, $05, CustomBoss_Loop01
	dc.b	dKickS3, $0C, dSnareS3, $02, dMidTimpaniS3, $04, dSnareS3, $02, dMidTimpaniS3, $04, dLowTimpaniS3, $0C
	dc.b	dSnareS3, $02, dMidTimpaniS3, $04, dSnareS3, $02, dMidTimpaniS3, $04, dLowTimpaniS3, $0C, dSnareS3, $06
	dc.b	dSnareS3
	smpsLoop            $01, $03, CustomBoss_Loop00

CustomBoss_Loop02:
	dc.b	dKickS3, $0C, dSnareS3, $06, dSnareS3
	smpsLoop            $00, $06, CustomBoss_Loop02
	dc.b	dKickS3, $0C, dSnareS3, $02, dMidTimpaniS3, $04, dSnareS3, $02, dMidTimpaniS3, $04, dLowTimpaniS3, $0C
	dc.b	dSnareS3, $06, dSnareS3

CustomBoss_Loop03:
	dc.b	dKickS3, $0C, dSnareS3, $06, dSnareS3
	smpsLoop            $00, $03, CustomBoss_Loop03

CustomBoss_Loop04:
	dc.b	dLowTimpaniS3, $0C, dSnareS3, $02, dMidTimpaniS3, $04, dSnareS3, $02, dMidTimpaniS3, $04
	smpsLoop            $00, $04, CustomBoss_Loop04
	smpsJump            CustomBoss_DAC
CustomBoss_Voices:
;	Voice $00
	dc.b	$20
	dc.b	$66, $60, $65, $61, 	$DF, $9F, $DF, $9F, 	$07, $09, $06, $06
	dc.b	$07, $06, $06, $08, 	$29, $19, $19, $F9, 	$1C, $16, $3A, $00
	;smpsVcAlgorithm     $00
	;smpsVcFeedback      $04
	;smpsVcUnusedBits    $00
	;smpsVcDetune        $06, $06, $06, $06
	;smpsVcCoarseFreq    $01, $00, $05, $06
	;smpsVcRateScale     $02, $02, $03, $03
	;smpsVcAttackRate    $1F, $1F, $1F, $1F
	;smpsVcAmpMod        $00, $00, $00, $00
	;smpsVcDecayRate1    $06, $09, $06, $07
	;smpsVcDecayRate2    $08, $06, $06, $07
	;smpsVcDecayLevel    $0F, $01, $01, $02
	;smpsVcReleaseRate   $09, $09, $09, $09
	;smpsVcTotalLevel    $00, $16, $3A, $1C

;	Voice $01
		dc.b $3A 
		dc.b $01, $01, $01, $02,  $8D, $07, $07, $52,  $09, $00, $00, $03 
		dc.b $01, $02, $02, $00,  $52, $02, $02, $28,  $18, $18, $22, $80
	;smpsVcAlgorithm     $02
	;smpsVcFeedback      $07
	;smpsVcUnusedBits    $00
	;smpsVcDetune        $00, $00, $00, $00
	;smpsVcCoarseFreq    $02, $01, $01, $01
	;smpsVcRateScale     $01, $00, $00, $02
	;smpsVcAttackRate    $12, $07, $07, $0D
	;smpsVcAmpMod        $00, $00, $00, $00
	;smpsVcDecayRate1    $03, $00, $00, $09
	;smpsVcDecayRate2    $00, $02, $02, $01
	;smpsVcDecayLevel    $02, $00, $00, $05
	;smpsVcReleaseRate   $08, $02, $02, $02
	;smpsVcTotalLevel    $00, $22, $18, $18

;	Voice $02
	dc.b	$3A
	dc.b	$01, $01, $07, $01, 	$8E, $8D, $8E, $53, 	$0E, $0E, $0E, $03
	dc.b	$00, $00, $00, $00, 	$1F, $1F, $FF, $0F, 	$17, $27, $28, $86
	;smpsVcAlgorithm     $02
	;smpsVcFeedback      $07
	;smpsVcUnusedBits    $00
	;smpsVcDetune        $00, $00, $00, $00
	;smpsVcCoarseFreq    $01, $01, $07, $01
	;smpsVcRateScale     $01, $02, $02, $02
	;smpsVcAttackRate    $13, $0D, $0E, $0E
	;smpsVcAmpMod        $00, $00, $00, $00
	;smpsVcDecayRate1    $03, $0E, $0E, $0E
	;smpsVcDecayRate2    $00, $00, $00, $00
	;smpsVcDecayLevel    $00, $01, $0F, $01
	;smpsVcReleaseRate   $0F, $0F, $0F, $0F
	;smpsVcTotalLevel    $06, $27, $28, $17

;	Voice $03
	dc.b	$3A
	dc.b	$51, $51, $07, $02, 	$0F, $0F, $0B, $0F, 	$1F, $1F, $1F, $0F
	dc.b	$00, $00, $00, $02, 	$0F, $0F, $0F, $1F, 	$1C, $22, $28, $81
	;smpsVcAlgorithm     $02
	;smpsVcFeedback      $07
	;smpsVcUnusedBits    $00
	;smpsVcDetune        $00, $05, $00, $05
	;smpsVcCoarseFreq    $02, $01, $07, $01
	;smpsVcRateScale     $00, $00, $00, $00
	;smpsVcAttackRate    $0F, $0F, $0B, $0F
	;smpsVcAmpMod        $00, $00, $00, $00
	;smpsVcDecayRate1    $0F, $1F, $1F, $1F
	;smpsVcDecayRate2    $02, $00, $00, $00
	;smpsVcDecayLevel    $01, $00, $00, $00
	;smpsVcReleaseRate   $0F, $0F, $0F, $0F
	;smpsVcTotalLevel    $01, $22, $28, $1C

