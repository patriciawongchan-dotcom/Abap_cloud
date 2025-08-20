CLASS zcl_clase_pwc_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lv_string TYPE string value ' Hola ' ,
          lv_date   TYPE d,
          lv_time type t,
          lv_int    TYPE i,
          lv_dec    TYPE p LENGTH 8 decimals 2 value '444.34'.

DATA: lv_nombre type string,
      lv_edad type i,
      lv_dni type string,
      lv_nacimiento type d.



lv_int = 123456.

out->write( lv_string ).

out->write( | variable 1 = { lv_string } variable 2 = { lv_int }| ).

lv_date = cl_abap_context_info=>get_system_date( ).

lv_time = cl_abap_context_info=>get_system_time( ).

out->write( lv_date ).

out->write( lv_time ).

lv_time = cl_abap_context_info=>get_user_time_zone( ).

out->write( lv_time ).

ENDMETHOD.
ENDCLASS.
