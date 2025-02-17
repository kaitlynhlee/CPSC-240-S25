;declarations

extern printf

global output_array

segment .data
;declare initialized arrays
results db "%lf ", 0

segment .bss
;declare empty arrays

segment .text

output_array:
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


;store array address and array length in non-volatile registers to use when adding the registers together and calculating mean
mov r15, rdi
mov r14, 0

loop:
cmp r14, 5
jge exit

mov rax, 1
mov rdi, results
movsd xmm0, [r15+r14*8]
call printf

inc r14
jmp loop

exit:
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
;End of the function ====================================================================

