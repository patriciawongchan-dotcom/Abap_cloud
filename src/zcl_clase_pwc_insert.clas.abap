CLASS zcl_clase_pwc_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_INSERT IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

data: lv_var1 type string value '123cliente01',
      lv_var2 type string value 'HOLA'.

      data(lv_ins_string) = insert( val = lv_var1 sub = lv_var2 off = 0 ).

out->write( lv_ins_string ).

ENDMETHOD.
ENDCLASS.
