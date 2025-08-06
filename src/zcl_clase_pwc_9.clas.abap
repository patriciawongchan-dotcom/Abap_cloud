CLASS zcl_clase_pwc_9 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_9 IMPLEMENTATION.



METHOD if_oo_adt_classrun~main.

DATA(lv_variable_linea) = 8 * 10.

out->write( lv_variable_linea ).

data(lv_texto) = 'ABAP 1 2025'.
out->write( lv_TEXTO ).

lv_texto = 'adios'.
DATA(lv_dec) = '10.245'.
out->write( lv_dec ).



ENDMETHOD.

ENDCLASS.
