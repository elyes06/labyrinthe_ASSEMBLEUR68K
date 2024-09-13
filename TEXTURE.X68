
	*PROGRAMME
DRAW_TEXTURE:	
    
    *LEA.L TEXTURE,A1
    

	MOVE.L D1,D3 
    MOVE.L D2,D4 
    
    LEA.L TEXTURE,A1
    JSR OPEN_FILE
    MOVE.L #500,D2
    JSR READ_FILE
    
    MOVE.L D4,D2
    
    MULU #20,D3
    MULU #20,D2

    MOVE.L #$76,OFFSET
    
    MOVE.L D2,SCALING_X
    MOVE.L D3,SCALING_Y
    
    MOVE.L #20,MAX_X
    MOVE.L #20,MAX_Y
    ADD.L D2,MAX_X
    ADD.L D3,MAX_Y

DRAW_TEXTURE_LOOP:  
** increment X then check if y equals 24
    CMP.L MAX_X, D2
    BPL DRAW_TEXTURE_YFIX
    JSR LOOP
    JSR SET_FILL_COLOR
    ADD.L #1, D2
DRAW_TEXTURE_LOOP_RESUME:
    cmp.L MAX_Y, D3
    BEQ FIN_TEXTURE
    BRA DRAW_TEXTURE_LOOP
DRAW_TEXTURE_YFIX:
    ADD.L #1, D3
    MOVE.L SCALING_X, D2
    BRA DRAW_TEXTURE_LOOP_RESUME




LOOP:
    MOVE.L D3,D4
    SUB.L SCALING_Y,D4
    
    MOVE.L D4,D1
    MULU #20,D1
    
    MOVE.L D2,D4
    SUB.L SCALING_X,D4
    
    ADD.L D4,D1
    DIVU #2,D1
    
    
    
    ADD.L OFFSET,D1
    MOVE.B (A1,D1),D1
    
    CLR.L D4
    MOVE.L D1,D4
    BRA PROCESS_2_PIXELS

PROCESS_2_PIXELS:
LOOP_RESUME:
    *FIRST (PIXEL)
    MOVE.L D4,D1
    AND.L #$000000F0,D1
    LSR.B #4,D1

    MULU #4,D1
    ADD.L #54,D1

    
    MOVE.L (A1,D1),D1
    LSR.L #8,D1
    
    
    JSR SET_FILL_COLOR
    JSR SET_PEN_COLOR


    MOVE.L D3,D1
    MOVE.L D2,D2
    JSR DRAW_PIX
    
    ADD.L #1,D2
 
    *SECOND (PIXEL)
    MOVE.L D4,D1
    AND.L #$0000000F,D1
    
    MULU #4,D1
    ADD.L #54,D1
    
    
    
    MOVE.L (A1,D1),D1
    LSR.L #8,D1
    
    JSR SET_FILL_COLOR
    JSR SET_PEN_COLOR
    
    

    
    MOVE.L D3,D1
    MOVE.L D2,D2
    JSR DRAW_PIX
    
    
    
    MOVE.L SCALING_X,PADDING
    ADD.L #19,PADDING
    CMP.L PADDING,D2
    BEQ INCREMENT_OFFSET    
    RTS

FIN_TEXTURE:
    RTS
INCREMENT_OFFSET:
    ADD.L #2,OFFSET
    RTS
	
	*INCLUDE
	*INCLUDE 'BIBLIO.X68'
	*INCLUDE 'PERIPH.X68'
	*VARIABLES
	
    OFFSET: DS.L 1
	PADDING: DS.L 1
	
	SCALING: DS.L 1
	SCALING_X: DS.L 1
	SCALING_Y: DS.L 1
	
	MAX_X: DS.L 1
	MAX_Y: DS.L 1




*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
