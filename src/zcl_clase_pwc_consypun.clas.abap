CLASS zcl_clase_pwc_consypun DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_CONSYPUN IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "VALUE inicializar valores en tablas, estructuras y variables

    "CORRESPONDING expresion que crea una tabla interna copiandola de otra solo con los campos q tengan similares

    "CORRESPONDING MAPPING
    TYPES: BEGIN OF  ty_employee,
             emp_name TYPE string,
             emp_age  TYPE i,
           END OF ty_employee.

    TYPES: BEGIN OF  ty_person,
             name TYPE string,
             age  TYPE i,
           END OF TY_person.

    DATA: lt_employee TYPE TABLE OF ty_employee,
          lt_person   TYPE TABLE OF ty_person,
          lt_client   TYPE TABLE OF ty_person.


    lt_employee = VALUE #( ( emp_name = 'Pedro'
                            emp_age = 30 ) ).


    out->write( data = lt_employee name = 'LT_EMPLOYEE' ).


    lt_person = CORRESPONDING #( lt_employee MAPPING name = emp_name age = emp_age ).

    out->write( data = lt_person name = 'LT_person' ).

**********************************************************************
*CORRESPONDING CON EL BASE

    lt_client = VALUE #( ( name = 'Maria' age = 50 ) ).

    lt_client = CORRESPONDING #( BASE ( lt_client ) lt_person ).

    out->write( data = lt_client name = 'LT_client' ).

**********************************************************************
*EXCEP

    lt_person = CORRESPONDING #( lt_client EXCEPT age ).
    out->write( data = lt_person name = 'LT_person' ).

    " DISCARTING DUPLICATES

    DATA: lt_itab1 TYPE TABLE OF ty_person WITH EMPTY KEY,
          lt_itab2 TYPE SORTED TABLE OF ty_person WITH UNIQUE KEY name.

    lt_itab1 = VALUE #( ( name = 'maria' age = 25 )
                         ( name = 'maria' age = 25 )
                         ( name = 'maria' age = 22 )
                         ( name = 'pedro' age = 24 ) ).

    out->write( data = lt_itab1 name = 'LT_ITAB1' ).
    lt_itab2 = CORRESPONDING #( lt_itab1 DISCARDING DUPLICATES ).

    out->write( data = lt_itab2 name = 'LT_ITAB2' ).

**********************************************************************
    " NEW se utiliza para crear instancias de clases y estructuras de manera mas compacta y leguble.
    "Puedes instanciar un objeto o estructura directamente al asignarlo a una variable, sin necesidad de declarar
    "el tipo explicitamente si ya esta implicito.

    DATA lo_data TYPE REF TO i."declaramos una variable de referencia a un entero(i)

    "creamos un nuevo objeto de tipo entero(inferido por #) con valor inicial 12345

    lo_data = NEW #( 12345 ).

    "mostamos el valor de la referencia lo_data

    out->write( lo_data ).

    "declaramos y creamos una referencia a un objeto string con el valor de 'Experis'

    DATA(lo_data2) = NEW string( 'Experis' ).
    out->write( lo_data2 ).

**********************************************************************
*CONV
* convierte a otro tipo de variable al que indicas en el conv
*no se puede convertir un string a un entero

    DATA(lv_number) = 2025.

    DATA(lv_text) = CONV string( lv_number ).


    out->write( |Numero original(entero): { lv_number } | ).

    out->write( |Numero convertido a texto: { lv_text } | ).


    DATA(lv_str_number) = '150'.

    DATA(lv_int_number) = CONV i( lv_str_number ).

    out->write( |Numero original(string): { lv_str_number } | ).

    out->write( |Numero convertido a entero: { lv_str_number } | ).

**********************************************************************
*EXACT hace una conversion exacta y da error en tiempo de ejecucion si hay perdida de datos

    DATA lv_num TYPE p LENGTH 5 DECIMALS 2 VALUE '123.45'.

*conversion con CONV
    DATA(lv_conv) = CONV i( lv_num ).
    out->write( |CONV a entero: { lv_conv } | ).

*conexion con EXACT(falla si hay perdida de datos)

    TRY.

        DATA(lv_exact) = EXACT i( lv_num ).
        out->write( |EXACT a entero: { lv_exact } | ).

      CATCH cx_sy_conversion_error INTO DATA(lx_error).
        out->write( |Error EXACT a entero: { lx_error->get_text(  ) } | ).

    ENDTRY.
**********************************************************************
*REF
*crea una referencia de datos(un puntero) a un valor o estructura existente, sin copiar el contenido
*Es util cuando: queremos pasar gran cantidad de datos sin copiarlos
*modificar el valor original desde otro lugar.
*Trabaja con objetos dinamicos


    DATA: lv_int_value TYPE i VALUE 100,
          lv_ref_int   TYPE REF TO i. "declara una referencia a un entero

    lv_ref_int = REF #( lv_int_value ). "crea una referencia al dato lv_int_value
    "no copia el valor, solo apunta a la misma direccion

    out->write( data = lv_int_value name = 'Original value' ).
    out->write( data = lv_ref_int->* name = 'Value desde la referencia' ).

**********************************************************************
*CAST
* Se usa para convertir referencias de un tipo a otro (on cinvierte valores como el CONV o EXACT, sino referencias)
*Es decir: convierte referencias de objetos o datos de un tipo de referencia a otro tipo de referencia compatible

    TYPES: BEGIN OF ty_struc,
             col1 TYPE i,
             col2 TYPE i,
           END OF ty_struc.

*declaramos la referencia generica a datos

DATA lr_data type REF TO data.

*declaramos una variable de tipo ty_struc(estructura tipada)

DATA ls_int type ty_struc.

*creamos en memoria un objeto del tipo ty:struc
*guardamos su referencia en lr_data
*NEW devuelve una referencia, no una copia

lr_data = NEW ty_struc(  ).

*usamos el CAST para convertir la referencia generica lr_data a una referencia del tipo ty_struc
*y ->* para desreferenciar(quitar la referencia) y copiar el contenido completo en ls_int

ls_int = CAST ty_struc( lr_data )->*.

*accedemos directamente al campo col1 usando el CAST
*esto no copia toda la estructura , solo lee col1

ls_int-col1 = CAST ty_struc( lr_data )->col1.

*lo mismo para col2
ls_int-col2 = CAST ty_struc( lr_data )->col2.

out->write( data = ls_int-col1 name = 'ls_int-col1' ).

out->write( data = ls_int-col2 name = 'ls_int-col2' ).

**********************************************************************
*FILTER
*Es una expresion ABAP que crea una nueva tabla interna filtrando los registros de otra tabla segun 'unas condiciones'
*Las condiciones pueden basarse en valores individuales o en una tabla RANGOS
*la tabla interna en la que se utiliza el operador filter debe tener al menos una clave ordenada o una clave HASH utilizada para el acceso


*declaracion de tablas
DATA: lt_flights_all type STANDARD TABLE OF /dmo/flight,
      lt_flights_final type STANDARD TABLE OF /dmo/flight,
      lt_filter type SORTED TABLE OF /dmo/flight-carrier_id "tabal del filtro (solo una columna)
      WITH UNIQUE KEY table_line,
      lt_filter1 type SORTED TABLE OF /dmo/flight-plane_type_id
      WITH UNIQUE KEY table_line,
      lt_filter2 type SORTED TABLE OF /dmo/flight-flight_date
      WITH UNIQUE KEY table_line.

SELECT FROM /dmo/flight
FIELDS *
into TABLE @lt_flights_all.

*construir la lista blanca de aerolineas permitidas (IDs de compañias)
*VALUE #(...) crea la tabla lt_filter con los valores indicados en filas de una sola columna(table_line)
lt_filter = value #( ( 'LH ' ) ( 'AA ' ) ( 'UA ' ) ).


*fitrado en memoria:
*Filter #(....) toma lt:flights_all como base
*IN lt_filter indica que usaremos la tabla de filtro como referencia
*WHERE carrier_id = table_line mantiene solo las filas cuyo carrier_id esta en lt_filter

lt_flights_final = FILTER #( LT_FLIGHTS_ALL IN LT_FILTER WHERE CARRIER_ID = TABLE_LINE ).


out->write( data = lt_flights_final name = 'FILTRO CON CARRIER_ID' ).

clear lt_flights_final.

lt_filter1 = value #( ( '747-400   ' ) ( '767-200   ' ) ( 'A320-200  ' ) ( 'A320-800  ' ) ).

lt_flights_final = FILTER #( LT_FLIGHTS_ALL IN LT_FILTER1 WHERE plane_type_id = TABLE_LINE ).


out->write( data = lt_flights_final name = 'FILTRO CON PLANE_TYPE_ID' ).

*LOOP DE AGRUPACION

DATA lt_members LIKE lt_flights_final.

    "bucle externo con agrupacion
    LOOP AT lt_flights_final INTO DATA(ls_flight_final)
    GROUP BY ls_flight_final-plane_type_id
    ASCENDING
    INTO DATA(lv_plane_type_id).

    clear lt_members.

    loop at GROUP lv_plane_type_id into data(ls_member).
    append ls_member to lt_members.
    ENDLOOP.



        out->write( |Aerolinea: { lv_plane_type_id } - Vuelos en este grupo: { lines( lt_members ) }  | ).

    ENDLOOP.

clear lt_flights_final.

DATA LV_DATE TYPE D.

LV_DATE = '20260101'.

APPEND lv_date TO lt_filter2.

out->write( lt_filter2 ).

lt_flights_final = FILTER #( LT_FLIGHTS_ALL IN LT_FILTER2 WHERE flight_date > TABLE_LINE ).

out->write( data = lt_flights_final name = 'FILTRO CON FLIGHT_DATE MAYORES DE 01/01/2026' ).









  ENDMETHOD.
ENDCLASS.
