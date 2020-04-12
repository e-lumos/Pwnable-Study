;file: strcpy.asm
;입력받은 문자열을 복사하여 저장하는 프로그램

section .bss
  str1 resb 64                ;문자열을 저장하기 위해 bss 세그먼트에 선언 

section .text
  global main

main:
  xor rax, rax                ;rax, rbx, rcx, rdx 초기화 
  mov rbx, rax 
  mov rcx, rax 
  mov rdx, rax 

  sub rsp, 64                 ;문자열 입력받음 
  mov rdi, 0
  mov rsi, rsp 
  mov rdx, 63 

  syscall 

  xor r9, r9 
  while:
    mov cl, [rsp + r9]        ;NULL이 나올 때까지 입력받은 문자열을 돌며 str1 (주소) 가 가리키는 곳에 문자를 하나씩 저장함 
    mov [str1 + r9], cl 
    cmp cl, 0x00
    je break
    inc r9 
    jmp while 
  break:

  mov rax, 1                  ;str1 출력 
  mov rdi, 1
  mov rsi, str1               ;rsi에 str1의 주소 전달해줌 
  mov rdx, 64

  syscall 

  mov rax, 60                 ;프로그램 종료 

  syscall 
