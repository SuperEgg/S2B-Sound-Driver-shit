	include 	"_smps2asm_inc.asm"                 
	if BytePerfect<1
Sound_Driver: ; loc_EC000: S2B_0x0EC000:                 
	include 	"Sound Driver\Saxman Compression Routine.asm" 	
z80_Driver:  
	incbin 	"z80.sax"
z80_Driver_End:		
	align	$ED000 
	else
z80_Driver:  
	incbin 	"z80.bin"
;=============================================================================== 
; DAC Bank Table
;=============================================================================== 			
	align 	m68kDriverSizeStart+zSong_Banklist	
zSongBank:
	dc.b 	$16 ;01
	dc.b 	$16 ;02
	dc.b 	$16 ;03
	dc.b 	$16 ;04
	dc.b 	$16 ;05
	dc.b 	$16 ;06
	dc.b 	$16 ;07
	dc.b 	$16 ;08
	dc.b 	$16 ;09
	dc.b 	$16 ;0A
	dc.b 	$17 ;0B
	dc.b 	$17 ;0C
	dc.b 	$17 ;0D
	dc.b 	$17 ;0E
	dc.b 	$17 ;0F

	dc.b 	$17 ;10
	dc.b 	$17 ;11
	dc.b 	$17 ;12
	dc.b 	$17 ;13
	dc.b 	$17 ;14
	dc.b 	$17 ;15
	dc.b 	$17 ;16
	dc.b 	$17 ;17
	dc.b 	$17 ;18
	dc.b 	$17 ;19
	dc.b 	$17 ;1A
	dc.b 	$17 ;1B
	dc.b 	$17 ;1C
	dc.b 	$18 ;1D
	dc.b 	$18 ;1E
	dc.b 	$18 ;1F

	dc.b 	$18 ;20
	dc.b 	$18 ;21
	dc.b 	$18 ;22
	dc.b 	$18 ;23
	dc.b 	$18 ;24
	dc.b 	$18 ;25
	dc.b 	$18 ;26
	dc.b 	$18 ;27
	dc.b 	$18 ;28
	dc.b 	$18 ;29
	dc.b 	$18 ;2A
	dc.b 	$18 ;2B
	dc.b 	$18 ;2C
	dc.b 	$19 ;2D
	dc.b 	$19 ;2E
	dc.b 	$19 ;2F

	dc.b 	$19 ;30
	dc.b 	$19 ;31
	dc.b 	$19 ;32
	dc.b 	$19 ;33
	dc.b 	$19 ;34
	dc.b 	$19 ;35
	dc.b 	$19 ;36
	dc.b 	$19 ;37
	dc.b 	$19 ;38
	dc.b 	$19 ;39
	dc.b 	$19 ;3A
	dc.b 	$19 ;3B
	dc.b 	$19 ;3C
	dc.b 	$1A ;3D
	dc.b 	$1A ;3E
	dc.b 	$1A ;3F

	dc.b 	$1A ;40
	dc.b 	$14 ;41
	dc.b 	$14 ;42
	dc.b 	$14 ;43
	dc.b 	$14 ;44
	dc.b 	$14 ;45
	dc.b 	$14 ;46
	dc.b 	$14 ;47
	dc.b 	$14 ;48
	dc.b 	$14 ;49
	dc.b 	$14 ;4A
	dc.b 	$14 ;4B
	dc.b 	$14 ;4C
	dc.b 	$14 ;4D
	dc.b 	$1A ;4E
	dc.b 	$1A ;4F	

	dc.b 	$12 ;50
	dc.b 	$12 ;51
	dc.b 	$12 ;52
	dc.b 	$12 ;53
	dc.b 	$12 ;54
	dc.b 	$12 ;55
	dc.b 	$12 ;56
	dc.b 	$12 ;57
	dc.b 	$12 ;58
	dc.b 	$12 ;59
	dc.b 	$12 ;5A
	dc.b 	$12 ;5B
	dc.b 	$13 ;5C
	dc.b 	$13 ;5D
	dc.b 	$13 ;5E
	dc.b 	$13 ;5F		
	
	dc.b 	$13 ;60
	dc.b	$13	;61
	dc.b	$13	;62
	dc.b	$13	;63 
 	dc.b	$13 ;64
 	dc.b 	$13	;65
 	dc.b	$13	;66
 	dc.b	$13	;67
	dc.b	$11 ;68 
	dc.b	$11 ;69
 	dc.b	$11 ;6A
 	dc.b	$11 ;6B
 	dc.b	$13 ;6C
 	dc.b	$11 ;6D
	dc.b	$13 ;6E 
 	dc.b	$14 ;6F

	dc.b	$14 ;70 
 	dc.b	$14 ;71
 	dc.b	$14 ;72
 	dc.b	$19 ;73
 	dc.b	$14 ;74
 	dc.b	$15 ;75
 	dc.b	$15 ;76
 	dc.b	$15 ;77
 	dc.b	$15 ;78
	dc.b	$15 ;79
	dc.b	$17 ;7A
	dc.b	$17 ;7B
	dc.b	$18 ;7C
	dc.b	$1A ;7D
	dc.b	$1A ;7E 
	dc.b	$1A ;7F

	dc.b	$15 ;80
	dc.b	$15	;81
	dc.b	$15	;82
	dc.b	$15	;83 
 	dc.b	$15 ;84
 	dc.b 	$15	;85
 	dc.b	$15	;86
 	dc.b	$15	;87
	dc.b	$15 ;88 
	dc.b	$15 ;89
 	dc.b	$15 ;8A
 	dc.b	$15 ;8B
 	dc.b	$15 ;8C
 	dc.b	$15 ;8D
	dc.b	$15 ;8E 
 	dc.b	$15 ;8F

	dc.b	$15 ;90 
 	dc.b	$15 ;91
 	dc.b	$15 ;92
 	dc.b	$15 ;93
 	dc.b	$15 ;94
 	dc.b	$15 ;95
 	dc.b	$15 ;96
 	dc.b	$15 ;97
 	dc.b	$14 ;98
	dc.b	$14 ;99
	dc.b	$14 ;9A
	dc.b	$14 ;9B
	dc.b	$14 ;9C
	dc.b	$14 ;9D
	dc.b	$14 ;9E
	dc.b	$14 ;9F         		
	
	
	align 	m68kDriverSizeStart+zMusicPlaylist
MusicBank:		
	k68z80Pointer   Music_AIZ1 	;01
	k68z80Pointer   Music_AIZ2  ;02
	k68z80Pointer   Music_HCZ1  ;03
	k68z80Pointer   Music_HCZ2  ;04
	k68z80Pointer   Music_MGZ1  ;05
	k68z80Pointer   Music_MGZ2  ;06
	k68z80Pointer 	Music_CNZ1  ;07
	k68z80Pointer 	Music_CNZ2  ;08
	k68z80Pointer 	Music_ICZ1  ;09
	k68z80Pointer 	Music_ICZ2  ;0A
	k68z80Pointer 	Music_LBZ1  ;0B
	k68z80Pointer 	Music_LBZ2  ;0C
	k68z80Pointer 	Music_MHZ1  ;0D
	k68z80Pointer 	Music_MHZ2  ;0E
	k68z80Pointer 	Music_FBZ1  ;0F

	k68z80Pointer 	Music_FBZ2  ;10
	k68z80Pointer 	Music_SOZ1  ;11
	k68z80Pointer 	Music_SOZ2  ;12
	k68z80Pointer 	Music_LRZ1  ;13
	k68z80Pointer 	Music_LRZ2  ;14
	k68z80Pointer 	Music_SSZ   ;15
	k68z80Pointer 	Music_DEZ1  ;16
	k68z80Pointer 	Music_DEZ2  ;17
	k68z80Pointer 	Music_Minib_SK ;18
	k68z80Pointer 	Music_Boss  ;19
	k68z80Pointer 	Music_DDZ  	;1A
	k68z80Pointer 	Music_PachBonus ;1B
	k68z80Pointer  	Music_SpecialS3 ;1C
	k68z80Pointer 	Music_SlotBonus ;1D
	k68z80Pointer 	Music_Knux ;1E
	k68z80Pointer 	Music_Title ;1F

	k68z80Pointer 	Music_1UP ;20
	k68z80Pointer 	Music_Emerald ;21
	k68z80Pointer	Music_SKCredits ;22
	k68z80Pointer 	Music_GameOver ;23
	k68z80Pointer 	Music_Continue ;24
	k68z80Pointer 	Music_Results ;25
	k68z80Pointer 	Music_Invic ;26
	k68z80Pointer 	Music_Menu ;27
	k68z80Pointer 	Music_FinalBoss ;28
	k68z80Pointer 	Music_PresSega ;29
	k68z80Pointer 	Music_GumBonus ;2A
	k68z80Pointer 	Music_ALZ ;2B
	k68z80Pointer 	Music_BPZ;2C
	k68z80Pointer 	Music_DPZ ;2D
	k68z80Pointer 	Music_CGZ;2E
	k68z80Pointer 	Music_EMZ ;2F

	k68z80Pointer 	Music_S3Credits ;30
	k68z80Pointer 	Music_2PMenu ;31
	k68z80Pointer 	Music_Drown ;32
	k68z80Pointer 	Music_S3_1up ;33
	k68z80Pointer 	Music_S3_Continue ;34
	k68z80Pointer 	Music_S3_FBZ1 ;35
	k68z80Pointer 	Music_S3_PresSega ;36
	k68z80Pointer 	Music_S3_Invincible ;37
	k68z80Pointer 	Music_S3_Knuckles ;38
	k68z80Pointer 	Music_S3_Menu ;39
	k68z80Pointer 	Music_S3_Miniboss ;3A
	k68z80Pointer 	Music_S3_SSZ ;3B
	k68z80Pointer 	Music_S3_Title ;3C
	k68z80Pointer 	EmptyTrack ;3D
	k68z80Pointer	EmptyTrack ;3E
	k68z80Pointer	EmptyTrack ;3F

	k68z80Pointer	EmptyTrack ;40
	k68z80Pointer 	Music_GHZ ;41
	k68z80Pointer	Music_LZ ;42
	k68z80Pointer	Music_MZ;43
	k68z80Pointer 	Music_SYZ ;44
	k68z80Pointer 	Music_SLZ ;45
	k68z80Pointer 	Music_SBZ ;46
	k68z80Pointer 	Music_InvicS1 ;47
	k68z80Pointer 	Music_S1SS ;48
	k68z80Pointer	Music_EndS1 ;49
	k68z80Pointer 	Music_BossS1 ;4A
	k68z80Pointer 	Music_FZ ;4B
	k68z80Pointer 	Music_CreditsS1 ;4C
	k68z80Pointer 	Music_DrowningS1 ;4D
	k68z80Pointer	EmptyTrack;4E
	k68z80Pointer	EmptyTrack ;4F

	k68z80Pointer 	Music_Boss1S3D ;50
	k68z80Pointer 	Music_Boss2S3D ;51
	k68z80Pointer 	Music_CreditsS3D ;52
	k68z80Pointer 	Music_DDZ1 ;53
	k68z80Pointer 	Music_DDZ2 ;54
	k68z80Pointer 	Music_EndingS3D ;55
	k68z80Pointer 	Music_GeneGZ1 ;56
	k68z80Pointer 	Music_GeneGZ2 ;57
	k68z80Pointer 	Music_GreeGZ1 ;58
	k68z80Pointer 	Music_GreeGZ2 ;59
	k68z80Pointer 	Music_TitleS3D ;5A
	k68z80Pointer 	Music_InvicS3D ;5B
	k68z80Pointer 	Music_LevSelS3D ;5C
	k68z80Pointer 	Music_MenuS3D ;5D
	k68z80Pointer 	Music_PPZ1 ;5E
	k68z80Pointer 	Music_PPZ2 ;5F		

	k68z80Pointer	Music_RRZ1	;60
	k68z80Pointer	Music_RRZ2	;61
	k68z80Pointer	Music_S3DSS ;62
	k68z80Pointer	Music_SSZ1 	;63
 	k68z80Pointer	Music_SSZ2  ;64
 	k68z80Pointer	Music_TFF 	;65
 	k68z80Pointer	Music_VVZ1	;66
 	k68z80Pointer	Music_VVZ2	;67
	k68z80Pointer	Music_OOZ  	;68
	k68z80Pointer	Music_EHZ	;69 
 	k68z80Pointer	Music_MTZ 	;6A
 	k68z80Pointer	Music_CNZ 	;6B
 	k68z80Pointer	Music_MCZ 	;6C
 	k68z80Pointer	Music_MCZ_2p;6D
	k68z80Pointer	Music_ARZ  	;6E
 	k68z80Pointer	Music_DEZ 	;6F

	k68z80Pointer	Music_S2SS  	;70
	k68z80Pointer	Music_DEZBoss 	;71
 	k68z80Pointer	Music_CPZ 		;72 
 	k68z80Pointer	Music_S2Boss 	;73 
 	k68z80Pointer	Music_SCZ 		;74
 	k68z80Pointer	Music_WFZ 		;75
 	k68z80Pointer	Music_EHZ_2P 	;76
 	k68z80Pointer	Music_S2CompMenu;77
 	k68z80Pointer	Music_SSonic 	;78
 	k68z80Pointer	Music_HTZ 		;79
	k68z80Pointer	Music_HPZ		;7A
	k68z80Pointer	Music_S2Title	;7B
	k68z80Pointer	Music_InvicS2 	;7C
	k68z80Pointer	Music_S2_Credits;7D
	k68z80Pointer	EmptyTrack    	;7E
	k68z80Pointer	EmptyTrack   	;7F

	k68z80Pointer	Music_81    ;80
	k68z80Pointer	Music_81	;81
	k68z80Pointer	Music_82 	;82
	k68z80Pointer	Music_83 	;83
 	k68z80Pointer	Music_84  	;84
 	k68z80Pointer	Music_85 	;85
 	k68z80Pointer	Music_86	;86
 	k68z80Pointer	Music_87	;87
	k68z80Pointer	Music_88  	;88
	k68z80Pointer	Music_89	;89 
 	k68z80Pointer	Music_8A 	;8A
 	k68z80Pointer	Music_8A 	;8B
 	k68z80Pointer	Music_8C 	;8C
 	k68z80Pointer	Music_8D 	;8D
	k68z80Pointer	Music_8E  	;8E
 	k68z80Pointer	Music_8F 	;8F

	k68z80Pointer	Music_90  	;90
	k68z80Pointer	Music_90  	;91
 	k68z80Pointer	music_92 	;92 
 	k68z80Pointer	Music_93 	;93
 	k68z80Pointer	Music_94   	;94
 	k68z80Pointer	Music_95 	;95
 	k68z80Pointer	Music_96  	;96
 	k68z80Pointer	Music_95 	;97
 	k68z80Pointer	Music_98 	;98
	k68z80Pointer	Music_99	;99
	k68z80Pointer	Music_9A	;9A
	k68z80Pointer	Music_9B 	;9B
	k68z80Pointer	Music_9C 	;9C
	k68z80Pointer	Music_9D 	;9D
	k68z80Pointer	Music_9E    ;9E      		
	k68z80Pointer   Music_9F    ;9F



	align 	m68kDriverSizeStart+zDPCM_Notes	

DPCM_Notes:	
	dc.b	$81,	$04				; 81 - dSnareS3
	dc.b	$82,	$0E				; 82 - dHighTom
	dc.b	$83,	$14				; 83 - dMidTomS3
	dc.b	$84,	$1A				; 84 - dLowTomS3
	dc.b	$85,	$20				; 85 - dFloorTomS3
	dc.b	$86,	$04				; 86 - dKickS3
	dc.b	$87,	$04				; 87 - dMuffledSnare
	dc.b	$88,	$06				; 88 - dCrashCymbal
	dc.b	$89,	$0A				; 89 - dRideCymbal
	dc.b	$8A,	$14				; 8A - dLowMetalHit
	dc.b	$8B,	$1B				; 8B - dMetalHit
	dc.b	$8C,	$08				; 8C - dHighMetalHit
	dc.b	$8D,	$0B				; 8D - dHigherMetalHit
	dc.b	$8E,	$11				; 8E - dMidMetalHit
	dc.b	$8F,	$08				; 8F - dClapS3
	dc.b	$90,	$03				; 90 - dElectricHighTom	
	dc.b	$91,	$07				; 91 - dElectricMidTom
	dc.b	$92,	$0A				; 92 - dElectricLowTom	
	dc.b	$93,	$0E				; 93 - dElectricFloorTom
	dc.b	$94,	$06				; 94 - dTightSnare
	dc.b	$95,	$0A				; 95 - dMidpitchSnare
	dc.b	$96,	$0D				; 96 - dLooseSnare
	dc.b	$97,	$12				; 97 - dLooserSnare
	dc.b	$98,	$0B				; 98 - dHiTimpaniS3
	dc.b	$99,	$13				; 99 - dLowTimpaniS3
	dc.b	$9A,	$16				; 9A - dMidTimpaniS3
	dc.b	$9B,	$0C				; 9B - dQuickLooseSnare
	dc.b	$9C,	$0A				; 9C - dClick
	dc.b	$9D,	$18				; 9D - dPowerKick
	dc.b	$9E,	$18				; 9E - dQuickGlassCrash
	dc.b	$9F,	$0C				; 9F - dGlassCrashSnare
	dc.b 	$A0, 	$0C				; A0 - dGlassCrash
	dc.b 	$A1, 	$0A 			; A1 - dGlassCrashKick
	dc.b 	$A2, 	$0A  			; A2 - dQuietGlassCrash
	dc.b 	$A3, 	$18  			; A3 - dOddSnareKick
	dc.b 	$A4, 	$18  			; A4 - dKickExtraBass
	dc.b 	$A5, 	$0C  			; A5 - dComeOn
	dc.b 	$A6, 	$09  			; A6 - dDanceSnare
	dc.b 	$A7, 	$18  			; A7 - dLooseKick
	dc.b 	$A8, 	$18  			; A8 - dModLooseKick
	dc.b 	$A9, 	$0C  			; A9 - dWoo
	dc.b 	$AA, 	$0A  			; AA - dGo
	dc.b 	$AB, 	$0D 			; AB - dSnareGo
	dc.b 	$AC, 	$06  			; AC - dPowerTom
	dc.b 	$AD, 	$10 			; AD - dHiWoodBlock
	dc.b 	$AE, 	$18   			; AE - dLowWoodBlock
	dc.b 	$AF, 	$09  			; AF - dHiHitDrum
	dc.b 	$B0, 	$12   			; B0 - dLowHitDrum
	dc.b 	$B1, 	$18  			; B1 - dMetalCrashHit
	dc.b 	$B2, 	$16  			; B2 - dEchoedClapHit
	dc.b 	$B3, 	$20  			; B3 - dLowerEchoedClapHit
	dc.b 	$B4, 	$0C  			; B4 - dHipHopHitKick
	dc.b 	$B5, 	$0C  			; B5 - dHipHopHitPowerKick
	dc.b 	$B6, 	$0C  			; B6 - dBassHey
	dc.b 	$B7, 	$18  			; B7 - dDanceStyleKick
	dc.b 	$B8, 	$0C  			; B8 - dHipHopHitKick2
	dc.b 	$B9, 	$0C  			; B9 - dHipHopHitKick3
	dc.b 	$BA, 	$18  			; BA - dReverseFadingWind
	dc.b 	$BB, 	$18  			; BB - dScratchS3
	dc.b 	$BC, 	$18  			; BC - dLooseSnareNoise
	dc.b 	$BD, 	$0C  			; BD - dPowerKick2
	dc.b 	$BE, 	$0C  			; BE - dCrashingNoiseWoo
	dc.b 	$BF, 	$1C  			; BF - dQuickHit
	dc.b 	$C0, 	$0B   			; C0 - dKickHey
	dc.b 	$C1, 	$0F  			; C1 - dPowerKickHit
	dc.b 	$C2, 	$11  			; C2 - dLowPowerKickHit
	dc.b 	$C3, 	$12  			; C3 - dLowerPowerKickHit
	dc.b 	$C4, 	$0B  			; C4 - dLowestPowerKickHit
	dc.b 	$C5, 	$17  			; C5 - dKick
	dc.b 	$C6, 	$01  			; C6 - dSnare
	dc.b 	$C7, 	$06  			; C7 - dClap
	dc.b 	$C8, 	$08  			; C8 - dScratch
	dc.b 	$C9, 	$1B  			; C9 - dTimpani
	dc.b 	$CA, 	$0A  			; CA - dHiTom
	dc.b 	$CB, 	$1B  			; CB - dVLowClap
	dc.b 	$CC, 	$12  			; CC - dHiTimpani
	dc.b 	$CD, 	$15  			; CD - dMidTimpani
	dc.b 	$CE, 	$1C  			; CE - dLowTimpani
	dc.b 	$CF, 	$1D 			; CF - dVLowTimpani		
	dc.b 	$D0, 	$02   			; D0 - dMidTom
	dc.b 	$D1, 	$05  			; D1 - dLowTom
	dc.b 	$D2, 	$08  			; D2 - dFloorTom
	dc.b 	$D3, 	$08  			; D3 - dHiClap
	dc.b 	$D4, 	$0B  			; D4 - dMidClap
	dc.b 	$D5, 	$12  			; D5 - dLowClap
	dc.b 	$D6, 	$01  			; D6 - dFinalFightMetalCrash
	dc.b 	$D7, 	$12  			; D7 - dIntroKick
	dc.b 	$D8, 	$16  			; D8 - dEchoedClapHit_S3
	dc.b 	$D9, 	$20  			; D9 - dLowerEchoedClapHit_S3
	dc.b 	$DA, 	$0C  			; DA - dBassD
	dc.b 	$DB, 	$0C  			; DB - dSnareD
	dc.b 	$DC, 	$0C  			; DC - dBassCrash		

	align 	m68kDriverSizeStart+zDACPtrTbl
	
DAC_PtrTable:	
DAC80:		DAC_Setup	DAC_Sample81,DAC_Sample81_End			; Dummy Slot. Just used what I already had.	
DAC81:		DAC_Setup	DAC_Sample81,DAC_Sample81_End  			; dSnareS3
DAC82:		DAC_Setup	DAC_Sample82_85,DAC_Sample82_85_End 	; dHighTom
DAC83:		DAC_Setup 	DAC_Sample82_85,DAC_Sample82_85_End 	; dMidTomS3

DAC84:		DAC_Setup 	DAC_Sample82_85,DAC_Sample82_85_End  	; dLowTomS3
DAC85:		DAC_Setup 	DAC_Sample82_85,DAC_Sample82_85_End  	; dFloorTomS3					
DAC86:		DAC_Setup	DAC_Sample86,DAC_Sample86_End 			; dKickS3
DAC87:	 	DAC_Setup	DAC_Sample87,DAC_Sample87_End			; dMuffledSnare	
	
DAC88: 		DAC_Setup	DAC_Sample88,DAC_Sample88_End			; dCrashCymbal		
DAC89:		DAC_Setup 	DAC_Sample89,DAC_Sample89_End			; dRideCymbal	
DAC8A:		DAC_Setup	DAC_Sample8A_8B,DAC_Sample8A_8B_End		; dLowMetalHit	
DAC8B: 		DAC_Setup	DAC_Sample8A_8B,DAC_Sample8A_8B_End		; dMetalHit	

DAC8C:		DAC_Setup	DAC_Sample8C,DAC_Sample8C_End			; dHighMetalHit
DAC8D:		DAC_Setup 	DAC_Sample8D_8E,DAC_Sample8D_8E_End		; dHigherMetalHit
DAC8E: 		DAC_Setup 	DAC_Sample8D_8E,DAC_Sample8D_8E_End		; dMidMetalHit		
DAC8F:		DAC_Setup 	DAC_Sample8F,DAC_Sample8F_End			; dClapS3

DAC90:		DAC_Setup 	DAC_Sample90_93,DAC_Sample90_93_End		; dElectricHighTom		
DAC91:		DAC_Setup 	DAC_Sample90_93,DAC_Sample90_93_End		; dElectricMidTom		
DAC92:		DAC_Setup 	DAC_Sample90_93,DAC_Sample90_93_End		; dElectricLowTom		
DAC93:		DAC_Setup 	DAC_Sample90_93,DAC_Sample90_93_End		; dElectricFloorTom	

DAC94:		DAC_Setup 	DAC_Sample94_97,DAC_Sample94_97_End		; dTightSnare		
DAC95:		DAC_Setup 	DAC_Sample94_97,DAC_Sample94_97_End		; dMidpitchSnare		
DAC96:		DAC_Setup 	DAC_Sample94_97,DAC_Sample94_97_End		; dLooseSnare		
DAC97:		DAC_Setup 	DAC_Sample94_97,DAC_Sample94_97_End		; dLooserSnare

DAC98:		DAC_Setup	DAC_Sample98_9A,DAC_Sample98_9A_End	; dHiTimpaniS3
DAC99:		DAC_Setup	DAC_Sample98_9A,DAC_Sample98_9A_End	; dLowTimpaniS3
DAC9A:		DAC_Setup	DAC_Sample98_9A,DAC_Sample98_9A_End	; dMidTimpaniS3
DAC9B:		DAC_Setup 	DAC_Sample9B,DAC_Sample9B_End 			; dQuickLooseSnare	

DAC9C:		DAC_Setup 	DAC_Sample9C,DAC_Sample9C_End 			; dClick	
DAC9D:		DAC_Setup 	DAC_Sample9D,DAC_Sample9D_End 			; dPowerKick	
DAC9E:		DAC_Setup 	DAC_Sample9E,DAC_Sample9E_End 			; dQuickGlassCrash	
DAC9F:		DAC_Setup 	DAC_Sample9F,DAC_Sample9F_End 			; dGlassCrashSnare

DACA0:		DAC_Setup 	DAC_SampleA0,DAC_SampleA0_End			; dGlassCrash
DACA1:		DAC_Setup 	DAC_SampleA1,DAC_SampleA1_End			; dGlassCrashKick
DACA2:		DAC_Setup 	DAC_SampleA2,DAC_SampleA2_End			; dQuietGlassCrash
DACA3:		DAC_Setup 	DAC_SampleA3,DAC_SampleA3_End			; dOddSnareKick	

DACA4:		DAC_Setup 	DAC_SampleA4,DAC_SampleA4_End 			; dKickExtraBass	
DACA5:		DAC_Setup 	DAC_SampleA5,DAC_SampleA5_End 			; dComeOn
DACA6:		DAC_Setup 	DAC_SampleA6,DAC_SampleA6_End			; dDanceSnare
DACA7:		DAC_Setup	DAC_SampleA7,DAC_SampleA7_End			; dLooseKick

DACA8:		DAC_Setup 	DAC_SampleA8,DAC_SampleA8_End			; dModLooseKick
DACA9:		DAC_Setup 	DAC_SampleA9,DAC_SampleA9_End			; dWoo
DACAA:		DAC_Setup 	DAC_SampleAA,DAC_SampleAA_End			; dGo
DACAB:		DAC_Setup 	DAC_SampleAB,DAC_SampleAB_End			; dSnareGo

DACAC:		DAC_Setup 	DAC_SampleAC,DAC_SampleAC_End			; dPowerTom
DACAD:		DAC_Setup 	DAC_SampleAD_AE,DAC_SampleAD_AE_End		; dHiWoodBlock
DACAE:		DAC_Setup 	DAC_SampleAD_AE,DAC_SampleAD_AE_End 	; dLowWoodBlock
DACAF:		DAC_Setup 	DAC_SampleAF_B0,DAC_SampleAF_B0_End		; dHiHitDrum

DACB0:		DAC_Setup	DAC_SampleAF_B0,DAC_SampleAF_B0_End		; dLowHitDrum	
DACB1:		DAC_Setup 	DAC_SampleB1,DAC_SampleB1_End			; dMetalCrashHit
DACB2:		DAC_Setup 	DAC_SampleB2_B3,DAC_SampleB2_B3_End		; dEchoedClapHit
DACB3:		DAC_Setup 	DAC_SampleB2_B3,DAC_SampleB2_B3_End		; dLowerEchoedClapHit	

DACB4:		DAC_Setup 	DAC_SampleB4_C1_C2_C3_C4,DAC_SampleB4_C1_C2_C3_C4_End 	; dHipHopHitKick		
DACB5:		DAC_Setup 	DAC_SampleB5,DAC_SampleB5_End 			; dHipHopHitPowerKick	
DACB6:		DAC_Setup 	DAC_SampleB6,DAC_SampleB6_End 			; dBassHey		
DACB7:		DAC_Setup 	DAC_SampleB7,DAC_SampleB7_End 			; dDanceStyleKick	

DACB8:		DAC_Setup	DAC_SampleB8_B9,DAC_SampleB8_B9_End		; dHipHopHitKick2
DACB9:		DAC_Setup	DAC_SampleB8_B9,DAC_SampleB8_B9_End		; dHipHopHitKick3
DACBA:		DAC_Setup	DAC_SampleBA,DAC_SampleBA_End			; dReverseFadingWind
DACBB:		DAC_Setup	DAC_SampleBB,DAC_SampleBB_End			; dScratchS3

DACBC:		DAC_Setup	DAC_SampleBC,DAC_SampleBC_End			; dLooseSnareNoise
DACBD:		DAC_Setup	DAC_SampleBD,DAC_SampleBD_End			; dPowerKick2
DACBE:		DAC_Setup	DAC_SampleBE,DAC_SampleBE_End			; dCrashingNoiseWoo
DACBF:		DAC_Setup	DAC_SampleBF,DAC_SampleBF_End			; dQuickHit

	align 	m68kDriverSizeStart+zDACPtrTbl2

DAC_PtrTable2:
DACC0:		DAC_Setup	DAC_SampleC0,DAC_SampleC0_End			; dKickHey
DACC1:		DAC_Setup 	DAC_SampleB4_C1_C2_C3_C4,DAC_SampleB4_C1_C2_C3_C4_End 	; dPowerKickHit
DACC2:		DAC_Setup 	DAC_SampleB4_C1_C2_C3_C4,DAC_SampleB4_C1_C2_C3_C4_End 	; dLowPowerKickHit
DACC3:		DAC_Setup 	DAC_SampleB4_C1_C2_C3_C4,DAC_SampleB4_C1_C2_C3_C4_End 	; dLowerPowerKickHit

DACC4:		DAC_Setup 	DAC_SampleB4_C1_C2_C3_C4,DAC_SampleB4_C1_C2_C3_C4_End 	; dLowestPowerKickHit
DACC5:		DAC_Setup 	DAC_SampleC5,DAC_SampleC5_End 			; dKick	
DACC6:		DAC_Setup 	DAC_SampleC6,DAC_SampleC6_End 			; dSnare		
DACC7:		DAC_Setup 	DAC_SampleC7,DAC_SampleC7_End 			; dClap

DACC8:		DAC_Setup 	DAC_SampleC8,DAC_SampleC8_End 			; dScratch	
DACC9:		DAC_Setup	DAC_SampleC9CC_CF,DAC_SampleC9CC_CF_End ; dTimpani
DACCA:		DAC_Setup	DAC_SampleCAD0_D2,DAC_SampleCAD0_D2_End ; dHiTom
DACCB:		DAC_Setup	DAC_SampleCBD3_D5,DAC_SampleCBD3_D5_End ; dVLowClap

DACCC:		DAC_Setup	DAC_SampleC9CC_CF,DAC_SampleC9CC_CF_End ; dHiTimpani
DACCD:		DAC_Setup	DAC_SampleC9CC_CF,DAC_SampleC9CC_CF_End ; dMidTimpani
DACCE:		DAC_Setup	DAC_SampleC9CC_CF,DAC_SampleC9CC_CF_End ; dLowTimpani
DACCF:		DAC_Setup	DAC_SampleC9CC_CF,DAC_SampleC9CC_CF_End ; dVLowTimpani

DACD0:		DAC_Setup	DAC_SampleCAD0_D2,DAC_SampleCAD0_D2_End ; dMidTom
DACD1:		DAC_Setup	DAC_SampleCAD0_D2,DAC_SampleCAD0_D2_End ; dLowTom
DACD2:		DAC_Setup	DAC_SampleCAD0_D2,DAC_SampleCAD0_D2_End ; dHiClap
DACD3:		DAC_Setup	DAC_SampleCBD3_D5,DAC_SampleCBD3_D5_End ; dMidClap

DACD4:		DAC_Setup	DAC_SampleCBD3_D5,DAC_SampleCBD3_D5_End ; dLowClap
DACD5:		DAC_Setup	DAC_SampleCBD3_D5,DAC_SampleCBD3_D5_End ; dVLowClap
DACD6:		DAC_Setup 	DAC_SampleD6,DAC_SampleD6_End 			; dFinalFightMetalCrash		
DACD7:		DAC_Setup 	DAC_SampleD7,DAC_SampleD7_End 			; dIntroKick

DACD8:		DAC_Setup 	DAC_SampleD8_D9,DAC_SampleD8_D9_End 	; dEchoedClapHit_S3	
DACD9:		DAC_Setup 	DAC_SampleD8_D9,DAC_SampleD8_D9_End 	; dLowerEchoedClapHit_S3	
		align 	m68kDriverSizeStart+z80_FreqFlutterPointers
FlutterPoints:
		dc.w	FreqFlutter0-FlutterPoints
		dc.w	FreqFlutter1-FlutterPoints
		dc.w	FreqFlutter2-FlutterPoints
		dc.w	FreqFlutter3-FlutterPoints
		dc.w	FreqFlutter4-FlutterPoints
		dc.w	FreqFlutter5-FlutterPoints
		dc.w	FreqFlutter6-FlutterPoints
		dc.w	FreqFlutter7-FlutterPoints

FreqFlutter1:   dc.b    0
FreqFlutter0:   dc.b    1,   2,   1,   0,$FF,$FE,$FD,$FC,$FD,$FE,$FF, $83
FreqFlutter2:   dc.b    0,   0,   0,   0, $13, $26, $39, $4C, $5F, $72, $7F, $72, $83
FreqFlutter3:   dc.b    1,   2,   3,   2,   1,   0,$FF,$FE,$FD,$FE,$FF,   0, $82,   0
FreqFlutter4:   dc.b    0,   0,   1,   3,   1,   0,$FF,$FD,$FF,   0, $82,   2
FreqFlutter5:   dc.b    0,   0,   0,   0,   0, $0A, $14, $1E, $14, $0A,   0,$F6,$EC,$0E2,$EC,$F6
                dc.b  $82,   4
FreqFlutter6:   dc.b    0,   0,   0,   0, $16, $2C, $42, $2C, $16,   0,$EA,$D4,$BE,$D4,$EA, $82
                dc.b    3
FreqFlutter7:   dc.b    1,   2,   3,   4,   3,   2,   1,   0,$FF,$FE,$FD,$FC,$FD,$FE,$FF,   0
                dc.b  $82,   1
z80_Driver_End:	
	endif 		
;=============================================================================== 
; Sound Bank 1 - $11
;=============================================================================== 	
		cnop    $0000,$88000 
SoundBank0_Start:		startbank	;1E8C	
Sega_Snd: 			incbin  'data\sounds\sega.snd'	
Music_OOZ: 		include "SMPS MUSIC\S2\Music\OOZ.asm"	
Music_EHZ:		include "SMPS MUSIC\S2\Music\EHZ.asm"
Music_MTZ:        include "SMPS MUSIC\S2\Music\MTZ.asm"
Music_CNZ:		include "SMPS MUSIC\S2\Music\CNZ.asm"
Music_MCZ_2p: 	include	"SMPS MUSIC\S2\Music\MCZ_2p.asm"
		finishbank
;=============================================================================== 
; Sound Bank 1 - $12
;=============================================================================== 	
		cnop    $0000,$90000  
SoundBank1_Start:		startbank	
Music_Boss1S3D:		include  "SMPS MUSIC\s3d\Music\Boss1.asm"
Music_Boss2S3D:		include  "SMPS MUSIC\s3d\Music\Boss2.asm"
Music_CreditsS3D: 	include  "SMPS MUSIC\s3d\Music\Credits.asm"
Music_DDZ1: 		include  "SMPS MUSIC\s3d\Music\DDZ1.asm"
Music_DDZ2:			include  "SMPS MUSIC\s3d\Music\DDZ2.asm"
Music_EndingS3D:	include  "SMPS MUSIC\s3d\Music\Ending.asm"
Music_GeneGZ1: 		include  "SMPS MUSIC\s3d\Music\GeneGZ1.asm"
Music_GeneGZ2:	 	include  "SMPS MUSIC\s3d\Music\GeneGZ2.asm"
Music_GreeGZ1:		include  "SMPS MUSIC\s3d\Music\GreenGZ1.asm"
Music_GreeGZ2: 		include  "SMPS MUSIC\s3d\Music\GreenGZ2.asm"
Music_TitleS3D: 	include  "SMPS MUSIC\s3d\Music\Intro.asm"
Music_InvicS3D: 	include  "SMPS MUSIC\s3d\Music\Invincible.asm"			
		finishbank   
;=============================================================================== 
; Sound Bank 2 - $13
;=============================================================================== 	
		cnop    $0000,$98000  
SoundBank2_Start:		startbank		
Music_LevSelS3D:	include  "SMPS MUSIC\s3d\Music\Level Select.asm"
Music_MenuS3D:		include  "SMPS MUSIC\s3d\Music\Menu.asm"
Music_PPZ1:			include  "SMPS MUSIC\s3d\Music\PPZ1.asm"
Music_PPZ2:			include  "SMPS MUSIC\s3d\Music\PPZ2.asm"				
Music_RRZ1:			include  "SMPS MUSIC\s3d\Music\RRZ1.asm"
Music_RRZ2:			include  "SMPS MUSIC\s3d\Music\RRZ2.asm"	
Music_S3DSS:		include  "SMPS MUSIC\s3d\Music\Special Stage.asm"
Music_SSZ1:			include  "SMPS MUSIC\s3d\Music\SSZ1.asm"
Music_SSZ2: 		include  "SMPS MUSIC\s3d\Music\SSZ2.asm"	
Music_TFF: 			include  "SMPS MUSIC\s3d\Music\The Final Fight.asm"
Music_VVZ1:			include  "SMPS MUSIC\s3d\Music\VVZ1.asm"
Music_VVZ2:			include  "SMPS MUSIC\s3d\Music\VVZ2.asm"	
Music_MCZ:			include "SMPS MUSIC\S2\Music\MCZ.asm"	
Music_ARZ: 			include	"SMPS MUSIC\S2\Music\ARZ.asm"
		finishbank   		
;=============================================================================== 
; Sound Bank 3 - $14
;=============================================================================== 	
		cnop    $0000,$A0000  
SoundBank3_Start:		startbank
Music_98:   		include  "SMPS MUSIC\s2b\Music\1up.asm"                
Music_99: 			include  "SMPS MUSIC\s2b\Music\Title Screen.asm" 
Music_9A: 			include  "SMPS MUSIC\s2b\Music\End of level.asm"
Music_9B: 			include  "SMPS MUSIC\s2b\Music\Game over.asm"
Music_9C:  			include  "SMPS MUSIC\s2b\Music\Continue.asm"
Music_9D: 			include  "SMPS MUSIC\s2b\Music\Got emerald.asm"
Music_9E: 			include  "SMPS MUSIC\Waylon.asm"	
Music_9F: 			include  "SMPS MUSIC\Sonic 3C 0517 credits.asm"	
Music_GHZ:			include  "SMPS MUSIC\s1\Music\Mus81 - GHZ.asm"
Music_LZ: 			include  "SMPS MUSIC\s1\Music\Mus82 - LZ.asm"
Music_MZ: 			include  "SMPS MUSIC\s1\Music\Mus83 - MZ.asm"
Music_SYZ: 			include  "SMPS MUSIC\s1\Music\Mus85 - SYZ.asm"
Music_SLZ: 			include  "SMPS MUSIC\s1\Music\Mus84 - SLZ.asm"
Music_SBZ: 			include  "SMPS MUSIC\s1\Music\Mus86 - SBZ.asm"
Music_InvicS1: 		include  "SMPS MUSIC\s1\Music\Mus87 - Invincibility.asm"
Music_S1SS: 		include  "SMPS MUSIC\s1\Music\Mus89 - Special Stage.asm"
Music_EndS1:  		include  "SMPS MUSIC\s1\Music\Mus8B - Ending.asm"
Music_BossS1: 		include  "SMPS MUSIC\s1\Music\Mus8C - Boss.asm"
Music_FZ: 			include  "SMPS MUSIC\s1\Music\Mus8D - FZ.asm"
Music_CreditsS1: 	include  "SMPS MUSIC\s1\Music\Mus91 - Credits.asm"
Music_DrowningS1: 	include  "SMPS MUSIC\s1\Music\Mus92 - Drowning.asm"
Music_DEZ: 			include  "SMPS MUSIC\s2\Music\dez.asm" 
Music_S2SS: 		include  "SMPS MUSIC\s2\Music\SpecStg.asm" 
Music_S2Menu: 		include  "SMPS MUSIC\s2\Music\Options.asm" 
Music_DEZBoss: 		include  "SMPS MUSIC\s2\Music\end_boss.asm"
Music_CPZ: 			include  "SMPS MUSIC\s2\Music\cpz.asm" 
Music_SCZ: 			include  "SMPS MUSIC\s2\Music\scz.asm"
		finishbank

;=============================================================================== 
; Sound Bank 4 - $15
;=============================================================================== 
		cnop    $000000, $A8000 
SoundBank4_Start:		startbank		   
Music_81: 			include  "SMPS MUSIC\s2b\Music\CNZ_2P.asm"
Music_82:	 		include  "SMPS MUSIC\s2b\Music\ehz.asm"
Music_83: 			include  "SMPS MUSIC\s2b\Music\mtz.asm"
Music_84:			include  "SMPS MUSIC\s2b\Music\cnz.asm"      
Music_85: 			include  "SMPS MUSIC\s2b\Music\dhz.asm" 
Music_86: 			include  "SMPS MUSIC\s2b\Music\MCZ_2P.asm" 
Music_87: 			include  "SMPS MUSIC\s2b\Music\nghz.asm" 
Music_88: 			include  "SMPS MUSIC\s2b\Music\dez.asm" 
Music_89: 			include  "SMPS MUSIC\s2b\Music\ss.asm"                
Music_8A: 			include  "SMPS MUSIC\s2b\Music\menu.asm" 
Music_8C: 			include  "SMPS MUSIC\s2b\Music\final boss.asm"
Music_8D: 			include  "SMPS MUSIC\s2b\Music\cpz.asm" 
Music_8E: 			include  "SMPS MUSIC\S2B\Music\boss.asm"
Music_8F: 			include  "SMPS MUSIC\s2b\Music\scz.asm"
Music_90: 			include  "SMPS MUSIC\s2b\Music\ooz.asm"
Music_92: 			include  "SMPS MUSIC\s2b\Music\wfz.asm"
Music_93: 		 	include  "SMPS MUSIC\s2b\Music\ehz_2p.asm"
Music_94:			include  "SMPS MUSIC\s2b\Music\2p_Menu.asm"
Music_95: 			include  "SMPS MUSIC\s2b\Music\Super Sonic.asm"
Music_96: 			include  "SMPS MUSIC\s2b\Music\htz.asm" 
Music_WFZ: 			include  "SMPS MUSIC\s2\Music\wfz.asm" 
Music_EHZ_2P: 		include  "SMPS MUSIC\s2\Music\ehz_2p.asm"
Music_S2CompMenu: 	include	 "SMPS MUSIC\s2\Music\Results screen 2p.asm"
Music_SSonic: 	    include  "SMPS MUSIC\s2\Music\Supersonic.asm"  
Music_HTZ: 			include  "SMPS MUSIC\s2\Music\htz.asm"  
		finishbank		
;=============================================================================== 
; Sound Bank 5 - $16
;=============================================================================== 
		cnop    $000000, $B0000 
SoundBank5_Start:		startbank	
z80_UniVoiceBank: 			
		include		"smps music/Universal Voice Bank.asm"
Music_AIZ1:			include  "SMPS MUSIC\sk\Music\AIZ1.asm"		
Music_AIZ2:			include  "SMPS MUSIC\sk\Music\AIZ2.asm"		
Music_HCZ1:			include  "SMPS MUSIC\sk\Music\HCZ1.asm"		
Music_HCZ2:			include  "SMPS MUSIC\sk\Music\HCZ2.asm"	
Music_MGZ1: 		include  "SMPS MUSIC\sk\Music\MGZ1.asm"		
Music_MGZ2: 		include  "SMPS MUSIC\sk\Music\MGZ2.asm"				
Music_CNZ1: 		include  "SMPS MUSIC\sk\Music\CNZ1.asm"		
Music_CNZ2: 		include  "SMPS MUSIC\sk\Music\CNZ2.asm"		
Music_ICZ1: 		include  "SMPS MUSIC\sk\Music\ICZ1.asm"		
Music_ICZ2: 		include  "SMPS MUSIC\sk\Music\ICZ2.asm"											

		finishbank			
;=============================================================================== 
; Sound Bank 6 - $17
;=============================================================================== 
		cnop    $000000, $B8000 
SoundBank6_Start:		startbank	
	include		"smps music/Universal Voice Bank.asm"
Music_LBZ1: 		include  "SMPS MUSIC\sk\Music\LBZ1.asm"			
Music_LBZ2: 		include  "SMPS MUSIC\sk\Music\LBZ2.asm"	
Music_MHZ1:			include  "SMPS MUSIC\sk\Music\MHZ1.asm"			
Music_MHZ2: 		include  "SMPS MUSIC\sk\Music\MHZ2.asm"	
Music_FBZ1: 		include  "SMPS MUSIC\sk\Music\FBZ1.asm"			
Music_FBZ2: 		include  "SMPS MUSIC\sk\Music\FBZ2.asm"		
Music_SOZ1: 		include  "SMPS MUSIC\sk\Music\SOZ1.asm"			
Music_SOZ2: 		include  "SMPS MUSIC\sk\Music\SOZ2.asm"	
Music_LRZ1: 		include  "SMPS MUSIC\sk\Music\LRZ1.asm"			
Music_LRZ2: 		include  "SMPS MUSIC\sk\Music\LRZ2.asm"	
Music_SSZ: 			include  "SMPS MUSIC\sk\Music\SSZ.asm"			
Music_DEZ1: 		include  "SMPS MUSIC\sk\Music\DEZ1.asm"	
Music_DEZ2: 		include  "SMPS MUSIC\sk\Music\DEZ2.asm"	
Music_Minib_SK:		include  "SMPS MUSIC\sk\Music\Miniboss.asm"	
Music_Boss: 		include  "SMPS MUSIC\sk\Music\Zone Boss.asm"
Music_DDZ:	 		include  "SMPS MUSIC\sk\Music\DDZ.asm"
Music_PachBonus: 	include  "SMPS MUSIC\sk\Music\Pachinko.asm"
Music_SpecialS3:	include	"SMPS MUSIC\sk\Music\Special Stage.asm"
Music_HPZ:      	include  "SMPS MUSIC\s2\Music\HPZ.asm" 
Music_S2Title: 		include "SMPS MUSIC\s2\Music\Title screen.asm"

	finishbank		
;=============================================================================== 
; Sound Bank 7 - $18
;=============================================================================== 
		cnop    $000000, $C0000 
SoundBank7_Start:		startbank	
	include		"smps music/Universal Voice Bank.asm"
Music_SlotBonus:	include	"SMPS MUSIC\sk\Music\Slots.asm"	
Music_Knux:			include	"SMPS MUSIC\sk\Music\Knuckles.asm"
Music_Title:		include	"SMPS MUSIC\sk\Music\Title.asm"
Music_1UP:			include	"SMPS MUSIC\sk\Music\1UP.asm"
Music_Emerald:		include	"SMPS MUSIC\sk\Music\Chaos Emerald.asm"
Music_SKCredits:	include	"SMPS MUSIC\sk\Music\Credits.asm"
Music_GameOver:		include	"SMPS MUSIC\sk\Music\Game Over.asm"
Music_Continue:		include	"SMPS MUSIC\sk\Music\Continue.asm"
Music_Results:		include	"SMPS MUSIC\sk\Music\Level Outro.asm"
Music_Invic:		include	"SMPS MUSIC\sk\Music\Invincible.asm"
Music_Menu:			include	"SMPS MUSIC\sk\Music\Menu.asm"
Music_FinalBoss:	include	"SMPS MUSIC\sk\Music\Final Boss.asm"
Music_PresSega:		include	"SMPS MUSIC\sk\Music\Game Complete.asm"
Music_GumBonus:		include	"SMPS MUSIC\sk\Music\Gum Ball Machine.asm"
Music_ALZ:			include	"SMPS MUSIC\sk\Music\Azure Lake.asm"
Music_BPZ:			include	"SMPS MUSIC\sk\Music\Balloon Park.asm"
Music_InvicS2		include "SMPS MUSIC\s2\Music\Invincible.asm"

	finishbank	
;=============================================================================== 
; Sound Bank 7 - $19
;=============================================================================== 
		cnop    $000000, $C8000 
SoundBank8_Start:		startbank 
	include		"smps music/Universal Voice Bank.asm"
Music_DPZ:			include	"SMPS MUSIC\sk\Music\Desert Palace.asm"
Music_CGZ:			include	"SMPS MUSIC\sk\Music\Chrome Gadget.asm"
Music_EMZ:			include	"SMPS MUSIC\sk\Music\Endless Mine.asm"
Music_S3Credits:	include	"SMPS MUSIC\sk\Music\Sonic 3 Credits.asm"
Music_2PMenu:		include	"SMPS MUSIC\sk\Music\Competition Menu.asm"	
Music_Drown:		include	"SMPS MUSIC\sk\Music\Countdown.asm"
Music_S3_1up: 		include	"SMPS MUSIC\s3\Music\1UP.asm"
Music_S3_Continue: 	include	"SMPS MUSIC\s3\Music\Continue.asm"
Music_S3_FBZ1:	 	include	"SMPS MUSIC\s3\Music\FBZ1.asm"
Music_S3_PresSega:	include	"SMPS MUSIC\s3\Music\Game Complete.asm"
Music_S3_Invincible: include "SMPS MUSIC\s3\Music\Invincible.asm"
Music_S3_Knuckles: 	include "SMPS MUSIC\s3\Music\Knuckles.asm"
Music_S3_Menu: 		include "SMPS MUSIC\s3\Music\Menu.asm"
Music_S3_Miniboss: 	include "SMPS MUSIC\s3\Music\Sonic 3 Miniboss.asm"
Music_S3_SSZ: 		include "SMPS MUSIC\s3\Music\SSZ.asm"
Music_S3_Title:		include	"SMPS MUSIC\s3\Music\Title.asm"
Music_S2Boss: 		include  "SMPS MUSIC\S2\Music\boss.asm"

	finishbank	
;=============================================================================== 
; Sound Bank 1 - $1A
;=============================================================================== 	
		cnop    $0000,$D0000  
SoundBank9_Start:		startbank	
Music_S2_Credits: 	include "SMPS MUSIC\s2\Music\Credits.asm" 	
EmptyTrack: 	include "SMPS MUSIC\Empty.asm" 		
		finishbank   
;=============================================================================== 
; DAC Bank 1 - $1B
;=============================================================================== 
	cnop    $0000,$D8000
DACBank2:			startbank
DAC_Sample81:
	incbin 	"SMPS Music\DAC\81.bin"
DAC_Sample81_End: 
DAC_Sample82_85:   
	incbin 	"SMPS Music\DAC\82-85.bin"
DAC_Sample82_85_End: 
DAC_Sample86:  
	incbin 	"SMPS Music\DAC\86.bin"
DAC_Sample86_End:      
DAC_Sample87: 
	incbin 	"SMPS Music\DAC\87.bin"
DAC_Sample87_End: 
DAC_Sample88:
	incbin 	"SMPS Music\DAC\88.bin"	
DAC_Sample88_End:
DAC_Sample89: 
	incbin 	"SMPS Music\DAC\89.bin"
DAC_Sample89_End:
DAC_Sample8A_8B: 
	incbin 	"SMPS Music\DAC\8A-8B.bin"
DAC_Sample8A_8B_End:	
DAC_Sample8C: 
	incbin 	"SMPS Music\DAC\8C.bin"	
DAC_Sample8C_End:	
DAC_Sample8D_8E: 
	incbin 	"SMPS Music\DAC\8D-8E.bin"
DAC_Sample8D_8E_End:			
DAC_Sample8F: 
	incbin 	"SMPS Music\DAC\8F.bin"	
DAC_Sample8F_End:
DAC_Sample90_93: 
	incbin 	"SMPS Music\DAC\90-93.bin"	
DAC_Sample90_93_End:		
DAC_Sample94_97: 
	incbin 	"SMPS Music\DAC\94-97.bin"	
DAC_Sample94_97_End:   
DAC_Sample98_9A: 
	incbin 	"SMPS Music\DAC\98-9A.bin"	
DAC_Sample98_9A_End:   
DAC_Sample9B: 
	incbin 	"SMPS Music\DAC\9B.bin"	
DAC_Sample9B_End:    
DAC_Sample9C: 
	incbin 	"SMPS Music\DAC\9C.bin"	
DAC_Sample9C_End:   
DAC_Sample9D: 
	incbin 	"SMPS Music\DAC\9D.bin"	
DAC_Sample9D_End:    
DAC_Sample9E: 
	incbin 	"SMPS Music\DAC\9E.bin"	
DAC_Sample9E_End: 
DAC_Sample9F: 
	incbin 	"SMPS Music\DAC\9F.bin"	
DAC_Sample9F_End:   
		finishbank
;=============================================================================== 
; DAC Bank 2 - $1C
;=============================================================================== 
	cnop    $0000,$E0000
DACBank3:			startbank
DAC_SampleA0: 
	incbin 	"SMPS Music\DAC\A0.bin"	
DAC_SampleA0_End:  
DAC_SampleA1: 
	incbin 	"SMPS Music\DAC\A1.bin"	
DAC_SampleA1_End: 
DAC_SampleA2: 
	incbin 	"SMPS Music\DAC\A2.bin"	
DAC_SampleA2_End: 
DAC_SampleA3: 
	incbin 	"SMPS Music\DAC\A3.bin"	
DAC_SampleA3_End: 
DAC_SampleA4: 
	incbin 	"SMPS Music\DAC\A4.bin"	
DAC_SampleA4_End: 
DAC_SampleA5: 
	incbin 	"SMPS Music\DAC\A5.bin"	
DAC_SampleA5_End: 
DAC_SampleA6: 
	incbin 	"SMPS Music\DAC\A6.bin"	
DAC_SampleA6_End: 
DAC_SampleA7: 
	incbin 	"SMPS Music\DAC\A7.bin"	
DAC_SampleA7_End: 
DAC_SampleA8: 
	incbin 	"SMPS Music\DAC\A8.bin"	
DAC_SampleA8_End: 
DAC_SampleA9: 
	incbin 	"SMPS Music\DAC\A9.bin"	
DAC_SampleA9_End: 
DAC_SampleAA: 
	incbin 	"SMPS Music\DAC\AA.bin"	
DAC_SampleAA_End: 
DAC_SampleAB: 
	incbin 	"SMPS Music\DAC\AB.bin"	
DAC_SampleAB_End: 
;=============================================================================== 
; DAC Bank 3 - $1D
;=============================================================================== 
	cnop    $0000,$E8000
DACBank4:			startbank
DAC_SampleAC: 
	incbin 	"SMPS Music\DAC\AC.bin"	
DAC_SampleAC_End: 
DAC_SampleAD_AE: 
	incbin 	"SMPS Music\DAC\AD-AE.bin"	
DAC_SampleAD_AE_End: 
DAC_SampleAF_B0: 
	incbin 	"SMPS Music\DAC\AF-B0.bin"	
DAC_SampleAF_B0_End: 
DAC_SampleB1:
	incbin 	"SMPS Music\DAC\B1.bin"	
DAC_SampleB1_End:
		finishbank
DAC_SampleB2_B3: 
	incbin 	"SMPS Music\DAC\B2-B3.bin"	
DAC_SampleB2_B3_End: 	
DAC_SampleB4_C1_C2_C3_C4:
	incbin 	"SMPS Music\DAC\B4C1-C4.bin"
DAC_SampleB4_C1_C2_C3_C4_End:
DAC_SampleB5:
	incbin 	"SMPS Music\DAC\B5.bin"	
DAC_SampleB5_End:
DAC_SampleB6:
	incbin 	"SMPS Music\DAC\B6.bin"	
DAC_SampleB6_End:
DAC_SampleB7:
	incbin 	"SMPS Music\DAC\B7.bin"	
DAC_SampleB7_End:
DAC_SampleB8_B9:
	incbin 	"SMPS Music\DAC\B8-B9.bin"	
DAC_SampleB8_B9_End:
DAC_SampleBA:
	incbin 	"SMPS Music\DAC\BA.bin"	
DAC_SampleBA_End:	
DAC_SampleBB:
	incbin 	"SMPS Music\DAC\BB.bin"	
DAC_SampleBB_End:		
DAC_SampleBC:
	incbin 	"SMPS Music\DAC\BC.bin"	
DAC_SampleBC_End:		
DAC_SampleBD:
	incbin 	"SMPS Music\DAC\BD.bin"	
DAC_SampleBD_End:
DAC_SampleBE:		
	incbin 	"SMPS Music\DAC\BE.bin"	
DAC_SampleBE_End:
DAC_SampleBF:		
	incbin 	"SMPS Music\DAC\BF.bin"	
DAC_SampleBF_End:
DAC_SampleC0:		
	incbin 	"SMPS Music\DAC\C0.bin"	
DAC_SampleC0_End:
		finishbank
;=============================================================================== 
; DAC Bank 4 - $1E
;=============================================================================== 
	cnop    $0000,$F0000
DACBank5:			startbank
DAC_SampleC5:		
	incbin 	"SMPS Music\DAC\C5.bin"	
DAC_SampleC5_End:
DAC_SampleC6:		
	incbin 	"SMPS Music\DAC\C6.bin"	
DAC_SampleC6_End:
DAC_SampleC7:			
	incbin 	"SMPS Music\DAC\C7.bin"	
DAC_SampleC7_End:
DAC_SampleC8:		
	incbin 	"SMPS Music\DAC\C8.bin"	
DAC_SampleC8_End:
DAC_SampleC9CC_CF:		
	incbin 	"SMPS Music\DAC\C9CC-CF.bin"
DAC_SampleC9CC_CF_End:	
DAC_SampleCAD0_D2:	
	incbin 	"SMPS Music\DAC\CAD0-D2.bin"
DAC_SampleCAD0_D2_End:		
DAC_SampleCBD3_D5:		
	incbin 	"SMPS Music\DAC\CBD3-D5.bin"
DAC_SampleCBD3_D5_End:		
DAC_SampleD6:	
	incbin 	"SMPS Music\DAC\D6.bin"	
DAC_SampleD6_End:	
DAC_SampleD7:	
	incbin 	"SMPS Music\DAC\D7.bin"
DAC_SampleD7_End:	
DAC_SampleD8_D9:	
	incbin 	"SMPS Music\DAC\D8-D9.bin"
DAC_SampleD8_D9_End:	  
		finishbank	
		
		cnop    $000000, $0F8000 
Sound_Index:		;startbank
	romptr_z80 	Sfx_A0   
	romptr_z80 	Sfx_A1    
	romptr_z80 	Sfx_A2    
	romptr_z80 	Sfx_A3  
	romptr_z80 	Sfx_A4 
	romptr_z80 	Sfx_A5  
	romptr_z80 	Sfx_A6   
	romptr_z80 	Sfx_A7    
	romptr_z80 	Sfx_A8    
	romptr_z80 	Sfx_A9  
	romptr_z80 	Sfx_AA 
	romptr_z80 	Sfx_AB  
	romptr_z80 	Sfx_AC   
	romptr_z80 	Sfx_AD    
	romptr_z80 	Sfx_AE    
	romptr_z80 	Sfx_AF  

	romptr_z80 	Sfx_B0   
	romptr_z80 	Sfx_B1    
	romptr_z80 	Sfx_B2    
	romptr_z80 	Sfx_B3  
	romptr_z80 	Sfx_B4 
	romptr_z80 	Sfx_B5  
	romptr_z80 	Sfx_B6   
	romptr_z80 	Sfx_B7    
	romptr_z80 	Sfx_B8    
	romptr_z80 	Sfx_B9  
	romptr_z80 	Sfx_BA 
	romptr_z80 	Sfx_BB  
	romptr_z80 	Sfx_BC   
	romptr_z80 	Sfx_BD    
	romptr_z80 	Sfx_BE    
	romptr_z80 	Sfx_BF 

	romptr_z80 	Sfx_C0   
	romptr_z80 	Sfx_C1    
	romptr_z80 	Sfx_C2    
	romptr_z80 	Sfx_C3  
	romptr_z80 	Sfx_C4 
	romptr_z80 	Sfx_C5  
	romptr_z80 	Sfx_C6   
	romptr_z80 	Sfx_C7    
	romptr_z80 	Sfx_C8    
	romptr_z80 	Sfx_C9  
	romptr_z80 	Sfx_CA 
	romptr_z80 	Sfx_CB  
	romptr_z80 	Sfx_CC   
	romptr_z80 	Sfx_CD    
	romptr_z80 	Sfx_CE    
	romptr_z80 	Sfx_CF

	romptr_z80 	Sfx_D0   
	romptr_z80 	Sfx_D1    
	romptr_z80 	Sfx_D2    
	romptr_z80 	Sfx_D3  
	romptr_z80 	Sfx_D4 
	romptr_z80 	Sfx_D5  
	romptr_z80 	Sfx_D6   
	romptr_z80 	Sfx_D7    
	romptr_z80 	Sfx_D8    
	romptr_z80 	Sfx_D9  
	romptr_z80 	Sfx_DA 
	romptr_z80 	Sfx_DB  
	romptr_z80 	Sfx_DC   
	romptr_z80 	Sfx_DD    
	romptr_z80 	Sfx_DE    
	romptr_z80 	Sfx_DF 	 
	
	romptr_z80 	Sfx_E0   
	romptr_z80 	Sfx_E1    
	romptr_z80 	Sfx_E2    
	romptr_z80 	Sfx_E3  
	romptr_z80 	Sfx_E4 
	romptr_z80 	Sfx_E5  
	romptr_z80 	Sfx_E6   
	romptr_z80 	Sfx_E7    
	romptr_z80 	Sfx_E8    
	romptr_z80 	Sfx_E9  
	romptr_z80 	Sfx_EA 
	romptr_z80 	Sfx_EB  
	romptr_z80 	Sfx_EC   
	romptr_z80 	Sfx_ED    
	romptr_z80 	Sfx_EE    
	romptr_z80 	Sfx_EF 
	
Sfx_A0: ; loc_FF082:          
	include 	"SMPS Music\S2\sfx\Sound20.asm"
	even
Sfx_A1: ; loc_FF098:                
	include 	"SMPS Music\S2\sfx\Sound21.asm"
	even
Sfx_A2: ; loc_FF0C2: 
	include 	"SMPS Music\S2\sfx\Sound22.asm"
	even
Sfx_A3: ; loc_FF0E1:                       
	include 	"SMPS Music\S2\sfx\Sound23.asm"
	even
Sfx_A4: ; loc_FF113:                 
	include 	"SMPS Music\S2\sfx\Sound24.asm" 
	even
Sfx_A5: ; loc_FF148:                    
	include 	"SMPS Music\S2\sfx\Sound25.asm"
	even
Sfx_A6: ; loc_FF174:  
	include 	"SMPS Music\S2\sfx\Sound26.asm"
	even
Sfx_A7: ; loc_FF1A3:    
	include 	"SMPS Music\S2\sfx\Sound27.asm"
	even
Sfx_A8: ; loc_FF1D2:    
	include 	"SMPS Music\S2\sfx\Sound28.asm"
	even
Sfx_A9: ; loc_FF1EC:  
	include 	"SMPS Music\S2\sfx\Sound29.asm"
	even
Sfx_AA: ; loc_FF1FE:   
	include 	"SMPS Music\S2\sfx\Sound2A.asm"
	even
Sfx_AB: ; loc_FF23F:   
	include 	"SMPS Music\S2\sfx\Sound2B.asm"
	even
Sfx_AC: ; loc_FF25E:    
	include 	"SMPS Music\S2\sfx\Sound2C.asm"
	even
Sfx_AD: ; loc_FF292:  
	include 	"SMPS Music\S2\sfx\Sound2D.asm"
	even	
Sfx_AE: ; loc_FF2C8:
	include 	"SMPS Music\S2\sfx\Sound2E.asm" 
	even	
Sfx_AF: ; loc_FF312:   
	include 	"SMPS Music\S2\sfx\Sound2F.asm"
	even	
Sfx_B0: ; loc_FF082:          
	include 	"SMPS Music\S2\sfx\Sound30.asm"
	even
Sfx_B1: ; loc_FF098:                
	include 	"SMPS Music\S2\sfx\Sound31.asm"
	even
Sfx_B2: ; loc_FF0C2: 
	include 	"SMPS Music\S2\sfx\Sound32.asm"
	even
Sfx_B3: ; loc_FF0E1:                       
	include 	"SMPS Music\S2\sfx\Sound33.asm"
	even
Sfx_B4: ; loc_FF113:                 
	include 	"SMPS Music\S2\sfx\Sound34.asm"  
	even
Sfx_B5: ; loc_FF148:                    
	include 	"SMPS Music\S2\sfx\Sound35.asm"
	even
Sfx_B6: ; loc_FF174:  
	include 	"SMPS Music\S2\sfx\Sound36.asm"
	even
Sfx_B7: ; loc_FF1A3:    
	include 	"SMPS Music\S2\sfx\Sound37.asm"
	even
Sfx_B8: ; loc_FF1D2:    
	include 	"SMPS Music\S2\sfx\Sound38.asm"
	even
Sfx_B9: ; loc_FF1EC:  
	include 	"SMPS Music\S2\sfx\Sound39.asm"
	even
Sfx_BA: ; loc_FF1FE:   
	include 	"SMPS Music\S2\sfx\Sound3A.asm"
	even
Sfx_BB: ; loc_FF23F:   
	include 	"SMPS Music\S2\sfx\Sound3B.asm"
	even
Sfx_BC: ; loc_FF25E:    
	include 	"SMPS Music\S2\sfx\Sound3C.asm"
	even
Sfx_BD: ; loc_FF292:  
	include 	"SMPS Music\S2\sfx\Sound3D.asm"
	even
Sfx_BE: ; loc_FF2C8:
	include 	"SMPS Music\S2\sfx\Sound3E.asm"  
	even
Sfx_BF: ; loc_FF312:   
	include 	"SMPS Music\S2\sfx\Sound3F.asm"   
	even
Sfx_C0: ; loc_FF082:          
	include 	"SMPS Music\S2\sfx\Sound40.asm"
	even
Sfx_C1: ; loc_FF098:                
	include 	"SMPS Music\S2\sfx\Sound41.asm"
	even
Sfx_C2: ; loc_FF0C2: 
	include 	"SMPS Music\S2\sfx\Sound42.asm"
	even
Sfx_C3: ; loc_FF0E1:                       
	include 	"SMPS Music\S2\sfx\Sound43.asm"
	even
Sfx_C4: ; loc_FF113:                 
	include 	"SMPS Music\S2\sfx\Sound44.asm"
	even
Sfx_C5: ; loc_FF148:                    
	include 	"SMPS Music\S2\sfx\Sound45.asm"
	even
Sfx_C6: ; loc_FF174:  
	include 	"SMPS Music\S2\sfx\Sound46.asm"
	even
Sfx_C7: ; loc_FF1A3:    
	include 	"SMPS Music\S2\sfx\Sound47.asm"
	even
Sfx_C8: ; loc_FF1D2:    
	include 	"SMPS Music\S2\sfx\Sound48.asm"
	even
Sfx_C9: ; loc_FF1EC:  
	include 	"SMPS Music\S2\sfx\Sound49.asm"
	even
Sfx_CA: ; loc_FF1FE:   
	include 	"SMPS Music\S2\sfx\Sound4A.asm"
	even
Sfx_CB: ; loc_FF23F:   
	include 	"SMPS Music\S2\sfx\Sound4B.asm"
	even
Sfx_CC: ; loc_FF25E:    
	include 	"SMPS Music\S2\sfx\Sound4C.asm"
	even
Sfx_CD: ; loc_FF292:  
	include 	"SMPS Music\S2\sfx\Sound4D.asm"
	even
Sfx_CE: ; loc_FF2C8:
	include 	"SMPS Music\S2\sfx\Sound4E.asm"
	even
Sfx_CF: ; loc_FF312:   
	include 	"SMPS Music\S2\sfx\Sound4F.asm"
	even
Sfx_D0: ; loc_FF082:          
	include 	"SMPS Music\S2\sfx\Sound50.asm"
	even
Sfx_D1: ; loc_FF098:                
	include 	"SMPS Music\S2\sfx\Sound51.asm"
	even
Sfx_D2: ; loc_FF0C2: 
	include 	"SMPS Music\S2\sfx\Sound52.asm"
	even
Sfx_D3: ; loc_FF0E1:                       
	include 	"SMPS Music\S2\sfx\Sound53.asm"
	even
Sfx_D4: ; loc_FF113:                 
	include 	"SMPS Music\S2\sfx\Sound54.asm"
	even
Sfx_D5: ; loc_FF148:                    
	include 	"SMPS Music\S2\sfx\Sound55.asm"
	even
Sfx_D6: ; loc_FF174:  
	include 	"SMPS Music\S2\sfx\Sound56.asm"
	even
Sfx_D7: ; loc_FF1A3:    
	include 	"SMPS Music\S2\sfx\Sound57.asm"
	even
Sfx_D8: ; loc_FF1D2:    
	include 	"SMPS Music\S2\sfx\Sound58.asm"
	even
Sfx_D9: ; loc_FF1EC:  
	include 	"SMPS Music\S2\sfx\Sound59.asm"
	even
Sfx_DA: ; loc_FF1FE:   
	include 	"SMPS Music\S2\sfx\Sound5A.asm"
	even
Sfx_DB: ; loc_FF23F:   
	include 	"SMPS Music\S2\sfx\Sound5B.asm"
	even
Sfx_DC: ; loc_FF25E:    
	include 	"SMPS Music\S2\sfx\Sound5C.asm"
	even
Sfx_DD: ; loc_FF292:  
	include 	"SMPS Music\S2\sfx\Sound5D.asm"
	even
Sfx_DE: ; loc_FF2C8:
	include 	"SMPS Music\S2\sfx\Sound5E.asm"
	even
Sfx_DF: ; loc_FF312:   
	include 	"SMPS Music\S2\sfx\Sound5F.asm"
	even              

Sfx_E0: ; loc_FF082:          
	include 	"SMPS Music\S2\sfx\Sound60.asm"
	even
Sfx_E1: ; loc_FF098:                
	include 	"SMPS Music\S2\sfx\Sound61.asm"
	even
Sfx_E2: ; loc_FF0C2: 
	include 	"SMPS Music\S2\sfx\Sound62.asm"
	even
Sfx_E3: ; loc_FF0E1:                       
	include 	"SMPS Music\S2\sfx\Sound63.asm"
	even
Sfx_E4: ; loc_FF113:                 
	include 	"SMPS Music\S2\sfx\Sound64.asm"
	even
Sfx_E5: ; loc_FF148:                    
	include 	"SMPS Music\S2\sfx\Sound65.asm"
	even
Sfx_E6: ; loc_FF174:  
	include 	"SMPS Music\S2\sfx\Sound66.asm"
	even
Sfx_E7: ; loc_FF1A3:    
	include 	"SMPS Music\S2\sfx\Sound67.asm"
	even
Sfx_E8: ; loc_FF1D2:    
	include 	"SMPS Music\S2\sfx\Sound68.asm"
	even
Sfx_E9: ; loc_FF1EC:  
	include 	"SMPS Music\S2\sfx\Sound69.asm"
	even
Sfx_EA: ; loc_FF1FE:   
	include 	"SMPS Music\S2\sfx\Sound6A.asm"
	even
Sfx_EB: ; loc_FF23F:   
	include 	"SMPS Music\S2\sfx\Sound6B.asm"
	even
Sfx_EC: ; loc_FF25E:    
	include 	"SMPS Music\S2\sfx\Sound6C.asm"
	even
Sfx_ED: ; loc_FF292:  
	include 	"SMPS Music\S2\sfx\Sound6D.asm"
	even
Sfx_EE: ; loc_FF2C8:
	include 	"SMPS Music\S2\sfx\Sound6E.asm"
	even
Sfx_EF: ; loc_FF312:   
	include 	"SMPS Music\S2\sfx\Sound6F.asm"
	even              
	
	;	finishbank