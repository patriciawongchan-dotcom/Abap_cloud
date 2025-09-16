CLASS zcl_crear_objeto_emp_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CREAR_OBJETO_EMP_PWC IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA PROCESO TYPE C LENGTH 1.
* 1 - CREAR
* 2 - MODIFICAR
* 3 - BUSCAR

PROCESO = '4'.

CASE PROCESO.

WHEN '1'.
*DELETE from ztab_emp_pwc.
 data(lo_emp_crear) = new zcl_02_class_pwc(
   iv_nombre          = 'LOLA'
   iv_apellido        = 'SOLER'
   iv_telefono        = '608630263'
   iv_experiencia     = 2
   iv_certificaciones = 1
 ).


DATA(LV_ALTA) = lo_emp_crear->alta_empleado( ).
OUT->write( LV_ALTA ).

WHEN '2'.

data(lo_emp_modif) = new zcl_02_class_pwc(
  iv_id_empleado     =  3
  iv_nombre          = 'nom modif4'
  iv_apellido        = 'ape modif4'
  iv_telefono        = '609863652'
  iv_experiencia     = 4
  iv_certificaciones = 2
).
DATA(LV_MODIF) = LO_EMP_MODIF->modif_emp( ).
OUT->write( LV_MODIF ).

WHEN '3'.

data(lo_buscar) = new zcl_02_class_pwc(
  iv_id_empleado     = 1
  iv_nombre          = 'nom modif4'
  iv_apellido        = 'ape modif4'
  iv_telefono        = '609863652'
  iv_experiencia     = 4
  iv_certificaciones = 2
).
data resp type string.
data(lv_buscar) = lo_buscar->buscar_reg(
                    IMPORTING
                      ev_result = resp
                  ).
out->write( resp ).
out->write( lv_buscar ).

WHEN '4'.

DATA(N_REG) = NEW zcl_02_class_pwc(
*  iv_id_empleado     =
  iv_nombre          = 'nom modif4'
  iv_apellido        = 'ape modif4'
  iv_telefono        = '609863652'
  iv_experiencia     = 4
  iv_certificaciones = 2
).

DATA(NU_REG) = N_REG->listar_reg( iv_num_reg = 3 ).

out->write( NU_REG ).

ENDCASE.

ENDMETHOD.
ENDCLASS.
