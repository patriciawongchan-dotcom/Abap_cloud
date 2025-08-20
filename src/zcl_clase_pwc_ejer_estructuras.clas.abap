CLASS zcl_clase_pwc_ejer_estructuras DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_EJER_ESTRUCTURAS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*crear tres estructuras de las tres maneras que hemos visto  ls_estructura1 ,  ls_estructura2 y  ls_estructura3.
* dieta
* numero de patas
* color
* peso
    TYPES: BEGIN OF ty_animal,
             nombre    TYPE string,
             dieta     TYPE char30,
             num_patas TYPE i,
             color     TYPE string,
             peso      TYPE i,

           END OF ty_animal.

    DATA ls_animal1 TYPE ty_animal.

    ls_animal1-nombre = 'Fido'.
    ls_animal1-dieta = 'mixta'.
    ls_animal1-num_patas = 4.
    ls_animal1-color = 'negro'.

    out->write( ls_animal1 ).


    DATA(ls_animal2) = VALUE ty_animal( nombre = 'Tomy' dieta = 'carnivora' num_patas = 1 color = 'naranja' ).

    out->write( |\n| ).

    out->write( ls_animal2 ).


    DATA: BEGIN OF ls_animal3,
            nombre    TYPE string,
            dieta     TYPE string,
            num_patas TYPE i,
            color     TYPE string,
          END OF ls_animal3.


    ls_animal3-nombre = 'Toby'.
    ls_animal3-dieta = 'vegetal'.
    ls_animal3-num_patas = 4.
    ls_animal3-color = 'negro'.

    out->write( |\n| ).
    out->write( ls_animal3 ).


    DATA: BEGIN OF ls_animal4,

            BEGIN OF datos,
              chip   TYPE i VALUE 4321,
              nombre TYPE string VALUE 'Luke',
              dueno  TYPE string VALUE 'Lucia',
            END OF datos,

            BEGIN OF dieta,
              tipo  TYPE string VALUE 'Mixta',
              marca TYPE string VALUE 'Hills',

            END OF dieta,

            BEGIN OF caracteristicas,
              raza  TYPE string VALUE 'labrador',
              color TYPE string VALUE 'labrador',
            END OF caracteristicas,

          END OF ls_animal4.

    out->write( |\n| ).
    out->write( ls_animal4 ).
  ENDMETHOD.
ENDCLASS.
