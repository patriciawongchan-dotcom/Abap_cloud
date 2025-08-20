CLASS zcl_clase_pwc_obj_anom DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_OBJ_ANOM IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

*OBJETOS ANONIMOS

DATA(lr_dato01) = NEW i( 123 ).  " creamos un objeto de datos anonimo de tipo i
    " inizializamos a 123 y guarda un "ref to" i en lr_dato01


    DATA(lr_dato02) = NEW ZPWC_TAB1( id = 10005 first_name = 'Sofia' ). "creamos una estructura anonima de tipo ztab_bd_der
    " con los valores  ( id = 10005 first_name = 'Sofia' )  y guarda una "ref to" a ztab_bd_der

     out->write( lr_dato01 ).
    out->write( lr_dato02 ).

SELECT *
FROM ZPWC_TAB1
INTO TABLE NEW @DATA(LR_DATA03). "CREA UNA TABLA INTERNA ANONIMA CON EL RESULTADO Y DEVUELVE UNA 'REF TO' EN LR_DATA03
out->write( LR_DATA03 ).

SELECT
SINGLE *
FROM ZPWC_TAB1
INTO NEW @DATA(LR_DATA04). "Crea una estructura anonima con esa fila y devuelve un 'ref to' a LR_DATA04

out->write( LR_DATA04 ).

*Sentencia dinamica con ASSIGN
*utiles cuando queremos asignar un valor que no sabemos hasta el tiempo de ejecucion

TYPES: BEGIN OF lty_data,
       field1 type i,
       field2 type string,
       field3 type string,
END OF lty_data.

DATA: ls_data TYPE lty_data,
      lt_data type table of lty_data WITH EMPTY KEY.

ls_data = value #(
 field1 = 1
 field2 = 'aaa'
 field3 = 'z' ).

APPEND ls_data TO lt_data.

DATA(lr_data) = new lty_data( "crea referencia de datos a una estructura anonima, inicia con los valores 2,bbb e y
 field1 = 2
 field2 = 'bbb'
 field3 = 'y' ).

FIELD-SYMBOLS <lfs_generic> type data. "field symbol generico(tipo dinamico)

ASSIGN ls_data-('field1') TO <lfs_generic>. "asigna por 'nombre dinamico' el comp. field1 de ls_data

out->write( <lfs_generic> ). "->muestra1

ASSIGN lt_data[ 1 ]-('field1') to <lfs_generic>. "toma la fila 1 de lt_data y su comp. field1
out->write( <lfs_generic> ). " -> muestra 1
* otra forma: ASSIGN lt_data[ 1 ]-field1 to <lfs_generic>.

*----IMPORTANTE AL TRABAJAR CON REFERENCIAS DE DATOS USAR EL COMPONENT ------
ASSIGN COMPONENT 'field2' of STRUCTURE lr_data->* to <lfs_generic>. "accede a field2 de la estructura referenciada

out->write( <lfs_generic> ). " -> muestra y


ASSIGN COMPONENT 'field3' of STRUCTURE lr_data->* to <lfs_generic>."accede a field3 de la estructura referenciada

out->write( <lfs_generic> ). " -> muestra y

DATA lv_field type string value 'field2'.

ASSIGN ls_data-(lv_field) to <lfs_generic>. "Asignacion por 'nombre de variable' field2
out->write( <lfs_generic> ). "muestra aaa

ASSIGN ('ls_data-field1') to  <lfs_generic> . "Asignacion por 'nombre absoluto' en cadena
out->write( <lfs_generic> ). "nuestra1

ASSIGN ls_data-(3) to  <lfs_generic> . "Asignacion por 'posicion' (3=field3)
out->write( <lfs_generic> ). "nuestraz

ENDMETHOD.
ENDCLASS.
