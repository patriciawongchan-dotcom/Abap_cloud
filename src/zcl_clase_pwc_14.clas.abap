CLASS zcl_clase_pwc_14 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_14 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lv_string) = 'daniel Fernando Pedro ramon Sergio'.

    "declaramos variables para almacenar cada nombre
    DATA : lv_nombre1 TYPE string,
           lv_nombre2 TYPE string,
           lv_nombre3 TYPE string,
           lv_nombre4 TYPE string,
           lv_nombre5 TYPE string.

    " quitamos espacios duplicados y espacios al principio/final si los hubiera
    CONDENSE lv_string.

    "buscamos la posicion del primer espacio

    DATA(lv_pos1) = find( val = lv_string sub = | | ).

    "extraemos el primer nombre desde la posicion 0 hasta antes del primer espacio
    lv_nombre1 = substring( val = lv_string off = 0 len = lv_pos1 ).

    "obtenemos el resto de la cadena despues del primer espacio
    DATA(lv_rest1) = substring_after( val = lv_string sub = | | ).

    " Buscamos el siguiente espacio en la nueva subcadena
    DATA(lv_pos2) = find( val = lv_rest1 sub = | | ).

    " Extraemos el segundo nombre
    lv_nombre2 = substring( val = lv_rest1 off = 0 len = lv_pos2 ).

    " Repetimos el proceso para extraer el tercer nombre
    DATA(lv_rest2) = substring_after( val = lv_rest1 sub = | | ).
    DATA(lv_pos3) = find( val = lv_rest2 sub = | | ).
    lv_nombre3 = substring( val = lv_rest2 off = 0 len = lv_pos3 ).

    " Repetimos el proceso para extraer el cuarto nombre
    DATA(lv_rest3) = substring_after( val = lv_rest2 sub = | | ).
    DATA(lv_pos4) = find( val = lv_rest3 sub = | | ).
    lv_nombre4 = substring( val = lv_rest3 off = 0 len = lv_pos4 ).

    " El quinto nombre es lo que queda después del último espacio
    lv_nombre5 = substring_after( val = lv_rest3 sub = | | ).


    DATA(lv_nombre) = lv_nombre4.


    DATA(lv_numcar) = strlen( lv_nombre ).

    IF lv_numcar > 7.
      out->write( 'Hola Fernando' ).

    ELSEIF lv_numcar = 6.
      IF lv_nombre = 'Sergio'.
        out->write( 'Hola Sergio' ).
      ELSEIF lv_nombre = 'daniel'.
        out->write( 'Hola Daniel' ).
      ENDIF.
    ELSE.
      IF lv_nombre = 'Pedro'.
        out->write( |Hola { to_upper( lv_nombre ) } | ).
      ELSEIF  lv_nombre = 'ramon'.
        out->write( |Hola { to_upper( lv_nombre ) } | ).
      ENDIF.
    ENDIF.



  ENDMETHOD.

ENDCLASS.
