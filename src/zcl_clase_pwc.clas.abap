CLASS zcl_clase_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

 "---------------------- Primera parte sentencia de bloqueo-----------------------------
    out->write( 'El usuario ha empezado el programa' ). " AÑADIDA
    TRY.

        DATA(lo_lock_object) = cl_abap_lock_object_factory=>get_instance( EXPORTING iv_name = 'EZ_BLOK_DER' ).
      CATCH cx_abap_lock_failure.
             out->write( 'El objeto instance no se ha creado' ).
             RETURN. " AÑADIDA
    ENDTRY.


        DATA lt_parameter TYPE if_abap_lock_object=>tt_parameter.
        lt_parameter = VALUE #( (   name = 'ID'
                                   value = REF #( '00000001' ) )
                                    ).
 TRY. " AÑADIDA
        lo_lock_object->enqueue(
*               it_table_mode =
         it_parameter  =  lt_parameter
*               _scope       =
               _wait         = abap_true
        ).
      CATCH cx_abap_foreign_lock  cx_abap_lock_failure.

        out->write( 'El objeto ya esta siendo tratado por otro usuario ' ).
        "return. " AÑADIDA
    ENDTRY.

    out->write( 'El objeto ya esta disponible' ).

    "--------------- segunda parte , "intento" crear una nueva fila----------------------------

    DATA ls_new_registro TYPE ztab_eje1_der.

    ls_new_registro  =  VALUE #(
                                  mandt         = '100'
                                  id            = '00000006'
                                  first_name    = 'Daniela'
                                  last_name     = 'RUIZ'
                                  email         = 'lauram@example.com'
                                  phone_number  = '38512369'
                                  salary        = '2000.30'
                                  currency_code = 'EUR' ).

wait up to 20 seconds.

    MODIFY ztab_eje1_der FROM @ls_new_registro.

    "---------------- tercera parte, liberación del objeto.---------------------------------------

    IF sy-subrc = 0.
      out->write( 'El la base de datos ha sido actualizado ' ).
    ENDIF.

    TRY.
        lo_lock_object->dequeue( it_parameter = lt_parameter ).
      CATCH cx_abap_lock_failure.
        out->write( 'El objeto no ha sido liberado' ).
    ENDTRY.
    out->write( 'El objeto ha sido liberado' ).


ENDMETHOD.
ENDCLASS.
