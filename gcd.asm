# Declare the listed label(s) as global to enable referencing from other files
# Use the following names for the function
# problem 1: lpyear
# problem 2: gcd
# problem 3: npnum
# problem 4: palin

# ALGORITHM
# 1) If a and b are 0, return -1
# 2) If a == b STOP, GCD = A = B, Else STEP 3
# 3) If a > b, a = a - b, GO TO STEP 2
# 4) If b > a, b = b - a, GO TO STEP 2

.globl gcd

gcd:
	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	mv t1, x10
	mv t2, x11
	
	#check if any inptus are 0
	bne t1, x0, ELSE
	j ZERO
	bne t2, x0, ELSE
	j ZERO
	
	ELSE:	bne t1, t2, NEQUAL
		j EQUAL
		
	EQUAL:	add x10, t1, x0
		j EXIT
	
	NEQUAL:	bgt t1, t2, AB
		bgt t2, t1, BA
		j EXIT
	
	AB:	sub t1, t1, t2
		j ELSE
	
	BA:	sub t2, t2, t1 
		j ELSE
		
	ZERO:
	addi x10, x0, -1
	
	EXIT:
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point
