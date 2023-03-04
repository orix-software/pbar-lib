.define PBAR_TYPE_SLIDE_EQUAL $01

.struct progressbar_struct
    type              .byte
    step              .byte
    posx              .byte
    number_of_values_needed_for_inc_progress_bar .word
    counter                                      .word
    inc_value                                    .word
    current_percentage                           .byte
.endstruct
