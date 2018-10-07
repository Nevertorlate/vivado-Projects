j L0
L4:
addi $29, $29, 4
sw $4, 0($29)
or $4, $0, $6


L2:
slt $1, $7, $4
bne $1, $0, L1
sb $5, 0($4)
add $4, $4, $8
beq $0, $0, L2


L1:
lw $4, 0($29)
addi $1, $0, 4
sub $29, $29, $1
jr $15




L6:
addi $29, $29, 4
sw $4, 0($29)
addi $29, $29, 4
sw $6, 0($29)
addi $29, $29, 4 
sw $7, 0($29) 
addi $29, $29, 4 
sw $8, 0($29) 
addi $29, $29, 4 
sw $15, 0($29) 
sub $4, $11, $9 
ori $8, $0, 0x1 
or $6, $0, $9 


L5:
slt $1, $12, $6 
bne $1, $0, L3 
add $7, $6, $4 
jal L4 
addi $6, $6, 28 
beq $0, $0, L5 




L3://图案向下
lw $15, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $8, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $7, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $6, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $4, 0($29)
addi $1, $0, 4
sub $29, $29, $1
jr $15


L8://图案向右
addi $29, $29, 4
sw $6, 0($29)
addi $29, $29, 4
sw $7, 0($29)
addi $29, $29, 4
sw $8, 0($29)
addi $29, $29, 4
sw $15, 0($29)//从regfile向ram搬数据
ori $8, $0, 0x1
or $6, $0, $9
or $7, $0, $11
jal L4
or $6, $0, $10
or $7, $0, $12
jal L4
ori $8, $0, 0x28
or $6, $0, $9
or $7, $0, $10
jal L4
or $6, $0, $11
or $7, $0, $12
jal L4
lw $15, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $8, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $7, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $6, 0($29)
addi $1, $0, 4
sub $29, $29, $1
jr $15 
addi $29, $29, 4
sw $15, 0($29)
addi $29, $29, 4
sw $5, 0($29)
addi $29, $29, 4
sw $9, 0($29)
addi $29, $29, 4
sw $10, 0($29)
addi $29, $29, 4
sw $11, 0($29)
addi $29, $29, 4
sw $12, 0($29)
ori $5, $0, 0x78
ori $9, $0, 0x400
ori $10, $0, 0x888
ori $11, $0, 0x427
ori $12, $0, 0x8af
jal L6
lw $12, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $11, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $10, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $9, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $5, 0($29)
addi $1, $0, 4
sub $29, $29, $1
lw $15, 0($29)
addi $1, $0, 4
sub $29, $29, $1
jr $15 





L14:
addi $29, $29, 4
sw $15, 0($29)
addi $29, $29, 4 
sw $6, 0($29) 
addi $29, $29, 4 
sw $7, 0($29) 
addi $29, $29, 4 
sw $8, 0($29) 
ori $8, $0, 0x28 
ori $6, $0, 0x480 
ori $7, $0, 0x818 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x487 
ori $7, $0, 0x81f 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x488 
ori $7, $0, 0x820 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x48f 
ori $7, $0, 0x827 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x490 
ori $7, $0, 0x828 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x497 
ori $7, $0, 0x82f 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $8, $0, 0x1 
ori $6, $0, 0x480 
ori $7, $0, 0x497 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x598 
ori $7, $0, 0x5af 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x5c0 
ori $7, $0, 0x5d7 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x6d8 
ori $7, $0, 0x6ef 
jal L4 //判断当前这是否存在三个在同一行同一列或者对角的情况
ori $6, $0, 0x700 
ori $7, $0, 0x717 
jal L4 
ori $6, $0, 0x818 
ori $7, $0, 0x82f 
jal L4 
lw $8, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $7, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $6, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $15, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
jr $15 



L15:
addi $29, $29, 4 
sw $15, 0($29) 
addi $29, $29, 4 
sw $6, 0($29) 
addi $29, $29, 4 
sw $9, 0($29) 
addi $29, $29, 4 
sw $10, 0($29) 
addi $29, $29, 4 
sw $11, 0($29) 
addi $29, $29, 4 
sw $12, 0($29) 
ori $9, $0, 0x4a9 
L10:
addi $1, $0, 2 
slt $1, $1, $6 
bne $1, $0, L7 
addi $1, $0, 8 
add $9, $9, $6 
addi $11, $9, 5 
addi $10, $9, c8 
addi $12, $9, cd 
jal L8 
j L9 





L7:
addi $1, $0, 3 
sub $6, $6, $1 
addi $9, $9, 140 
beq $0, $0, L10 






































L9:
lw $12, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $11, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $10, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $9, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $6, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $15, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
jr $15 


L25:
addi $29, $29, 4 
sw $15, 0($29) 
addi $29, $29, 4 
sw $6, 0($29) 
addi $29, $29, 4 
sw $9, 0($29) 
addi $29, $29, 4 
sw $10, 0($29) 
addi $29, $29, 4 
sw $11, 0($29) 
addi $29, $29, 4 
sw $12, 0($29) 
ori $9, $0, 0x4d2 




L13:
addi $1, $0, 2 
slt $1, $1, $6 
bne $1, $0, L11 
addi $1, $0, 8  
add $9, $9, $6 
addi $11, $9, 3 
addi $12, $9, 7b 
jal L6 
j L12 



L11:
addi $1, $0, 3 
sub $6, $6, $1 
addi $9, $9, 140 
beq $0, $0, L13 



L12:
lw $12, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $11, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $10, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $9, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $6, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $15, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
jr $15 



L0:
ori $29, $29, 0x200 
ori $5, $0, 0x34 
ori $9, $0, 0x457 
ori $10, $0, 0x83f 
ori $11, $0, 0x470 
ori $12, $0, 0x858 
jal L8 
ori $5, $0, 0x76 
ori $9, $0, 0x480 
ori $11, $0, 0x497 
ori $12, $0, 0x82f 
jal L6 
ori $5, $0, 0x2b 
jal L14 
ori $6, $0, 0x0 
sb $6, 257($0) 
sb $6, 258($0) 
sb $6, 259($0) 
sb $6, 260($0) 
sb $6, 261($0) 
sb $6, 262($0) 
sb $6, 263($0) 
sb $6, 264($0) 
sb $6, 265($0) 
sb $6, 266($0) 
sb $6, 267($0) 
ori $t6, $0, 0x1 
sb $t6, 268($0) 
ori $5, $5, 0xff 
ori $6, $0, 0x0 
jal L15 
ori $6, $0, 0x1 
jal L15 
ori $6, $0, 0x2 
jal L15 
ori $6, $0, 0x3 
jal L15 
ori $6, $0, 0x4 
jal L15 
ori $6, $0, 0x5 
jal L15 
ori $6, $0, 0x6 
jal L15 
ori $6, $0, 0x7 
jal L15 
ori $6, $0, 0x8 
jal L15 
ori $6, $0, 0x0 




L16:
lw $t7, 4096($0) 
addi $1, $0, 0 
beq $1, $t7, L16 
or $s0, $0, $t7 




L17:
lw $t7, 4096($0) 
addi $1, $0, 0 
bne $1, $t7, L17 
ori $5, $0, 0xff 
jal L15 
addi $1, $0, 2 
beq $1, $s0, L18 
addi $1, $0, 3 
beq $1, $s0, L19 
addi $1, $0, 4 
beq $1, $s0, L20 
addi $1, $0, 5 
beq $1, $s0, L21 
addi $1, $0, 1 
beq $1, $s0, L22 




L18:
addi $1, $0, 0 
beq $1, $6, L23 
addi $1, $0, 1 
beq $1, $6, L23 
addi $1, $0, 2 
beq $1, $6, L23 
addi $1, $0, 3 
sub $6, $6, $1 
beq $0, $0, L23 




L19:
addi $1, $0, 0 
beq $1, $6, L23 
addi $1, $0, 3 
beq $1, $6, L23 
addi $1, $0, 6 
beq $1, $6, L23 
addi $1, $0, 1 
sub $6, $6, $1 
beq $0, $0, L23 


L20:
addi $1, $0, 6 
beq $1, $6, L23 
addi $1, $0, 7 
beq $1, $6, L23 
addi $1, $0, 8 
beq $1, $6, L23 
addi $6, $6, 3 
beq $0, $0, L23 



L21:
addi $1, $0, 2 
beq $1, $6, L23 
addi $1, $0, 5 
beq $1, $6, L23 
addi $1, $0, 8 
beq $1, $6, L23 
addi $6, $6, 1 
beq $0, $0, L23 



L23:
ori $5, $0, 0xb5 
jal L15 
beq $0, $0, L16 



L22:
lb $s1, 259($6) 
nop
nop
addi $1, $0, 0 
bne $1, $s1, L23 
addi $1, $0, 2 
bne $1, $t6, L24 
ori $5, $0, 0x38 
sb $t6, 259($6) 
ori $t6, $0, 0x1 
jal L25 
nop
jal L26 
beq $0, $0, L23 



L24:
ori $5, $0, 0xda 
sb $t6, 259($6) 
ori $t6, $0, 0x2 
jal L25 
nop
jal L26 
beq $0, $0, L23 









L26:
addi $29, $29, 4 
sw $15, 0($29) 
addi $29, $29, 4 
sw $5, 0($29) 
addi $29, $29, 4 
sw $6, 0($29) 
addi $29, $29, 4 
sw $7, 0($29) 
ori $7, $0, 0x1 
ori $5, $0, 0x0 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x1 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x2 
lb $6, 259($5) 
nop
nop
addi $1, $0, 1 
beq $1, $7, L27 
addi $1, $0, 8 
beq $1, $7, L28 
ori $7, $0, 0x1 
ori $5, $0, 0x3 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x4 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x5 
lb $6, 259($5) 
nop
sll $0,$0,0x0
addi $1, $0, 1
beq $1, $7, L27
addi $1, $0, 8
beq $1, $7, L28 
ori $7, $0, 0x1 
ori $5, $0, 0x6 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x7 
lb $6, 259($5) 
nop
nop 
ori $5, $0, 0x8 
lb $6, 259($5) 
nop
nop
addi $1, $0, 1 
beq $1, $7, L27 
addi $1, $0, 8 
beq $1, $7, L28 
ori $7, $0, 0x1 
ori $5, $0, 0x0 
lb $6, 259($5) 
nop
nop 
ori $5, $0, 0x3 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x6 
lb $6, 259($5) 
nop
nop
addi $1, $0, 1 
beq $1, $7, L27 
addi $1, $0, 8 
beq $1, $7, L28 
ori $7, $0, 0x1 
ori $5, $0, 0x1 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x4 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x7 
lb $6, 259($5) 
nop
nop
addi $1, $0, 1 
beq $1, $7, L27 
addi $1, $0, 8 
beq $1, $7, L28 
ori $7, $0, 0x1 
ori $5, $0, 0x3 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x5 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x8 
lb $6, 259($5) 
nop
nop
addi $1, $0, 1 
beq $1, $7, L27 
addi $1, $0, 8 
beq $1, $7, L28 
ori $7, $0, 0x1 
ori $5, $0, 0x0 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x4 
lb $6, 259($5) 
nop
nop 
ori $5, $0, 0x8 
lb $6, 259($5) 
nop
nop
addi $1, $0, 1 
beq $1, $7, L27 
addi $1, $0, 8 
beq $1, $7, L28 
ori $7, $0, 0x1 
ori $5, $0, 0x2 
lb $6, 259($5) 
nop
nop 
ori $5, $0, 0x4 
lb $6, 259($5) 
nop
nop
ori $5, $0, 0x6 
lb $6, 259($5) 
nop
nop
addi $1, $0, 1 
beq $1, $7, L27 
addi $1, $0, 8 
beq $1, $7, L28 
ori $5, $0, 0x0 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
ori $5, $0, 0x1 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
ori $5, $0, 0x2 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
ori $5, $0, 0x3 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
ori $5, $0, 0x4 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
ori $5, $0, 0x5 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
ori $5, $0, 0x6 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
ori $5, $0, 0x7 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
ori $5, $0, 0x8 
lb $6, 259($5) 
nop
nop
addi $1, $0, 0 
beq $1, $6, L29 
beq $0, $0, L30 



L29:
lw $7, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $6, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $5, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
lw $15, 0($29) 
addi $1, $0, 4 
sub $29, $29, $1 
jr $15 


L27:
ori $6, $0, 0x1 
beq $0, $0, L31 


L28:
ori $6, $0, 0x2 
beq $0, $0, L31 


L31:
addi $1, $0, 2 
beq $1, $6, L32 
ori $5, $0, 0xb5 
beq $0, $0, L33 


L32:
ori $5, $0, 0x38 
L33:
ori $6, $0, 0x0 
jal L25 
ori $6, $0, 0x1 
jal L25 
ori $6, $0, 0x2 
jal L25 
ori $6, $0, 0x3 
jal L25 
ori $6, $0, 0x4 
jal L25 
ori $6, $0, 0x5 
jal L25 
ori $6, $0, 0x6 
jal L25 
ori $6, $0, 0x7 
jal L25 
ori $6, $0, 0x8 
jal L25 


L30:
lw $t7, 4096($0) 
addi $1, $0, 0 
beq $1, $t7, L30 
or $s0, $0, $t7 


L34:
lw $t7, 4096($0) 
addi $1, $0, 0 
bne $1, $t7, L34 
j L0 