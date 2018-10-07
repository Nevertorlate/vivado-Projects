j L0
L4:
addi $sp, $sp, 4
sw $a0, 0($sp)
or $a0, $zero, $a2
L2:
slt $at, $a3, $a0
bne $at, $zero, L1
sb $a1, 0($a0)
add $a0, $a0, $t0
beq $zero, $zero, L2
L1:
lw $a0, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
jr $ra
L6:
addi $sp, $sp, 4
sw $a0, 0($sp)
addi $sp, $sp, 4
sw $a2, 0($sp)
addi $sp, $sp, 4
sw $a3, 0($sp)
addi $sp, $sp, 4
sw $t0, 0($sp)
addi $sp, $sp, 4
sw $ra, 0($sp)
sub $a0, $t3, $t1
ori $t0, $zero, 0x1
or $a2, $zero, $t1
L5:
slt $at, $t4, $a2
bne $at, $zero, L3
add $a3, $a2, $a0
jal L4
addi $a2, $a2, 28
beq $zero, $zero, L5
L3:
lw $ra, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t0, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a3, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a0, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
jr $ra
L8:
addi $sp, $sp, 4
sw $a2, 0($sp)
addi $sp, $sp, 4
sw $a3, 0($sp)
addi $sp, $sp, 4
sw $t0, 0($sp)
addi $sp, $sp, 4
sw $ra, 0($sp)
ori $t0, $zero, 0x1
or $a2, $zero, $t1
or $a3, $zero, $t3
jal L4
or $a2, $zero, $t2
or $a3, $zero, $t4
jal L4
ori $t0, $zero, 0x28
or $a2, $zero, $t1
or $a3, $zero, $t2
jal L4
or $a2, $zero, $t3
or $a3, $zero, $t4
jal L4
lw $ra, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t0, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a3, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
jr $ra
addi $sp, $sp, 4
sw $ra, 0($sp)
addi $sp, $sp, 4
sw $a1, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($sp)
addi $sp, $sp, 4
sw $t2, 0($sp)
addi $sp, $sp, 4
sw $t3, 0($sp)
addi $sp, $sp, 4
sw $t4, 0($sp)
ori $a1, $zero, 0x78
ori $t1, $zero, 0x400
ori $t2, $zero, 0x888
ori $t3, $zero, 0x427
ori $t4, $zero, 0x8af
jal L6
lw $t4, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t3, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t1, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a1, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $ra, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
jr $ra
L14:
addi $sp, $sp, 4
sw $ra, 0($sp)
addi $sp, $sp, 4
sw $a2, 0($sp)
addi $sp, $sp, 4
sw $a3, 0($sp)
addi $sp, $sp, 4
sw $t0, 0($sp)
ori $t0, $zero, 0x28
ori $a2, $zero, 0x480
ori $a3, $zero, 0x818
jal L4
ori $a2, $zero, 0x487
ori $a3, $zero, 0x81f
jal L4
ori $a2, $zero, 0x488
ori $a3, $zero, 0x820
jal L4
ori $a2, $zero, 0x48f
ori $a3, $zero, 0x827
jal L4
ori $a2, $zero, 0x490
ori $a3, $zero, 0x828
jal L4
ori $a2, $zero, 0x497
ori $a3, $zero, 0x82f
jal L4
ori $t0, $zero, 0x1
ori $a2, $zero, 0x480
ori $a3, $zero, 0x497
jal L4
ori $a2, $zero, 0x598
ori $a3, $zero, 0x5af
jal L4
ori $a2, $zero, 0x5c0
ori $a3, $zero, 0x5d7
jal L4
ori $a2, $zero, 0x6d8
ori $a3, $zero, 0x6ef
jal L4
ori $a2, $zero, 0x700
ori $a3, $zero, 0x717
jal L4
ori $a2, $zero, 0x818
ori $a3, $zero, 0x82f
jal L4
lw $t0, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a3, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $ra, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
jr $ra
L15:
addi $sp, $sp, 4
sw $ra, 0($sp)
addi $sp, $sp, 4
sw $a2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($sp)
addi $sp, $sp, 4
sw $t2, 0($sp)
addi $sp, $sp, 4
sw $t3, 0($sp)
addi $sp, $sp, 4
sw $t4, 0($sp)
ori $t1, $zero, 0x4a9
L10:
addi $at, $zero, 2
slt $at, $at, $a2
bne $at, $zero, L7
addi $at, $zero, 8

add $t1, $t1, $a2
addi $t3, $t1, 5
addi $t2, $t1, 0xc8
addi $t4, $t1, 0xcd
jal L8
j L9
L7:
addi $at, $zero, 3
sub $a2, $a2, $at
addi $t1, $t1, 140
beq $zero, $zero, L10
L9:
lw $t4, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t3, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t1, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $ra, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
jr $ra
L25:
addi $sp, $sp, 4
sw $ra, 0($sp)
addi $sp, $sp, 4
sw $a2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($sp)
addi $sp, $sp, 4
sw $t2, 0($sp)
addi $sp, $sp, 4
sw $t3, 0($sp)
addi $sp, $sp, 4
sw $t4, 0($sp)
ori $t1, $zero, 0x4d2
L13:
addi $at, $zero, 2
slt $at, $at, $a2
bne $at, $zero, L11
addi $at, $zero, 8

add $t1, $t1, $a2
addi $t3, $t1, 3
addi $t4, $t1, 0x7b
jal L6
j L12
L11:
addi $at, $zero, 3
sub $a2, $a2, $at
addi $t1, $t1, 140
beq $zero, $zero, L13
L12:
lw $t4, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t3, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $t1, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $ra, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
jr $ra
L0:
ori $sp, $sp, 0x200
ori $a1, $zero, 0x34
ori $t1, $zero, 0x457
ori $t2, $zero, 0x83f
ori $t3, $zero, 0x470
ori $t4, $zero, 0x858
jal L8
ori $a1, $zero, 0x76
ori $t1, $zero, 0x480
ori $t3, $zero, 0x497
ori $t4, $zero, 0x82f
jal L6
ori $a1, $zero, 0x2b
jal L14
ori $a2, $zero, 0x0
sb $a2, 257($zero)
sb $a2, 258($zero)
sb $a2, 259($zero)
sb $a2, 260($zero)
sb $a2, 261($zero)
sb $a2, 262($zero)
sb $a2, 263($zero)
sb $a2, 264($zero)
sb $a2, 265($zero)
sb $a2, 266($zero)
sb $a2, 267($zero)
ori $t6, $zero, 0x1
sb $t6, 268($zero)
ori $a1, $a1, 0xff
ori $a2, $zero, 0x0
jal L15
ori $a2, $zero, 0x1
jal L15
ori $a2, $zero, 0x2
jal L15
ori $a2, $zero, 0x3
jal L15
ori $a2, $zero, 0x4
jal L15
ori $a2, $zero, 0x5
jal L15
ori $a2, $zero, 0x6
jal L15
ori $a2, $zero, 0x7
jal L15
ori $a2, $zero, 0x8
jal L15
ori $a2, $zero, 0x0
L16:
lw $t7, 4096($zero)
addi $at, $zero, 0
beq $at, $t7, L16
or $s0, $zero, $t7
L17:
lw $t7, 4096($zero)
addi $at, $zero, 0
bne $at, $t7, L17
ori $a1, $zero, 0xff
jal L15
addi $at, $zero, 2
beq $at, $s0, L18
addi $at, $zero, 3
beq $at, $s0, L19
addi $at, $zero, 4
beq $at, $s0, L20
addi $at, $zero, 5
beq $at, $s0, L21
addi $at, $zero, 1
beq $at, $s0, L22
L18:
addi $at, $zero, 0
beq $at, $a2, L23
addi $at, $zero, 1
beq $at, $a2, L23
addi $at, $zero, 2
beq $at, $a2, L23
addi $at, $zero, 3
sub $a2, $a2, $at
beq $zero, $zero, L23
L19:
addi $at, $zero, 0
beq $at, $a2, L23
addi $at, $zero, 3
beq $at, $a2, L23
addi $at, $zero, 6
beq $at, $a2, L23
addi $at, $zero, 1
sub $a2, $a2, $at
beq $zero, $zero, L23
L20:
addi $at, $zero, 6
beq $at, $a2, L23
addi $at, $zero, 7
beq $at, $a2, L23
addi $at, $zero, 8
beq $at, $a2, L23
addi $a2, $a2, 3
beq $zero, $zero, L23
L21:
addi $at, $zero, 2
beq $at, $a2, L23
addi $at, $zero, 5
beq $at, $a2, L23
addi $at, $zero, 8
beq $at, $a2, L23
addi $a2, $a2, 1
beq $zero, $zero, L23
L23:
ori $a1, $zero, 0xb5
jal L15
beq $zero, $zero, L16
L22:
lb $s1, 259($a2)
nop
nop
addi $at, $zero, 0
bne $at, $s1, L23
addi $at, $zero, 2
bne $at, $t6, L24
ori $a1, $zero, 0x38
sb $t6, 259($a2)
ori $t6, $zero, 0x1
jal L25
nop
jal L26
beq $zero, $zero, L23
L24:
ori $a1, $zero, 0xda
sb $t6, 259($a2)
ori $t6, $zero, 0x2
jal L25
nop
jal L26
beq $zero, $zero, L23
L26:
addi $sp, $sp, 4
sw $ra, 0($sp)
addi $sp, $sp, 4
sw $a1, 0($sp)
addi $sp, $sp, 4
sw $a2, 0($sp)
addi $sp, $sp, 4
sw $a3, 0($sp)
ori $a3, $zero, 0x1
ori $a1, $zero, 0x0
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x1
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x2
lb $a2, 259($a1)
nop
nop

addi $at, $zero, 1
beq $at, $a3, L27
addi $at, $zero, 8
beq $at, $a3, L28
ori $a3, $zero, 0x1
ori $a1, $zero, 0x3
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x4
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x5
lb $a2, 259($a1)
nop
nop

addi $at, $zero, 1
beq $at, $a3, L27
addi $at, $zero, 8
beq $at, $a3, L28
ori $a3, $zero, 0x1
ori $a1, $zero, 0x6
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x7
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x8
lb $a2, 259($a1)
nop
nop

addi $at, $zero, 1
beq $at, $a3, L27
addi $at, $zero, 8
beq $at, $a3, L28
ori $a3, $zero, 0x1
ori $a1, $zero, 0x0
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x3
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x6
lb $a2, 259($a1)
nop
nop

addi $at, $zero, 1
beq $at, $a3, L27
addi $at, $zero, 8
beq $at, $a3, L28
ori $a3, $zero, 0x1
ori $a1, $zero, 0x1
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x4
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x7
lb $a2, 259($a1)
nop
nop

addi $at, $zero, 1
beq $at, $a3, L27
addi $at, $zero, 8
beq $at, $a3, L28
ori $a3, $zero, 0x1
ori $a1, $zero, 0x3
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x5
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x8
lb $a2, 259($a1)
nop
nop

addi $at, $zero, 1
beq $at, $a3, L27
addi $at, $zero, 8
beq $at, $a3, L28
ori $a3, $zero, 0x1
ori $a1, $zero, 0x0
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x4
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x8
lb $a2, 259($a1)
nop
nop

addi $at, $zero, 1
beq $at, $a3, L27
addi $at, $zero, 8
beq $at, $a3, L28
ori $a3, $zero, 0x1
ori $a1, $zero, 0x2
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x4
lb $a2, 259($a1)
nop
nop

ori $a1, $zero, 0x6
lb $a2, 259($a1)
nop
nop

addi $at, $zero, 1
beq $at, $a3, L27
addi $at, $zero, 8
beq $at, $a3, L28
ori $a1, $zero, 0x0
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
ori $a1, $zero, 0x1
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
ori $a1, $zero, 0x2
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
ori $a1, $zero, 0x3
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
ori $a1, $zero, 0x4
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
ori $a1, $zero, 0x5
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
ori $a1, $zero, 0x6
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
ori $a1, $zero, 0x7
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
ori $a1, $zero, 0x8
lb $a2, 259($a1)
nop
nop
addi $at, $zero, 0
beq $at, $a2, L29
beq $zero, $zero, L30
L29:
lw $a3, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a2, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $a1, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
lw $ra, 0($sp)
addi $at, $zero, 4
sub $sp, $sp, $at
jr $ra
L27:
ori $a2, $zero, 0x1
beq $zero, $zero, L31
L28:
ori $a2, $zero, 0x2
beq $zero, $zero, L31
L31:
addi $at, $zero, 2
beq $at, $a2, L32
ori $a1, $zero, 0xb5
beq $zero, $zero, L33
L32:
ori $a1, $zero, 0x38
L33:
ori $a2, $zero, 0x0
jal L25
ori $a2, $zero, 0x1
jal L25
ori $a2, $zero, 0x2
jal L25
ori $a2, $zero, 0x3
jal L25
ori $a2, $zero, 0x4
jal L25
ori $a2, $zero, 0x5
jal L25
ori $a2, $zero, 0x6
jal L25
ori $a2, $zero, 0x7
jal L25
ori $a2, $zero, 0x8
jal L25
L30:
lw $t7, 4096($zero)
addi $at, $zero, 0
beq $at, $t7, L30
or $s0, $zero, $t7
L34:
lw $t7, 4096($zero)
addi $at, $zero, 0
bne $at, $t7, L34
j L0

