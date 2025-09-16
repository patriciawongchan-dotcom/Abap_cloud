CLASS zcl_02_class_pwc DEFINITION

  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_id_empleado     TYPE i OPTIONAL
                                  iv_Nombre          TYPE zde_nombre_der
                                  iv_Apellido        TYPE zde_nombre_der
                                  iv_telefono        TYPE zde_tele_der
                                  iv_experiencia     TYPE i
                                  iv_certificaciones TYPE i .


 TYPES RV_REG TYPE STANDARD TABLE OF ztab_emp_pwc WITH EMPTY KEY.

    METHODS alta_empleado RETURNING VALUE(rv_sueldo) TYPE string.

    METHODS clacular_sueldo .

    METHODS ex_id_empleado.

    METHODS MODIF_EMP RETURNING VALUE(rv_sueldo) TYPE string.

    METHODS BUSCAR_REG   EXPORTING EV_RESULT type string RETURNING VALUE(RV_TABLA) TYPE  RV_REG.

    METHODS LISTAR_REG IMPORTING IV_NUM_REG TYPE I RETURNING VALUE(RV_TABLA) TYPE  RV_REG.


  PROTECTED SECTION.
  PRIVATE SECTION.

*
*    TYPES:BEGIN OF ty_empleado,
*            Nombre      TYPE zde_nombre_der,
*            Apellido    TYPE zde_nombre_der,
*            telefono    TYPE zde_tele_der,
*            ID_empleado TYPE zid,
*            sueldo      TYPE zde_salary_pwc,
*            currency    TYPE waers,
*          END OF ty_empleado,
*          tty_empleado TYPE TABLE OF ty_empleado.
*
*    DATA lt_prueba TYPE tty_empleado.


    DATA ls_prueba TYPE ztab_emp_pwc.


    DATA: experiencia     TYPE i,
          certificaciones TYPE i,
          num_reg type i.

DATA LT_REGISTRO TYPE  rv_Reg.


ENDCLASS.

CLASS zcl_02_class_pwc IMPLEMENTATION.



  METHOD clacular_sueldo.

    me->ls_prueba-sueldo = ( me->certificaciones * 50 + me->experiencia * 100 ) + 1000.

  ENDMETHOD.

  METHOD constructor .
    me->ls_prueba-id_empleado = iv_id_empleado.
    me->ls_prueba-nombre = iv_Nombre.
    me->ls_prueba-apellido = iv_Apellido.
    me->ls_prueba-telefono = iv_telefono.
    me->experiencia = iv_experiencia.
    me->certificaciones = iv_certificaciones.
    me->ls_prueba-currency_code = 'EUR'.


  ENDMETHOD.



  METHOD ex_id_empleado.

    SELECT MAX( id_empleado )
    FROM ztab_emp_pwc
    INTO @DATA(var_seleccion).


    IF sy-subrc = 0.

      me->ls_prueba-id_empleado = var_seleccion + 1.
    ELSE.

      me->ls_prueba-id_empleado = 0001.

    ENDIF.



  ENDMETHOD.



  METHOD alta_empleado.

    me->clacular_sueldo( ).

    ex_id_empleado( ).

    MODIFY ztab_emp_pwc FROM @ls_prueba.

    IF sy-subrc = 0.
      COMMIT WORK.
      rv_sueldo = 'EMPLEADO CREADO'.
    ELSE.
      rv_sueldo = 'EMPLEADO NO CREADO'.
    ENDIF.

  ENDMETHOD.

  METHOD modif_emp.

    clacular_sueldo( ).
    MODIFY ztab_emp_pwc FROM @ls_prueba.

   IF sy-subrc = 0.
      COMMIT WORK.
      rv_sueldo = 'EMPLEADO MODIFICADO'.
    ELSE.
      rv_sueldo = 'EMPLEADO NO MODIFICADO'.
    ENDIF.
  ENDMETHOD.

METHOD BUSCAR_REG.
num_reg = me->ls_prueba-id_empleado.

IF NUM_REG = 0.

SELECT * FROM  ztab_emp_pwc
ORDER BY ID_EMPLEADO ASCENDING
INTO TABLE @me->lt_registro.

ELSE.

SELECT * FROM  ztab_emp_pwc
WHERE ID_EMPLEADO = @ME->num_reg
INTO TABLE @me->lt_registro.

ENDIF.
RV_TABLA = LT_REGISTRO.


IF SY-SUBRC = 0.

EV_RESULT = 'SE ENCONTRARON REGISTROS'.
RV_TABLA = LT_REGISTRO.
ELSE.

EV_RESULT = 'NO SE ENCONTRO EL REGISTRO'.

ENDIF.


ENDMETHOD.


  METHOD listar_reg.

SELECT *
FROM ztab_emp_pwc
ORDER BY id_empleado
INTO TABLE @me->lt_registro
UP TO @IV_NUM_REG ROWS.

rv_tabla = lt_registro.

  ENDMETHOD.

ENDCLASS.
