.arm
.text
.global main

main:
STMDB R13!, {R0-R8, R14}

@parameters:
LDR R7, =table
MOV R8, #20

BL insertion_sort_subrtn

BL test_subrtn

LDMIA R13!, {R0-R8, PC}

insertion_sort_subrtn:
STMDB R13!, {R0-R6}

@initialization:
MOV R1, #0

repeat:
ADD R3, R1, #1
LDRB R0, [R7, R1]
MOV R2, R1

table_size:
LDRB R4, [R7, R3]
CMP R0, R4
BLS not_to_change_element

@to_change_element:
MOV R2, R3
MOV R0, R4

not_to_change_element:
ADD R3, R3, #1
CMP R3, R8
BLO table_size

@change_memory:
LDRB R5, [R7, R1]
STRB R0, [R7, R1]
STRB R5, [R7, R2]
ADD R1, R1, #1
SUB R6, R8, #1 
CMP R1, R6 
BLO repeat

finished:
LDMIA R13!, {R0-R6}
MOV PC, R14

test_subrtn:
STMDB R13!, {R0-R5}

MOV R0, #1 @R0:counter
MOV R5, #1 @R5=1 -> correct
MOV R1, R7
ADD R2, R7, #1
Loop:
LDRB R3, [R1], #1
LDRB R4, [R2], #1
CMP R4, R3
BHS correct

not_correct:
MOV R5, #0

correct:
ADD R0, R0, #1
CMP R0, R8
BLO Loop

tested:
LDMIA R13!, {R0-R5}
MOV PC, R14

.data
table:
.byte 0x45, 0x82, 0x34, 0x1 
.byte 0xDA, 0x10, 0x28, 0x2
.byte 0x3, 0x5, 0x79, 0xEA
.byte 0x42, 0x46, 0x36, 0x32
.byte 0x21, 0x23, 0xEB, 0xDF