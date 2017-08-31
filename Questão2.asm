	addi $s0, $zero, 5 #a = ...
	addi $s1, $zero, 3 #b = ...
	addi $s3, $zero, 0, #x = 0
	
	slt $t0, $s0, $zero #se a < 0 , t0 = 1
	sgt $t1, $s0, $s1 #se a > b, t1 = 1
	beq $t0, $t1, elseif #se t0 = t1, a < 0 e a > b, vai para else if
	
	volta:
	sgt $t2, $s0, $zero #se a >=0, t2 = 1
	slt $t3, $s0, $s1 #se a < b, t3 = 1
	beq $t2, $t3, if # se t2 = t3 = 1

	addi $s3, $zero, 3 #x = 3
	li $v0, 10 #Encerra
	syscall
			
	elseif:
	beq $t0, $zero, volta #Permanece apenas se t0 = 1, que consequentemente, t1 também será 1, pois só passa para cá se forem iguais
	addi $s3, $zero, 2 #x = 2
	li $v0, 10 #encerra
	syscall
	
	if:
	addi $s3, $zero, 1 #x = 1

	