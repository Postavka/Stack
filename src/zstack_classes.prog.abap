*&---------------------------------------------------------------------*
*& Include ZSTACK_CLASSES
*&---------------------------------------------------------------------*
CLASS lcl_stack DEFINITION FINAL.
  PUBLIC SECTION.

    METHODS push
      IMPORTING VALUE(iv_number) TYPE i.

    METHODS pop
      IMPORTING VALUE(iv_number) TYPE i
      RETURNING VALUE(rv_number) TYPE i.

    METHODS size
      RETURNING VALUE(rv_size) TYPE i.

  PRIVATE SECTION.
    TYPES: tt_data TYPE STANDARD TABLE OF ty_stack.

    DATA: mt_data TYPE tt_data.

    DATA: mw_data TYPE ty_stack.

ENDCLASS.

CLASS lcl_stack IMPLEMENTATION.


  METHOD push.
    mw_data-number = iv_number.
    APPEND mw_data to mt_data.
    Write / 'Значення '.
    write iv_number.
    write ' додано в стек'.
  ENDMETHOD.

  METHOD pop.
    DELETE mt_data where number = iv_number.
    Write / 'Усі значення '.
    write iv_number.
    write ' забрано зі стеку'.
  ENDMETHOD.

  METHOD size.
    rv_size = lines( mt_data ).
    write / 'Dlina massiva = '.
    write rv_size.
  ENDMETHOD.
ENDCLASS.
