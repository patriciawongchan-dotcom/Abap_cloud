CLASS zcl_clase_pwc_split DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_SPLIT IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA(lv_string) = 'daniel Fernando Pedro ramon Sergio'.

    "declaramos variables para almacenar cada nombre
    DATA : lv_nombre1 TYPE string,
           lv_nombre2 TYPE string,
           lv_nombre3 TYPE string,
           lv_nombre4 TYPE string,
           lv_nombre5 TYPE string.
SPLIT lv_string at space into lv_nombre1 lv_nombre2 lv_nombre3 lv_nombre4 lv_nombre5.

out->write( lv_nombre1 ).
out->write( lv_nombre2 ).
out->write( lv_nombre3 ).
out->write( lv_nombre4 ).
out->write( lv_nombre5 ).



ENDMETHOD.
ENDCLASS.
