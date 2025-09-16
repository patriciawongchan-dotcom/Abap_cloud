CLASS zcl_pwc_luw DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pwc_luw IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

**********************************************************************
*COMMIT Y ROLLBACK

UPDATE ZTAB_CARRIER_PWC
SET CURRENCY_CODE = 'EUR'
WHERE CARRIER_ID = 'AA'.


IF SY-SUBRC = 0.

SELECT SINGLE FROM ZTAB_CARRIER_PWC
FIELDS *
WHERE CARRIER_ID = 'AA'
INTO @DATA(LS_AIRLINES).

IF SY-SUBRC = 0.
out->write( LS_AIRLINES-currency_code ).

ENDIF.

ENDIF.
DELETE FROM ZTAB_CARRIER_PWC.
COMMIT WORK.

CONSTANTS LC_CURRENCY TYPE C LENGTH 3 VALUE 'USD' .
SELECT FROM ZTAB_CARRIER_PWC
FIELDS *
INTO TABLE @DATA(LT_AIRLINES).
IF SY-SUBRC = 0.

LOOP AT lt_airlines ASSIGNING FIELD-SYMBOL(<ls_airlines>).

        "CLEAR <ls_airlines>-name.
        <ls_airlines>-currency_code = lc_currency.
      ENDLOOP.

      UPDATE ztab_carrier_der FROM TABLE @lt_airlines.

      IF sy-subrc = 0.
        out->write(  |Todos los registros han sido actualizados con el nuevo currency { lc_currency }| ).
      ENDIF.
    ENDIF.


ENDMETHOD.

ENDCLASS..
