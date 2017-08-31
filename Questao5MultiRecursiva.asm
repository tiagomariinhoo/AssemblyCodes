.data
var1: .word 3 #Primeiro valor
var2: .word 5 #Segundo valor
var3: .space 256 #valor final na memoria

.text
lw $t0, var1 #Coloco t0 = var1
lw $t1, var2 #t1 = var2

slt $t3, $t0, $zero #Se t0 < 0
slt $t4, $t1, $zero #Se t1 < 0

abs $t0, $t0 #Passando os valores absolutos pra função de multiplicar
abs $t1, $t1 

addi $s1, $zero, 0 #S1 = 0
addi $s2, $zero, 0 #s1 e s2 = 0

multiplicação:
beq $s2, $t1, FIM #Se s2=t1, pula para o fim

addi $s2, $s2, 1 #s2++
add $s1, $s1, $t0 #s1 += t0

j multiplicação

FIM : 

bne $t3, $t4,FIM2 #t3 != t4

sw $s1, var3 #var3 em s1
li $v0, 1 
move $a0, $s1 #Para printar o inteiro que está em s1
syscall

li $v0, 10
syscall #Encerra

FIM2 : #Para caso um dos valores seja negativo, o resultado dá negativo

sub $s1, $zero, $s1 #subtrai s1 dele mesmo

sw $s1, var3 #var 3 em s1

li $v0, 1
move $a0, $s1 #Printa o inteiro
syscall
