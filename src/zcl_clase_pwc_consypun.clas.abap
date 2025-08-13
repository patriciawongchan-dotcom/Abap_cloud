CLASS zcl_clase_pwc_consypun DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*atributos publicos accesibles desde fuera de la clase
DATA: lv_name type string,
      lv_age type i.

*definicion del metodo constructor que recibe parametros de entrada
METHODS: constructor IMPORTING iv_name type string
                               iv_age type i.


  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_clase_pwc_consypun IMPLEMENTATION.

METHOD constructor.

lv_age = iv_age. "asigna el valor recibido a la variable lv_age

lv_name = iv_name. "asigna el valor recibido a la variable lv_name


ENDMETHOD.



METHOD if_oo_adt_classrun~main.

"VALUE inicializar valores en tablas, estructuras y variables

"CORRESPONDING expresion que crea una tabla interna copiandola de otra solo con los campos q tengan similares

"CORRESPONDING MAPPING
 TYPES: BEGIN OF  ty_employee,
        emp_name type string,
        emp_age type i,
        END OF TY_EMPLOYEE.

TYPES: BEGIN OF  ty_person,
        name type string,
        age type i,
        END OF TY_person.

DATA: lt_employee type TABLE of ty_employee,
      lt_person type TABLE of ty_person,
      lt_client type TABLE of ty_person.


lt_employee = value #( ( emp_name = 'Pedro'
                        emp_age = 30 ) ).


out->write( data = lt_employee name = 'LT_EMPLOYEE' ).


lt_person = CORRESPONDING #( lt_employee mapping name = emp_name age = emp_age ).

out->write( data = lt_person name = 'LT_person' ).

" CORRESPONDING CON EL BASE

lt_client = value #( ( name = 'Maria' age = 50 ) ).

lt_client = CORRESPONDING #( base ( lt_client ) lt_person ).

out->write( data = lt_client name = 'LT_client' ).

" EXCEP

LT_PERSON = CORRESPONDING #( LT_CLIENT EXCEPT AGE ).
out->write( data = lt_person name = 'LT_person' ).

" DISCARTING DUPLICATES

DATA: LT_ITAB1 TYPE TABLE OF TY_PERSON WITH EMPTY KEY,
      LT_ITAB2 TYPE SORTED TABLE OF TY_PERSON WITH UNIQUE KEY NAME.

LT_ITAB1 = VALUE #( ( NAME = 'maria' age = 25 )
                     ( NAME = 'maria' age = 25 )
                     ( NAME = 'maria' age = 22 )
                     ( NAME = 'pedro' age = 24 ) ).

out->write( data = LT_ITAB1 name = 'LT_ITAB1' ).
lt_itab2 = CORRESPONDING #( lt_itab1 discarding duplicates ).

out->write( data = LT_ITAB2 name = 'LT_ITAB2' ).

" NEW se utiliza para crear instancias de clases y estructuras de manera mas compacta y leguble.
"Puedes instanciar un objeto o estructura directamente al asignarlo a una variable, sin necesidad de declarar
"el tipo explicitamente si ya esta implicito.

DATA lo_data type REF TO i."declaramos una variable de referencia a un entero(i)

"creamos un nuevo objeto de tipo entero(inferido por #) con valor inicial 12345

lo_data = NEW #( 12345 ).

"mostamos el valor de la referencia lo_data

out->write( lo_data ).

"declaramos y creamos una referencia a un objeto string con el valor de 'Experis'

DATA(lo_data2) = NEW string( 'Experis' ).
out->write( lo_data2 ).









ENDMETHOD.

ENDCLASS.
