CLASS zcl_pwc_insertar_reg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pwc_insertar_reg IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

DATA ls_airline type ztab_carrier_pwc.
**********************************************************************
*INSERCION DE UN SOLO REGISTRO

*ls_airline = value #( carrier_id = 'AA'
*                       name = 'America airlines'
*                       currency_code = 'USD' ).
** INSERT INTO ztab_carrier_pwc VALUES @LS_AIRLINE. -> ESTA MEJOR NO USARLA
*INSERT ztab_carrier_pwc FROM @LS_AIRLINE. "USAR ESTA DE PREFERENCIA
*
*IF SY-SUBRC = 0.
*out->write( 'REGISTRO INSERTADO CORRECTAMENTE' ).
*ELSE.
*out->write( 'REGISTRO NO INSERTADO CORRECTAMENTE' ).
*
*ENDIF.

**********************************************************************
* INSERCION MULTIPLE REGISTRO

*DELETE FROM ZTAB_CARRIER_PWC.
*
*DATA LT_DDBB TYPE STANDARD TABLE OF ZTAB_CARRIER_PWC.
*
*SELECT FROM /DMO/I_CARRIER
*FIELDS *
*WHERE CURRENCYCODE = 'USD'
*INTO TABLE @DATA(LT_AIRLINES).
*
*
*IF SY-subrc = 0.
*LT_DDBB = CORRESPONDING #( LT_AIRLINES MAPPING CARRIER_ID = AirlineID
*                                                currency_code = CurrencyCode ).
*
*insert  ZTAB_CARRIER_PWC from table @lt_ddbb.
*
*IF SY-subrc = 0.
*out->write( |El numero de lineas insertadas es : { sy-dbcnt }| ).
*
*ENDIF.
*
*ENDIF.

**********************************************************************
* LO DE ARRIBA PERO MAS EFICIENTE.

DELETE FROM ZTAB_CARRIER_PWC.


DATA LT_DDBB TYPE STANDARD TABLE OF ZTAB_CARRIER_PWC.


SELECT FROM /DMO/I_CARRIER
FIELDS AirlineID as carrier_id, name, CurrencyCode as currency_code
WHERE CURRENCYCODE = 'USD'
INTO CORRESPONDING FIELDS OF
TABLE @lt_ddbb.

IF SY-subrc = 0.

try.
insert  ZTAB_CARRIER_PWC from table @lt_ddbb.
*controla cuando no se ha podido hacer el insert

catch cx_sy_open_sql_db into data(lx_sql_db).
out->write( lx_sql_db->get_text(  ) ).
return.
ENDTRY.


IF SY-subrc = 0.
out->write( |El numero de lineas insertadas es : { sy-dbcnt }| ).

ENDIF.

ENDIF.












ENDMETHOD.

ENDCLASS..
