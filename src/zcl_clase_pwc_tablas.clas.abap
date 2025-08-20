CLASS zcl_clase_pwc_tablas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_TABLAS IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

*TYPES: BEGIN OF ty_persona,
*       nombre type string,
*       edad type i,
*       END OF TY_PERSONA.
*
*types: ty_tabla_personas type STANDARD TABLE OF ty_persona WITH EMPTY KEY.
*
*DATA: lt_personas type ty_tabla_personas,
*      ls_persona type ty_persona.
*
*ls_persona-nombre = 'Carla'.
*ls_persona-edad = 12.
*
*INSERT ls_persona into lt_personas INDEX 1.
*
*ls_persona-nombre = 'Juan'.
*ls_persona-edad = 10.
*
*INSERT ls_persona into lt_personas INDEX 2.
*
*ls_persona-nombre = 'Pedro'.
*ls_persona-edad = 31.
*
*INSERT ls_persona into lt_personas INDEX 3.
*
*" el index vale para añadir en una fila definida que quieras, si se va añadir una debajo de otra no es necesario
*" ALT + SHIFT + A permite copiar campos para seleccionar
*
*LOOP AT lt_personas INTO ls_persona.
*"out->write( |Nombre: { ls_persona-nombre }, edad: { ls_persona-edad }| ).
*
*out->write( ls_persona ).
*ENDLOOP.
*
*DATA lt_aeropuerto TYPE STANDARD TABLE OF /dmo/airport.
*
*INSERT VALUE #(
*    client = 101
*    airport_id = 'FRA'
*    name = 'Frankfurt'
*    city = 'Frankfurt/main'
*    country = 'DE'
*) into table lt_aeropuerto .
*
*INSERT VALUE #(
*    client = 100
*    airport_id = 'FRA'
*    name = 'Frankfurt'
*    city = 'Frankfurt/main'
*    country = 'DE'
*) into  lt_aeropuerto index 2.
*
*" para crear una linea en blanco
*INSERT INITIAL LINE INTO TABLE lt_aeropuerto.
*out->write( lt_aeropuerto ).
*
*" para igualar dos tablas internas usamos el like
*data lt_aeropuerto2 like lt_aeropuerto.
*data lt_aeropuerto3 like lt_aeropuerto.
*data lt_aeropuerto4 like lt_aeropuerto.
*out->write( lt_aeropuerto2 ).
*
*" duplicar el contenido
*INSERT LINES OF lt_aeropuerto INTO TABLE lt_aeropuerto2.
*
*out->write( data = lt_aeropuerto name = 'lt_aeropuerto' ).
*
*out->write( |\n| ).
*
*out->write( data = lt_aeropuerto2 name = 'lt_aeropuerto2' ).
*
*"copiar regsitros determinados
*INSERT LINES OF lt_aeropuerto to 1 INTO TABLE lt_aeropuerto3.
*
*INSERT LINES OF lt_aeropuerto from 2 to 3 INTO TABLE lt_aeropuerto4.
*out->write( data = lt_aeropuerto name = 'lt_aeropuerto' ).
*
*out->write( |\n| ).
*
*out->write( data = lt_aeropuerto2 name = 'lt_aeropuerto2' ).
*
*out->write( |\n| ).
*out->write( data = lt_aeropuerto3 name = 'lt_aeropuerto3' ).
*
*out->write( |\n| ).
*
*out->write( data = lt_aeropuerto4 name = 'lt_aeropuerto4' ).
*
*
*INSERT INITIAL LINE INTO TABLE lt_aeropuerto.
*

TYPES: BEGIN OF ty_persona,
       nombre type string,
       edad type i,
       END OF ty_persona.
TYPES ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.

*data: lt_personas type ty_tabla_personas,
*      ls_persona type ty_persona.
*
* ls_persona-nombre = 'Daniel'.
* ls_persona-edad = 50.
*
* APPEND ls_persona to lt_personas.
*
* out->write( lt_persona ).
*
*APPEND VALUE #(
*nombre = 'juan'
*edad = 12
*) to lt_personas.
*
*"copiar un contenido de una tabla a otra
*"APPEND LINES OF lt_personas
*
*" AÑADIR REGISTROS CON EL VALUE

data(lt_persona) = value ty_tabla_personas(
( nombre = 'ana' edad = 25 )
( nombre = 'pepe' edad = 21 )
( nombre = 'luis' edad = 20 )
).

out->write( lt_persona ).






ENDMETHOD.
ENDCLASS.
