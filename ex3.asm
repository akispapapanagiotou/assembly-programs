.arm
.text
.global main

main:

STMDB R13!, {R0-R6}

LDR R0, =Values_A
LDR R1, =Values_B
LDR R2, =Values_C

MOV R6, #0
Loop:
LDR R3, [R0], #4
LDR R4, [R1], #4

ADD R5, R3, R4

STR R5, [R2], #4

ADD R6, R6, #1
CMP R6, #4
BLO Loop

LDMIA R13!, {R0-R6}
MOV PC, R14

.data

Values_A:
.byte 32, 127, 254, 57
.byte 22, 111, 48, 11
.byte 87, 45, 114, 45
.byte 66, 23, 134, 168

Values_B:
.byte 19, 1, 18, 89
.byte 90, 112, 89, 32
.byte 23, 98, 67, 83
.byte 146, 140, 200, 67

Values_C:
.byte 0, 0, 0, 0
.byte 0, 0, 0, 0
.byte 0, 0, 0, 0
.byte 0, 0, 0, 0