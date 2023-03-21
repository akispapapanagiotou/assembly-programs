.arm
.text
.global main
 
main:
STMDB R13!, {R0-R12, R14}
 
LDR R1, =Const
LDR R2, =Values
MOV R10, #0
Loop:
BL Subrtn
ADD R2, R2, #3
ADD R10, R10, #1
CMP R10, #4
BLO Loop
 
LDMIA R13!, {R0-R12, PC}
 
 
Subrtn:
STMDB R13!, {R3-R8}
 
LDRB R3, [R2, #0]
LDRB R4, [R2, #1]
LDRB R5, [R2, #2]
 
LDRB R6, [R1, #0]
LDRB R7, [R1, #1]
LDRB R8, [R1, #2]
 
MUL R6, R3, R6
MUL R7, R4, R7
MUL R8, R5, R8
 
ADD R7, R6, R7
SUB R8, R7, R8
 
MOV R7, #5
MUL R8, R7, R8
 
MOV R8, R8, ASR #6
MOV R0, R8
 
LDRB R12, [R1, #3]
CMP R0, R12
STRGEB R0, [R1, #3]
STRGEB R10, [R1, #4]
 
LDMIA R13!, {R3-R8}
MOV PC, LR
 
.data
Values:
.byte 0x02, 0x03, 0x04
.byte 0x10, 0x05, 0x06
.byte 0x0B, 0x02, 0x0D
.byte 0x01, 0x0c, 0x08
 
Const:
.byte 0x04, 0x07, 0x05
.byte 0x0, 0x0