CLASS zcl_clase_pwc_metodo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_METODO IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
"crea un variable/ objeto que apunta a un objeto de tipo zcl_clase_pwc_consypun { lines( lt_
data(lo_employee) = NEW zcl_clase_pwc_NEW_EJEM( iv_age = 22 iv_name = 'Laura' ).

out->write( LO_EMPLOYEE->lv_age  ).
out->write( LO_EMPLOYEE->lv_name ).
ENDMETHOD.
ENDCLASS.
