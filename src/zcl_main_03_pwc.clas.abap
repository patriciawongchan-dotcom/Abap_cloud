CLASS zcl_main_03_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_main_03_pwc IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
*
*DATA(LO_EMPLOYEE1) = NEW zcl_03_class_pwc( IV_EMPLOYEE_ID = '01' ).
*OUT->write( LO_EMPLOYEE1->get_employee_id(  ) ).
*
*
*DATA(LO_EMPLOYEE2) =  NEW zcl_03_class_pwc( IV_EMPLOYEE_ID = '02' ).
*OUT->write( LO_EMPLOYEE2->get_employee_id(  ) ).
*
*
*OUT->write( zcl_03_class_pwc=>company ).

data(lo_company) = new zcl_04_class_PWC(  ).
data(lo_pant) = new zcl_05_class_PWC(  ).
data(lo_storage_location) = new zcl_06_class_pwc(  ).


lo_company->set_company_code( '1234' ).
lo_company->set_currency( 'USD' ).

LO_COMPANY->get_company_code( IMPORTING EV_COMPANY_CODE = DATA(LV_COMPANY_CODE) ).
LO_COMPANY->get_currency( IMPORTING EV_CURRENCY = DATA(LV_CURRENCY) ).

OUT->write( |{ LV_COMPANY_CODE } - { LV_CURRENCY }| ).


lo_pant->set_company_code( '5678' ).
lo_pant->set_currency( 'EUR' ).

lo_pant->get_company_code( IMPORTING EV_COMPANY_CODE = DATA(LV_COMPANY_CODE_H) ).
lo_pant->get_currency( IMPORTING EV_CURRENCY = DATA(LV_CURRENCY_H) ).

OUT->write( |{ LV_COMPANY_CODE_H } - { LV_CURRENCY_H }| ).

lo_storage_location->set_company_code( '0000' ).
lo_storage_location->set_currency( 'USD' ).

lo_storage_location->get_company_code( IMPORTING EV_COMPANY_CODE = DATA(LV_COMPANY_CODE_N) ).
lo_storage_location->get_currency( IMPORTING EV_CURRENCY = DATA(LV_CURRENCY_N) ).

OUT->write( |{ LV_COMPANY_CODE_N } - { LV_CURRENCY_N }| ).







ENDMETHOD.

ENDCLASS..
