CLASS zcl_clase_pwc_segment DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_segment IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

DATA(lv_string1) = 'El-perro-corre-por-el-prado'.

DATA(lv_palabra) = segment( val = lv_string1 index = 3 sep = '-' ).

out->write( lv_palabra ).

ENDMETHOD.

ENDCLASS.
