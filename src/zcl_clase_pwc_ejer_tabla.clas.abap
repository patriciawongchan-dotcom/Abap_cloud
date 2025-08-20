CLASS zcl_clase_pwc_ejer_tabla DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_EJER_TABLA IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA gv_emple type string.
FIELD-SYMBOLS: <gfs_emple>  TYPE string,
                   <gfs_emple2> TYPE zpwc_tab1.
*EJERCICIO1
 ASSIGN gv_emple TO <gfs_emple>.
    <gfs_emple> = 'Maria'.
*out->write( <gfs_emple> ).
out->write( GV_EMPLE ).

*LIBERA EL PUNTERO
UNASSIGN <gfs_emple>.
out->write( GV_EMPLE ).


*EJERCICIO2
SELECT FROM zpwc_tab1
           FIELDS *
           INTO TABLE @DATA(gt_emple).
   out->write( gt_emple ).


*EJERCICIO3

 LOOP AT gt_emple INTO DATA(gs_emple). " itera copiando cada fila en gs_emloyee ( estructura loca)
      gs_emple-email = 'estemailesmio@email.com'.     " cambia el email **solo en la copia**, no en gt_employees
*out->write( gs_emple ).
ENDLOOP.                                     " fin del bucle por copia ( no persiste camnos en la tabla )

    out->write( gs_emple ).
    out->write( |\n| ).
    out->write( data = gt_emple name = 'Structure' ). "Muestra gt_employees "(deberia seguir sin cambios) "

LOOP AT gt_emple ASSIGNING <gfs_emple2>.    " Itera ASSIGNING haciendo referencia a la fila real de gt_employees
      <gfs_emple2>-email = 'nuevo@email.com'.       " Modifica el email **en la fila real** de gt_employees
    ENDLOOP.                                           " Fin del bulcle por referencia ( si persisten los cambios)
    out->write( |\n| ).
    out->write( data = gt_emple name = 'Field symbols' ). "Muestra gt_employees ya con los emails modificados
*EJERCICIO4
 append INITIAL LINE TO gt_emple ASSIGNING FIELD-SYMBOL(<lfs_employee_apd>).

    <lfs_employee_apd> = value #(
                                mandt         = sy-mandt
                               id            = 00000005
                               first_name    = 'Patricia'
                                last_name     = 'Wong'
                               email         = 'patriwong@mimail.es'
                                phone_number  = 60986532
                                salary        = '10000'
                                currency_code = 'EUR'     ).
 out->write( gt_emple ).

*EJERCICIO5

INSERT INITIAL LINE INTO gt_emple ASSIGNING FIELD-SYMBOL(<lfs_employee_into>) INDEX 2.

    <lfs_employee_into> = VALUE #(
                                mandt         = sy-mandt
                                id            = 00000006
                               first_name    = 'Lulu'
                                last_name     = 'Lopez'
                                email         = 'lulu@experis.es'
                                phone_number  = 569652
                               salary        = '12000'
                                currency_code = 'EUR'     ).
 out->write( gt_emple ).

*EJERCICIO6

READ TABLE gt_emple ASSIGNING FIELD-SYMBOL(<lfs_employee_rd>) WITH KEY first_name = 'Mario'.

    <lfs_employee_rd>-last_name = 'WONG'.
    <lfs_employee_rd>-email      = 'MARIO.WONG@expris.es '.

    out->write( data =  gt_emple name = 'TABLA GT_EMPLE' ).

ENDMETHOD.
ENDCLASS.
