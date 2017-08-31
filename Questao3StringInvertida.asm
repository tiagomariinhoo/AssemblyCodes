.data
 str: .asciiz "abacaTe" #String original
 final: .space 256 #String invertida
 final2: .space 256 #String com os maisculos e minusculos certos
 
 .text
 la $s0, final #final em s0
 la $s1, str #str em s1
 la $t3, str #str em t3
 li $t1,0 #Colocando 0 em t1
 la $t4, str #str em t4

strlen:
lb $t2, ($t3) #Carrega o primeiro byte do endereço em t2
ble $t2, 57, end2
volta:
beqz $t2, fim1 #se t2 == 0 vai para a label final
add $t3, $t3, 1 # Senão, incrementa no endereço
add $t1, $t1, 1 #E incrementa o contador
j strlen #Com esse loop, deixo o ponteiro t3 no final da string

fim1:
subi $t3, $t3, 1 #decremento para voltar ao final da string

 copyString:
 	lb $t0, ($t3) #Lendo o caractere
 	beqz $t0, check #Se t0 ==0, pulo para check
 	sb $t0, 0($s0) #Caso contrário, coloco o byte que eu li em s0, concatenando
 	subi $t3, $t3, 1 #Subtraio o ponteiro da string original
 	addi $s0, $s0, 1 #Adiciono no ponteiro da string que estou concatenando
 	j copyString #loop
  
 check:
 la $s1, str #str em s1
 la $s0, final #final em s0
 la $s5, final2 #final2 em s5
 li $t0, 20000 #20000 em t0
 li $t1, 20000 #20000 em t1
 loop:
 beqz $t0, end #Se t0 == 0, fim
 lb $t0, ($s1) #Carregando o byte que está no começo da string original (carregando o caractere)
 lb $t1, ($s0) #Carregando o byte que está no começo da string invertida (Carregando o caractere)
 bge $t0, 'a', toLower #Se o caractere lido em t0 for maior ou igual que 'a' (minusculo), vai para toLower, lido na string original
 aqui:
 ble $t0, 'Z', toUpper #Se o caracter lido em t0 for menor ou igual a 'Z', vai para toUpper
 aqui2: #Essa parte do código, compara se é maior ou igual que 'a' e menor ou igual que 'Z' pois se o caracter for minusculo e na original foi maiusculo, ele troca, o mesmo para o contrário
 addi $s1, $s1, 1 #Adicionando 1 em s1
 addi $s0, $s0, 1 #Adicionando 1 em s0
 addi $s5, $s5, 1 #Adicionando 1 em S5
 j loop
 
 
 end:
 	li $v0, 4 #Colocando 4 em v0
 	la $a0, final2 #final2 em a0
 	syscall #Imprimindo a string
 	
 	li $v0, 10
 	syscall #Encerrando programa
 
 end2:
 	ble $t2, 48, volta
 	li $v1, 1
 	li $v0, 10
 	syscall
 
 toLower:
 bge $t1, 'a', escreve #Se o que foi lido na string invertida for minusculo, não faz nada
 addi $t1, $t1, 32 #Senão, soma 32 para ficar minusculo.
 sb $t1, 0($s5) #Coloco em s5, o caracter formatado
 j aqui #Volta
 
 toUpper:
 ble $t1, 'Z', escreve2 #Se o que foi lido na string invertida for maiusculo, não faz nada
 subi $t1, $t1, 32 #Caso contrário, subtrai 32 para ficar maiusculo
 sb $t1, 0($s5) #Coloca em s5, o caracter formatado
 j aqui2 #Volta
 
 escreve:
 sb $t1, 0($s5) #Coloca t1 que é o caracter atual, em s5
 j aqui #volta
 
 escreve2:
 sb $t1, 0 ($s5) #Coloca t1 que é o caracter atual, em s5
 j aqui2 #volta
 
