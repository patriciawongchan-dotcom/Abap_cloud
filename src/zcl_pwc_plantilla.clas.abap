CLASS zcl_pwc_plantilla DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pwc_plantilla IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

DATA :        NUM_REG TYPE I VALUE 2.

SELECT * FROM ztab_emp_pwc
INTO TABLE @data(lt_REG)
UP TO  2 ROWS.

OUT->write( lt_REG ).
ENDMETHOD.

ENDCLASS..
