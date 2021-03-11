.data
	string:	.asciiz "Enter temperature in Celsius: "
	msg:		.asciiz "The temperature in Fahrenheit is "
	newline:	.asciiz "\n"

	#arithmetic implementation for convering celsius to fahreheit
	
.text
        
	.main:               

        la $a0,string
        li $v0,4        # system call to print
        syscall         # out a string

        li $v0,5	# syscall 5 reads an integer
        syscall         

	mul $t0,$v0,9 	# to convert, multiply by 9,
	div $t0,$t0,5 	# divide by 5, then
	addi $t0,$t0,32  # add 32

	la $a0,msg	# print string before result
	li $v0,4
	syscall 

	move $a0,$t0	# print result
	li $v0,1
	syscall

	la $a0,newline	# syscal to print out
	li $v0,4	# a new line
	syscall 

	li $v0,10
	syscall		

	   

