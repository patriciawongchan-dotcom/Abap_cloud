CLASS zcl_creador_objeto_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_creador_objeto_pwc IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
**********************************************************************
* DATA lo_contract type  ref to zcl_clase_creadora_obj_pwc.
* CREATE OBJECT lo_contarct.
**********************************************************************
*lo_contract = new #().
**********************************************************************

DATA(lo_contract) = new zcl_clase_creadora_obj_pwc(  ).
data lv_process type string.


if lo_contract is BOUND.
lo_contract->set_client( "cuando pones el nombre del metodo sin el parentesis shift + enter en el metodo q te sale
  EXPORTING
    iv_client   = 'experis'
    iv_location = space
  IMPORTING
   ev_status   = data(lv_status)
  CHANGING
    cv_process  = lv_process
).

lo_contract->get_client(
IMPORTING
ev_client = data(lv_client)

).

lo_contract->region = 'eu'.

ENDIF.

*lo_contract->get_client_name(
*  EXPORTING
*    iv_client_id   = '02'
*  RECEIVING
*    rv_client_name = data(lv_client_name)
*).

data(lv_client_name) = lo_contract->get_client_name( exporting iv_client_id = '01' ).

out->write( lv_client_name ).

if not lo_contract->get_client_name( iv_client_id = '02' ) is initial.
out->write( lo_contract->get_client_name( iv_client_id = '02' ) ).
ENDIF.

*out->write( |{ lv_client }-{ lv_status }-{ lv_process }-{ lo_contract->region } | ).
*
*
*zcl_clase_creadora_obj_pwc=>set_cntr_type( exporting iv_cntr_type = 'Construccion' ).
*
*zcl_clase_creadora_obj_pwc=>get_cntr_type( importing ev_cntr_type = data(lv_cntr_type) ).
*
*
*out->write( lv_cntr_type ).








ENDMETHOD.

ENDCLASS..
