CLASS zcl_clase_pwc_ejer_estruc2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS ZCL_CLASE_PWC_EJER_ESTRUC2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   TYPES: BEGIN OF ty_nave,

            begin of ty_datos_generales,
              nombre      TYPE string,
              modelo      TYPE i,
              pais_origen TYPE string,
            END OF ty_datos_generales,

            BEGIN OF ty_especificacion,
              vel_max   TYPE i,
              autonomia TYPE i,

            END OF ty_especificacion,

            BEGIN OF ty_estado_mision,
              mision     TYPE string,
              nivel_comb TYPE I,
            END OF ty_estado_mision,

          END OF TY_NAVE.

data: ls_nave1 type ty_nave,
      ls_nave2 type ty_nave,
      ls_nave3 type ty_nave,
      pais_or type string value 'EEUU',
      velo type i value 25000,
      auto type i value 1000,
      nivel type i value 20,
      mision type string value 'MARTE' .

 ls_nave1 = VALUE #( ty_datos_generales = VALUE #( nombre = 'APOLO11' modelo = 11111 pais_origen = 'EEUU' )
                            ty_especificacion = VALUE #( vel_max = 1500 autonomia = 500 )
                            ty_estado_mision = VALUE #( mision = 'De la luna a marte' nivel_comb = 10 ) ).
    out->write( ls_nave1 ).

 ls_nave2 = VALUE #( ty_datos_generales = VALUE #( nombre = 'STAR' modelo = 22222 pais_origen = 'CHINA' )
                            ty_especificacion = VALUE #( vel_max = 10000 autonomia = 900 )
                            ty_estado_mision = VALUE #( mision = 'Luna' nivel_comb = 30 ) ).
 out->write( ls_nave2 ).
  ls_nave3 = VALUE #( ty_datos_generales = VALUE #( nombre = 'TOP100' modelo = 333333 pais_origen = 'JAPON' )
                            ty_especificacion = VALUE #( vel_max = 26000 autonomia = 1500 )
                            ty_estado_mision = VALUE #( mision = 'Marte' nivel_comb = 80 ) ).

      out->write( |\n| ).
    out->write( ls_nave3 ).
     out->write( |\n| ).


 If ( ls_nave1-ty_datos_generales-pais_origen <> pais_or )
 AND ( ls_nave1-ty_especificacion-vel_max > velo  ).

 out->write( 'Nave extranjera de alta velocidad' ).

 ENDIF.

  If ( ls_nave2-ty_datos_generales-pais_origen <> pais_or )
 AND ( ls_nave2-ty_especificacion-vel_max > velo  ).

 out->write( 'Nave extranjera de alta velocidad' ).

 ENDIF.
  If ( ls_nave3-ty_datos_generales-pais_origen <> pais_or )
 AND ( ls_nave3-ty_especificacion-vel_max > velo  ).

 out->write( 'Nave extranjera de alta velocidad' ).

 ENDIF.


If ( ls_nave1-ty_especificacion-autonomia < auto  )
OR ( ls_nave1-ty_estado_mision-nivel_comb < nivel  ).

 out->write( 'Revisión urgente necesaria' ).

ENDIF.

 If ( ls_nave2-ty_especificacion-autonomia < auto  )
OR ( ls_nave2-ty_estado_mision-nivel_comb < nivel  ).

 out->write( 'Revisión urgente necesaria' ).

ENDIF.
 If ( ls_nave3-ty_especificacion-autonomia < auto  )
OR ( ls_nave3-ty_estado_mision-nivel_comb < nivel  ).

 out->write( 'Revisión urgente necesaria' ).

ENDIF.

ls_nave1-ty_estado_mision-mision = to_upper( ls_nave1-ty_estado_mision-mision ).
ls_nave2-ty_estado_mision-mision = to_upper( ls_nave2-ty_estado_mision-mision ).
ls_nave3-ty_estado_mision-mision = to_upper( ls_nave3-ty_estado_mision-mision ).


 DATA(resultado1) = substring_from( val = ls_nave1-ty_estado_mision-mision  sub = mision  ).
out->write( resultado1 ).

 DATA(resultado2) = substring_from( val = ls_nave2-ty_estado_mision-mision  sub = mision  ).
out->write( resultado2 ).

 DATA(resultado3) = substring_from( val = ls_nave3-ty_estado_mision-mision  sub = mision  ).
out->write( resultado3 ).

if resultado1 <> ' ' AND ls_nave1-ty_estado_mision-nivel_comb > 75.
out->write( 'Misión a Marte en condiciones óptimas' ).

ENDIF.

if resultado2 <> ' ' AND ls_nave2-ty_estado_mision-nivel_comb > 75.
out->write( 'Misión a Marte en condiciones óptimas' ).

ENDIF.if resultado3 <> ' ' AND ls_nave3-ty_estado_mision-nivel_comb > 75.
out->write( 'Misión a Marte en condiciones óptimas' ).

ENDIF.
  ENDMETHOD.
ENDCLASS.
