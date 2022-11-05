.section .init
.global _start
_start:
    call0 notmain
    ill
.balign 0x100
.global dummy
dummy:
    ret.n
    
.balign 0x10
.global PUT32
PUT32:
    memw
    s32i.n a3,a2,0
    ret.n
    
.balign 0x10
.global GET32
GET32:
    memw
    l32i.n a2,a2,0
    ret.n
