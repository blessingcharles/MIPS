#logical operations
.data 
	a: .word 10
	c: .word 2
	d: .word 0
	msg1: .asciiz "And operation:"
	msg2: .asciiz "\nAnd immediate operation:"
	msg3: .asciiz "\nOr operation:"
	msg4: .asciiz "\nOr immediate operation:"
	msg5: .asciiz "\nXOR operation:"
	msg6: .asciiz "\nXOR immediate operation:"
	msg7: .asciiz "\nNot operation:"
	msg8: .asciiz "\nShift left logical:"
	msg9: .asciiz "\nShift left logical(variable):"
	msg10: .asciiz "\nShift right logical:"
	msg11: .asciiz "\nShift right logical(variable):"
	msg12: .asciiz "\nShift right arithmetic:"
.text
.globl main
main:
	lw $t1,a
	lw $t2,c
	
	and $t0,$t1,$t2
	andi $t3,$t1,3
	or $t4,$t1,$t2
	ori $t5,$t1,3
	
	li $v0,4
	la $a0,msg1
	syscall
	
	li $v0,1
	la $a0,($t0)
	syscall 
	
	li $v0,4
	la $a0,msg2
	syscall
	
	li $v0,1
	la $a0,($t3)
	syscall 
	
	li $v0,4
	la $a0,msg3
	syscall
	
	li $v0,1
	la $a0,($t4)
	syscall 
	
	li $v0,4
	la $a0,msg4
	syscall
	
	li $v0,1
	la $a0,($t5)
	syscall 
	
	xor $t0,$t1,$t2
	xori $t3,$t1,10
	not $t4,$t1
	
	li $v0,4
	la $a0,msg5
	syscall
	
	li $v0,1
	la $a0,($t0)
	syscall 
	
	li $v0,4
	la $a0,msg6
	syscall
	
	li $v0,1
	la $a0,($t3)
	syscall 
	
	li $v0,4
	la $a0,msg7
	syscall
	
	li $v0,1
	la $a0,($t4)
	syscall 
	
	sll $t0,$t1,3
	sllv $t3,$t1,$t2
	srl $t4,$t1,3
	srlv $t5,$t1,$t2
	sra $t6,$t1,2
	
	li $v0,4
	la $a0,msg8
	syscall
	
	li $v0,1
	la $a0,($t0)
	syscall 
	
	li $v0,4
	la $a0,msg9
	syscall
	
	li $v0,1
	la $a0,($t3)
	syscall 
	
	li $v0,4
	la $a0,msg10
	syscall
	
	li $v0,1
	la $a0,($t4)
	syscall 
	
	li $v0,4
	la $a0,msg11
	syscall
	
	li $v0,1
	la $a0,($t5)
	syscall 
	
	li $v0,4
	la $a0,msg12
	syscall
	
	li $v0,1
	la $a0,($t6)
	syscall