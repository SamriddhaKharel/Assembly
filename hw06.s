 	.global countChar
	.global sumDigits

@Samriddha Kharel

countChar:
    mov r2, #0      @ initialize count to zero

loop:
    ldrb r3, [r0], #1   @ load the next character from s and increment the pointer
    cmp r3, #0          @ Check for the null terminator
    beq done           
    cmp r3, r1          @ compare the loaded character with character 
    bne loop            @ if not equal continue looping
    add r2, r2, #1      @ else increment the count
    
    b loop    
done:
    mov r0, r2           @ return the count in r0
    bx lr
    
    

sumDigits:
    mov r1, #0           @ initialize sum to 0

loop2:
    ldrb r2, [r0], #1   
    cmp r2, #0          
    beq done2           
    cmp r2, #'0'        @ compare with the character '0'
    blt loop2           @ if less than '0' not a digit
    cmp r2, #'9'        @ compare with the character '9'
    bgt loop2           @ if greater than '9', not a digit
    sub r2, r2, #'0'    @ convert asci digit to integer
    add r1, r1, r2      @ add the digit to the sum
    b loop2

done2:
    mov r0, r1           @ return the sum in r0
    bx lr
