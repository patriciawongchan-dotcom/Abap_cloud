CLASS zcl_clase_pwc_scape DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_scape IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

"scape URL

data(lv_url) =  escape( val = 'El perro corre por el campo' format = cl_abap_format=>e_url_full ).
out->write( lv_url ).

ENDMETHOD.

ENDCLASS.
