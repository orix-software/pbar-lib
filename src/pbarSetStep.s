.include "telestrat.inc"
.include "pbar.inc"

.proc pbar_set_default_step
    ; A & Y ptr of bar
    ;

    sta     RES
    sty     RES+1

    rts
.endproc
