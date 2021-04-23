.text
# macro to terminate the simualtion
.macro exit ()
.text
li a7,10
ecall
.end_macro

# macro to print a integer value
.macro print_int (%reg)
.text
li a7,1
add x10, %reg, x0 
ecall
.end_macro

# marco to print a hexadecimal value
.macro print_hex (%reg)
.text
li a7,34
add x10, %reg, x0 
ecall
.end_macro

# macro to print a string
.macro print_str (%str)
.data
str_label: .string %str
.text
li a7, 4
la x10, str_label
ecall
.end_macro


.globl main
main: 

	# to test example function
	print_str("Output of example function\n")
	li x10, 250 # pass inputs
	li x11, -2
	call average
	mv t0, a0
	print_str("Value stored in x10:")
	print_int(t0)


# Use the following labels for functions
	# problem 1: lpyear
	# problem 2: gcd
	# problem 3: npnum
	# problem 4: palin
		
	# to test lpyear function
	print_str("\nOutput of lpyear function\n")
	li x10, 2001 # pass inputs
	call lpyear
	mv t0, a0
	print_str("Value stored in x10:")
	print_int(t0)

	print_str("\nOutput of gcd function\n")
	li x10, 250 # pass inputs
	li x11, 100
	call gcd
	mv t0, a0
	print_str("Value stored in x10:")
	print_int(t0)

	# to test npnum function
	print_str("\nOutput of npnum function\n")
	li x10, 5
	call npnum
	mv t0, a0
	print_str("Value stored in x10:")
	print_int(t0)

	# to test palin function
	print_str("\nOutput of palin function\n")
	li x10, 0x22 # pass inputs
	call palin
	mv t0, a0
	print_str("Value stored in x10: ")
	print_int(t0)

	exit()



	
