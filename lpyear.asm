# Declare the listed label(s) as global to enable referencing from other files
# Use the following names for the function
# problem 1: lpyear
# problem 2: gcd
# problem 3: npnum
# problem 4: palin

# ALGORITHM
# 1) If the year is evenly divisible by 4, go to step 2. Otherwise, go to step 5.
# 2) If the year is evenly divisible by 100, go to step 3. Otherwise, go to step 4.
# 3) If the year is evenly divisible by 400, go to step 4. Otherwise, go to step 5.
# 4) The year is a leap year (it has 366 days).
# 5) The year is not a leap year (it has 365 days).

.globl lpyear

lpyear:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	mv t1, x10
	
	#Check if x10 is negative
	blt t1, x0, NEG
	
	addi t2, zero, 4 	#set t2 to 4
	rem t2, t1, t2		#t2 = x10 % 4
	
	#check if X10 % 4 = 0
	bne t2, x0, EXIT1
	j LOOP1
	EXIT1: addi x10, x0, 0
	j RETURN
		
	#check if x10 % 100 = 0
	LOOP1:  addi t2, zero, 100 	#set t2 to 100
		rem t2, t1, t2		#t2 = x10 % 100
		
		bne t2, x0, EXIT1
		j LOOP2
		
	#check if x10 % 400 = 0	
	LOOP2:
		addi t2, zero, 400 	#set t2 to 100
		rem t2, t1, t2		#t2 = x10 % 100
		bne t2, x0, EXIT1
		j LEAP
	
	LEAP:
		addi x10, x0, 1
		j RETURN
		
	NEG:
		addi x10, x0, -1
		j RETURN	
	
	j RETURN
	RETURN:
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point
