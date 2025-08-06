CLASS zcl_clase_pwc_switch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_switch IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

do 6 times.
DATA(lv_value) = SWITCH #( sy-index when 1 then |iteracion 1|
                                    when 2 then |iteracion 2|
                                     when 3 then |iteracion 3| ).

out->write( lv_value ).
ENDDO.
ENDMETHOD.

ENDCLASS.
