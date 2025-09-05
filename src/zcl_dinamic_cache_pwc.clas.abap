CLASS zcl_dinamic_cache_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dinamic_cache_pwc IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

GET TIME STAMP FIELD data(lv_timestamp_begin).

SELECT FROM ZTAB_INVOICE_PWC
FIELDS COMP, CURRENCY_KEY, SUM( AMOUNT )
AS TOTALAMOUNT
GROUP BY COMP, CURRENCY_KEY
INTO TABLE @DATA(LT_INVOICES).

IF SY-subrc = 0.

GET TIME STAMP FIELD data(lv_timestamp_end).

data(lv_dif_sec) = cl_abap_tstmp=>subtract( exporting tstmp1 = lv_timestamp_end tstmp2 = lv_timestamp_begin ).

out->write( |Número de registros: { lines( LT_INVOICES ) }| ).
out->write( LT_INVOICES ).
out->write( |Tiempo de ejecucion total: { lv_dif_sec }| ).

ENDIF.



ENDMETHOD.

ENDCLASS.
