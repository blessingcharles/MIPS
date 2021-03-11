.data
	num: .word 14
	float: .float 12.1
	double: .double 12.5543
	str: .asciiz "AAAA"
	char: .byte 'b'
	nextline: .asciiz  "\n"
	
.text 
	
	#ascii
	li $v0, 4
	la  $a0, str
	syscall
	
	jal .newline
	
	#byte
	li $v0, 4
	la  $a0, char
	syscall
	
	#word
	lw $a0, num
	li $v0, 1
	syscall
	
	jal .newline	
	
	#float
	lwc1 $f12, float
	li $v0, 2
	syscall
	
	jal .newline
	
	#double
	ldc1 $f12, double
	li $v0, 3
	syscall
	
	jal .exit
	
	#exit
	.exit:
		addi $v0,$zero,10
		syscall
	
	#print newline
	.newline:
		addi $v0,$zero,4
		la $a0,nextline
		syscall
		jr $ra
