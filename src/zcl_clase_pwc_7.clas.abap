CLASS zcl_clase_pwc_7 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_7 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

CONSTANTS: lc_pi type p DECIMALS 2 VALUE '3.14'.

DATA: lv_radio type i,
      lv_area type p DECIMALS 2.

lv_radio = 2.
lv_area = lc_pi * lv_radio ** 2.


out->write( lv_area ).



ENDMETHOD.

ENDCLASS.
