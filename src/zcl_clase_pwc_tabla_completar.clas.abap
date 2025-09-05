CLASS zcl_clase_pwc_tabla_completar DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_TABLA_COMPLETAR IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
get time stamp field
data(lv_timestamp_begin).

DELETE FROM ztab_invoice_pwc.

    DO 100000 TIMES.

      MODIFY ztab_invoice_pwc FROM TABLE @( VALUE #(

                                    ( invoice_id = sy-index
                                      comp = '1010'
                                      customer = 'coca-cola'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '1000'
                                      currency_key = 'USD' )

                                    ( invoice_id = sy-index
                                      comp = '1020'
                                      customer = 'Pepsi'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '2000'
                                      currency_key = 'USD' )


                                    ( invoice_id = sy-index
                                      comp = '1030'
                                      customer = 'patatas'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '500'
                                      currency_key = 'USD' )

                                    ( invoice_id = sy-index
                                      comp = '1040'
                                      customer = 'Piña'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '1000'
                                      currency_key = 'USD' )

                                    ( invoice_id = sy-index
                                      comp = '1050'
                                      customer = 'Manzana'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '1000'
                                      currency_key = 'EUR' )


       ) ).



    ENDDO.

    get time stamp field data(lv_timestamp_end).

    data(lv_dif_sec) = cl_abap_tstmp=>subtract(  exporting tstmp1 = lv_timestamp_end
                                                            tstmp2 = lv_timestamp_begin ).


ENDMETHOD.
ENDCLASS.
