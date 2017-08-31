.text

main:
	li $a0, 10 #Passo em a0 o fib que eu quero
	jal fib #Chamo a função do fib
	move $a0, $v0 #Após o calculo do fib, passo o que está em v0 para a0, para usar o syscall
	
	li $v0, 1 #Coloco 1 em v0, para que eu printe um inteiro
	syscall #Chamo syscall
	
	li $v0, 10 #Encerrar o programa
	syscall
	

fib:
	#Analisando os casos base
	bgt $a0, 1, fibfunc
	move $v0, $a0 #caso seja <= 1, coloc ele mesmo em v0
	jr $ra
fibfunc:
	sub $sp, $sp, 12 #alocando espaço da pilha, como usamos 3 espaços na pilha, usamos 12 (4 para cada)
	sw $ra, 0($sp) #salvando endereço de retorno (ra)
	
	sw $a0, 4($sp) #salvando n
	add $a0, $a0, -1 #n = n-1
	jal fib #volto para fib
	lw $a0, 4($sp) #pega n
	sw $v0, 8($sp) #salva o valor retornado fib(n-1)
	
	 add $a0, $a0, -2 #n-2 , pois restaura alguns registradores que serão chamados
	 jal fib #volto para fib
	 
	lw $t0, 8($sp) #restaura o retorno do valor de fib(n-1) 
	add $v0, $t0, $v0 #retorna o valor total.

	lw $ra, 0($sp) # restaura $ra
	add $sp, $sp, 12 #destrói a pilha
	jr $ra #volto para o ultimo endereço salvo
