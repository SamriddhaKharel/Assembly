/*
    Samriddha Kharel

    program hw04b
*/

.global _start

_start:

    ldr r1, =string
    mov r0, #0       @ index count
    mov r4, #0       @ charcter count

loop:
    ldrb r2, [r1, r0]

    cmp r2, #0          @ check for the null terminator
    beq print

    and r3, r0, #1
    cmp r3, #0          @ Check with inmdex if the result of AND is even or odd
    beq is_even
    sub r2, r2, #5
    b store

is_even:
    add r2, r2, #5

store:
    strb r2, [r1, r0]

    @ Increment index count and character
    
    add r0, r0, #1
    add r4, r4, #1

    b loop

print:
    @ print the modified string
    
    mov r7, #4         @ syscall = write
    mov r0, #1         @ File pointer = stdout
    mov r2, r4         @ Length of the modified string
    add r2, r2, #1     @ Add 1 for the null terminator
    ldr r1, =string
    swi 0

    @ Print a newline character
    mov r7, #4        
    mov r0, #1         
    ldr r1, =newline   @ Load the address of newline into r1
    mov r2, #1         @ Load 1 into r2 newline length
    swi 0

end:
    mov r7, #1         
    swi 0

.data
    /* indices              */
string:  /* 01234567890123456789 */
    .asciz "Kwjlmfhrdsb%atm%azi3" 

newline:
    .asciz "\n"
