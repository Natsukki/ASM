.globl my_strlen
my_strlen:
        mov $0, %rax
        cmpb $0, (%rdi)
        je .exit
.loop:
        inc %rax
        test %rdi, %rdi
        cmpb $0, (%rdi, %rax)
        jne .loop
.exit:
        ret
