CLASS zcl_00_main_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_main_pwc IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

    DATA(LO_EMPLOYEE) = NEW zcl_01_class_pwc( IV_EMPLOYEE_ID = '01' ).

    OUT->write( LO_EMPLOYEE->get_employee( ) ).








ENDMETHOD.

ENDCLASS.
