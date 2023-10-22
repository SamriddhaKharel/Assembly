/*
    Samriddha Kharel
*/

    .global _start

_start:
    ldr r1, len
    ldr r2, = small      @ get address of an small 
    ldr r3, = half

    mov r0, #0          @r0 is max r6 is sum

loop:
    ldrsb r4, [r2], #1    @ Load the next element from the array into r3
    ldrsh r5, [r3], #2
    add r6, r4, r5
    cmp r6, r0
    bgt set_max

cont_loop:
    subs r1, r1, #1
    bne loop            @ Continue the loop if array_size is not zero

    
set_max:
    mov r0 , r6
    bne cont_loop            

    
end:
    mov r7, #1
    swi 0

len:             @ literal, not a variable
    .word 5      @ use with something like
                 @   ldr r1, len

    .data

small:
    .byte  -3, 18,  5, -21, -7
half:
    .hword -9, -6, 14,  33, 30

