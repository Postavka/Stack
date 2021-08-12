*&---------------------------------------------------------------------*
*& Report ZSTACK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zstack.

include zstack_types.

include zstack_classes.

start-of-selection.

  data stack type ref to lcl_stack.
  create object stack.

 write 'Simply for visual'.

 stack->push( 'First' ).
 stack->push( 'Second' ).
 stack->push( 'Third' ).
 stack->push( '4rth' ).
 stack->push( '5th' ).

 write / 'The last element is: '.
 write stack->pop( ).
 write / 'The first element is: '.
 write stack->shift( ).
 write / 'Now we will add zero on the first position'.
 stack->unshift( 'zero' ).
 write / 'And now the first element is: '.
 write stack->shift( ).
