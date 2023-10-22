@Samriddha Kharel 

	.global _start 
	
_start:

	mov r1, #13
	mov r2, #0b110
	sub r3, r1, r2 @ Value in r3 = 13-6 =7
	mov r4, #0x14
	mul r5, r3, r4 @ value in r5 = 7 * 0x14 = 140 
	lsr r0, r5, #2 @ value in r0 = 140/4 = 35 decimal or 23 hexadecimal


_exit: 

	mov r7, #1
	swi 0
