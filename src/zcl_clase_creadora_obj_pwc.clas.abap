CLASS zcl_clase_creadora_obj_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
***********************DEFINICIONES***********************************************

  "INSTANCIA: objeto creado a partir de una clase

**********************************************************************

*Atributos de dependencia de instancia y los estaticos:

**********************************************************************

*Atributos de dependencia de instancia-> Dependen de la instancia de la clase,
*el contenido es especifico para cada objeto.
*se declaran usando la sentencia DATA
* Resumen-> son variables que pertenecen a cada objeto, no a la clase.
*cada instancia tiene su propia copia.

**********************************************************************
*Atributos estaticos -> El contenido de los atributos estaticos definen el estado de la clase y
* es valido para todas las instancias de la clase, se declaran usando CLASS_DATA.
*Son accesible desde todo el entorno de ejecucion de la clase. Todos los objetos de una clase pueden acceder a sus atributos estaticos.
*Si se cambia un atributo estatico en un objeto, el cambio es visible en todos los demas objetos de la clase.
*
*resumen- Variables de la clase, NO del objeto. Hay una sola copia por clase en la sesion. todas las instancias lo comparten
**********************************************************************
*METODOS ESTATICOS O DE INSTANCIA
**********************************************************************
*METODOS ESTATICOS -> no dependen de la instancia
**********************************************************************
*METODOS DE INSTANCIA -> Dependen de cada instancia que se va a realizar en el contenxto de la memoria de ejecucion

*METODOS DE INSTANCIA ->
*METODOS ESTATICO =>

*ESTATICO NO tiene acceso a la instancia
*INSTANCIA tiene acceso al estatico




  PUBLIC SECTION. " Todos los atributos y metodos son publicos y accesibles

  TYPES : BEGIN OF TY_ADDRESS,
          COUNTRY TYPE STRING,
          CITY TYPE STRING,
          POSTAL_CODE TYPE STRING,
          REGION TYPE STRING,
          STREET TYPE STRING,
          NUMBER TYPE STRING,
          END OF TY_ADDRESS,
TTY_ADDRESS TYPE TABLE OF TY_ADDRESS.

METHODS SET_ADDRESS IMPORTING IT_ADDRESS TYPE TTY_ADDRESS.




    CLASS-DATA currency TYPE c LENGTH 3. "atributo estatico(de declara con el class_data
    DATA region TYPE string.

*DECLARACION DE METODO/FUNCION DE INSTANCIA

    METHODS set_client

      IMPORTING iv_client   TYPE string "parametro de entrada
                iv_location TYPE string

      EXPORTING ev_status   TYPE string "parametro de salida

      CHANGING  cv_process  TYPE string."parametro de cambio


*DECLARACION DE METODO/FUNCION DE ESTATICA

    METHODS get_client

      EXPORTING ev_client TYPE string.

    CLASS-METHODS:

      set_cntr_type IMPORTING iv_cntr_type TYPE string,
      get_cntr_type EXPORTING ev_cntr_type TYPE string.

METHODS get_client_name IMPORTING iv_client_id type string returning value(rv_client_name) type string.







  PROTECTED SECTION. " Es solo accesible para esta clase y las clases hijas

    DATA CREATION_dATE TYPE sydate. "atributo de instancia


  PRIVATE SECTION. "Es accesible solo para esta clase y las clases 'friends'

    DATA client TYPE string.
    CLASS-DATA cntr_type TYPE string .


ENDCLASS.



CLASS zcl_clase_creadora_obj_pwc IMPLEMENTATION.

  METHOD set_client. "Desarrollo de la funcion/metodo set_cliente
      client = iv_client.
      ev_status = 'Ok'.
      cv_process = 'Started'.

  ENDMETHOD.

  METHOD get_client. "Desarrollo de la funcion/metodo get_cliente

    ev_client = client.

  ENDMETHOD.

  METHOD get_cntr_type. "Desarrollo de la funcion/metodo get_cntr_type

    ev_cntr_type = cntr_type.
  ENDMETHOD.

  METHOD set_cntr_type. "Desarrollo de la funcion/metodo set_cntr_type
        cntr_type = iv_cntr_type.
  ENDMETHOD.

  METHOD get_client_name.

case iv_client_id.

when '01'.
rv_client_name = 'client name 01'.
when '02'.
rv_client_name = 'client name 02'.

ENDCASE.



  ENDMETHOD.

  METHOD set_address.




  ENDMETHOD.

ENDCLASS..
