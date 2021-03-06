S3D_Invic_Header:
smpsHeaderStartSong= 3
	smpsHeaderVoice     S3D_Invic_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $72

	smpsHeaderDAC       S3D_Invic_DAC
	smpsHeaderFM        S3D_Invic_FM1,	$FD, $0B
	smpsHeaderFM        S3D_Invic_FM2,	$F1, $16
	smpsHeaderFM        S3D_Invic_FM3,	$F1, $18
	smpsHeaderFM        S3D_Invic_FM4,	$09, $15
	smpsHeaderFM        S3D_Invic_FM5,	$F1, $16
	smpsHeaderPSG       S3D_Invic_PSG1,	$00, $06, $00, sTone_06
	smpsHeaderPSG       S3D_Invic_PSG2,	$00, $07, $00, sTone_04
	smpsHeaderPSG       S3D_Invic_PSG3,	$23, $00, $00, sTone_03

; FM1 Data
S3D_Invic_FM1:
	smpsSetvoice        $00
	dc.b	nRst, $30

S3D_Invic_Jump04:
	smpsCall            S3D_Invic_Call03
	dc.b	nG2, nA2, nB2, nC3, nD3, nE3, nF3, nFs3, nG3, nRst, $09, nG2
	dc.b	$0C
	smpsAlterPitch      $02
	smpsCall            S3D_Invic_Call03
	smpsAlterPitch      $FE
	dc.b	nA2, nB2, nCs3, nD3, nE3, nFs3, nG3, nAb3, nA3, nRst, $09, nA2
	dc.b	$0C
	smpsAlterPitch      $04
	smpsCall            S3D_Invic_Call03
	smpsAlterPitch      $FC
	dc.b	nB2, nCs3, nEb3, nE3, nFs3, nAb3, nA3, nBb3, nB3, nRst, $09, nG3
	dc.b	$0C
	smpsJump            S3D_Invic_Jump04

S3D_Invic_Call03:
	dc.b	nC3, $06, nC4, $03, nC4
	smpsLoop            $00, $06, S3D_Invic_Call03
	dc.b	nC3, nC3, nD3, nD3, nE3, nF3, nE3, nC3

S3D_Invic_Loop00:
	dc.b	nB2, $06, nB3, $03, nB3
	smpsLoop            $00, $05, S3D_Invic_Loop00
	dc.b	nC3, $06, nC4, $03, nC4, nD3, nE3, nD3, nC3, nB2, nA2, nG2
	dc.b	$06

S3D_Invic_Loop01:
	dc.b	nAb2, $06, nAb3, $03, nAb3
	smpsLoop            $00, $04, S3D_Invic_Loop01
	smpsReturn

; FM2 Data
S3D_Invic_FM2:
	smpsPan             panLeft, $00
	smpsSetvoice        $01
	dc.b	nRst, $30

S3D_Invic_Jump01:
	smpsCall            S3D_Invic_Call02
	dc.b	nG5, $03, nA5, nB5, nC6, nD6, nE6, nF6, nFs6, nG6, nRst, $09
	smpsModSet          $07, $01, $09, $05
	dc.b	nG5, $0C
	smpsAlterPitch      $02
	smpsCall            S3D_Invic_Call02
	smpsAlterPitch      $FE
	dc.b	nA5, $03, nB5, nCs6, nD6, nE6, nFs6, nG6, nAb6, nA6, nRst, $09
	smpsModSet          $07, $01, $09, $05
	dc.b	nA5, $0C
	smpsAlterPitch      $04
	smpsCall            S3D_Invic_Call02
	smpsAlterPitch      $FC
	dc.b	nB6, $03, nA6, nAb6, nFs6, nE6, nEb6, nCs6, nC6, nB5, nRst, $09
	smpsModSet          $07, $01, $09, $05
	dc.b	nG5, $0C
	smpsJump            S3D_Invic_Jump01

S3D_Invic_Call02:
	smpsModSet          $0C, $01, $F8, $FF
	dc.b	nRst, $0C, nC6
	smpsModSet          $07, $01, $03, $05
	dc.b	nG5, $06, nG6, nF6, nE6, smpsNoAttack, nE6, nF6, nE6
	smpsModSet          $07, $01, $09, $05
	dc.b	nC6, $12
	smpsModSet          $0C, $01, $F0, $FD
	dc.b	smpsNoAttack, nC6, $0C
	smpsModSet          $0C, $01, $F8, $FD
	dc.b	nRst, $0C, nC6
	smpsModSet          $07, $01, $03, $05
	dc.b	nG5, $06, nG6, nF6, nE6, smpsNoAttack, nE6, nF6, nE6, nC6
	smpsModSet          $07, $01, $09, $05
	dc.b	nD6, $0C
	smpsModSet          $0C, $01, $F0, $FF
	dc.b	smpsNoAttack, nD6
	smpsModSet          $0C, $01, $05, $07
	dc.b	nC6, $12, nF6, $0C
	smpsModSet          $07, $01, $03, $05
	dc.b	nE6, $06, nD6, nC6
	smpsReturn

; FM3 Data
S3D_Invic_FM3:
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	dc.b	nRst, $30

S3D_Invic_Jump03:
	smpsCall            S3D_Invic_Call01
	dc.b	nD5, $03, nFs5, nG5, nA5, nB5, nC6, nD6, nC6, nB5, nRst, $09
	smpsModSet          $07, $01, $09, $05
	dc.b	nD5, $0C
	smpsAlterPitch      $02
	smpsCall            S3D_Invic_Call01
	smpsAlterPitch      $FE
	dc.b	nE5, $03, nAb5, nA5, nB5, nCs6, nD6, nE6, nD6, nCs6, nRst, $09
	smpsModSet          $07, $01, $09, $05
	dc.b	nE5, $0C
	smpsAlterPitch      $04
	smpsCall            S3D_Invic_Call01
	smpsAlterPitch      $FC
	dc.b	nAb6, $03, nFs6, nE6, nEb6, nCs6, nB5, nBb5, nA5, nFs5, nRst, $09
	smpsModSet          $07, $01, $09, $05
	dc.b	nD5, $0C
	smpsJump            S3D_Invic_Jump03

S3D_Invic_Call01:
	smpsModSet          $0C, $01, $F8, $FF
	dc.b	nRst, $0C, nG5
	smpsModSet          $07, $01, $03, $05
	dc.b	nE5, $06, nE6, nD6, nC6, smpsNoAttack, nC6, nD6, nC6
	smpsModSet          $07, $01, $09, $05
	dc.b	nG5, $12
	smpsModSet          $0C, $01, $F0, $FD
	dc.b	smpsNoAttack, nG5, $0C
	smpsModSet          $0C, $01, $F8, $FD
	dc.b	nRst, $0C, nG5
	smpsModSet          $07, $01, $03, $05
	dc.b	nD5, $06, nD6, nD6, nC6, smpsNoAttack, nC6, nD6, nC6, nG5
	smpsModSet          $07, $01, $09, $05
	dc.b	nB5, $0C
	smpsModSet          $0C, $01, $F0, $FF
	dc.b	smpsNoAttack, nB5, $0C
	smpsModSet          $0C, $01, $05, $07
	dc.b	nAb5, $12, nC6, $0C
	smpsModSet          $07, $01, $03, $05
	dc.b	$06, nAb5, nAb5
	smpsReturn

; FM4 Data
S3D_Invic_FM4:
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	smpsModSet          $07, $01, $03, $05
	dc.b	nRst, $30

S3D_Invic_Jump02:
	dc.b	nC4, $30
	smpsCall            S3D_Invic_Call00
	dc.b	nG4, $0C, nA4, nB4, nC5, nD5, $30
	smpsAlterPitch      $02
	smpsCall            S3D_Invic_Call00
	smpsAlterPitch      $FE
	dc.b	nA4, $0C, nB4, nCs5, nD5, nE5, $30
	smpsAlterPitch      $04
	smpsCall            S3D_Invic_Call00
	smpsAlterPitch      $FC
	dc.b	nB4, $0C, nA4, nAb4, nG4
	smpsJump            S3D_Invic_Jump02

S3D_Invic_Call00:
	dc.b	nG4, $12, nE4, nC5, $0C, nB4, $30, nC5, $12, nB4, nG4, $0C
	dc.b	nAb4, $30
	smpsReturn

; FM5 Data
S3D_Invic_FM5:
	smpsPan             panRight, $00
	smpsSetvoice        $01
	dc.b	nRst, $02, nRst, $30
	smpsJump            S3D_Invic_Jump01

; PSG1 Data
S3D_Invic_PSG1:
	smpsStop

; PSG2 Data
S3D_Invic_PSG2:
	smpsStop

; PSG3 Data
S3D_Invic_PSG3:
	smpsPSGform         $E7
	dc.b	nRst, $30

S3D_Invic_Jump05:
	smpsPSGvoice        sTone_26
	dc.b	nC4, $0C, nRst, $06
	smpsPSGvoice        sTone_24
	dc.b	nC4, $03, $03, $06, $03, $03, nRst, $06, nC4, $03, $03, $06
	dc.b	$03, $03, nRst, $06, nC4, $03, $03, $06, $03, $03, nRst, $06
	dc.b	nC4, $03, $03
	smpsPSGvoice        sTone_26
	dc.b	nC4, $0C, nRst, $06
	smpsPSGvoice        sTone_24
	dc.b	nC4, $03, $03, $06, $03, $03, nRst, $06, nC4, $03, $03, $06
	dc.b	$03, $03, nRst, $06, nC4, $03, $03, $03, $03, nRst, $12
	smpsPSGvoice        sTone_26
	dc.b	nC4, $0C, nRst, $06
	smpsPSGvoice        sTone_24
	dc.b	nC4, $03, $03, $06, $03, $03, nRst, $06, nC4, $03, $03
	smpsPSGvoice        sTone_1E
	dc.b	$0C, $0C, $0C
	smpsPSGvoice        sTone_26
	dc.b	$0C
	smpsJump            S3D_Invic_Jump05

; DAC Data
S3D_Invic_DAC:
	dc.b	dSnareS3, $06, $06, nRst, $03, dSnareS3, $03, $06, dHighTom, $02, $02, $02
	dc.b	dMidTomS3, $03, $03, dLowTomS3, $03, $03, dFloorTomS3, $03, $03

S3D_Invic_Jump00:
	dc.b	dKickS3, $0C, dMuffledSnare, dKickS3, dMuffledSnare, dKickS3, dMuffledSnare, dKickS3, dMuffledSnare, $09, dSnareS3, $03
	dc.b	dKickS3, $0C, dMuffledSnare, dKickS3, dMuffledSnare, dKickS3, dMuffledSnare, dKickS3, $06, dSnareS3, dMuffledSnare, $03
	dc.b	dSnareS3, $06, $03, dKickS3, $0C, dMuffledSnare, dKickS3, dMuffledSnare, dSnareS3, $03, $03, $03
	dc.b	$03, $03, $03, $03, $03, $06, dKickS3, $02, $02, $02, dSnareS3, $0C
	smpsJump            S3D_Invic_Jump00

S3D_Invic_Voices:
;	Voice $00
;	$20
;	$36, $35, $30, $31, 	$DF, $DF, $9F, $9F, 	$07, $06, $09, $06
;	$07, $06, $06, $08, 	$2F, $1F, $1F, $FF, 	$19, $37, $13, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $03, $03
	smpsVcCoarseFreq    $01, $00, $05, $06
	smpsVcRateScale     $02, $02, $03, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $06, $09, $06, $07
	smpsVcDecayRate2    $08, $06, $06, $07
	smpsVcDecayLevel    $0F, $01, $01, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $13, $37, $19

;	Voice $01
;	$3D
;	$01, $21, $51, $01, 	$12, $14, $14, $0F, 	$0A, $05, $05, $05
;	$00, $00, $00, $00, 	$2B, $2B, $2B, $1B, 	$19, $80, $80, $80
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $05, $02, $00
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0F, $14, $14, $12
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $05, $05, $0A
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $02, $02, $02
	smpsVcReleaseRate   $0B, $0B, $0B, $0B
	smpsVcTotalLevel    $00, $00, $00, $19

;	Voice $02
;	$16
;	$7A, $74, $3C, $31, 	$1F, $1F, $1F, $1F, 	$0A, $08, $0C, $0A
;	$07, $0A, $07, $05, 	$2F, $AF, $AF, $5F, 	$14, $85, $8A, $80
	smpsVcAlgorithm     $06
	smpsVcFeedback      $02
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $07, $07
	smpsVcCoarseFreq    $01, $0C, $04, $0A
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0A, $0C, $08, $0A
	smpsVcDecayRate2    $05, $07, $0A, $07
	smpsVcDecayLevel    $05, $0A, $0A, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $0A, $05, $14

