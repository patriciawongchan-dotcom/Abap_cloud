CLASS zcl_clase_pwc_contains DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_CONTAINS IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
data(lv_text) = 'El telefono del empleado es 688-365-987 el correo electronico es daniel.elviraruiz@experis.es'.
"para el telefono
data(lv_pattern) = `\d{3}-\d{3}-\d{3}`.

"para un mail
data(lv_pattern2) = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b`.

if contains(  val = lv_text pcre = lv_pattern  ).
out->write( 'el texto contiene un numero de telefono' ).
data(lv_numero) = match( val = lv_text pcre = lv_pattern occ = '1' ).
out->write( lv_numero ).
else.

out->write( 'el texto NO contiene un numero de telefono' ).
ENDIF.



ENDMETHOD.
ENDCLASS.
