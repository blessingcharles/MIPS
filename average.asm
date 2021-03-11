.data
	arr:      .space 80 	#maximum 20 elements mem allocation
	length:      .space 4 		#size of arr  given by user
	sum:	 	.space 4		#total sum
	average:	.space 4
	prompt1:	.asciiz  "ENTER NO OF ELEMENTS : "
	message: 	 .asciiz "ENTER A NUMBER : "
	nextline:	 .asciiz "\n"
	
.text
	
	main:
		la $a0,prompt1		# get arr length
		jal printmsg
		jal getint
		######	get array inputs  #######
		add $t1,$zero,$v0	# t1 contains len of arr
		la $t0,arr		# t0 contains &arr 
		la $a0,message	# a0 contains &msg
		jal getarray		# getarray function call
		
		la $t0,arr 				# t0 points to &arr
		xor $t2,$t2,$t2
		xor $s0,$s0,$s0
		jal newline		
		sumloop:
			lw $t3,($t0)                          # move value into t3 
			add $s0,$s0,$t3			# s0 contains sum of all
			
			addi $t2,$t2,1			# incr the counter
			addi $t0,$t0,4			#inc the index
			
			blt $t2,$t1,sumloop		# counter < len
			
		sw $s0,sum				# saving the total sum
		div $s1,$s0,$t1				# s1 average = sum / len
		
		sw $s1,average				#storing the avg	
		
		jal newline
		addi $v0,$zero,1				#printing the avg
		add $a0,$zero,$s1
		syscall		
		
		jal exit 		#exit the program
		
	#getarray input [  before calling set t0 = &arr , t1 = len arr , a0 = &message ]
	getarray:
		xor $t2,$t2,$t2		# t2 acts as counter set to 0
		move $t7,$ra		# storing the return adress in t7
				
		inputloop:
			la $a0,($a0)       	#get arr inputs recursively
			jal printmsg
			jal getint
			sw $v0,($t0)		#storing the value
			addi $t0,$t0,4		# inc the index of arr
			
			addi $t2,$t2,1		#increment the counter
			blt $t2,$t1,inputloop		
		
		add $ra,$t7,$zero		# moving return address to ra
		jr $ra					# return to caller
	
	#get a integer and store in $v0
	getint:
		addi $v0,$zero,5
		syscall
		jr $ra
		
	#print string from addr in $a0	
	printmsg:
		addi $v0,$zero,4
		la $a0,($a0)
		syscall
		jr $ra
		
	#print newline
	newline:
		addi $v0,$zero,4
		la $a0,nextline
		syscall
		jr $ra
		
	#exit function
	exit:
		addi $v0,$zero,10
		syscall
		