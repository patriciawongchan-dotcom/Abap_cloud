CLASS zcl_clase_pwc_4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_4 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA:     lv_date   TYPE d,
          lv_date2   TYPE d value '20240622',
          lv_mes type string.

DATA: lv_cadena type  string value 'Tengo sueño',
      lv_contador type i.

DATA: lv_cadena1 type  string value 'Patricia Wong chan',
      lv_contador1 type i.

lv_contador1 = count(  val = lv_cadena1 sub = 'c' ).

out->write( lv_contador1 ).

lv_contador = numofchar( lv_cadena ). "cuenta caracteres de una variable

out->write( lv_contador ).

*lv_date = cl_abap_context_info=>get_system_date( ).
*lv_mes = lv_date2+4(2).
*
*out->write( lv_mes ).
*
*
*    lv_date = cl_abap_context_info=>get_system_date(  ).
*
*    lv_mes = lv_date2+4(2). " mes
*     out->write( lv_mes ).
*    lv_mes = lv_date2(4).
*     out->write( lv_mes ).
*    lv_mes = lv_date2+3.
*     out->write( lv_mes ).

ENDMETHOD.
ENDCLASS.
