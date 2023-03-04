.export pbarInit
.export _pbarInit

.include "telestrat.inc"
.include "pbar.inc"

; Y the type of the progressbar
; A and X the ptr of struct

_pbarInit = pbarInit

.proc pbarInit

    lda     #<.sizeof(progressbar_struct)
    ldy     #>.sizeof(progressbar_struct)

    BRK_TELEMON XMALLOC

    sta     RES
    sty     RES+1

    ; Store the type of progressbar
    ldy     #progressbar_struct::type
    txa
    sta     (RES),y

    ; Set step to 0 by default
    ldy     #progressbar_struct::step
    lda     #$00
    sta     (RES),y

    ldy     #progressbar_struct::posx
    lda     #$01
    sta     (RES),y

    ldy     #$00
    lda     #'|'
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

    ldy     #progressbar_struct::number_of_values_needed_for_inc_progress_bar
    lda     #<1
    sta     (RES),y
    iny
    lda     #>1
    sta     (RES),y

    ldy     #progressbar_struct::counter
    lda     #<1
    sta     (RES),y
    iny
    lda     #>1
    sta     (RES),y

    ldy     #progressbar_struct::inc_value
    lda     #$02
    sta     (RES),y

    ldy     #progressbar_struct::current_percentage
    lda     #$00
    sta     (RES),y

    lda     RES
    ldx     RES+1

    rts
.endproc
