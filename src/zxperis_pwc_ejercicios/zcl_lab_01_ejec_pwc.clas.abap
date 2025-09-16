CLASS zcl_lab_01_ejec_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_ejec_pwc IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.


***********************EJERCICIO 2 ***********************************************
*DATA(LO_DATE) = NEW zcl_lab02_product_pwc( ).
*
*
*lo_DATE->set_product( EXPORTING i_product = 'ESTE ES EL PRODUCTO' ).
*LO_DATE->set_creationdate( EXPORTING I_CREATION_DATE = '20250101' ).

**********************************************************************
*************************EJERCICIO 4 *********************************************

*DATA(LO_AGE) = NEW zcl_lab_04_person_pwc( ).
*
*LO_AGE->set_age( EXPORTING iv_age = ' 10 ' ).
*
*LO_AGE->get_age( IMPORTING  ev_age =  DATA(NEW_AGE) ).
*
*
*out->write( NEW_AGE ).

**********************************************************************

*********************** EJERCICIO 6 ***********************************************

*DATA(LO_FLIGHT) = NEW zcl_lab_05_flight_pwc(  ).
*
*DATA(lv_result) = LO_FLIGHT->check_flight(
*                    iv_carrier_id    = 'SQ'
*                    iv_connection_id = '0900'
*                  ).
*
*IF lv_result = abap_true.
*
*out->write( 'EL REGISTRO EXISTE' ).
*ELSE.
*out->write( 'EL REGISTRO NO EXISTE' ).
*ENDIF.
**********************************************************************
************************* EJERCICIO 7 *********************************************
*DATA(LO_OBJECT) = NEW zcl_lab_06_elements_pwc(  ).
*
*DATA LS_OBJECT  TYPE zcl_lab_06_elements_pwc=>ty_elem_objects.
**DATA(ls_object) TYPE zcl_lab_06_elements=>ty_elem_objects.
*
*
*LS_OBJECT-class = 'CLASE 06'.
*LS_OBJECT-instance = 'INT01'.
*LS_OBJECT-reference = 'REF01'.
*
*LO_OBJECT->set_object( is_object = LS_OBJECT ).
*
*out->write( |Clase: { LO_OBJECT->ms_object-class }| ).
*out->write( |Instancia: { LO_OBJECT->ms_object-instance }| ).
*out->write( |Referencia: { LO_OBJECT->ms_object-reference }| ).
*
*************************** EJERCICIO 8 ********************************************
*out->write( '\n' ).
*out->write( '\n' ).
*out->write( |Clase: { zcl_lab_06_elements_pwc=>c_class_name }| ).
*out->write( |Instancia: { zcl_lab_06_elements_pwc=>c_instance_id }| ).
*out->write( |Referencia: { zcl_lab_06_elements_pwc=>c_reference_code }| ).
*out->write( |Version: { zcl_lab_06_elements_pwc=>c_version }| ).

***********************EJERCICIO 09***********************************************

*DATA(LO_RECORD) = NEW zcl_lab_08_work_record_pwc( ).
*
*LO_RECORD->open_new_record( EXPORTING  iv_date = cl_abap_context_info=>get_system_date(  )
*                                                       IV_FIRTS_NAME = 'Jhon'
*                                                       iv_last_name  = 'Smith' ).


**************************EJERCICIO 10********************************************
DATA(LO_ACCOUNT) = NEW zcl_lab_09_ACCOUNT_pwc( ).

LO_ACCOUNT->set_iban( iban = 'ES34 0022 2255 2233 9999' ).

LO_ACCOUNT->get_iban(
            IMPORTING IBAN = DATA(LV_IBAN) ).


OUT->write( LV_IBAN ).


ENDMETHOD.


ENDCLASS..
