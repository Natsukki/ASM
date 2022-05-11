.globl my_strcpy
my_strcpy:
        movzbl (%rsi), %ecx
        mov %rdi, %rax
        mov $0, %edx
.loop:
        movb %cl, (%rax,%rdx)
        inc %rdx
        movzbl (%rsi,%rdx), %ecx
        test %cl, %cl
        jne .loop
        add %rax, %rdx
        movb $0, (%rdx)
        ret
.return:
        mov %rdi, %rdx
        movb $0, (%rdx)
        ret
