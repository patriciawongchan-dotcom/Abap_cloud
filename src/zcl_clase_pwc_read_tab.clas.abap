CLASS zcl_clase_pwc_read_tab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_READ_TAB IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

*SELECT from /dmo/airport
*fields *
*WHERE country = 'DE'
*into table @DATA(lt_flights).
*
*if sy-subrc = 0.
*read TABLE lt_flights into data(ls_flight) index 1.
*
*out->write( data = lt_flights name = 'tabla de vuelos' ).
*
*out->write( data = ls_flight name = 'estructura  de vuelos' ).
*
*
*READ TABLE lt_flights into DATA(ls_flights2) index 4 TRANSPORTING airport_id city.
*
*out->write( data = ls_flights2 name = 'estructura  de vuelos' ).



*ENDIF.

SELECT from /dmo/airport
fields *
WHERE country = 'DE'
into table @DATA(lt_flights).

*if sy-subrc = 0.
*read TABLE lt_flights ASSIGNING FIELD-SYMBOL(<lfs_flihgt>) index 3.
*out->write( data = <lfs_flihgt> name = '<lfs_flihgt>' ).
*
*endif.

" FORMA MODERNA

DATA(ls_data) = lt_flights[ 2 ].
out->write( data = ls_data name = 'ls_data' ).

data(ls_data2) = VALUE #( lt_flights[ 2 ] default lt_flights[ 1 ] ).

if sy-subrc = 0.

read table lt_flights into data(ls_flight) with key city = 'Berlin'.
out->write( data = lt_flights name = 'lt_flights' ).
out->write( data = ls_flight name = 'ls_flight' ).


ENDIF.
DATA(ls_flight2) = lt_flights[ airport_id = 'MUC' ]-name.
out->write( data = ls_flight2 name = 'ls_flight2' ).

ENDMETHOD.
ENDCLASS.
