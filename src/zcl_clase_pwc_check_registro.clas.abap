CLASS zcl_clase_pwc_check_registro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_check_registro IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

" VERIFICA SI EXISTE UN REGISTRO

" DATA lt_flights type STANDARD TABLE OF /dmo/flight. esto se usara si no pongo al final del select el @data
SELECT FROM /dmo/flight
FIELDS *
WHERE carrier_id = 'LH'
INTO TABLE @DATA(lt_flights).
"si declaro con data antes la tabla solo sera INTO TABLE @lt_flights
out->write( lt_flights ).

*IF SY-subrc = 0.

"READ TABLE lt_flights WITH KEY connection_id = '0403' TRANSPORTING no FIELDS. "existe el registro

"READ TABLE lt_flights WITH KEY connection_id = '9999' TRANSPORTING no FIELDS. no existe el registro

"IF SY-subrc = 0.

*IF line_exists( lt_flights[ connection_id = '0403' ] ).
*
*out->write( 'El vuelo existe en la BBDD' ).
*
*else.
*
*out->write( 'El vuelo NO existe en la BBDD' ).
*
*ENDIF.
*
*ENDIF.

" INDICE DE UN REGISTRO

"LINE_INDEX

READ TABLE lt_flights WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.

*DATA(lv_index) = sy-tabix.
*out->write( data = lt_flights name = 'lt_flights' ).
*out->write( lv_index ).

"FORMA MODERNA
DATA(lv_index) = line_index( lt_flights[ connection_id = '0401' ] ).

out->write( data = lt_flights name = 'lt_flights' ).
out->write( lv_index ).

"numero total de lineas

data(lv_num) = lines( lt_flights ).
out->write( data = lv_num name = 'lv_num' ).




ENDMETHOD.

ENDCLASS.
