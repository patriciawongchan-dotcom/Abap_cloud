CLASS zcl_clase_pwc_11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_11 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA lv_string TYPE string VALUE 'daniel Fernando Pedro Ramon'.
out->write( |to_upper = { to_upper( lv_string ) } |  ).

lv_string = find( val = lv_string sub = 'Fernando' ).
out->write( lv_string  ).




ENDMETHOD.
ENDCLASS.
