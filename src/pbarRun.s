.include "telestrat.inc"
.include "pbar.inc"

.export pbarRun

    ; Continue here don't put any code here
.proc pbarRun


    sta     RES
    stx     RES+1
    ; Y step
    tya
    ldy     #progressbar_struct::step
    sta     (RES),y


    ldy     #progressbar_struct::counter+1
    lda     (RES),y
    bne     @dec

    dey
    lda     (RES),y
    bne     @dec

    ldy     #progressbar_struct::number_of_values_needed_for_inc_progress_bar
    lda     (RES),y
    ldy     #progressbar_struct::counter
    sta     (RES),y

    ldy     #progressbar_struct::number_of_values_needed_for_inc_progress_bar+1
    lda     (RES),y
    ldy     #progressbar_struct::counter+1
    sta     (RES),y

    ldy     #progressbar_struct::current_percentage
    lda     (RES),y
    sta     RESB

    ldy     #progressbar_struct::posx
    lda     (RES),y

    tay
    lda     #'='

    sta     (ADSCR),y

    iny
    lda     #'>'
    sta     (ADSCR),y

    tya
    tax

    ldy     #progressbar_struct::inc_value
    lda     (RES),y
    adc     RESB
    ldy     #progressbar_struct::current_percentage
    sta     (RES),y

    pha
    txa
    tay
    pla

    ldx     #$FF
@L2:
    inx
    sec
    sbc     #10
    bpl     @L2
    clc
    adc     #10
    pha

    txa
    clc
    adc     #$30

    iny
    sta     (ADSCR),y

    iny
    pla
    clc
    adc     #$30
    sta     (ADSCR),y

    lda     #'%'
    iny
    sta     (ADSCR),y

@skip:
    ldy     #progressbar_struct::posx
    lda     (RES),y
    clc
    adc     #$01
    sta     (RES),y


@dec:

    ldy     #progressbar_struct::counter
    lda     (RES),y
    bne     @out

    ldy     #progressbar_struct::counter+1
    lda     (RES),y
    sec
    sbc     #$01
    sta     (RES),y

@out:
    ldy     #progressbar_struct::counter
    lda     (RES),y
    sec
    sbc     #$01
    sta     (RES),y

    rts
.endproc
