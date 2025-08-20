CLASS zcl_clase_pwc_do_end_do DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_DO_END_DO IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA(lv_num) = 0.

DO 3 TIMES.

out->write( lv_num ).
lv_num = lv_num + 1.

ENDDO.



ENDMETHOD.
ENDCLASS.
