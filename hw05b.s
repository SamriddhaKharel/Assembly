/*
    Samriddha Kharel
*/

    .global _start
    
_start:

    ldr r1, =s1
    bl sumDigits
    bl convert
    bl printString

    ldr r1, =s2
    bl sumDigits
    bl convert
    bl printString

    ldr r1, =s3
    bl sumDigits
    bl convert
    bl printString

end:
    mov r7, #1
    swi 0

sumDigits:
    mov r4, #0       
loop:
    ldrb r3, [r1], #1  @ Load the next character from the string
    cmp r3, #0        
    beq done          @ If null-terminator, exit the loop
    cmp r3, #','      @ Check if the character is a comma
    beq loop          
    cmp r3, #'0'      @ Check if the character is a digit
    blt loop          @ If not a digit, continue to the next character
    cmp r3, #'9'
    bgt loop
    sub r3, r3, #'0'  @ Convert ASCII character to integer
    add r4, r4, r3   @ Add the integer value to the sum
    b loop

done:
    bx lr

convert:
    mov r2, r4          @ Copy the sum to r2
    mov r5, #0          @ Initialize r5 as the second digit
    mov r6, #1          @ Initialize r6 as the iteration counter

    cmp r4, #10     @ Check if the sum is greater than or equal to 10
    bge subLoop

    add r6, r4, #'0'  @ Convert the sum to ASCII
    mov r4, #'0'      @ Set r4 to '0' for the first digit
    ldr r1, =out      
    strb r4, [r1]     @ Store the first digit 
    strb r6, [r1, #1] @ Store the second digit 

    bx lr

subLoop:
    sub r2, r2, #10  
    cmp r2, #10      
    blt finish       @ If the result is less than 10, exit the loop
    add r6, r6, #1   @ Increment the iteration counter
    b subLoop    

finish:

 @ At this point, r6 contains the first digit (iteration counter) and r2 contains the second digit.

    add r6, r6, #'0'
    add r2, r2, #'0'

   
    ldr r1, =out       
    strb r6, [r1]      
    strb r2, [r1, #1]  

    bx lr

printString:
    mov r0, #1       
    ldr r1, =out     

    @ Replace 'AZ' with the actual two-digit number (should be in r6 and r2)
    
    ldrb r6, [r1]      @ Load the first digit
    ldrb r2, [r1, #1]  @ Load the second digit

    @ Add a newline character after the two-digit number
    ldr r3, ='\n'
    strb r3, [r1, #2]

    mov r2, #3     
    mov r7, #4       @ System call for write
    swi #0

    bx lr

.data
s1:
    .asciz "1, 2, 3, 4, 5"
s2:
    .asciz "9, 0, 0, 6,0, 8, 7"
s3:
    .asciz "2, 4"
out:    @ should replace A and Z with digits to print
    .asciz "AZ\n"

