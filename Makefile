QEMU = qemu-system-riscv32
CC = /bin/clang
CFLAGS = -std=c11 -O2 -g3 -Wall -Wextra --target=riscv32-unknown-elf -fno-stack-protector -ffreestanding -nostdlib

build: kernel.c kernel.ld
	$(CC) $(CFLAGS) -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf \
    kernel.c

run: kernel.elf
	$(QEMU) -machine virt -bios default -nographic -serial mon:stdio --no-reboot \
    -kernel kernel.elf
	
test: kernel.elf kernel.map
	./test.sh
