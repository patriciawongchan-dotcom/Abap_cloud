CLASS zcl_clase_pwc_15 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_15 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

   DATA: lv_nombre TYPE string VALUE 'Daniel',
    lv_num1 type i value 5.
    "lv_nombre = strlen( lv_nombre ).

    DATA(lv_cara) =  strlen( lv_nombre ).

*    IF lv_num1 + lv_num1 = 10.
*
*      out->write(  'la suma es 10'   ).


*    ENDIF.
*
*    data(lv_p) = lv_nombre+0(1).
*    out->write( lv_p ).
data lv_result type string.

IF lv_nombre+0(1) = 'D'.
lv_result = lv_nombre+0(1).
  out->write( lv_result ).


ENDIF.


ENDMETHOD.
ENDCLASS.
