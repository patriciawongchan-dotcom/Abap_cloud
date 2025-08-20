CLASS zcl_clase_pwc_try_catch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_TRY_CATCH IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

try.
DATA: lv_num1 type i value 10,
      lv_num2 type i value 0,
      lv_res type f.

lv_res = lv_num1 / lv_num2.

out->write( lv_res ).

catch cx_sy_zerodivide into data(lv_zero_divide).
out->write( 'ERROR: no se puede realizar esta operacion' ).

ENDTRY.
ENDMETHOD.
ENDCLASS.
