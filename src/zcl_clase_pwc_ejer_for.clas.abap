CLASS zcl_clase_pwc_ejer_for DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_EJER_FOR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_flights,
             iduser     TYPE /dmo/customer_id,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    DATA: lt_flights TYPE TABLE OF ty_flights.


*EJERCICIO 1

    lt_flights = VALUE #( FOR i = 1 UNTIL i > 15
    ( iduser = | { 11110 + i } - USER |
    aircode = 'PW'
    flightnum = 0400 + i
    key = 'ES'
    seat = 10 + i
    flightdate = '20250101' ) ).

    out->write( lt_flights ).

*EJERCICIO 2

    LOOP AT lt_flights INTO DATA(ls_flights).

      IF ls_flights-flightnum < 0405.

        DELETE TABLE lt_flights FROM ls_flights.

      ENDIF.

    ENDLOOP.

    out->write( |\n| ).
    out->write( |\n| ).
    out->write( data = lt_flights  name = 'Ejercicio2' ).

*EJERCICIO3

    LOOP AT lt_flights INTO ls_flights.

      IF ls_flights-seat > 20.

        MODIFY lt_flights FROM VALUE #(
                                        aircode = 'UPD'
                                        flightdate = cl_abap_context_info=>get_system_date(  ) ) TRANSPORTING aircode flightdate.

      ENDIF.
    ENDLOOP.
    out->write( |\n| ).
    out->write( |\n| ).
    out->write( data = lt_flights  name = 'Ejercicio3' ).


*EJERCICIO 4

    TYPES: BEGIN OF ty_vuelo,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             flightdate TYPE /dmo/flight_date,
           END OF ty_vuelo.


    TYPES: BEGIN OF ty_precio,
             aircode     TYPE /dmo/carrier_id,
             flightnum   TYPE /dmo/connection_id,
             flightprice TYPE /dmo/flight_price,
             currency    TYPE /dmo/currency_code,
           END OF ty_precio.
    TYPES: BEGIN OF ty_resultado,
             aircode     TYPE /dmo/carrier_id,
             flightnum   TYPE /dmo/connection_id,
             flightdate  TYPE /dmo/flight_date,
             flightprice TYPE /dmo/flight_price,
             currency    TYPE /dmo/currency_code,
           END OF ty_resultado.
    DATA: lt_vuelos    TYPE STANDARD TABLE OF ty_vuelo,
          lt_precios   TYPE STANDARD TABLE OF ty_precio,
          lt_resultado TYPE STANDARD TABLE OF ty_resultado,
          ls_vuelos    TYPE ty_vuelo,
          ls_precios   TYPE ty_precio.



    lt_vuelos = VALUE #( FOR i = 1 UNTIL i > 5
    (
    aircode = 'PW'
    flightnum = 0900 + i
    flightdate = '20250101' ) ).

    out->write( data = lt_vuelos name = 'TABLA DE VUELOS' ).

    lt_PRECIOS = VALUE #( FOR i = 1 UNTIL i > 5
    (
    aircode = 'PW'
    flightnum = 0903 + i
    flightprice = 200 + i
    currency = 'EUR' ) ).

    out->write( data = lt_PRECIOS name = 'TABLA DE PRECIOS' ).

    lt_RESULTADO = VALUE #( FOR  ls_vuelo  IN lt_vuelos


            FOR ls_precio IN lt_precios WHERE ( aircode = ls_vuelo-aircode AND flightnum = ls_vuelo-flightnum )


            ( aircode = ls_vuelo-aircode
            flightnum = ls_vuelo-flightnum
            flightdate = ls_vuelo-flightdate
            flightprice = ls_precio-flightprice
            currency = ls_precio-currency )  ).

    out->write( |\n| ).
    out->write( |\n| ).
    out->write( data = lt_RESULTADO  name = 'TABLA RESULTADO' ).



  ENDMETHOD.
ENDCLASS.
