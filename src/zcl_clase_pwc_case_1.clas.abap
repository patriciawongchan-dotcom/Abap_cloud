CLASS zcl_clase_pwc_case_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_CASE_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lv_aleatorio) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  ) min = 1 max = 4 )->get_next(  ).

    DATA: lv_nombre1 type string value 'Daniel',
          lv_nombre2 type string value 'Pedro',
          lv_nombre3 type string value 'Diego',
          lv_nombre4 type string value 'Sara',
          lv_nombre type string.

if lv_aleatorio = 1.

lv_nombre = lv_nombre1.
out->write( lv_aleatorio ).

ELSEIF lv_aleatorio = 2.

lv_nombre = lv_nombre2.
out->write( lv_aleatorio ).

ELSEIF lv_aleatorio = 3.
lv_nombre = lv_nombre3.
out->write( lv_aleatorio ).

else.

lv_nombre = lv_nombre4.
out->write( lv_aleatorio ).

ENDIF.


out->write( | Hola { lv_nombre } | ).
*

*    CASE lv_aleatorio.
*
*      WHEN 1.
*
*        out->write( lv_cliente ).
*        out->write( 'el cliente es el 1' ).
*
*      WHEN 2.
*        out->write( lv_cliente ).
*        out->write( 'el cliente es el 2' ).
*
*      WHEN 3.
*
*        out->write( lv_cliente ).
*        out->write( 'el cliente es el 3' ).
*      WHEN OTHERS.
*        out->write( lv_cliente ).
*        out->write( 'el cliente no se ha registrado ' ).
*    ENDCASE.


  ENDMETHOD.
ENDCLASS.
