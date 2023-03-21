.arm
.text
.global main
 
main:
STMDB R13!, {R0-R1, R14}
 
LDR R1, =Stor
 
MOV R0, #0
Loop:
STRB R0, [R1], #1
ADD R0, R0, #1
CMP R0, #6
BLO Loop
 
LDMIA R13!, {R0-R1, PC}
 
.data
 
Stor:
.word 0, 0
