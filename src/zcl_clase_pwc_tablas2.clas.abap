CLASS zcl_clase_pwc_tablas2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_TABLAS2 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

TYPES :BEGIN OF ty_flights,
       carrier_id type /dmo/carrier_id,
       connection_id type /dmo/connection_id,
       flight_date type /dmo/flight_date,
       END OF ty_flights.

 DATA: lt_my_flights type STANDARD TABLE OF ty_flights,
       ls_my_flight type ty_flights.


SELECT from  /dmo/flight
fields *
where currency_code = 'EUR'
into table @DATA(lt_flights).

*move-CORRESPONDING lt_flights to lt_my_flights.
*
*out->write( data = lt_flights name = 'TABLA LT_FLIGHTS' ).
*out->write( |\n| ).
*out->write( data = lt_my_flights name = 'TABLA LT_MY_FLIGHTS' ).

lt_my_flights = CORRESPONDING #( lt_flights ). "version moderna

out->write( data = lt_my_flights name = 'TABLA LT_MY_FLIGHTS' ).

MOVE-CORRESPONDING lt_flights to lt_my_flights KEEPING TARGET LINES. "con keeping hace que se vuelva a hacer el move corresponding sin borrar los datos q ya habian
out->write( data = lt_my_flights name = 'TABLA LT_MY_FLIGHTS' ).



ENDMETHOD.
ENDCLASS.
