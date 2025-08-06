CLASS zcl_clase_pwc_case_calculadora DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_case_calculadora IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(lv_alea) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  ) min = 1 max = 4 )->get_next(  ).

    DATA(lv_var1) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  ) min = 1 max = 100 )->get_next(  ).

    DATA(lv_var2) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  ) min = 1 max = 100 )->get_next(  ).

    DATA  lv_resul type i.

    out->write( lv_var1 ).
    out->write( lv_var2 ).


    CASE lv_alea.

      WHEN 1.

        out->write( 'SUMA' ).
        lv_resul = lv_var1 + lv_var2.
        out->write( | { lv_var1 } + { lv_var2 } = { lv_resul }| ).

      WHEN 2.
out->write( 'RESTA' ).
        lv_resul = lv_var1 - lv_var2.
        out->write( | { lv_var1 } - { lv_var2 } = { lv_resul }| ).


      WHEN 3.
out->write( 'MULTIPLICACION' ).
        lv_resul = lv_var1 * lv_var2.
        out->write( | { lv_var1 } * { lv_var2 } = { lv_resul }| ).


      WHEN 4.

      out->write( 'DIVISION' ).
        lv_resul = lv_var1 / lv_var2.
        out->write( | { lv_var1 } / { lv_var2 } = { lv_resul }| ).


    ENDCASE.


  ENDMETHOD.

ENDCLASS.
