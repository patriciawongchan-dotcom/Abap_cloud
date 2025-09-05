CLASS zcl_pwc_modify DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pwc_modify IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

**********************************************************************
*MODIFICACION DE UN UNICO REGISTRO CON EL MODIFY

DATA(LS_AIRLINE) = VALUE ZTAB_CARRIER_PWC( CARRIER_ID = 'UA'
                                            NAME = 'WIZZ AIR'
                                            CURRENCY_CODE = 'USD' ).

MODIFY ZTAB_CARRIER_PWC FROM @LS_AIRLINE.

if  SY-subrc = 0.
 out->write( 'EL REGISTRO HA SIDO INTRODUCIDO/MODIFICADO' ).

ELSE.

out->write( 'NO EJECUTADO' ).

ENDIF.






ENDMETHOD.

ENDCLASS..
