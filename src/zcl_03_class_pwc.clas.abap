CLASS zcl_03_class_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_employee_id TYPE string.

    CLASS-METHODS class_constructor.

    METHODS get_employee_id RETURNING VALUE(rv_employee_id) TYPE string.

    CLASS-DATA company TYPE string READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA employee_id TYPE string.
ENDCLASS.



CLASS zcl_03_class_pwc IMPLEMENTATION.

  METHOD class_constructor.
    zcl_03_class_pwc=>company = 'EXPERIS'.
  ENDMETHOD.

  METHOD constructor.
    ME->employee_id = IV_EMPLOYEE_ID.


  ENDMETHOD.

  METHOD get_employee_id.
    RV_EMPLOYEE_ID = ME->employee_id.
  ENDMETHOD.

ENDCLASS..
