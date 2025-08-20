CLASS zcl_clase_pwc_6 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_6 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

CONSTANTS: lc_pais type string value 'España',
           lc_moneda type string VALUE 'EUR',
           lc_iva TYPE p DECIMALS 3 VALUE '21.09'.

DATA: lv_pais type string value 'España'.

lv_pais = 'Francia'.




out->write( lc_iva ).


ENDMETHOD.
ENDCLASS.
