CLASS zcl_pwc_update_reg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pwc_update_reg IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

*DATA ls_airline type ztab_carrier_pwc.

**********************************************************************
*ACTUALIZACION DE UN UNICO CAMPO / REGISTRO

*SELECT SINGLE FROM ztab_carrier_pwc
*FIELDS *
*WHERE CARRIER_ID = 'AA'
*INTO @LS_AIRLINE.
*
*IF SY-subrc = 0.
*
*out->write( |CURRENT CURRENCY : { LS_AIRLINE-currency_code }| ).
*
*ENDIF.
*
*LS_AIRLINE-currency_code = 'EUR' .
*
*UPDATE ztab_carrier_pwc FROM @LS_AIRLINE.
*
*IF SY-subrc = 0.
*
*out->write( | EL REGISTRO SE HA ACTUALIZADO CON CURRENCY : { LS_AIRLINE-currency_code }| ).
*
*ENDIF.

**********************************************************************


*DATA LS_AIRLINE TYPE ZTAB_CARRIER_PWC.
*
*LS_AIRLINE = VALUE #( CARRIER_ID = 'AA'
*                       NAME = 'AMERICANS AIRLINES INC'
*                       CURRENCY_CODE = 'XXX' ).
*
*UPDATE ztab_carrier_pwc FROM @LS_AIRLINE.
*
*IF SY-subrc = 0.
*
*out->write( | EL REGISTRO SE HA ACTUALIZADO CON CURRENCY : { LS_AIRLINE-currency_code }| ).
*
*ENDIF.

**********************************************************************
*UPDATE MULTIPLES REGISTROS

*CONSTANTS LC_CURRENCY TYPE C LENGTH 3 VALUE 'USD'.
*
*SELECT FROM ZTAB_CARRIER_PWC
*FIELDS *
*INTO TABLE @DATA(LT_AIRLINES).
*
*IF SY-subrc = 0.
*
*LOOP AT LT_AIRLINES ASSIGNING FIELD-SYMBOL(<LS_AIRLINES>).
*
*CLEAR <LS_AIRLINES>-NAME.
*<LS_AIRLINES>-CURRENCY_CODE = LC_CURRENCY.
*
*ENDLOOP.
*
*UPDATE ZTAB_CARRIER_PWC FROM TABLE @LT_AIRLINES.
*
*IF SY-subrc = 0.
*
*out->write( | TODOS LOS REGISTROS HAN SIDO ACTUALIZADOS CON EL NUEVO CURRENCY : { LC_CURRENCY }| ).
*
*ENDIF.
*
*ENDIF.

**********************************************************************
*ACTUALIZACION DE LAS COLUMNAS

*
*
*CONSTANTS LC_CURRENCY TYPE C LENGTH 3 VALUE 'EUR'.
*
*UPDATE ZTAB_CARRIER_PWC
*SET CURRENCY_CODE = @LC_CURRENCY
*WHERE CARRIER_ID = 'AA'
*OR CARRIER_ID = 'FJ'.
*
*IF SY-subrc = 0.
*
*out->write( | REGISTROS ACTUALIZADOS| ).
*
*ELSE.
*
*out->write( | REGISTROS NO ACTUALIZADOS | ).
*
*ENDIF.
*

**********************************************************************
*INSERTAR REGISTROS EN UN TABLA

*DATA LT_FLIGHTS TYPE /DMO/I_FLIGHT.
*DELETE FROM ZTAB_flight_PWC.
*DATA LT_DDBB TYPE STANDARD TABLE OF ZTAB_FLIGHT_PWC.
*
*
*SELECT FROM /DMO/i_FLIGHT
*FIELDS *
*INTO CORRESPONDING FIELDS OF
*TABLE @lt_ddbb.
*
*IF SY-subrc = 0.
*
*try.
*insert  ZTAB_FLIGHT_PWC from table @lt_ddbb.
**controla cuando no se ha podido hacer el insert
*
*
*catch cx_sy_open_sql_db into data(lx_sql_db).
*out->write( lx_sql_db->get_text(  ) ).
*return.
*ENDTRY.
*if  SY-subrc = 0.
*out->write( 'todo ok' ).
*ENDIF.
*ENDIF.

**********************************************************************
*ACTUALIZACION DE COLUMNAS CON EXPRESIONES

UPDATE ZTAB_FLIGHT_PWC
SET MAXIMUMSEATS = MAXIMUMSEATS + 10,
OCCUPIEDSEATS = OCCUPIEDSEATS + 5
WHERE AIRLINEID = 'AA'.


if  SY-subrc = 0.
 out->write( |ACTUALIZACION DE COLUMNAS : { SY-dbcnt }| ).

ELSE.

out->write( 'ACTUALIZACION NO EJECUTADA' ).

ENDIF.








ENDMETHOD.

ENDCLASS..
