CLASS zcl_clase_pwc_tablas_der DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_TABLAS_DER IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

" Vaciar la tabla antes de cargar datos de ejemplo
*DELETE FROM zpwc_tab1.

" Insertar los registros
*MODIFY zpwc_tab1 FROM TABLE @(
*  VALUE #(
*    ( mandt         = '100'
*      id            = '00000001'
*      first_name    = 'Laura'
*      last_name     = 'Martinez'
*      email         = 'lauram@example.com'
*      phone_number  = '38512369'
*      salary        = '2000.30'
*      currency_code = 'EUR' )
*
*    ( mandt         = '100'
*      id            = '00000002'
*      first_name    = 'Mario'
*      last_name     = 'Martinez'
*      email         = 'marion@example.com'
*      phone_number  = '38512369'
*      salary        = '2000.30'
*      currency_code = 'EUR' )
*
*    ( mandt         = '100'
*      id            = '00000003'
*      first_name    = 'Daniela'
*      last_name     = 'Linares'
*      email         = 'daniela@example.com'
*      phone_number  = '38512369'
*      salary        = '2000.30'
*      currency_code = 'EUR' )
*
*    ( mandt         = '100'
*      id            = '00000004'
*      first_name    = 'Karol'
*      last_name     = 'Pérez'
*      email         = 'kperez@example.com'
*      phone_number  = '546987'
*      salary        = '5000.00'
*      currency_code = 'USD' )
*  )
*).

*delete from ztpwc_person.
*
MODIFY ztpwc_person FROM TABLE @(
  VALUE #(
    (
      mandt  = '100'
  id      = '0010'
  first_name   = 'Juan'
  last_name   = 'Perez'
  age         = 12
*include zst_pwc_addr with suffix _ad;
  currency_id = 'eur'
*@Semantics.amount.currencyCode : 'ztpwc_person.currency_id'
  amount = '100'
*@Semantics.quantity.unitOfMeasure : 'ztpwc_person.unit'
  quantity    = 100
  unit        = 'kg'
  calle = 'alcala'
  ciudad = 'madrid'

      )

      ) ).

insert ztpwc_person FROM TABLE @(
  VALUE #(
    (
      mandt  = '100'
  id      = '0013'
  first_name   = 'Maria'
  last_name   = 'Perez'
  age         = 12
*include zst_pwc_addr with suffix _ad;
  currency_id = 'eur'
*@Semantics.amount.currencyCode : 'ztpwc_person.currency_id'
  amount = '100'
*@Semantics.quantity.unitOfMeasure : 'ztpwc_person.unit'
  quantity    = 100
  unit        = 'kg'
  calle = 'alcala'
  ciudad = 'madrid'

      )

      ) ).

ENDMETHOD.
ENDCLASS.
