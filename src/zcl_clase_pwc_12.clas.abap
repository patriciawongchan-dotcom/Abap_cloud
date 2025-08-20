CLASS zcl_clase_pwc_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_12 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

*El programa debe:
*Eliminar los espacios sobrantes de la frase.
*Convertir la frase a minúsculas.
*Comprobar si la palabra "abap" aparece en ella.
*Si aparece, extraer solo esa
* palabra usando substring_from.
*Contar cuántos caracteres tiene la frase sin espacios iniciales/finales.
*Mostrar todos los resultados por consola.
*
*
*DATA lv_texto type string value '¡   Bienvenido a   ABAP Cloud, Daniel!   '.

DATA:  lv_texto type string value '¡   Bienvenido a   ABAP Cloud, Daniel!   ',
       lv_busca type i,
       lv_palabra type string value 'abap'.



CONDENSE lv_texto.

out->write( lv_texto ).

lv_texto = to_lower( lv_texto ).

out->write( |Frase en minúscula =  { lv_texto }  |  ).

lv_busca = find_any_of( val = lv_texto sub = lv_palabra ).
IF lv_busca > 0.

out->write( |Si existe la palabra { lv_palabra } en la frase { lv_texto } | ).

DATA(resultado) = substring_from( val = lv_texto  sub = 'abap' len = 4 ).
out->write( resultado ).


ELSE.

out->write( |NO existe la palabra { lv_palabra } en la frase { lv_texto } | ).

ENDIF.

DATA(lv_cantidad) = numofchar( lv_texto ).

out->write( |Cantidad de caracteres: { lv_cantidad }| ).

ENDMETHOD.
ENDCLASS.
