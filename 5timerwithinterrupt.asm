with interrupts

ORG 0000H
LJMP MAIN          ; Jump to main program

ORG 000BH          ; Timer0 interrupt vector address
TIMER0_ISR:
    CPL P1.2       ; Toggle P1.2 on each overflow
    MOV TH0, #0ECH ; Reload high byte for 5 ms delay
    MOV TL0, #078H ; Reload low byte for 5 ms delay
    RETI           ; Return from interrupt

ORG 0030H
MAIN:
    MOV TMOD, #01H ; Timer0 Mode 1 (16-bit)
    MOV TH0, #0ECH ; Load initial high byte
    MOV TL0, #078H ; Load initial low byte
    MOV IE, #82H   ; Enable Timer0 interrupt (EA=1, ET0=1)
    SETB TR0       ; Start Timer0

HERE: SJMP HERE    ; Infinite loop
END

