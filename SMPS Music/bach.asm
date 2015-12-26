Bach_Header:
smpsHeaderStartSong = 2
	smpsHeaderVoice     Bach_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $09

	smpsHeaderDAC       Bach_DAC
	smpsHeaderFM        Bach_FM1,	$0C, $08
	smpsHeaderFM        Bach_FM2,	$0C, $04

; FM1 Data
Bach_FM1:
    smpsSetvoice		$00	
	dc.b		nG2, $18, nC1, $18
	smpsLoop 			$00, $14, Bach_FM1
FM1_Loop02	
	dc.b		nD3, $18, nG2, $18
	smpsLoop 			$00, $04, FM1_Loop02
	smpsStop
; FM2 Data
Bach_FM2:
	smpsAlterVol		$04
    smpsSetvoice		$01
	dc.b		nG2, $0C, nD3, $0C, nB3, $0C, nA3, $0C, nB3, $0C, nD3, $0C, nB3, $0C, nD3, $0C
	smpsLoop 			$00, $02, Bach_FM2
FM2_Loop02:	
	dc.b		nG2, $0C, nE3, $0C, nC4, $0C, nB3, $0C, nC4, $0C, nE3, $0C, nC4, $0C, nE3, $0C
	smpsLoop 			$00, $02, FM2_Loop02
FM2_Loop03:	
	dc.b		nG2, $0C, nFs3, $0C, nC4, $0C, nB3, $0C, nC4, $0C, nFs3, $0C, nC4, $0C, nFs3, $0C
	smpsLoop 			$00, $02, FM2_Loop03	
FM2_Cont01:	
	dc.b		nG2, $0C, nG3, $0C, nB3, $0C, nA3, $0C, nB3, $0C, nG3, $0C, nB3, $0C, nG3, $0C
	dc.b		nG2, $0C, nG3, $0C, nB3, $0C, nA3, $0C, nB3, $0C, nG3, $0C, nB3, $0C, nFs3,$0C
Cresendo00:
	smpsAlterVol	$FF
	dc.b		nG2, $0C, nE3, $0C 
	smpsAlterVol	$FE
	dc.b   		nB3, $0C, nA3, $0C
	smpsAlterVol	$FD
	dc.b 		nB3, $0C, nG3, $0C
	dc.b 		nFs3, $0C, nG3,$0C
	smpsAlterVol	$FC
	dc.b		nE3, $0C, nG3, $0C
Decresendo00:	
	smpsAlterVol	$03
	dc.b 		nFs3,$0C, nG3, $0C
	smpsAlterVol	$02
	dc.b 		nB2, $0C, nD3, $0C
	smpsAlterVol	$01
	dc.b 		nCs3, $0C, nB2,$0C
	smpsAlterVol	$00
FM2_Loop04:	
	dc.b		nCs3, $0C, nG3, $0C, nA3, $0C, nG3, $0C, nA3, $0C, nG3, $0C, nA3, $0C, nG3,$0C
	smpsLoop 			$00, $02, FM2_Loop04	
Cresendo01:
	smpsAlterVol	$FF
	dc.b		nFs3, $0C, nA3, $0C
	smpsAlterVol	$FE 
	dc.b 		nD4, $0C, nCs4, $0C
	smpsAlterVol	$FD 
	dc.b 		nD4, $0C, nA3, $0C
	dc.b 		nG3, $0C, nA3,$0C
	smpsAlterVol	$FC
Decresendo01:	
	dc.b		nFs3, $0C, nA3, $0C
	smpsAlterVol	$03
	dc.b 		nG3, $0C, nA3,  $0C
	smpsAlterVol	$02
	dc.b 		nD3, $0C, nFs3,$0C
	smpsAlterVol	$01 
	dc.b 		nE3, $0C, nD3,$0C
	smpsAlterVol	$00
FM2_Loop05:	
	dc.b		nE2, $0C, nB2, $0C, nG3, $0C, nFs3, $0C, nG3, $0C, nB2, $0C, nG3, $0C, nB2,$0C	
	smpsLoop 			$00, $02, FM2_Loop05
FM2_Cont02:	
	dc.b		nE2, $0C, nCs3, $0C, nD3, $0C, nE3, $0C, nD3, $0C, nCs3, $0C, nB2, $0C, nA2,$0C
Cresendo02:	
	smpsAlterVol	$FF
	dc.b		nG3, $0C, nFs3, $0C 	
	dc.b 		nE3, $0C, nD4, $0C
	smpsAlterVol	$FE 	
	dc.b 		nCs4, $0C, nB3, $0C
	smpsAlterVol	$FD 
	dc.b 		nA3, $0C, nG3,$0C
	smpsAlterVol	$FC
FM2_Cont03:	
	dc.b		nFs3,$0C, nE3,  $0C, nD3, $0C, nD4, $0C, nA3, $0C, nD4, $0C, nFs3, $0C, nA3,$0C
Decresendo02:	
	dc.b 		nD3, $0C, nE3,  $0C, nFs3,$0C, nA3,$0C
	smpsAlterVol	$03	
	dc.b 		nG3, $0C, nFs3, $0C
	smpsAlterVol	$02	
	dc.b 		nE3, $0C
	smpsAlterVol	$01	
	dc.b 		nD3,$0C
	smpsAlterVol	$00	
FM2_Cont04:	
	dc.b		nAb3,$0C, nD3,  $0C, nF3, $0C, nE3, $0C, nF3, $0C, nD3, $0C, nG3, $0C, nD3, $0C		
	dc.b		nA3, $0C, nD3,  $0C, nF3, $0C, nE3, $0C, nF3, $0C, nD3, $0C, nG3, $0C, nD3, $0C
	smpsAlterVol	$FC	
	dc.b 		nC3, $0C, nE3,  $0C, nA3, $0C, nB3, $0C, nC4, $0C, nA3, $0C, nE3, $0C, nD3, $0C
	smpsAlterVol	$01
	dc.b 		nC3, $0C, nE3,  $0C, nA3, $0C, nB3, $0C, nC4, $0C, nA3, $0C, nFs3,$0C, nE3, $0C
	smpsAlterVol	$02
FM2_Loop06:	
	dc.b 		nEb3, $0C,nFs3, $0C, nEb3,$0C, nFs3,$0C, nA3, $0C, nFs3,$0C, nA3, $0C, nFs3,$0C
	smpsLoop		$00, $02, FM2_Loop06
FM2_Cont05:
	dc.b 		nG3, $0C, nFs3, $0C, nE3, $0C, nG3, $0C, nFs3,$0C, nG3, $0C, nA3, $0C nFs3, $0C
Cresendo03:	
	smpsAlterVol 	$FF
	dc.b 		nG3, $0C, nFs3, $0C
	smpsAlterVol	$FE
	dc.b 		nE3, $0C, nD3, $0C
	smpsAlterVol	$FD
	dc.b 		nC3, $0C, nB2, $0C
	smpsAlterVol	$FC
	dc.b 		nA2, $0C, nG2, $0C
	smpsAlterVol 	$FB
FM2_Loop07:
	smpsAlterVol	$06
	dc.b 		nFs2, $0C, nC3, $0C, nD3, $0C, nC3, $0C, nD3, $0C, nC3, $0C, nD3, $0C, nC3, $0C
	smpsLoop		$00, $02, FM2_Loop07
FM2_Loop08:
	dc.b 		nG2, $0C, nB2, $0C, nF3, $0C, nE3, $0C, nF3, $0C, nB2, $0C, nF3, $0C, nB2, $0C
	smpsLoop		$00, $02, FM2_Loop08
FM2_Loop09:	
	dc.b		nG2, $0C, nC3, $0C, nE3, $0C, nD3, $0C, nE3, $0C, nC3, $0C, nE3, $0C, nC3, $0C
	smpsLoop		$00, $02, FM2_Loop09
FM2_Loop0A:
	dc.b 		nG2, $0C, nFs3, $0C, nC4, $0C, nB3, $0C, nC4, $0C, nFs3, $0C, nC4, $0C, nFs3, $0C
	smpsLoop		$00, $02, FM2_Loop0A
FM2_Cont06:
	dc.b 		nG2, $0C, nD3, $0C, nB3, $0C, nA3, $0c, nB3, $0c, nG3, $0C, nFs3, $0C, nE3, $0C
Cresendo04:
	smpsAlterVol	$FF
	dc.b 		nD3, $0C, nC3, $0C
	smpsAlterVol	$FE
	dc.b 		nB2, $0C, nA2, $0C
	smpsAlterVol	$FD
	dc.b 		nG2, $0C, nFs2, $0C
	smpsAlterVol	$FC
	dc.b 		nE2, $0C, nD2, $0C
	smpsAlterVol	$FB
FM2_Loop0B:
	dc.b		nCs2, $0C, nBb2, $0C
 MiniCresendo01:	
	smpsAlterVol	$FA
	dc.b 		nE3, $0C, nFs3, $0C, nG3, $0C
 MiniDecresendo01:
	smpsAlterVol	$01
	dc.b 		nE3, $0C
	smpsAlterVol 	$02
	dc.b 		nFs3, $0C
	smpsAlterVol	$03
	dc.b 		nG3, $0C
	smpsLoop		$00, $02, FM2_Loop0B
Cresendo05:	
	smpsAlterVol	$FF
	dc.b 		nC2, $0C, nA2, $0C
	smpsAlterVol	$FE
	dc.b 		nD3, $0C, nE3, $0C
	smpsAlterVol	$FD
	dc.b 		nFs3, $0C, nD3, $0C
	smpsAlterVol	$FC
	dc.b 		nE3, $0C, nFs3, $0C
FM2_Cont07:	
	dc.b 		nC2, $0C, nA2, $0C, nD3, $0C, nE3, $0C, nFs3, $0C, nD3, $0C, nE3, $0C, nFs3, $0C
	dc.b 		nC2, $0C, nA2, $0C, nD3, $0C, nFs3,$0C, nA3, $0C, nCs4, $0C, nD4, $18
	smpsAlterVol	$F9
	dc.b 		nD4, $0C, nA2, $0C, nB2, $0C, nC3, $0C, nD3, $0C, nE3, $0C, nFs3, $0C, nG3, $0C 
	dc.b 		nA3, $0C, nFs3, $0C, nD3, $0C, nE3, $0C, nFs3, $0C, nG3, $0C, nA3, $0C, nB3, $0C
	dc.b 		nC4, $0C, nA3, $0C, nFs3, $0C, nG3, $0C, nA3, $0C, nB3, $0C, nC4, $0C, nD4, $0C
	dc.b 		nEb4, $0C, nD4, $0C, nCs4, $0C, nD4, $0C, nD4, $0C, nC4, $0C, nB3, $0C, nC4, $0C
	dc.b 		nC4, $0C, nA3, $0C, nFs3, $0C, nE3, $0C, nD3, $0C, nA2, $0C, nB2, $0C, nC3, $0C
	smpsAlterVol	$05
	dc.b 		nD2, $0C, nA2, $0C, nD3, $0C, nFs3, $0C, nA3, $0C, nB3, $0C, nC4, $0C, nA3, $0C
	dc.b 		nB3, $0C, nG3, $0C, nD3, $0C, nC2, $0C, nB2, $0C, nG2, $0C, nA2, $0C, nB2, $0C 
Cresendo06:	
	dc.b 		nD2, $0C, nG2, $0C
	dc.b 		nB2, $0C, nD3, $0C
	dc.b 		nG3, $0C, nA3, $0C
	dc.b 		nB3, $0C, nD3, $0C
FM2_Cont08:
	dc.b 		nCs4, $0C, nB3, $0C, nA3, $0C, nBb3, $0C, nBb3, $0C, nA3, $0C, nAb3, $0C, nA3, $0C
	dc.b 		nA3, $0C, nG3, $0C, nFs3, $0C, nG3, $0C, nG3, $0C, nE3, $0C, nCs3, $0C, nB2, $0C
	dc.b 		nA2, $0C, nCs3, $0C, nE3, $0C, nG3, $0C, nA3, $0C, nCs4, $0C, nD4, $0C, nCs4, $0C
	
	smpsStop
	smpsJump		Bach_FM2
	smpsReturn

; DAC Data
Bach_DAC:
		dc.b 	dSnareS3, $0C, dFloorTomS3, dFloorTomS3, dSnareS3, dFloorTomS3, dFloorTomS3, dSnareS3, dFloorTomS3, dFloorTomS3, $18, dFloorTomS3, dFloorTomS3, dFloorTomS3 
		smpsLoop 			$00, $02, Bach_DAC

	BachDAC_Loop01:  
			dc.b 	dKickS3, $0C, dSnareS3, $06, dSnareS3, dKickS3, $0C, dSnareS3, $06, dSnareS3, dKickS3, $0C, dSnareS3, $06  
			dc.b 	dSnareS3, dKickS3, $0C, dSnareS3, $06, dSnareS3, dKickS3, $0C, dSnareS3, $06, dSnareS3, dKickS3, $0C, dSnareS3 
			dc.b  	$06, dSnareS3, dKickS3, $0C, dSnareS3, $02, dFloorTomS3, $04, dSnareS3, $02, dFloorTomS3, $04, dKickS3, $0C 
			dc.b 	dSnareS3, $02, dFloorTomS3, $04, dSnareS3, $02, dFloorTomS3, $04 
			smpsLoop 			$00, $08, BachDAC_Loop01
			smpsJump 			Bach_DAC
Bach_Voices:
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
	;smpsVcDetune        $07, $00, $00, $03
	;smpsVcCoarseFreq    $01, $01, $01, $01
	;smpsVcRateScale     $01, $01, $02, $02
	;smpsVcAttackRate    $0D, $0F, $0F, $0F
	;smpsVcAmpMod        $00, $00, $00, $00
	;smpsVcDecayRate1    $03, $00, $09, $09
	;smpsVcDecayRate2    $00, $00, $00, $00
	;smpsVcDecayLevel    $00, $00, $0F, $01
	;smpsVcReleaseRate   $0A, $05, $05, $05
	;smpsVcTotalLevel    $01, $19, $1F, $19

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

