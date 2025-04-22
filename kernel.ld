ENTRY(boot) /* カーネルのエントリポイントはbootシンボルである */

SECTIONS {
    . = 0x80200000; /* 現在のアドレス`.`に0x80200000を割り当て */

    .text :{
        KEEP(*(.text.boot)); /* .text.bootセクションを先頭にする */
        *(.text .text.*); /* *(.text .text.* )を満たすファイル、つまり全ファイル*のうち.textまたは.text.*をみたすファイルを配置 */
    }

    .rodata : ALIGN(4) { /* .rodata(Read-Only Data)セクションを配置、4Bytes境界になるように配置 */
        *(.rodata .rodata.*);
    }

    .data : ALIGN(4) {
        *(.data .data.*);
    }

    .bss : ALIGN(4) {
        __bss = .; /* __bss シンボルに現在のアドレスを割り当て */
        *(.bss .bss.* .sbss .sbss.*);
        __bss_end = .;
    }

    . = ALIGN(4);
    . += 128 * 1024; /* 128KB 追加 */
    __stack_top = .;
}
