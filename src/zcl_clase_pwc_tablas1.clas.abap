CLASS zcl_clase_pwc_tablas1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_TABLAS1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_libro,
             titulo  TYPE string,
             autor   TYPE string,
             num_pag TYPE i,
           END OF ty_libro.

    TYPES: ty_libros TYPE STANDARD TABLE OF ty_libro WITH EMPTY KEY.

    DATA: lt_libros TYPE ty_libros,
          ls_libro  TYPE ty_libro.


    ls_libro-titulo = 'la vida es bella'.
    ls_libro-autor = 'pepito perez'.
    ls_libro-num_pag = 135.

    INSERT ls_libro INTO lt_libros INDEX 1.

    ls_libro-titulo = 'uno mas'.
    ls_libro-autor = 'juanito mata'.
    ls_libro-num_pag = 650.

    INSERT ls_libro INTO lt_libros INDEX 1.
    ls_libro-titulo = 'uno menos'.
    ls_libro-autor = 'juanito mata'.
    ls_libro-num_pag = 250.

    INSERT ls_libro INTO lt_libros INDEX 2.

    LOOP AT lt_libros INTO ls_libro.

      if ls_libro-num_pag < 150.

        out->write( |Libro corto : { ls_libro-titulo } | ).

      ELSEIF ls_libro-num_pag > 500 .

          out->write( |Libro largo : { ls_libro-titulo } | ).

        else.

          out->write( |Libro estandar : { ls_libro-titulo } | ).

      ENDIF.


    ENDLOOP.

*LOOP AT lt_libros INTO ls_libro.
*out->write( ls_libro ).
*ENDLOOP.
out->write( lt_libros ).
  ENDMETHOD.
ENDCLASS.
