;declarations

extern printf
extern input_array
extern output_array

global manager

segment .data                 ;Place initialized data here
msg_1 db "This program will manage your arrays of 64-bit floats", 10, 0
msg_2 db "For the array enter a sequence of 5 64-bit floats separated by white space.", 10, 0
msg_4 db "These numbers were received and placed into an array", 10, 0
floatformat db 10, "%lf", 10, 0

segment .bss      ;Declare pointers to un-initialized space in this segment.


my_array resq 12 ; <name> <data-type> <size>


segment .text
manager:

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


;inform user what the program does/how it works in creating floating point number arrays
mov rax, 0
mov rdi, msg_1
call printf

;inform the user how to input float values into the array
mov rax, 0
mov rdi, msg_2
call printf

;call input_array function in order to obtain the float values from user and place them into array



;tell user that these were the values received before printing the array values
mov rax, 0
mov rdi, msg_4
call printf

;call output_array function to loop through the array and print each value for the user to see



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
;End of the function manager ====================================================================

