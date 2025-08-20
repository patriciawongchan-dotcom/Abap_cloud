CLASS zcl_clase_pwc_case DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_CASE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lv_cliente) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  ) min = 1 max = 3 )->get_next(  ).

    out->write( lv_cliente ).

    CASE lv_cliente.

      WHEN 1.

        out->write( lv_cliente ).
        out->write( 'el cliente es el 1' ).

      WHEN 2.
        out->write( lv_cliente ).
        out->write( 'el cliente es el 2' ).

      WHEN 3.

        out->write( lv_cliente ).
        out->write( 'el cliente es el 3' ).
      WHEN OTHERS.
        out->write( lv_cliente ).
        out->write( 'el cliente no se ha registrado ' ).
    ENDCASE.


  ENDMETHOD.
ENDCLASS.
