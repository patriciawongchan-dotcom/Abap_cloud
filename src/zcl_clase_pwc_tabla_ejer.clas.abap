CLASS zcl_clase_pwc_tabla_ejer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_TABLA_EJER IMPLEMENTATION.




METHOD if_oo_adt_classrun~main.



*select from /dmo/connection
*fields carrier_id, connection_id, airport_from_id, airport_to_id
*into table @DATA(lt_conexion).
*
*out->write( lt_conexion ).
*
*
*select from /dmo/flight
*fields carrier_id, connection_id, flight_date, price, currency_code
*into table @DATA(lt_flights).

DATA: lv_from TYPE d VALUE '20250101',
      lv_to TYPE d VALUE '20251231',
      lv_min_prc TYPE /dmo/flight_price value '300'.


SELECT
    c~carrier_id AS carrier,
    c~connection_id AS conn,
    af~city AS city_from,
    af~city AS city_to,
    f~flight_date,
    f~price,
    f~currency_code

FROM /dmo/connection AS c
INNER JOIN /DMO/FLIGHT AS f

ON f~carrier_id = c~carrier_id
AND f~connection_id = c~connection_id

INNER JOIN /dmo/airport AS af

ON af~airport_id = c~airport_to_id

WHERE  f~flight_date BETWEEN @lv_from AND @lv_to

ORDER BY  f~flight_date ASCENDING

INTO TABLE @DATA(lt_detail).

out->write( lt_detail ).

ENDMETHOD.
ENDCLASS.
