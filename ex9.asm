.arm
.text
.global main
 
main:
 
STMDB R13!, {R0-R12, R14}
 
LDR R0, =Values
LDR R1, =Const
 
MOV R10, #0
 
LoopOut:
 
LDRB R2, [R1, #6]
LDRB R3, [R1, #5]
LDRH R4, [R0], #2
 
MUL R5, R2, R4
ADD R5, R5, R3
 
 
MOV R6, #0
MOV R8, #4
 
LoopIn:
 
LDRB R9, [R1, R8]
 
MUL R7, R5, R4
ADD R5, R7, R9
 
SUB R8, R8, #1
 
ADD R6, R6, #1
CMP R6, #5
BLO LoopIn
 
ADD R10, R10, #1
CMP R10, #4
BLO LoopOut
 
LDMIA R13!, {R0-R12, PC}
 
 
.data
 
Values:
.word 0x10
.word 0x50A
.word 0xCDCA
.word 0x80AB
 
Const:
.byte 0x04, 0x07, 0x05
.byte 0x20, 0x1A, 0x12, 0x06