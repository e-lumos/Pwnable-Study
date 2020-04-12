;file: strcat.asm
;입력받은 문자열 2개를 이어 출력하는 프로그램

section .text
  global _start

_start:
  xor rax, rax            ;rax, rbx, rcx, rdx 초기화 
  mov rbx, rax 
  mov rcx, rax 
  mov rdx, rax 

  sub rsp, 128            ;첫번째 문자열 입력
  mov rdi, 0
  mov rsi, rsp 
  mov rdx, 63

  syscall

  mov al, 0               ;키보드 버퍼 플러쉬 후 두번째 문자열 입력
  add rsp, 64  
  mov rdi, 0
  mov rsi, rsp 
  mov rdx, 63

  syscall

  mov al, 0
  sub rsp, 64 
  
  xor r9, r9 
  while:
    mov cl, [rsp + 1 + r9]
    cmp cl, 0x0A
    jz break
    inc r9
    jmp while 
  
  break: 
  mov BYTE[rsp + 1 + r9], 0x00

  mov rax, 1              ;문자열 출력 
  mov rdi, 1
  mov rsi, rsp 
  mov rdx, 127

  syscall 
  
  mov rax, 60             ;프로그램 종료

  syscall
