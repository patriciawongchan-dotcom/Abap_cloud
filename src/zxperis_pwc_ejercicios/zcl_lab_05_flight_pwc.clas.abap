CLASS zcl_lab_05_flight_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS:
      check_flight
        IMPORTING
          iv_carrier_id    TYPE /dmo/carrier_id
          iv_connection_id TYPE /dmo/connection_id
        RETURNING VALUE(rv_exists) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_flight_pwc IMPLEMENTATION.
  METHOD check_flight.
SELECT SINGLE *
      FROM /dmo/flight
      WHERE carrier_id    = @iv_carrier_id
        AND connection_id = @iv_connection_id
      INTO @DATA(ls_flight).

    rv_exists = xsdbool( sy-subrc = 0 ).

  ENDMETHOD.

ENDCLASS.
