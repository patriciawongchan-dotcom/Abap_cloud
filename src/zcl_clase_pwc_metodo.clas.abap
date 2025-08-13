CLASS zcl_clase_pwc_metodo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_metodo IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
"crea un objeto
data(lo_employee) = NEW zcl_clase_pwc_consypun( iv_age = 22 iv_name = 'Laura' ).

out->write( LO_EMPLOYEE->lv_age  ).
out->write( LO_EMPLOYEE->lv_name ).
ENDMETHOD.

ENDCLASS.
