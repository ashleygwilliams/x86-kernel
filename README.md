kjin modify on my master
# x86 kernel
> a simple x86 kernel, extended with Rust 

this is my work following along with a [@phil-opp][2]'s blog post series ["A minimal x86 kernel"][1]

## prerequisites

### virtualization
> (if you are on OSX, ChromeOS, Windows, etc)

- [Vagrant]: development environment manager
- [VirtualBox]: virtualizer
- [XQuartz]: X11 Graphics

### linux dependencies
- `nasm`: assembler (assembly -> binary)
- `ld`: linker (makes binary out of other files)
- `grub`: creates the bootable iso
- `xorriso`: req'd by grub, filesystem manipulator
- `QEMU`: fake-computer emulator

### utilities
you don't need these, but they are nice for viewing
generated code.

- `hexdump`: allows you to view generated binary
- `objdump`: a nicer viewer for .o files

## up and running

1. fork and clone this repository
2. navigate into the repo directory: `cd x86-kernel`
3. `$ vagrant up`
4. `$ vagrant ssh -- -Y`
    `-- -Y` forwards graphics
5. `$ multirust default nightly-2015-11-19`
    
    Sets your default rust to a stable nightly. 
    The features needed to do OS work in Rust are
    not yet in a stable release, so you must use
    a nightly build.

6. `$ cd /vagrant`

    The `/vagrant` directory is the virtualized directory
    that is synced with the `/` directory on your HD.

7. `$ make run`

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/
[XQuartz]: http://www.xquartz.org/
[1]: http://blog.phil-opp.com/rust-os/multiboot-kernel.html
[2]: https://github.com/phil-opp
