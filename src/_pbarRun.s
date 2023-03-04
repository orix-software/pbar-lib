.export _pbarRun

.importzp ptr1

.import popa, pbarRun

.proc _pbarRun

    sta     ptr1
    stx     ptr1+1

    ; Get step
    jsr popa
    tay

    ; Get struct
    lda     ptr1
    ldx     ptr1+1

    jmp     pbarRun
    ; No RTS
.endproc
