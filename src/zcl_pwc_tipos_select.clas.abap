CLASS zcl_pwc_tipos_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pwc_tipos_select IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

**********************************************************************
*SELECT SINGLE

*SELECT SINGLE FROM ZTAB_CARRIER_PWC
*FIELDS *
*WHERE CARRIER_ID = 'AA'
*INTO @DATA(LS_AIRLINE).
*
*IF SY-SUBRC = 0.
*OUT->WRITE( LS_AIRLINE ).
*
*ENDIF.

**********************************************************************
* SELECT INTO (almacena datos en una tabla interna)
*Y APPENDING TABLE (almacena datos en una tabla sin borrar lo q habia)

*data lt_airlines type STANDARD TABLE OF ztab_carrier_pwc.
*
*select from ztab_carrier_pwc
*fields *
*where currency_code = 'usd'
*into table @lt_airlines.
*
*if sy-subrc = 0.
*out->write( lt_airlines ) .
*endif.
*
*out->write( 'nueva seleccion').
*
*select from ztab_carrier_pwc
*fields *
*where currency_code = 'xyz'
*into table @lt_airlines.
*
*
**append initial line to lt_airlines
*
******falta cosas
*
*if lt_airlines is initial.
*
*out->write( lt_airlines ).
*
*ENDIF.


**********************************************************************
*SELECT INTO CORRESPONDING FIELDS

*TYPES: BEGIN OF TY_FLIGHTS,
*       AIRLINEID TYPE C LENGTH 3,
*       CONNECTIONID TYPE N LENGTH 4,
*       PRICE TYPE P LENGTH 16 DECIMALS 2,
*       CURRENCYCODE TYPE C LENGTH 5,
*END OF TY_FLIGHTS.
*
*DATA LT_FLIGHTS TYPE STANDARD TABLE OF TY_FLIGHTS.
*
*SELECT FROM ZTAB_FLIGHT_PWC
*FIELDS *
*WHERE AIRLINEID = 'LH'
*INTO CORRESPONDING FIELDS OF TABLE @LT_FLIGHTS.
*
*IF SY-subrc = 0.
*
*out->write( LT_FLIGHTS ).
*
*ENDIF.
*

**********************************************************************
* SELECT COLUMNS

*SELECT SINGLE FROM ZTAB_FLIGHT_PWC
*FIELDS PRICE
*WHERE AIRLINEID = 'AA'
*AND FLIGHTDATE = '20260419'
*INTO @DATA(LV_FLIGHT_PRICE).
*
*IF SY-subrc = 0.
*
*out->write( LV_FLIGHT_PRICE ).
*
*ENDIF.


**********************************************************************
*SELECT UP TO N ROWS

SELECT FROM ZTAB_FLIGHT_PWC
FIELDS *
WHERE AIRLINEID = 'LH'
INTO TABLE @DATA(LT_FLIGHTS)
UP TO 3 ROWS.
IF SY-subrc = 0.

out->write( LT_FLIGHTS ).

ENDIF.





ENDMETHOD.

ENDCLASS..
