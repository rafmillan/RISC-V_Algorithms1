# Declare the listed label(s) as global to enable referencing from other files
# Use the following names for the function
# problem 1: lpyear
# problem 2: gcd
# problem 3: npnum
# problem 4: palin

.globl npnum

# set t1 to 1 if a1 is prime, set t1 to 0 if a1 not prime
isprime:
	mv t1, a3
	
	addi t2, x0, 3
	beq t1, t2, TRUE 	# Check if t1 == 3
	addi t0, x0, 2
	beq t1, t0, TRUE 	# check if t1 == 2
	blt t1, t0, FALSE 	# check if t1 < 2 
	rem t0, t1, t0
	beq t0, x0, FALSE	# check if t1%2 == 0
	
	addi t0, x0, 3		#t0 = i
	j LOOP
	
	LOOP:	bge t0, t1, ELOOP
		rem t2, t1, t0
		beq t2, x0, FALSE
		addi t0, t0, 2
		j LOOP
		
	ELOOP:	j TRUE
	
	TRUE:	addi t1, x0, 1
		j RET
		
	FALSE:	addi t1, x0, 0
		j RET
			
	RET:
		ret

npnum:
	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	mv a1, x10
	
	#Check if x10 is 0
	blt a1, x0, NEG
	#4th
	addi a2, x0, 1	#i = 1 4 (2,3,5,7)
	addi a3, x0, 1	#j = 1 8
	addi a4, x0, 1
	j WHILE
	
	WHILE:	ble a2, a1, WHILE2
		j RETURN 
		
	WHILE2: jal isprime
		beq t1, a4, IPRIME	#if j isprime
		j EWHILE
	
	IPRIME:	addi x10, a3, 0	#prime = j
 		addi a2, a2, 1
		j EWHILE
		
	EWHILE:	addi a3, a3, 1 #j = j+1
		j WHILE
	
	NEG:	addi x10, x0, -1
		j RETURN
		
	RETURN:
	# restore registers from stack if needed
	addi a3, x0, 0
	addi a2, x0, 0
	addi a1, x0, 0
	addi a4, x0, 0
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point
