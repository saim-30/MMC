ORG 0000H

MOV TMOD, #10H       ; Timer1 in Mode 1 (16-bit timer)

AGAIN: 
    MOV TL1, #0FFH    ; Load low byte of Timer1
    MOV TH1, #0EDH    ; Load high byte of Timer1
    CPL P1.5          ; Toggle pin P1.5
    SETB TR1          ; Start Timer1

BACK: 
    JNB TF1, BACK     ; Wait until Timer1 overflows (TF1 = 1)

    CLR TR1           ; Stop Timer1
    CLR TF1           ; Clear overflow flag
    SJMP AGAIN        ; Repeat forever

END
