addi $s1, $zero, 1 #Colocando 10 em s1 para testar
addi $s2, $zero, 5 #Colocando 5 em s2 para testar

	slt $t0, $s2, $s1 #Se s2 < s1 , t0 = 1
	bne $t0, $zero, FIM1 #Se t0 == 0
	add $s3, $zero, $s1 # s3 = s1
	add $s4, $zero, $s1 #s4 = s1
SOMA: 
	beq $s4, $s2, FIM2 #Se s4 == s2
	addi $s4, $s4, 1 #s4 += 1
	add $s3, $s3, $s4 #S3+=s4
	j SOMA #repete enquanto s4 for diferente de s2

FIM1:
	addi $v1, $zero, 1 #Colocando 1 em v1
	j FIM2
FIM2:
	li $v0, 1
	move $a0, $s3 
	syscall #Imprimindo para testar
