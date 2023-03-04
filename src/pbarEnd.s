.export pbarEnd
.export _pbarEnd

.include "telestrat.inc"
.include "pbar.inc"

_pbarEnd = pbarEnd

.proc pbarEnd

    sta     RES
    stx     RES+1

    ldy     #progressbar_struct::posx
    lda     (RES),y
    tay

    lda     #'|'
    sta     (ADSCR),y
    iny
    lda     #'1'
    sta     (ADSCR),y

    iny
    lda     #'0'
    sta     (ADSCR),y

    iny
    lda     #'0'
    sta     (ADSCR),y

    iny
    lda     #'%'
    sta     (ADSCR),y
    iny
    sty     SCRX


    lda     RES
    ldy     RES+1
    BRK_TELEMON XFREE

    BRK_TELEMON(XCRLF)

    rts
.endproc
