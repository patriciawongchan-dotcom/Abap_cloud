CLASS zcl_clase_pwc_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASE_PWC_1 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA lv_alumno TYPE string value 'Juanito' .
out->write(  lv_alumno ).

lv_alumno =  'Pedro'.
out->write(  lv_alumno ).

lv_alumno =  'Pipo'.
"lv_alumno = lv_alumno + lv_alumno.
out->write(  lv_alumno ).

ENDMETHOD.
ENDCLASS.
