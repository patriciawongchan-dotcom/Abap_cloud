CLASS zcl_clase_pwc_cambio_tipo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_CAMBIO_TIPO IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA:  lv_string type string value '1234' ,
lv_int type i.

lv_int = lv_string.



out->write( lv_int ).

ENDMETHOD.
ENDCLASS.
