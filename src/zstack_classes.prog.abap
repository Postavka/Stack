*&---------------------------------------------------------------------*
*& Include ZSTACK_CLASSES
*&---------------------------------------------------------------------*
class lcl_stack definition final.
  public section.

    types: ty_stack type string.


    methods push
      importing
        value(iv_value) type ty_stack.

    methods pop
      returning
        value(rv_value) type ty_stack.

    methods shift
      returning
        value(rv_value) type ty_stack.

    methods unshift
       importing
        value(iv_value) type ty_stack.

    methods size
      returning value(rv_size) type i.

  private section.
    types: tt_data type standard table of ty_stack.


    data: mt_data type tt_data.



endclass.

class lcl_stack implementation.


  method push.
    data: mw_data type ty_stack.

    mw_data = iv_value.
    append mw_data to mt_data.

  endmethod.

   method unshift.
    data: mw_data type ty_stack.

    mw_data = iv_value.
    insert mw_data into mt_data index 1.

  endmethod.

  method pop.
    data number type i.

    number = lines( mt_data ).

    read table mt_data index number into rv_value.

    delete mt_data index number.

  endmethod.

   method shift.

    read table mt_data index 1 into rv_value.

    delete mt_data index 1.

  endmethod.

  method size.
    rv_size = lines( mt_data ).
  endmethod.
endclass.

**********************************************************************
* unit tests
**********************************************************************

class ltcl_test_stack definition
  for testing
  risk level harmless
  duration short.

  private section.

    methods do_test for testing.
    methods do_test2 for testing.
    methods do_shift for testing.
    methods do_unshift for testing.

endclass.

class ltcl_test_stack implementation.

  method do_test.

    data lo_stack type ref to lcl_stack.

    create object lo_stack.

    cl_abap_unit_assert=>assert_equals(
      act = lo_stack->size( )
      exp = 0 ).

    lo_stack->push( '1' ).

    cl_abap_unit_assert=>assert_equals(
      act = lo_stack->size( )
      exp = 1 ).

    lo_stack->pop(  ).

    cl_abap_unit_assert=>assert_equals(
      act = lo_stack->size( )
      exp = 0 ).


  endmethod.

  method do_test2.
    data lo_stack type ref to lcl_stack.

    create object lo_stack.

    lo_stack->push( 'First' ).

    cl_abap_unit_assert=>assert_equals(
      act = lo_stack->pop( )
      exp = 'First' ).

    lo_stack->push( 'First' ).
    lo_stack->push( 'Second' ).
    lo_stack->push( 'Third' ).

    cl_abap_unit_assert=>assert_equals(
      act = lo_stack->pop( )
      exp = 'Third' ).



  endmethod.

  method do_shift.
     data lo_stack type ref to lcl_stack.

    create object lo_stack.

    lo_stack->push( 'First' ).
    lo_stack->push( 'Second' ).
    lo_stack->push( 'Third' ).


    cl_abap_unit_assert=>assert_equals(
      act = lo_stack->shift( )
      exp = 'First' ).

   cl_abap_unit_assert=>assert_equals(
      act = lo_stack->size( )
      exp = 2 ).

  endmethod.

  method do_unshift.
    data lo_stack type ref to lcl_stack.

    create object lo_stack.

    lo_stack->push( 'Second' ).
    lo_stack->push( 'Third' ).
    lo_stack->unshift( 'First' ).

    cl_abap_unit_assert=>assert_equals(
        act = lo_stack->size( )
        exp = 3 ).

    cl_abap_unit_assert=>assert_equals(
      act = lo_stack->shift( )
      exp = 'First' ).

    cl_abap_unit_assert=>assert_equals(
      act = lo_stack->size( )
      exp = 2 ).

  endmethod.



endclass.
