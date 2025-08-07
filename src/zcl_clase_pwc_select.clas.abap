CLASS zcl_clase_pwc_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_select IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

SELECT FROM /dmo/flight
fields *
where carrier_id = 'LH'
INTO TABLE @DATA(lt_flights).

SELECT carrier_id, connection_id, flight_date
FROM @lt_flights AS gt
into table @DATA(lt_flights_copy).

out->write( data = lt_flights name = 'lt_flights' ).
out->write( data = lt_flights_copy name = 'lt_flights_copy' ).







ENDMETHOD.

ENDCLASS.
