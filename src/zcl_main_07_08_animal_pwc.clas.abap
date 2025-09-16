CLASS zcl_main_07_08_animal_pwc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_main_07_08_animal_pwc IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

*DATA(LO_ANIMAL) = NEW zcl_07_class_animal_pwc(  ).
*DATA(LO_LEON) = NEW zcl_08_class_leon_pwc(  ).
*
*OUT->write( LO_ANIMAL->walk(  ) ).
*OUT->write( LO_LEON->walk(  ) ).
*
*LO_ANIMAL = LO_LEON.
*
*OUT->write( 'NARROWING CASTING (UP CAST)' ).
*OUT->write( LO_ANIMAL->walk(  ) ).
*OUT->write( LO_LEON->walk(  ) ).

DATA(LO_DER) = NEW zcl_07_leon(  ).






ENDMETHOD.
ENDCLASS.
