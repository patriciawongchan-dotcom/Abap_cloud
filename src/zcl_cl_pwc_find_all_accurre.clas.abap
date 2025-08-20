CLASS zcl_cl_pwc_find_all_accurre DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CL_PWC_FIND_ALL_ACCURRE IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA:  lv_string_c type string VALUE 'ERP ####### El perro corre por el campo'.
find ALL OCCURRENCES OF '#' in lv_string_c MATCH COUNT data(lv_count).

out->write( lv_count ).

ENDMETHOD.
ENDCLASS.
