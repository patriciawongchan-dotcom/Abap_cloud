CLASS zcl_clase_pwc_new_ejem DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*atributos publicos accesibles desde fuera de la clase
DATA: lv_name type string,
      lv_age type i.

*definicion del metodo constructor que recibe parametros de entrada
METHODS: constructor IMPORTING iv_name type string
                               iv_age type i.


  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_NEW_EJEM IMPLEMENTATION.


METHOD constructor.

lv_age = iv_age. "asigna el valor recibido a la variable lv_age

lv_name = iv_name. "asigna el valor recibido a la variable lv_name


ENDMETHOD.


METHOD if_oo_adt_classrun~main.

out->write( 'Hola mundo' ).

ENDMETHOD.
ENDCLASS.
