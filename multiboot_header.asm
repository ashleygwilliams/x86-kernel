section .multiboot_header
header_start:
  dd 0xe85250d6                 ; magic number (multiboot 2)
  dd 0                          ; architecture 0 (protected mode i386)
  dd header_end - header_start  ; header length

  ; checksum (magic number + architecture + header length)
  ; we subtract from 0x1... to account for signedness 
  dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

  ; required end tag (u16, u16, u32)
  dw 0                          ; type
  dw 0                          ; flags
  dd 8                          ; size
header_end:
