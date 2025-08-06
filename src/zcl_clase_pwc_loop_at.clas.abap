CLASS zcl_clase_pwc_loop_at DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_loop_at IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

*DATA: lt_flight type /dmo/flight,
*ls_flight type /dmo/flight.



"loop at lt_flight INTO  ls_flight.

" LOOP CON ASSIGNING FIELD-SYMBOL

SELECT FROM /dmo/flight
FIELDS *
WHERE carrier_id = 'LH'
INTO TABLE @DATA(LT_FLIGHTS).

DATA ls_flight type /dmo/flight.

LOOP AT lt_flights INTO ls_flight.

out->write( data = ls_flight name = 'ls_flight' ).

ENDLOOP.

out->write( |\n| ).
out->write( |\n| ).

LOOP AT LT_FLIGHTS ASSIGNING FIELD-SYMBOL(<fs_flight>) where connection_id = '0403'.

out->write( data = <fs_flight> name = '<fs_flight>' ).

ENDLOOP.
out->write( |\n| ).
out->write( |\n| ).
out->write( data = lt_flights name = 'lt_flights' ).


LOOP AT lt_flights into data(ls_flight2) where connection_id = '0403'.
out->write( data = ls_flight2 name = 'ls_flight2' ).

ENDLOOP.
out->write( |\n| ).
out->write( |\n| ).


LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flight2>) FROM 3 TO 8.

<fs_flight2>-currency_code = 'COP'.

ENDLOOP.

out->write( data = lt_flights name = 'lt_flights' ).




ENDMETHOD.

ENDCLASS.
