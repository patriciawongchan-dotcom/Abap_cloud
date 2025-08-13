CLASS zcl_clase_ejercicios_tab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_ejercicios_tab IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

* EJERCICIO 1

TYPES: BEGIN OF ty_flights,
             iduser     TYPE C LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    DATA: lt_flights TYPE TABLE OF ty_flights,
          lt_flights_info TYPE TABLE OF ty_flights.

lt_flights = VALUE #( FOR i = 1 UNTIL i > 15
    ( iduser = | { 1234 + i } - USER |
    aircode = 'SQ'
    flightnum = 0000 + i
    key = 'US'
    seat = 0 + i
    flightdate = cl_abap_context_info=>get_system_date(  ) ) ).

 "   out->write( lt_flights ).

lt_flights_info = VALUE #( FOR i = 1 UNTIL i > 15
    ( iduser = | { 1234 + i } - USER |
    aircode = 'CL'
    flightnum = 0000 + ( i * 10 )
    key = 'COP'
    seat = 0 + i
    flightdate = cl_abap_context_info=>get_system_date(  ) ) ).

"out->write( lt_flights_info ).

**********************************************************************
*EJERCICIO 2

TYPES: BEGIN OF ty_connection,
         carrier_id       TYPE /dmo/carrier_id,
         connection_id    TYPE /dmo/connection_id,
         airport_from_id  TYPE /dmo/airport_id,
       END OF ty_connection.

DATA: mt_airline TYPE STANDARD TABLE OF ty_connection WITH EMPTY KEY.

DATA: mt_flights_type type STANDARD TABLE OF /dmo/flight,
      lt_final type  SORTED TABLE OF ty_flights WITH NON-UNIQUE KEY aircode.

SELECT from /dmo/flight
fields *
into table @mt_flights_type.

"out->write( mt_flights_type ).

SELECT carrier_id, connection_id, airport_from_id
  FROM /dmo/connection
  INTO TABLE @mt_airline.

"out->write( mt_airline ).



lt_final = VALUE #(
  FOR ls_flight_type IN mt_flights_type WHERE ( carrier_id = 'SQ' )
  FOR ls_airline IN mt_airline WHERE ( connection_id = ls_flight_type-connection_id )
  ( iduser     = ls_flight_type-client
    aircode   = ls_flight_type-carrier_id
    flightnum  = ls_airline-connection_id
    key = ls_airline-airport_from_id
    seat    = ls_flight_type-seats_occupied
    flightdate = ls_flight_type-flight_date ) ).

"out->write( lt_final ).

**********************************************************************
* EJERCICIO3

types: BEGIN OF ty_airlines,
       carrier_id type /dmo/carrier_id,
       connection_id type /dmo/connection_id,
       airport_from_id type /dmo/airport_from_id,
       airport_to_id type /dmo/airport_to_id,
       END OF ty_airlines.

"DATA: MT_ARILINES TYPE STANDARD TABLE OF ty_airlines.

SELECT FROM /dmo/connection
  FIELDS *
  WHERE airport_from_id = 'FRA'
  INTO TABLE @DATA(MT_ARILINES).


 out->write( MT_ARILINES ).

**********************************************************************
*EJECICIO 4

SORT MT_ARILINES BY CONNECTION_ID DESCENDING.
out->write( MT_ARILINES ).


ENDMETHOD.

ENDCLASS.
