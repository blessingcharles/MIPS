.data
	str: .asciiz "enter :"
	nextline: .asciiz  "\n"
	input: .space  20
	
	
.text

	.main
	 
	
		
		la $a0,str
		jal .printstring
		
		 
		la $a0,input
		li $a1,20
		jal .getstring

		la $a0,input
		jal .printstring
		
		jal .exit
		

	
	#get input from the user and store in $v0
	.getstring:
		addi $v0,$zero,8
		la $a0,($a0)
		la $a1,($a1)
		syscall
		
		jr $ra
		
	#print the string from the address in $a0
	.printstring:
		addi $v0,$zero,4
		la $a0,($a0)
		syscall
		
		jr $ra
	
	#print newline
	.newline:
		addi $v0,$zero,4
		la $a0,nextline
		syscall
		jr $ra
	# exit the program	
	.exit:
		addi $v0,$zero,10
		syscall
