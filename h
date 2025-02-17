
;declarations

extern printf
extern scanf

global fibo

string_size equ 48


segment .data
;declare initialized arrays

prompt_for_nums db "how many times would you like to run fibo? ", 0
num db "%d", 0
result db "fibo has returned: %d", 10, 0


segment .bss
;declare empty arrays


segment .text

fibo:
;backup GPRs
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

mov r11, 0
mov r12, 1
mov r13, 1

;prompt user for how many times
mov rax, 0
mov rdi, prompt_for_nums
call printf

;get number of times
mov rax, 0
push qword 0
push qword 0
mov rdi, num
mov rsi, rsp
call scanf
mov r14, [rsp]
pop rax
pop rax

fib:

;jump to end if finished
cmp r13, r14
je end

;add last number to total
mov r10, r12
add r10, r11

mov r11, r12
mov r12, r10

inc r13

jmp fib


end: 

;print results to user
mov rax, 0
mov rdi, result
mov rsi, r12
call printf

mov rax, r12


;Restore the GPRs
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp   ;Restore rbp to the base of the activation record of the caller program
ret
;End of the function average ====================================================================
