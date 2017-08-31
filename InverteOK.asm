.data
prompt: .asciiz " Given String is = "
str: .asciiz "aaaaBBBBccccDDDD"
newline: .asciiz "\n"
ans: .asciiz " The String reversed is = " 
.text
.globl main
main:
la      $a0, prompt     #calling opening prompt
li      $v0, 4
syscall
la      $a0, str        #initial string
syscall
la      $a0, newline    #newline
syscall
la      $a0, ans        #initial text for reversed string
syscall
li      $t2, 0
strLen:                 #getting length of string
lb      $t0, str($t2)   #loading value
add     $t2, $t2, 1
bne     $t0, $zero, strLen

li      $v0, 11         #load imediate - print low-level byte
Loop:
sub     $t2, $t2, 1     #this statement is now before the 'load address'
la      $t0, str($t2)   #loading value
lb      $a0, ($t0)
syscall
#This is where the sub statement used to be, which caused the loop to terminate too early
bnez    $t2, Loop
li      $v0, 10              #program done: terminating
syscall