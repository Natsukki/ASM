.globl my_strchr

my_strchr:
        movsbl (%rdi), %edx
        mov %rdi, %rax
        test %dl, %dl
        jz .exit
        jmp .loop

.increment:
        movsbl 1(%rax), %edx
        add $1, %rax
        test %dl, %dl
        jz .exit

.loop:
        cmpl %esi, %edx
        jne .increment
.exit:
        ret
