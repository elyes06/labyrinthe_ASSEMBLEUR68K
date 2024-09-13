OPEN_FILE:
    MOVE #51,D0
    TRAP #15
    RTS
CLOSE_FILE:
    MOVE #56,D0
    TRAP #15
    RTS
READ_FILE:
    MOVE #53,D0
    TRAP #15
    RTS

AFFCAR:
    MOVE #6, D0
    TRAP #15
    RTS
SAISCAR:
    MOVE #5, D0
    TRAP #15
    RTS

POS_CURS:
    MOVE #11, D0
    TRAP #15
    RTS
GET_AFFCHAR:
    MOVE #22, D0
    TRAP #15
    RTS
GET_TIME:
    MOVE.L #8, D0
    TRAP #15
    RTS
RAND_PIXEL:
    JSR GET_TIME
    MOVE.L D1,D3
    LSL.L #8,D3
    LSL.L #8,D3
    LSL.L #8,D3
    LSR.L #8,D3
    LSR.L #8,D3
    LSR.L #6,D3
    MOVE.L D3,D0
    ADD.L #$FFF,D0
    JSR DENTISTE_WAIT_ROOM
    JSR GET_TIME
    LSL.L #8,D1
    LSL.L #8,D1
    LSL.L #8,D1
    LSR.L #8,D1
    LSR.L #8,D1
    LSR.L #6,D1
    OR.L D3,D1
    MOVE.L #10, D3
    DIVU D3,D1
    DIVU D3,D1
    LSR.L #8,D1
    LSR.L #8,D1
    RTS
AFFSTRING:
    MOVE.L #0,D4
    CLR.L D1
BEGINING:
    CMP.L #2653,D4
    BEQ RETURN
    MOVE.B (A1,D4),D1
    ADD.L #1,D4
    JSR AFFCAR
    BRA BEGINING    


 
*RAND:
*    JSR GET_TIME
*    MOVE.L D1,D6
*    LSL.L #8,D6
*    LSL.L #8,D6
*    LSL.L #8,D6
*    LSR.L #8,D6
*    LSR.L #8,D6
*    LSR.L #6,D6
*    MOVE.L D6,D0
*    JSR DENTISTE_WAIT_ROOM
*    JSR GET_TIME
*    LSL.L #8,D1
*    LSL.L #8,D1
*    LSL.L #8,D1
*    LSR.L #8,D1
*    LSR.L #8,D1
*    LSR.L #6,D1
*    OR.L D6,D1
*    MOVE.L #10, D6
*    DIVU D6,D1
*    DIVU D6,D1
*    LSR.L #8,D1
*    LSR.L #8,D1
*    RTS
RAND:
    JSR GET_TIME
    AND.L #$0000000F,D1
    ADD.L #1,D1
    MULU #657,D1
    ADD.L #973,D1
    DIVU #787,D1
    LSR.L #8,D1
    LSR.L #8,D1
    AND.B #%00000001,D1
    MOVE.L D1,D3
    MOVE.L #$00000069,D0
    JSR DENTISTE_WAIT_ROOM
    JSR GET_TIME
    AND.L #$0000000F,D1
    ADD.L #1,D1
    MULU #657,D1
    ADD.L #973,D1
    DIVU #787,D1
    LSR.L #8,D1
    LSR.L #8,D1
    AND.B #%00000001,D1
    ADD.L D1,D3
    MOVE.L #$00000069,D0
    JSR DENTISTE_WAIT_ROOM
    JSR GET_TIME
    AND.L #$0000000F,D1
    ADD.L #1,D1
    MULU #657,D1
    ADD.L #973,D1
    DIVU #787,D1
    LSR.L #8,D1
    LSR.L #8,D1
    AND.B #%00000001,D1
    ADD.L D3,D1
    
    RTS


    

RAND39:
    JSR GET_TIME
    MOVE.L D1,D3
    LSL.L #8,D3
    LSL.L #8,D3
    LSL.L #8,D3
    LSR.L #8,D3
    LSR.L #8,D3
    LSR.L #6,D3
    MOVE.L D3,D0
    JSR DENTISTE_WAIT_ROOM
    JSR GET_TIME
    LSL.L #8,D1
    LSL.L #8,D1
    LSL.L #8,D1
    LSR.L #8,D1
    LSR.L #8,D1
    LSR.L #6,D1
    OR.L D3,D1
    MOVE.L #30, D3
    DIVU D3,D1
    DIVU D3,D1
    LSR.L #8,D1
    LSR.L #8,D1
    RTS
RAND24:
    JSR GET_TIME
    MOVE.L D1,D6
    LSL.L #8,D6
    LSL.L #8,D6
    LSL.L #8,D6
    LSR.L #8,D6
    LSR.L #8,D6
    LSR.L #6,D6
    MOVE.L D6,D0
    JSR DENTISTE_WAIT_ROOM
    JSR GET_TIME
    LSL.L #8,D1
    LSL.L #8,D1
    LSL.L #8,D1
    LSR.L #8,D1
    LSR.L #8,D1
    LSR.L #6,D1
    OR.L D6,D1
    MOVE.L #24, D6
    DIVU D6,D1
    DIVU D6,D1
    LSR.L #8,D1
    LSR.L #8,D1
    RTS


RANDOM_COLOR:
    JSR RAND
    MOVE.L D1,D5
    JSR RAND
    LSL.L #6,D1
    ADD.L D5,D1
    RTS
GEN_COLOR:
    *MOVE.L #$00EE2343, D1
    MOVE.B (A0)+,D0
    CMP.B #1,D0
    BEQ TEX
    CMP.B #2,D0
    BEQ WIN
    CMP.B #3,D0
    BEQ PATH
    MOVE.L #$00FF0099,D1
    BRA RETURN
WIN:
    MOVE.L #$00000099,D1
    JSR SET_FILL_COLOR
    JSR SET_PEN_COLOR
    
    MOVE.L D5,D1
    MOVE.L D6,D2
    JSR DRAW_BOX
    
    BRA RETURN    
PATH:
    MOVE.L #$0017141c,D1
    
    JSR SET_FILL_COLOR
    JSR SET_PEN_COLOR
    
    MOVE.L D5,D1
    MOVE.L D6,D2
    JSR DRAW_BOX
    
    BRA RETURN
TEX:
    MOVE.L D5,D1
    MOVE.L D6,D2
    
    JSR DRAW_TEXTURE
    
    BRA RETURN    
    
DENTISTE_WAIT_ROOM:
    CMPI.L #0, D0
    BEQ RETURN
    SUB.L #1, D0
    BRA DENTISTE_WAIT_ROOM

RETURN:
    RTS
FINPRG:
    MOVE #9, D0
    TRAP #15







































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
