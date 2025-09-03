CLASS zcl_clase_pwc_estruc_ani DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_ESTRUC_ANI IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA LS_EMPLOYEE TYPE ZST_EMPLEADOS_PWC.
out->write( LS_EMPLOYEE ).
"estructura plana
    "Subestructura (plana)
    TYPES : BEGIN OF ty_addr,

              steet TYPE c LENGTH 30,
              city  TYPE c LENGTH 20,
            END OF ty_addr.
*
*    "estructura ANIDADA: contiene ty_addr como un campo
*
*    TYPES: BEGIN OF ty_employee_nested,
*
*           id type i,
*           name type c LENGTH 20,
*           addr type ty_addr, " subestructura anidada  seria igual que decir prueba : include zst_empleados_der.
*        end of ty_employee_nested.
*
*
*data ls_prueba type ty_employee_nested.
* out->write( ls_prueba ).
*


" estructura profunda
" producto simple para la tabla interna
types: BEGIN OF ty_order_item,
        producto type c LENGTH 10,
        camion  type  i,
        end of TY_ORDER_ITEM.

  "estructura profunda: tiene tipos dinamicos (string, tablas, referencias)


    TYPES: BEGIN OF ty_customer_deep,
           id type i,
           name type string,  " profunda
           addr type ty_addr, " anidada ( plana )
           orders type STANDARD table of ty_order_item with empty key, "profunda ( tabala interna )
           refaddr type ref to ty_addr, " profunda ( esta haciendo una referencia)

           END OF TY_CUSTOMER_DEEP.



data ls_cust TYPE ty_customer_deep.

free ls_cust-orders .


ENDMETHOD.
ENDCLASS.
