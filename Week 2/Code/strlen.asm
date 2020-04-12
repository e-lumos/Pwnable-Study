;file: strlen.asm
;문자열을 입력받고 길이를 출력하는 프로그램

section .text
  global _start

_start: 
  xor rax, rax
  mov rbx, rax 
  mov rcx, rax 
  mov rdx, rax 

  sub rsp, 64                 ;입력 받는 부분
  mov rdi, 0
  mov rsi, rsp 
  mov rdx, 63 

  syscall 

  xor r9, r9
  while:
    mov cl, [rsp + 1 + r9]    ;문자열을 1 바이트씩 받아옴
    cmp cl, 0x00              ;NULL인지 확인 
    je break                  ;NULL 이면 break 
    inc r9                    ;cnt++
    jmp while                 ;반복 
  break:

  add r9, 0x30                ;숫자로 바꾸기 위해 '0' 추가
  
  mov rax, 1                  ;출력 부분
  mov rdi, 1
  mov [rsi], r9 
  mov rdx, 1

  syscall

  mov rax, 60                 ;종료 부분 

  syscall

