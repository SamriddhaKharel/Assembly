/*
      Samriddha Kharel

      program hw04a
*/

    .global _start

_start:

    ldr r1, = array      @ get address of an array
    ldr r2, = array_size 
    ldr r2,[r2]          

    mov r0, #0
    
loop:
    ldr r3, [r1], #4    @ Load the next element from the array into r3
    cmp r3, #20         
    bge skip_add        @ Branch if greater than or equal to 20
    add r0, r0, r3     

skip_add:
    subs r2, r2, #1     @ Decrement array_size
    bne loop            @ Continue the loop if array_size is not zero


end:
    mov r7, #1
    swi 0


    .data
array:
    .word 5, 1, 16, 200, 7, 20, 2, 21, 19, 3
array_size:
    .word 10

