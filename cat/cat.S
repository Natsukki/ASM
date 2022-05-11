.globl main
main:
    cmp $2, %rdi
    je .next
    jmp .error_arg

.next:
    addq $8, %rsi
    movq (%rsi), %rdi
    movq $0, %rsi
    call open
    cmp $-1, %eax
    je .error_open
    mov %eax, %ebp
    sub $512, %rsp
    jmp .loop

.loop:
    mov %ebp, %edi
    movq %rsp, %rsi
    movq $511, %rdx
    call read
    test %rax, %rax
    je .return
    cmp $-1, %rax
    je .return
    movq $1, %rdi
    movq %rsp, %rsi
    movq %rax, %rdx
    call write
    jmp .loop

.error_arg:
    movq $1, %rax
    ret

.error_open:
    movq $2, %rax
    ret

.return:
    addq $512, %rsp
    mov %ebp, %edi
    call close
    xor %rax, %rax
    ret