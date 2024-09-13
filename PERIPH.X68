SET_PEN_COLOR:
    MOVE #80,D0
    TRAP #15
    RTS

DRAW_PIX:
    MOVE #82,D0
    TRAP #15
    RTS

GET_PIX_COLOR:
    MOVE #83,D0
    TRAP #15
    RTS

MOVE_TO:
    MOVE #86,D0
    TRAP #15
    RTS
    
WIDTH_PEN:
    MOVE #93,D0
    TRAP #15
    RTS

DRAW_LINE:
    MOVE #84,D0
    TRAP #15
    RTS
    
DRAW_RECT:
    MOVE #90,D0
    TRAP #15
    RTS
    
DRAW_FILL_RECT:
    MOVE #87,D0
    TRAP #15
    RTS
    
SET_FILL_COLOR:
    MOVE #81,D0
    TRAP #15
    RTS

DRAW_BOX:
    MULU #20,D1
    MOVE.L #20,D3
    ADD.L D1,D3
    MULU #20,D2
    MOVE.L #20,D4
    ADD.L D2,D4
    MOVE.L #87,D0
    TRAP #15
    RTS
    
DRAW_TEXTURES:
    MULU #20,D1
    MOVE.L #20,D3
    ADD.L D1,D3
    MULU #20,D2
    MOVE.L #20,D4
    ADD.L D2,D4
    MOVE.L #87,D0
    TRAP #15
    RTS

CLOSE_ALL_FILE:
    MOVE #50,D0
    TRAP #15
    RTS















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
