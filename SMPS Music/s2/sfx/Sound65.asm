Sound65_Leaves_Header:
smpsHeaderStartSong = 2
	smpsHeaderVoice     Sound65_Leaves_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cPSG3, Sound65_Leaves_PSG3,	$F8, $00

; PSG3 Data
Sound65_Leaves_PSG3:
	smpsPSGvoice        fTone_03
	smpsPSGform         $E7
	dc.b	nF6, $03
	smpsPSGvoice        fTone_06
	dc.b	nF6, $04
	smpsPSGAlterVol     $02
	dc.b	nF6, $02
	smpsPSGvoice        fTone_03
	smpsPSGAlterVol     $FE
	dc.b	nF6, $08, nF6, $18
	smpsStop

; Song seems to not use any FM voices
Sound65_Leaves_Voices:
