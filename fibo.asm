;declarations

extern printf
extern scanf

global fibo

string_size equ 48


segment .data
;declare initialized arrays

prompt_for_nums db "type 5 numbers: ", 0
num db "%lf", 0
result db "array: ", 10, 0


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
mov r12, 0
mov r13, 1
mov r14, 0

;prompt user for numbers
mov rax, 0
mov rdi, prompt_for_nums
call printf

fill:
;cmp r11, 4
;je sort
;je end

;get values
mov rax, 0
push qword 0
push qword 0
mov rdi, num
mov rsi, rsp
call scanf
movsd xmm15, [rsp]
pop rax
pop rax

movsd [r15+r11*8], xmm15

;inc r11
;jmp fill

;sort:
;cmp r13, 5
;je printing

;cmpsd [r15+r12*8], [r15+r13*8]
;jg swap

;inc r12
;inc r13

;jmp sort

;swap:
;movsd xmm15, [r15+r12*8]
;movsd [r15+r12*8], [r15+r13*8]
;movsd [r15+r13*8], xmm15

;inc r12
;inc r13

;jmp sort

printing: 
mov rax, 0
mov rdi, result
call printf

;output:
;cmp r14, 5
;je end

;mov rax, 1
;mov rdi, num
;movsd xmm0, [r15+r14*8]
;call printf

;inc r14
;jmp output


end: 

mov rax, r11

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
