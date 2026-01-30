CLASS lhc_ZI_LUT_DETAILS DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_lut_details RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_lut_details RESULT result.

*    METHODS set_lutno
*      FOR DETERMINATION ON SAVE
*      IMPORTING keys FOR ZI_LUT_DETAILS~.

*         METHODS set_lutno
*      FOR DETERMINE ON SAVE
*      IMPORTING keys FOR ZI_LUT_DETAILS~set_lutno.
  METHODS set_lutno
      FOR DETERMINE ON SAVE
      IMPORTING keys FOR zi_lut_details~set_lutno.

ENDCLASS.

CLASS lhc_ZI_LUT_DETAILS IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

METHOD set_lutno.

  READ ENTITIES OF zi_lut_details IN LOCAL MODE
    ENTITY zi_lut_details
    FIELDS ( LutNo )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

  LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<fs>).

    " Only for newly created entries
    IF <fs>-LutNo IS INITIAL.

      " Example logic – adjust as per your requirement
      SELECT SINGLE MAX( lut_no )
        FROM ztb_lut_details
        INTO @DATA(lv_max_lutno).

      DATA(lv_new_lutno) = lv_max_lutno + 1.

      MODIFY ENTITIES OF zi_lut_details IN LOCAL MODE
        ENTITY zi_lut_details
        UPDATE
        FIELDS ( LutNo )
        WITH VALUE #(
          (
            %tky            = <fs>-%tky
            LutNo           = lv_new_lutno
            %control-LutNo  = if_abap_behv=>mk-on
          )
        ).

    ENDIF.

  ENDLOOP.

ENDMETHOD.


ENDCLASS.
