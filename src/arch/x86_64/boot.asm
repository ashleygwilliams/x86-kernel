global start

section .text
bits 32
start:
  ; print OK to the screen
  ; 0xb8000 is the upper left chunk of the screen (convention)
  ; 0x2f4b2f4f is ascii for OK
  mov dword [0xb8000], 0x2f4b2f4f
  hlt
