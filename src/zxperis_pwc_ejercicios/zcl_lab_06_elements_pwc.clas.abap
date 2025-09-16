CLASS zcl_lab_06_elements_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  TYPES : BEGIN OF TY_ELEM_OBJECTS,
          CLASS TYPE STRING,
          INSTANCE TYPE STRING,
          REFERENCE TYPE STRING,
          END OF TY_ELEM_OBJECTS.

  DATA MS_OBJECT TYPE TY_ELEM_OBJECTS.

  METHODS: set_object
      IMPORTING
        is_object TYPE ty_elem_objects.


 CONSTANTS: c_class_name     TYPE string VALUE 'ZCL_LAB_06_ELEMENTS',
               c_instance_id    TYPE string VALUE 'OBJ_001',
               c_reference_code TYPE string VALUE 'REF_ABC',
               c_version        TYPE string VALUE 'v1.0'.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_06_elements_pwc IMPLEMENTATION.


  METHOD set_object.
me->ms_object = is_object.

  ENDMETHOD.




ENDCLASS.
