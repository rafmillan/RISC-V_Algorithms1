# Declare the listed label(s) as global to enable referencing from other files
# Use the following names for the function
# problem 1: lpyear
# problem 2: gcd
# problem 3: npnum
# problem 4: palin

.globl palin

palin:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	mv t1, x10
	
	#number, needed for math
	addi s0, x0, 7
	
	#num bits shifted
	addi s1, x0, 0
	#1
	addi s4, x0, 1
	
	#check if any inptus are 0
	beq t1, x0, NEG
	
       	li t0, 0x0000000f #mask out LSB
       	
       	#check for single digit input
       	ble t1, t0, TRUE
	
	li t2, 0xf0000000 #mask out MSB
	j START
	
	START:	and a3, t1, t2
		beq a3, x0, ZERO
		j LOOP
		
	LOOP: 	and a2, t2, t1	#get MSB
		and a1, t0, t1	#get LSB
		
		sub s2, s0, s1
		slli s2, s2, 2
		srl a2, a2, s2 
		
		bne a1, a2, END	#check if theyre the same
		sub s3, s0, s1
		
		# check if s0-s1 == 1, then @ middle of even digit hex
		beq s3, s4, MID
		
		#check if s0-s1 == 0, then @ middle of odd digit hex
		beq s3, x0, MID
		
		j SHIFT
		
	NEG:	addi x10, x0, -1
		j RETURN
	ZERO:	srli t2, t2, 4 #shift till not zero
		addi, s1, s1, 1 #increast shift cnt
		j START
		
	SHIFT:	
		srli t2, t2, 4 #shift left mask
		slli t0, t0, 4 #shift right mask
		addi s0, s0, -1
		addi s1, s1, 1 #increast shift cnt
		j LOOP
		
	MID:	beq a1, a2, TRUE
		j END
	
	TRUE: 	addi x10, x0, 1
		j RETURN
	
	END: 	addi x10, x0, 0
		j RETURN
		
	
	RETURN:
	#clear used registers
	addi t0, x0, 0
	addi t1, x0, 0
	addi t2, x0, 0
	addi s0, x0, 0
	addi s1, x0, 0
	addi s2, x0, 0
	addi a4, x0, 0
	addi a3, x0, 0
	addi a2, x0, 0
	addi a1, x0, 0
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point
