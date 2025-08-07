CLASS zcl_clase_pwc_ejer_loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_ejer_loop IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

*Enunciado del ejercicio: Anonimización de agencias de viajes
*La empresa de turismo internacional "DMO Travel Corp" almacena en la tabla /DMO/AGENCY información sobre sus agencias distribuidas
*por todo el mundo.
*Cada agencia contiene los siguientes datos: ID de cliente (CLIENT), ID de agencia (AGENCY_ID), nombre (NAME),
*dirección (STREET, POSTAL_CODE, CITY), país (COUNTRY_CODE), número de teléfono (PHONE_NUMBER), correo electrónico (EMAIL_ADDRESS) y
*página web (WEB_ADDRESS).
*Por normativa de protección de datos, se ha solicitado anonimizar los correos electrónicos de todas aquellas agencias que cumplan simultáneamente las siguientes condiciones:
*No se encuentran en Alemania (es decir, su campo COUNTRY_CODE es distinto de 'DE')
*Su página web contiene la palabra 'tour'
*🎯 Objetivos del ejercicio
*Leer todas las entradas de la tabla /DMO/AGENCY en una tabla interna.
*Recorrer la tabla interna y aplicar condiciones lógicas combinadas (AND, <>, CP, line_exists...).
*Modificar los correos electrónicos de las agencias que cumplan los criterios anteriores, asignándoles 'oculta@demo.com'.
*Mostrar el contenido de la tabla antes y después de la modificación usando out->write.
*
*    data lv_var type i value 0.
*
*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @DATA(lt_flights).
*
*    DATA ls_flight TYPE /dmo/flight.
*
*    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flight>) from 3 to 8.
*
*
*      <fs_flight>-currency_code = 'COP'.
*
*
*    ENDLOOP.
*    out->write( data = lt_flights name = `lt_flights` ).
*


SELECT FROM /dmo/agency
FIELDS client, agency_id, name, street, postal_code, city, country_code, phone_number, email_address, web_address
INTO TABLE @DATA(lt_agency).


out->write( data = lt_agency name = 'lt_agency_inicio' ).
out->write( |\n| ).
out->write( |\n| ).

LOOP AT LT_agency ASSIGNING FIELD-SYMBOL(<fs_agency>) where country_code <> 'DE' AND web_address cp '*tour*'.

<fs_agency>-email_address = 'aculta@demo.com'.
"out->write( data = <fs_agency> name = '<fs_agency>' ).

ENDLOOP.
out->write( data = lt_agency name = 'lt_agency_fin' ).
ENDMETHOD.

ENDCLASS.
