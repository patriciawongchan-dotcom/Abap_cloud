CLASS zcl_clase_pwc_3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA: lv_string TYPE string VALUE ' Hola ',
*          lv_date   TYPE d,
*          lv_time   TYPE t,
*          lv_int    TYPE i,
*          lv_dec    TYPE p LENGTH 8 DECIMALS 2 VALUE '444.34'.
*
*    DATA: lv_nombre     TYPE string,
*          lv_edad       TYPE i,
*          lv_dni        TYPE string,
*          lv_nacimiento TYPE d.
*
*
*
*    lv_int = 123456.
*
*    out->write( lv_string ).
*
*    out->write( | variable 1 = { lv_string } variable 2 = { lv_int }| ).
*
*    lv_date = cl_abap_context_info=>get_system_date( ).
*
*    lv_time = cl_abap_context_info=>get_system_time( ).
*
*    out->write( lv_date ).
*
*    out->write( lv_time ).
*
*    lv_time = cl_abap_context_info=>get_user_time_zone( ).
*
*    out->write( lv_time ).

    " OPERACIONES MATEMATICAS CON VARIABLES

    DATA: lv_num1 TYPE i,
          lv_num2 TYPE i,
          lv_num3 TYPE i,
          lv_numf type f.

    lv_num1 = 2.
    lv_num2 = 7.

    lv_num3 = lv_num1 + lv_num2.

    out->write( lv_num3 ).

    out->write( | La suma de { lv_num1 } + { lv_num2 } es igual a { lv_num3 } | ).

    lv_num3 = lv_num1 - lv_num2.

    out->write( | Oper { lv_num1 } - { lv_num2 } = { lv_num3 } | ).

    lv_num3 = lv_num1 * lv_num2.

    out->write( | Oper { lv_num1 } * { lv_num2 } = { lv_num3 } | ).


    lv_num3 = lv_num1 / lv_num2.

    out->write( | Oper { lv_num1 } / { lv_num2 } = { lv_num3 } | ).


    lv_num3 = lv_num2 / lv_num1.

    out->write( | Oper { lv_num2 } / { lv_num1 } = { lv_num3 } | ).

    lv_numf = lv_num2 / lv_num1.

    out->write( | Oper con f { lv_num2 } / { lv_num1 } = { lv_numf } | ).

    lv_num2 = 10.

    lv_num3 = lv_num2 / lv_num1.

    out->write( | Oper { lv_num2 } / { lv_num1 } = { lv_num3 } | ).


lv_num2 = 10.
lv_num1 = 3.

    lv_num3 = lv_num2 / lv_num1.

    out->write( | Oper { lv_num2 } / { lv_num1 } = { lv_num3 } | ).

lv_numf = lv_num2 / lv_num1.

    out->write( | Oper con f { lv_num2 } / { lv_num1 } = { lv_numf } | ).


*lv_num2 = 10.
*lv_num1 = 0. esto no va por el 0
*
*    lv_num3 = lv_num2 / lv_num1.
*
*    out->write( | Oper { lv_num2 } / { lv_num1 } = { lv_num3 } | ).

  ENDMETHOD.
ENDCLASS.
