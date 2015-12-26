
		move	SR, -(A7)
		movem.l D0-A6, -(SP)
		move    #$2700, SR
		lea     ($00A11100), A3
		lea     ($00A11200), A2
		moveq   #$00, D2
		move.w  #$0100, D1 
		move.w  D1, (A3)	
		move.w  D1, (A2)
Sound_Driver_001:                
		btst    D2, (A3)
		bne.s   Sound_Driver_001 
		jsr     Sound_Driver_002(PC)
		move.w  D2, (A2)
		move.w  D2, (A3)
		moveq   #$17, D0
Sound_Driver_Loop_01:
		dbra    D0, Sound_Driver_Loop_01
		move.w  D1, (A2)
		movem.l (SP)+,D0-A6
		move    (SP)+, SR
		rts
Sound_Driver_002:
		lea     z80_Driver(PC), A6 
		move.w  #z80_Driver_End-z80_Driver, D7
		moveq   #$00, D6
		lea     ($00A00000), A5
		moveq   #$00, D5
		lea     ($00A00000), A4
Sound_Driver_003:                
		lsr.w   #$01, D6
		btst    #$08, D6
		bne.s   Sound_Driver_004
		jsr     Sound_Driver_007(PC)
		move.b  D0, D6
		ori.w   #$FF00, D6
Sound_Driver_004:  
		btst    #$00, D6
		beq.s   Sound_Driver_005
		jsr     Sound_Driver_007(PC)
		move.b  D0, (A5)+
		addq.w  #$01, D5
		bra.w   Sound_Driver_003 
Sound_Driver_005:                  
		jsr     Sound_Driver_007(PC)
		moveq   #$00, D4
		move.b  D0, D4 
		jsr     Sound_Driver_007(PC)
		move.b  D0, D3 
		andi.w  #$000F, D3
		addq.w  #$02, D3
		andi.w  #$00F0, D0
		lsl.w   #$04, D0
		add.w   D0, D4
		addi.w  #$0012, D4
		andi.w  #$0FFF, D4
		move.w  D5, D0
		andi.w  #$F000, D0
		add.w   D0, D4
		cmp.w   D4, D5  
		bcc.s   Sound_Driver_006
		subi.w  #$1000, D4
		bcc.s   Sound_Driver_006
		add.w   D3, D5
		addq.w  #$01, D5
Sound_Driver_Loop_02:                
		move.b  #$00, (A5)+
		addq.w  #$01, D4
		dbra    D3, Sound_Driver_Loop_02
		bra.w   Sound_Driver_003
Sound_Driver_006:                
		add.w   D3, D5
		addq.w  #$01, D5
Sound_Driver_Loop_03:                 
		move.b  $00(A4, D4), (A5)+
		addq.w  #$01, D4
		dbra    D3, Sound_Driver_Loop_03 
		bra.w   Sound_Driver_003 
Sound_Driver_007:                
		move.b  (A6)+, D0   
		subq.w  #$01, D7  
		bne.s   Sound_Driver_008
		addq.w  #$04, A7
Sound_Driver_008:      
		rts   