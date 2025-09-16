CLASS zcl_f_m_objetos__impoler_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_f_m_objetos__impoler_pwc IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

data(lo_perro) = new zcl_f_m_objetos_pwc(  ) .


if lo_perro is BOUND.

lo_perro->lv_nombre = 'Dante'.
lo_perro->lv_raza = 'Pastor suizo'.


out->write( lo_perro->ladrar( ) ).

lo_perro->lanzar_pelota(
RECEIVING
rv_accion = data(lv_Action) ).

out->write( lv_action ).


ENDIF.



ENDMETHOD.

ENDCLASS..
