CLASS zcl_clase_pwc_block_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_BLOCK_TABLE IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

**********************************************************************
* PRIMERO SENTENCIA DEL BLOQUEO

  out->write( 'El usuario ha empezado el programa' ).

  TRY.
        DATA(lo_lock_object) = cl_abap_lock_object_factory=>get_instance( EXPORTING iv_name = 'EZ_BLOCK_PWC' ).
out->write( Lo_lock_object ).

      CATCH cx_abap_lock_failure.
      out->write( 'El objeto INSTANCE no se ha creado' ).
      RETURN.

    ENDTRY.



        DATA lt_parameter TYPE if_abap_lock_object=>tt_parameter.
        lt_parameter = VALUE #( (   name = 'ID'
                                   value = REF #( '0000000011' ) ) ).
TRY.
        lo_lock_object->enqueue(
*               it_table_mode =
         it_parameter  =  lt_parameter
*               _scope        =
*               _wait         =
        ).
      CATCH cx_abap_foreign_lock.
        out->write( 'foreing lock exception' ).
      CATCH cx_abap_lock_failure.
        out->write( 'El objeto ya esta siendo tratado por otro usuario ' ).
        RETURN.
    ENDTRY.

    out->write( 'El objeto ya esta disponible' ).

**********************************************************************
*SEGUNDA PARTE INTENTAMOS CREAR UN NUEVO REGISTRO EN LA TABLA

DATA LS_NEW_REGISTRO TYPE ZTPWC_PERSON.

LS_NEW_REGISTRO = VALUE #(

      mandt  = '100'
  id      = '0019'
  first_name   = 'Maria'
  last_name   = 'Perez'
  age         = 12
  currency_id = 'eur'
  amount = '100'
  quantity    = 100
  unit        = 'kg'
  calle = 'alcala'
  ciudad = 'madrid'

      ).
wait up to 30 seconds.

MODIFY ZTPWC_PERSON FROM @LS_NEW_REGISTRO.

**********************************************************************
* TERCERO: LIBERAR EL OBJETO

 IF SY-subrc = 0.
 out->write( 'LA BD HA SIDO ACTUALIZADA' ).
 ENDIF.

 TRY.
 lo_lock_object->dequeue( it_parameter = lt_parameter ).
 CATCH cx_abap_lock_failure.
 out->write( 'El objento no ha sido liberado' ).

 ENDTRY.
 out->write( 'El objeto ha sido liberado' ).












ENDMETHOD.
ENDCLASS.
