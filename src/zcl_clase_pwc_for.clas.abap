CLASS zcl_clase_pwc_for DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_FOR IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

*SELECT FROM /dmo/agency

types: BEGIN OF ty_flights,
       iduser type /dmo/customer_id,
       aircode type /dmo/carrier_id,
       flightnum type /dmo/connection_id,
       key type land1,
       seat type /dmo/plane_seats_occupied,
       flightdate type /dmo/flight_date,
       END OF TY_FLIGHTS.

 DATA: lt_flights_info type TABLE of ty_flights,
       lt_my_flights TYPE TABLE of ty_flights.


" CON EL FOR  UNTIL
* lt_my_flights = value #( for i = 1 until i > 30
* ( iduser = | { 123456 + i } - USER |
* aircode = 'LH'
* flightnum = 00001 + i
* key = 'US'
* seat = 0 + i
* flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).

" CON EL FOR  WHILE
 lt_my_flights = value #( for i = 1 WHILE i <= 20
 ( iduser = | { 123456 + i } - USER |
 aircode = 'LH'
 flightnum = 00001 + i
 key = 'US'
 seat = 0 + i
 flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).

 lt_flights_info = value #( FOR ls_my_flight in lt_my_flights "no es necesario declarar antes la estructura
 where ( aircode = 'LH' and flightnum = 12 )
 ( iduser = ls_my_flight-iduser
 aircode = ls_my_flight-aircode
 flightnum = ls_my_flight-flightnum
 key = ls_my_flight-key
 seat = ls_my_flight-seat
 flightdate = ls_my_flight-flightdate ) ).


out->write( data = lt_my_flights name = 'lt_my_flights' ).

out->write( lt_flights_info ).

ENDMETHOD.
ENDCLASS.
