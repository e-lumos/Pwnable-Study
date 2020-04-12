;file: ehco.asm
;입력받은 값을 그대로 출력하는 프로그램

section .text
  global _start

_start:
  xor rax, rax          ;자기 자신과의 xor연산 -> 0
  mov rbx, rax          ;rbx 초기화
  mov rcx, rax          ;rcx 초기화
  mov rdx, rax          ;rdx 초기화

  sub rsp, 64           ;rsp - 64를 통해 문자열이 담길 수 있는 공간 64를 확보
  mov rdi, 0            ;rdi = 파일 서술자(file descriptor), 무언가를 읽는 경우에는 0, 쓰는 경우에는 1
  mov rsi, rsp          ;rsi = 문자열 포인터, 즉 문자열의 시작 주소를 가리킴
  mov rdx, 63           ;rdx = 문자열을 얼마나 읽어올지 정함

  syscall               ;rax = 0, sys_read 실행

  mov rax, 1            
  mov rdi, 1            ;무언가를 쓰는 경우이므로 rdi = 1
  mov rsi, rsp          ;위 syscall로 받아온 문자열 시작 주소 rsp
  mov rdx, 63           ;rsi부터 63만큼 출력하기로 정함

  syscall               ;rax = 1, sys_write 실행

  mov rax, 60

  syscall               ;rax = 60, sys_exit 실행. 즉, 프로그램 종료
