    .syntax unified
    .arch armv6-m
    
    .section .xip_banned,"x"
    .thumb
    .thumb_func
    .globl cpu_sleep_asm
    .type cpu_sleep_asm,%function
cpu_sleep_asm:
    mov r0, r8
    mov r1, r9
    mov r2, r10
    mov r3, r11
    PUSH {R0,R1,R2,R3,R4,R5,R6,R7,LR}
    MOVS R1,#0
    MOV R2,SP
    STR R2,[R1,#0]
    BL dcdc_off
    WFI
    .size	cpu_sleep_asm, . - cpu_sleep_asm

    .section .xip_banned,"x"
    .thumb
    .thumb_func
    .globl cpu_recover_asm
    .type cpu_recover_asm,%function
cpu_recover_asm:
    BL dcdc_on
    POP {R0,R1,R2,R3,R4,R5,R6,R7}
    mov r8, r0
    mov r9, r1
    mov r10, r2
    mov r11, r3
    POP {PC}
    .size	cpu_recover_asm, . - cpu_recover_asm

    