
	li $s0, 2 #a = 2
	li $s1, 1 #b = 1
	li $s3, 0 #m = 0
	
	move $s3, $s0 #m = a
	
	slt $t0, $s1, $s3 #Se b < m, t0 = 1
	bne $t0, $zero, if #Se t0 != 0, vai para o if
	
	addi $s3, $zero, 0 #s3 = 0
	li $v0, 10 #termina o programa
	syscall
	
	if:
	move $s3, $s1 #Se b < m , m = b
	