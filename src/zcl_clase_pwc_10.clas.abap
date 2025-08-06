CLASS zcl_clase_pwc_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_10 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

DATA: lv_string type string VALUE '¡EXPERIS! Welcome to ABAP Cloud Master',
lv_names type string value 'Ana Maria Juana Pepa',
lv_name type string value 'Ma'.

DATA(lv_num) = count(  val = lv_string sub = 'We' ) .

"count - devuelve el numero de caracteres encontrados-distingue mayusculas y minusculas

out->write( lv_num ).

"strlen - cuenta los numeros de caracteres

lv_num = strlen( '¡EXPERIS! Welcome to ABAP Cloud Master'  ).

out->write( lv_num ).

" count any off busca cadena mayuscula o minuscula

lv_num =  count_any_of(  val = lv_string sub = 'We' ) .

out->write( lv_num ).

" count_any_not_of

lv_num =  count_any_not_of(  val = lv_string sub = 'We' ) .

out->write( lv_num ).

" find te dice la pocision donde esta la primera cadena q se busca y empieza desde 0

lv_num = find( val = lv_names sub = lv_name ).
out->write( lv_num ).

" find_any_of



"find_any_not_of


" FUNCIONES DE PROCESAMIENTO

DATA: lv_cadena TYPE string.

lv_cadena = 'esto es el ejemplo'.
"MAY minus

out->write( |to_upper = { to_upper( lv_cadena ) } |  ).





ENDMETHOD.

ENDCLASS.
