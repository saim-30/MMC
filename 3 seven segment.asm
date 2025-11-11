ORG 0000H
MOV P1, #0FFH      ; Set Port 1 as input (all bits high)
MOV P2, #00H       ; Clear Port 2 (output port)
MOV DPTR, #0300H   ; Load lookup table address into DPTR

AGAIN: 
    MOV A, P1       ; Read input from Port 1
    ANL A, #0FH     ; Mask lower 4 bits (take only lower nibble)
    MOVC A, @A+DPTR ; Get corresponding code from lookup table
    MOV P2, A       ; Send the output to Port 2
    SJMP AGAIN      ; Repeat forever

ORG 0300H           ; Lookup table for 7-segment display (0–9)
DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH

END

port 1 and port 2
