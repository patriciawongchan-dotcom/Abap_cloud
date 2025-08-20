CLASS zcl_clase_pwc_group_by DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_GROUP_BY IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

"agrupar registros
    "En abap cloud( y en abap en general) agrupar registros significa organizar datos con un criterio comun
    "para tratarlos como un conjunto.
    "( se suele hacer cuando se quiere sumar, contar o procesar datos que comparten un mismo valor o varios campos.

    SELECT *
    FROM /dmo/flight
    INTO TABLE @DATA(lt_flights).

    DATA lt_members LIKE lt_flights.

    "bucle externo con agrupacion
    LOOP AT lt_flights INTO DATA(ls_flight) " recorre lt_flights fila a fila en la estructura ls_flgitht
    GROUP BY ls_flight-carrier_id "agrupacion logica por aerolina ( carrier_id)
    ASCENDING "ordena de manera ascendente
    INTO DATA(lv_carrier). "guarda la clave del grupo actual (carrier_id ) en lv_carrier

    clear lt_members. "resetea el acumulador para empezar a llenar el grupo actual

    loop at GROUP lv_carrier into data(ls_member). "itera solo por las filas que pertenecen a este grupo
    append ls_member to lt_members. "añade cada miembro del gurpo a lt_members
    ENDLOOP.



        out->write( |Aerolinea: { lv_carrier } - Vuelos en este grupo: { lines( lt_members ) }  | ).

    ENDLOOP.

ENDMETHOD.
ENDCLASS.
