CLASS zcl_clase_pwc_while DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_WHILE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_num TYPE i.

    WHILE lv_num < 10.
      out->write( lv_num ).
      out->write( |iteracion = { sy-index }| ).
      lv_num += 1.
      IF lv_num > 5.
        EXIT.
      ENDIF.

ENDWHILE.



    ENDMETHOD.
ENDCLASS.
