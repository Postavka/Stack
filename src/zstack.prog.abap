*&---------------------------------------------------------------------*
*& Report ZSTACK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zstack.

INCLUDE zstack_types.

INCLUDE zstack_classes.

START-OF-SELECTION.

DATA stack TYPE REF TO lcl_stack.
CREATE OBJECT stack.

stack->push( iv_number = 1 ).
stack->size( ).
stack->pop( iv_number = 1 ).
stack->size( ).
