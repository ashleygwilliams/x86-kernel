# x86 kernel
> a simple x86 kernel, extended with Rust 

this is my work following along with a [@phil-opp][2]'s blog post series ["A minimal x86 kernel"][1]

## prerequisites

- `nasm`: assembler (assembly -> binary)
- `ld`: linker (makes binary out of other files)
- `grub`: creates the bootable iso
- `xorriso`: req'd by grub, filesystem manipulator
- `QEMU`: fake-computer emulator
- `libsdl2-dev`: graphics library (not currently working on my chrooted chromebook)

### utilities
you don't need these, but they are nice for viewing
generated code.

- `hexdump`: allows you to view generated binary
- `objdump`: a nicer viewer for .o files

## up and running

1. fork and clone this repository
2. navigate into the repo directory: `cd x86-kernel`
3. compile the `multiboot_header` and `boot` to elf64 (o file)

    ```sh
      $ nasm -f elf64 multiboot_header.asm
      # => multiboot_header.o
      $ nasm -f elf64 boot.asm
      # => boot.o
    ```

    you can czech out what you did using `hexdump`, e.g.:

    ```sh
      $ hexdump -x boot.o
    ```

4. build the `kernel.bin` using the linker file

    ```sh
      $ ld -n -o kernel.bin -T linker.ld multiboot_header.o boot.o
    ```

    you can czech out what you did using `objdump`:

    ```sh
      $ objdump -h kernel.bin
    ```

5. make a bootable iso

    ```sh
      $ grub-mkrescue -o os.iso isofiles
    ```

5. tell QEMU to boot with our image

    ```sh
      $ qemu-system-x86_64 -hda os.iso
    ```

[1]: http://blog.phil-opp.com/rust-os/multiboot-kernel.html
[2]: https://github.com/phil-opp
