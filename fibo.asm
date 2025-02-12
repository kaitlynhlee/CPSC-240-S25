;****************************************************************************************************************************
;Program name: "Average Driving Time".  This program calculates the average driving speed and time it took to go a certain distance based on user input
; Copyright (C) 2024  Kaitlyn Lee.          *
;                                                                                                                           *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.                                                                                           *
;****************************************************************************************************************************




;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;Author information
;  Author name: Kaitlyn Lee
;  Author email: kaitlynlee@csu.fullerton.edu
;  CWID: 886374479
;  Class: 240-03 Section 03
;
;Program information
;  Program name: Average Driving Time
;  Programming languages: One module in C, one in X86, and one in bash.
;  Date program began: 2024-Jan-30
;  Date of last update: 2024-Feb-4
;  Files in this program: driver.c, average.asm, r.sh.
;  Testing: Alpha testing completed.  All functions are correct.
;  Status: Ready for release to customers
;
;Purpose
;  This program is a driving time, speed, and distance calculator based on the user's input
;
;This file:
;  File name: average.asm
;  Language: X86-64
;  Max page width: 124 columns
;  Assemble (standard): nasm -f elf64 -l avg.lis -o avg.o average.asm
;  Assemble (debug): nasm -f elf64 -gdwarf -l avg.lis -o avg.o average.asm
;  Optimal print specification: Landscape, 7 points, monospace, 8½x11 paper
;  Prototype of this function: unsigned long helloword();
; 
;
;
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

;declarations

extern printf

extern scanf

extern cos

extern sin

extern tan

global calculator

string_size equ 48

segment .data
;declare initialized arrays

prompt_for_nums
num

segment .bss
;declare empty arrays

align 64
backup_storage_area resb 832

user_name resb string_size
user_title resb string_size

segment .text

calculator:

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

;backup other registers
mov rax,7
mov rdx,0
xsave [backup_storage_area]


;prompt user for nums


;input for num 1


;input for num 2



;add two nums

  
;subtract two nums

  
;multiply two nums


;divide two nums


;get square root of a number


;get cos of a number


;get sin of a number


;get tan of a number

  



;move results to stack
mov rax, 0
push qword 0
movsd [rsp], xmm15 ;move average speed in xmm15 to stack to restore sse registers

;Restore the values to non-GPRs
mov rax,7
mov rdx,0
xrstor [backup_storage_area]

;Send back average speed
movsd xmm0, [rsp] ;move average speed from top of stack to xmm0 to send back to driver
pop rax


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
