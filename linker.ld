ENTRY(start)

SECTIONS {
  /* sets load address to MiB (convention) */
  . = 1M;

  .boot : {
    /* put the header at the beginning */
    *(.multiboot_header)
  }

  .text : {
    *(.text)
  }
}
