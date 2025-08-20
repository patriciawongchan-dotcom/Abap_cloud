CLASS zcl_clase_pwc_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_16 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

   " Declaramos la cadena original con los nombres separados por espacios
    DATA(lv_string) = 'daniel Fernando Pedro ramon Sergio'.

    " Quitamos espacios duplicados y espacios al principio/final si los hubiera
    CONDENSE lv_string."""""""""""""""" lo mismo con funcion split"""""""""""""""""""""""""
    DATA: lv_nombre1 TYPE string,
          lv_nombre2 TYPE string,
          lv_nombre3 TYPE string,
          lv_nombre4 TYPE string,
          lv_nombre5 TYPE string.

    " Extraer los nombres usando SPLIT
    SPLIT lv_string AT space  INTO  lv_nombre1 lv_nombre2 lv_nombre3 lv_nombre4 lv_nombre5.

    """""""""""""" SEGUNDA PARTE DEL EJERCICIO """"""""""""""""




   " DATA(lv_nombre) = lv_nombre2.

   " DATA(lv_longitud) = strlen( lv_nombre ).

    DATA(data_num) = 1.



DO.
data(lv_text) = 'lv_nombre' && data_num .
DATA(lv_nombre) = lv_text.
out->write( lv_nombre ).
data_num = data_num + 1.
DATA(lv_longitud) = strlen( lv_nombre ).
out->write( lv_longitud ).
check data_num > 5.

ENDDO.

*
*
*    IF lv_longitud > 7.
*      " Si tiene más de 7 caracteres, asumimos que es Fernando
*      out->write( 'Hola Fernando' ).
*
*    ELSEIF lv_longitud = 6.
*      " Si tiene 6 caracteres puede ser Sergio o Daniel
*      IF lv_nombre = 'Sergio'.
*        out->write( 'Hola Sergio' ).
*      ELSEIF lv_nombre = 'daniel'.
*        out->write( 'Hola Daniel' ).
*      ENDIF.
*
*    ELSE.
*      " Si no es ninguno de los anteriores, asumimos que es Pedro
*      out->write( 'Hola Pedro' ).
*
*      " Convertimos el nombre a mayúsculas
*      lv_nombre = to_upper( lv_nombre ).
*
*      " Mostramos el nombre en mayúsculas
*      out->write( |Nombre en mayúsculas: { lv_nombre }| ).
*    ENDIF.
*
*
ENDMETHOD.
ENDCLASS.
