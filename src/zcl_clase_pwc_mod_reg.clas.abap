CLASS zcl_clase_pwc_mod_reg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_MOD_REG IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
SELECT FROM /dmo/flight
fields *
where carrier_id = 'LH'
INTO TABLE @DATA(lt_flights).

SELECT carrier_id, connection_id, flight_date
FROM @lt_flights AS lt
into table @DATA(lt_flights_copy).

out->write( data = lt_flights NAME = 'ANTES / lt_flights' ).

*LOOP AT lt_flights INTO DATA(ls_flight).
*
*ls_flight-flight_date = cl_abap_context_info=>get_system_date(  ).
*MODIFY lt_flights FROM ls_flight index 2.
*
*ENDLOOP.
*out->write( data = lt_flights NAME = 'DESPUES / lt_flights' ).
*LOOP AT lt_flights INTO DATA(ls_flight).
*
**if ls_flight-flight_date > '20250105'.
**ls_flight-flight_date = cl_abap_context_info=>get_system_date(  ).
**MODIFY lt_flights FROM ls_flight TRANSPORTING flight_date.
*
*if ls_flight-connection_id > '0401'.
*ls_flight-connection_id = '4000'.
*MODIFY lt_flights FROM ls_flight TRANSPORTING connection_id.
*ENDIF.
*
*ENDLOOP.
*out->write( data = lt_flights NAME = 'DESPUES / lt_flights' ).

" forma moderna

LOOP AT lt_flights INTO DATA(ls_flight).

if ls_flight-flight_date GT '20250401'.
ls_flight-flight_date = cl_abap_context_info=>get_system_date(  ).

*MODIFY lt_flights FROM VALUE #( CARRIER_ID = 'XX'
*                                connection_id = '111'
*                                PLANE_TYPE_ID = 'YY' ).

MODIFY lt_flights FROM VALUE #(
                                CARRIER_ID = 'XX'
                                PLANE_TYPE_ID = 'YY' ) TRANSPORTING CARRIER_ID PLANE_TYPE_ID.

ENDIF.
ENDLOOP.
out->write( data = lt_flights NAME = 'DESPUES / lt_flights' ).

ENDMETHOD.
ENDCLASS.
