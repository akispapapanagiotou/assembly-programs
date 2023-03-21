.arm
.text
.global main
 
main:
STMDB R13!, {R0-R4, R14}
 
LDR R1, =Stor
 
MOV R0, #0
MOV R2, #1
MOV R3, #2
STRB R2, [R1], #1
STRB R3, [R1], #1
Loop:
ADD R4, R3, R2
STRB R4, [R1], #1
MOV R2, R3
MOV R3, R4
 
ADD R0, R0, #1
CMP R0, #4
BLO Loop
 
LDMIA R13!, {R0-R4, PC}
 
.data
 
Stor:
.word 0, 0