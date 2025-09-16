CLASS zcl_pwc_filtros_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pwc_filtros_select IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*OPERADORES RELACIONALES BINARIOS

*SELECT FROM ZTAB_FLIGHT_PWC
*FIELDS *
*WHERE AIRLINEID = 'AA'
*INTO TABLE @DATA(LT_FLIGHTS).
*
*IF SY-subrc = 0.
*OUT->write( LT_FLIGHTS ).
*ENDIF.

*OPERADORES RELACIONALES BINARIOS
* EQ -----> IGUAL
*<> NE ----> DISTINTO
*< LT -----> MENOR QUE
*< GT ----> GREAT THAN
*<= LE ----> LEES EQUAL
*>= GE GREAT EQUAL

**********************************************************************
*MENOR QUE
*SELECT FROM ZTAB_FLIGHT_PWC
*FIELDS *
*WHERE FLIGHTDATE < '20260415'
*INTO TABLE @LT_FLIGHTS.
*
*IF SY-subrc = 0.
*OUT->write( LT_FLIGHTS ).
*ENDIF.

**********************************************************************
* FORMA BASICA

*SELECT FROM ZTAB_FLIGHT_PWC
*FIELDS *
*WHERE FLIGHTDATE GE  '20260415' AND FLIGHTDATE LE '20250619'
*INTO TABLE @LT_FLIGHTS.
*
*IF SY-subrc = 0.
*OUT->write( LT_FLIGHTS ).
*ENDIF.


*BETWEEN

*SELECT FROM ZTAB_FLIGHT_PWC
*FIELDS *
*WHERE FLIGHTDATE BETWEEN '20260415' AND  '20250619'
*INTO TABLE @DATA(LT_FLIGHTS).
*
*IF SY-subrc = 0.
*OUT->write( LT_FLIGHTS ).
*ENDIF.

**********************************************************************
* IN para comparar un rango de valores

*SELECT FROM ZTAB_CARRIER_PWC
*FIELDS *
*WHERE carrier_id IN ( 'AA', 'CO', 'AV' )
*INTO TABLE @DATA(LT_FLIGHTS).
*
*IF SY-subrc = 0.
*OUT->write( LT_FLIGHTS ).
*ENDIF.
*
*SELECT FROM ZTAB_FLIGHT_PWC
*FIELDS *
*WHERE AIRLINEID IN ( 'AA', 'SQ', 'AZ' )
*INTO TABLE @DATA(LT_FLIGHTS1).
*
*IF SY-subrc = 0.
*OUT->write( LT_FLIGHTS1 ).
*ENDIF.
**********************************************************************
* IN CON TABLAS DE RANGOS

*DATA LR_PRICE TYPE RANGE OF /DMO/PRICE.
*
*LR_PRICE = VALUE #( ( SIGN = 'I'
*                    OPTION = 'BT'
*                    LOW = 500
*                    HIGH = 1500 )
*).
*
*APPEND VALUE #(  SIGN = 'I'
*                    OPTION = 'EQ'
*                    LOW = '4496.00'
*                     ) TO LR_PRICE.
*
*SELECT FROM ZTAB_FLIGHT_PWC
*FIELDS *
*WHERE PRICE IN @LR_PRICE
*AND CURRENCYCODE = 'USD'
*INTO TABLE @DATA(LT_FLIGHTS).
*
*IF SY-subrc = 0.
*OUT->write( LT_FLIGHTS ).
*ENDIF.


**********************************************************************
*MIN MAX

*SELECT FROM /DMO/I_FLIGHT
*FIELDS MIN( MaximumSeats ) as MinSeats,
*       max( MaximumSeats ) as MaxSeats
*into (  @data(lv_min_seats), @data(lv_max_seats) ).
*
*IF SY-subrc = 0.
*OUT->write( |Min seats : { lv_min_seats }; Max seats: { lv_max_seats }| ).
*ENDIF.
*
*
*SELECT FROM /DMO/I_FLIGHT
*FIELDS MIN( MaximumSeats ) as MinSeats,
*       max( MaximumSeats ) as MaxSeats
*into @data(ls_min_max).
*
*IF SY-subrc = 0.
*OUT->write( ls_min_max  ).
*ENDIF.

**********************************************************************
* AVG / SUM

*SELECT FROM /DMO/I_FLIGHT
*FIELDS AVG( MaximumSeats ) as AVGSeats,
*       SUM( MaximumSeats ) as SUMSeats
*WHERE AirLineID = 'AA'
*into (  @data(LV_AVG_Seats), @data(LV_SUM_Seats) ).
*
*IF SY-subrc = 0.
*OUT->write( |Media aritmetica : { LV_AVG_Seats }; La suma es: { LV_SUM_Seats }| ).
*ENDIF.

**********************************************************************
* DISTINC - elimina campos repetidos

**********************************************************************

**********************************************************************
* COUNT

*SELECT FROM /DMO/I_FLIGHT
*FIELDS
*COUNT( * ) AS COUNTALL,
*COUNT( DISTINCT MaximumSeats ) as COUNTMAXIMUNSEATS
*WHERE AirLineID = 'AA'
*into (  @data(LV_COUNT_ALL), @data(LV_DISTINCT_SEATS) ).
*
*IF SY-subrc = 0.
*OUT->write( |MCOUNT ALL : { LV_COUNT_ALL }; COUNT DISTINCT SEATS: { LV_DISTINCT_SEATS }| ).
*ENDIF.

**********************************************************************
* GROUP BY

*SELECT FROM /DMO/I_FLIGHT
*FIELDS AIRLINEID,
*COUNT( DISTINCT CONNECTIONID ) as COUNTDISTINCTCONN
*WHERE FLIGHTDATE = '20250621'
*GROUP BY AIRLINEID
*into TABLE @DATA(LT_RESULTS).
*
*IF SY-subrc = 0.
*OUT->write( LT_RESULTS ).
*ENDIF.

**********************************************************************
* ORDER BY
*    SELECT FROM /dmo/i_flight
*    FIELDS airlineid,
*    MIN( MaximumSeats ) AS MINSeats,
*    MAX( MaximumSeats ) AS MAXSeats
*    WHERE flightdate BETWEEN '20250621' AND '20260419'
*    GROUP BY airlineid HAVING  airlineid IN ( 'AA', 'LH', 'UA' )
*    INTO TABLE @DATA(lt_results1).
*
*    IF sy-subrc = 0.
*      out->write( lt_results1 ).
*    ENDIF.

**********************************************************************
* OFFSET

    DATA: lv_page_number      TYPE i VALUE 2,
          lv_records_per_page TYPE i VALUE 10.


    DATA gv_offset TYPE int8.

    gv_offset = ( lv_page_number - 1 ) * lv_records_per_page.

    SELECT FROM /dmo/i_flight
    FIELDS *
*    WHERE currencycode = 'USD'
    ORDER BY airlineid, connectionid, flightdate ASCENDING
    INTO TABLE @DATA(lt_results)
    OFFSET @gv_offset
    UP TO @lv_records_per_page ROWS.

    IF sy-subrc = 0.
      out->write( lt_results ).
    ELSE.

    out->write( 'NO HAY COLUMNAS DISPONIBLES PARA LA SIGUIENTE PAG' ).
    ENDIF.










  ENDMETHOD.

ENDCLASS..
