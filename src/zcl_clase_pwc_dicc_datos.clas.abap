CLASS zcl_clase_pwc_dicc_datos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_DICC_DATOS IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA lv_nombre type zde_nombre_pwc.

lv_nombre = 'JUANITO'.

out->write( lv_nombre ).

DATA LS_EMPLEADO TYPE ZST_EMPLEADOS_PWC.

LS_EMPLEADO-empleado_id = '001'.
LS_EMPLEADO-nombre = LV_NOMBRE.

out->write( LS_EMPLEADO ).

out->write( LS_EMPLEADO-nombre ).


ENDMETHOD.
ENDCLASS.
