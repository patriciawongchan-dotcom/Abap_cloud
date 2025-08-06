CLASS zcl_clase_pwc_estructuras DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_estructuras IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF ty_persona,
             nombre TYPE char40,
             edad   TYPE numc3,
             email  TYPE /dmo/email_address,

           END OF ty_persona.

    TYPES: BEGIN OF ty_persona2,
             nombre TYPE ty_persona-nombre, "es posible crear un campo haciendo referencia a otro campo que hace referencia
             edad   TYPE numc3,
             email  TYPE /dmo/email_address,

           END OF ty_persona2.

    "FORMA 1 DECLARACION ESTRUCTURA

    DATA ls_persona TYPE ty_persona. "estructura

    ls_persona-nombre = 'Pedro'.
    ls_persona-edad = 20.
    ls_persona-email = 'pedro@gmail.com'.

    out->write( ls_persona ).

    "FORMA 2 DECLARACION ESTRUCTURA

    DATA(ls_persona2) = VALUE ty_persona( nombre = 'juan' edad = 20 email = 'juan@gmail.com' ).

    out->write( |\n| ). "imprime salto de linea

    out->write( ls_persona2 ).

    "FORMA 3 DECLARACION ESTRUCTURA y tipo de golpe

    DATA: BEGIN OF ls_empleado,
            nombre TYPE string VALUE 'Laura',
            id     TYPE i,
            email  TYPE /dmo/email_address,
          END OF ls_empleado.

    out->write( ls_empleado-nombre ).


    ls_empleado-id = 007.

    out->write( ls_empleado ).

    " Tipos de tablas:
    "1-TABLAS INTERNAS ( en memoria) Se usan dentro del codigo ABAP !SOLO EXISTEN EN TIEMPO DE EJECUCION¡
    "y las creamos nosotros, no estan en la base de datos.  se declaran como lt_xxxx
    "2-TABLAS DE BASE DE DATOS(persistentes) o tablas transparentes o externas.
    "se crean en el diccionario ABAP (.ddls, .ddic ) y alamacenan datos reales.
    "3-CDS table (o Entity) es una vista avanzada que se define con el lenguaje DDL, en Eclipse, sobre una o varias tablas
    "exsitentes.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "TIPOS DE ESTRUCTURAS

    "1 ESTRUCTURA SIMPLE
    TYPES: BEGIN OF ty_simple,
             nombre TYPE char40,
             edad   TYPE numc3,
             email  TYPE /dmo/email_address,

           END OF TY_simple.

    "2 ESTRUCTURA ANIDADA

*    DATA: BEGIN OF ls_empl_info,
*
*            BEGIN OF info,
*              id         TYPE i VALUE 1234,
*              first_name TYPE string VALUE 'Pedro',
*              last_name  TYPE string VALUE 'Elvira',
*            END OF info,
*
*            BEGIN OF direccion,
*              ciudad TYPE string VALUE 'Madrid',
*              calle  TYPE string VALUE 'calle calle',
*              pais   TYPE string VALUE 'España',
*            END OF direccion,
*
*            BEGIN OF puesto,
*              departamento TYPE string VALUE 'CEO',
*              sueldo       TYPE p DECIMALS 2 VALUE '20000.99',
*            END OF puesto,
*
*          END OF ls_empl_info.
* out->write( ls_empl_info ).
* out->write( ls_empl_info-direccion ).
*out->write( ls_empl_info-puesto-sueldo ).

    "3 ESTRUCTURA PROFUNDA

* TYPES: BEGIN OF ty_flights,
*        flight_date TYPE /dmo/flight-flight_date,
*        price TYPE /dmo/flight-price,
*        currency_code TYPE /dmo/flight-currency_code,
*        END OF ty_flights.
*
*data: BEGIN OF ls_flight_info,
*      carrier type /dmo/flight-carrier_id value 'AA',
*      CONNID type /dmo/flight-connection_id value '0018',
*      ts_flights type table of ty_flights with EMPTY KEY, "hace referencia tanto al tipo creado en el types ty_flights como a la tabla de bbdd
*
*      END OF ls_flight_info.
* SELECT *
* from /dmo/flight
* where carrier_id = 'AA'
* into corresponding fields of table @ls_flight_info-lt_flights.
*
* out->write( data = ls_flight_info name = 'ls_flight_info' ).


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "AÑADIR DATOS A LAS ESTRUCTURAS


*TYPES: BEGIN OF ty_flights,
*        flight_date TYPE /dmo/flight-flight_date,
*        price TYPE /dmo/flight-price,
*        currency_code TYPE /dmo/flight-currency_code,
*        END OF ty_flights.
*
*data: BEGIN OF ls_flight_info,
*      carrier type /dmo/flight-carrier_id value 'AA', "no es necesario si abajo le das valor o puede ir sin valor y no da error
*      CONNID type /dmo/flight-connection_id value '0018',
*      ls_flights type ty_flights, "DIFERENCIA CON EL EJEM ANTERIOR
*
*      END OF ls_flight_info.
*ls_flight_info-carrier = 'XX'.
*ls_flight_info-connid = '0022'.
*ls_flight_info-ls_flights-flight_date = cl_abap_context_info=>get_system_date(  ).
*ls_flight_info-ls_flights-currency_code = 'USD'.
*ls_flight_info-ls_flights-price = '200'.
*
*out->write( data = ls_flight_info name = 'ls_flight_info' ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "FORMA2 meter datos en estructura anidada

    DATA: BEGIN OF ls_empl_info,

            BEGIN OF info,
              id       TYPE i VALUE 1234,
              nombre   TYPE string VALUE 'Pedro',
              apellido TYPE string VALUE 'Elvira',
            END OF info,

            BEGIN OF direccion,
              ciudad TYPE string VALUE 'Madrid',
              calle  TYPE string VALUE 'calle calle',
              pais   TYPE string VALUE 'España',
            END OF direccion,

            BEGIN OF puesto,
              departamento TYPE string VALUE 'CEO',
              sueldo       TYPE p DECIMALS 2 VALUE '20000.99',
            END OF puesto,

          END OF ls_empl_info.

    ls_empl_info = VALUE #( info = VALUE #( id = 9999 nombre = 'Juan' apellido = 'Martin' )
                            direccion = VALUE #( ciudad = 'Madrid' calle = 'gran via' pais = 'singapur' )
                            puesto = VALUE #( departamento = 'finanzas' ) ).
    out->write( ls_empl_info ).
    ls_empl_info-puesto-sueldo = '100.00'.

    out->write( ls_empl_info ).

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " FORMA 3

    TYPES: BEGIN OF ty_flights,
             flight_date   TYPE /dmo/flight-flight_date,
             price         TYPE /dmo/flight-price,
             currency_code TYPE /dmo/flight-currency_code,
           END OF ty_flights.

    DATA: BEGIN OF ls_flight_info,
            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id VALUE '0018',
            ls_flights TYPE ty_flights,
          END OF ls_flight_info.


    ls_flight_info = VALUE #(
    carrier = 'ww'
    connid = '0035'
    ls_flights = VALUE #( flight_date = '20250731'
                           currency_code = 'EUR'
                           price = '200' ) ).


out->write( data = ls_flight_info name = 'ls_flight_info' ).

" forma completar estructura

SELECT SINGLE from /dmo/flight
FIELDS *
where carrier_id = 'LH'
into @DATA(ls_flight2).


out->write(  data = ls_flight2  name = 'ls_flight2' ).

Clear ls_flight2-connection_id.
out->write(  data = ls_flight2  name = 'ls_flight2' ).

clear ls_flight2.
out->write(  data = ls_flight2  name = 'ls_flight2' ).





  ENDMETHOD.

ENDCLASS.
