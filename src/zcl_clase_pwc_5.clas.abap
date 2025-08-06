CLASS zcl_clase_pwc_5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_5 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: lv_text TYPE string.

    lv_text = zcl_clase_pwc_8=>gc_label_usuario.

    out->write( lv_text ).


  ENDMETHOD.

ENDCLASS.
