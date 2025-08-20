CLASS zcl_clase_pwc_concatenar DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_CONCATENAR IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

data: lv_string_a type string value 'hola, que tal estas?',
      lv_string_b type string value 'Bien gracias2',
      lv_concatenacion type string,
      lv_concatenacion3 type string.

"CONCATENACION 1
out->write( |concatenacion1: { lv_string_a } Bien gracias| ).

out->write( |concatenacion1: { lv_string_a } { lv_string_b } | ).

lv_concatenacion = |concatenacion1: { lv_string_a } { lv_string_b } |.

out->write( lv_concatenacion ).

"CONCATENACION 2

CONCATENATE lv_string_a lv_string_b into data(lv_concatenacion2) SEPARATED BY space.
out->write( lv_concatenacion2 ).

"CONCATENACION 3

lv_concatenacion3 = 'Hola' && ` ` && 'juan'.
out->write( lv_concatenacion3 ).

"CONCATENACION DE LINEAS DE TABLAS

SELECT FROM /dmo/flight
fields carrier_id, flight_date
into table @DATA(lt_itab).

DATA(lv_string_itab) = concat_lines_of( table = lt_itab sep = ` ` ).
out->write( lv_string_itab ).










ENDMETHOD.
ENDCLASS.
