.data
str: .asciiz "abc"
str2: .asciiz "123"
str3: .asciiz "aeae"
result: .space 200
.text
main:
	la $a0, str
	move $s0, $a0
	move $s1, $s0
	jal strlen
	subi $s0, $s0, 1
	jal print
	jal strcpy
	jal end

strlen:
	addi $t0, $zero, 0
loop: 
	lb $t1, ($s0)
	beqz $t1, end1
	addi $s0, $s0, 1
	addi $t0, $t0, 1
	j loop
	
strcpy:
	addi $t1, $zero, 0
	subi $t3, $t0, 1 #tamnho = tam - 1
loop2:
	lb $s2, ($s0)
	beq $t3,$zero, end
	sb $s2, ($s1)
	subi $s0, $s0, 1
	subi $t3, $t3, 1
	addi $s2, $s2, 1
	j loop2
		
end1:
jr $ra

print:
	li $v0, 4
	move $a0, $s1
	syscall
jr $ra

end:
	li $v0, 1
	move $a0, $t0
	syscall

	
	li $v0, 4
	move $a0, $s2
	syscall