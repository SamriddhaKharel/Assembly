@Samriddha Kharel 

.global _start
_start:
   
    mov r0 , #0
    mov r1 , #1
    mov r2 , #10
   
loop:
    and r3, r1, #1    
    cmp r3, #0
    beq is_even 
   
    add r0, r0, r1
    add r1, r1 ,#1

    cmp r1, r2
    bge _exit

       
is_even:
    add r1, r1 ,#1
    b loop

_exit:
    mov r7, #1
    swi 0        


