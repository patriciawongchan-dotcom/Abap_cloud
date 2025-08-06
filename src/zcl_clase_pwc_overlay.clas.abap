CLASS zcl_clase_pwc_overlay DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_overlay IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

Data: lv_string type string value 'a.b.c.a.b.c.A',
      lv_string2 type string value 'z.x.y.Z.x.y.z'.

      OVERLAY lv_string WITH lv_string2 only 'ab'.

out->write( lv_string ).

ENDMETHOD.

ENDCLASS.
