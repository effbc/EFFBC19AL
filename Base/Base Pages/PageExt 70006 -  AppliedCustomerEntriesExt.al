pageextension 70006 AppliedCustomerEntriesExt extends "Applied Customer Entries"
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 77". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 77". Please convert manually.


        //Unsupported feature: Change Name on "Control 75". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 75". Please convert manually.


        //Unsupported feature: Change Name on "Control 73". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 73". Please convert manually.


        //Unsupported feature: Change Name on "Control 71". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 71". Please convert manually.


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 21". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 21". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 6")
        {
            field("External Document No."; "External Document No.")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 20". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 27". Please convert manually.


        //Unsupported feature: Change Name on "Action 27". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 32". Please convert manually.


        //Unsupported feature: Change Name on "Action 32". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 35". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 35". Please convert manually.


        //Unsupported feature: Change Name on "Action 35". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 19")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 19". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "FindApplnEntriesDtldtLedgEntry(PROCEDURE 1).DtldCustLedgEntry1(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FindApplnEntriesDtldtLedgEntry : 379;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FindApplnEntriesDtldtLedgEntry : "Detailed Cust. Ledg. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FindApplnEntriesDtldtLedgEntry(PROCEDURE 1).DtldCustLedgEntry2(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FindApplnEntriesDtldtLedgEntry : 379;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FindApplnEntriesDtldtLedgEntry : "Detailed Cust. Ledg. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CreateCustLedgEntry(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CreateCustLedgEntry : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CreateCustLedgEntry : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Navigate(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Navigate : 344;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Navigate : Navigate;
    //Variable type has not been exported.


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RESET;

    IF "Entry No." <> 0 THEN BEGIN
    #4..18

      SETCURRENTKEY("Closed by Entry No.");
      SETRANGE("Closed by Entry No.",CreateCustLedgEntry."Entry No.");
      IF FIND('-') THEN
        REPEAT
          MARK(TRUE);
        UNTIL NEXT = 0;
    #26..28
    END;

    MARKEDONLY(TRUE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..21
      IF FINDSET THEN
    #23..31
    */
    //end;


    //Unsupported feature: CodeModification on "FindApplnEntriesDtldtLedgEntry(PROCEDURE 1)". Please convert manually.

    //procedure FindApplnEntriesDtldtLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DtldCustLedgEntry1.SETCURRENTKEY("Cust. Ledger Entry No.");
    DtldCustLedgEntry1.SETRANGE("Cust. Ledger Entry No.",CreateCustLedgEntry."Entry No.");
    DtldCustLedgEntry1.SETRANGE(Unapplied,FALSE);
    IF DtldCustLedgEntry1.FIND('-') THEN
      REPEAT
        IF DtldCustLedgEntry1."Cust. Ledger Entry No." =
           DtldCustLedgEntry1."Applied Cust. Ledger Entry No."
    #8..11
            "Applied Cust. Ledger Entry No.",DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
          DtldCustLedgEntry2.SETRANGE("Entry Type",DtldCustLedgEntry2."Entry Type"::Application);
          DtldCustLedgEntry2.SETRANGE(Unapplied,FALSE);
          IF DtldCustLedgEntry2.FIND('-') THEN
            REPEAT
              IF DtldCustLedgEntry2."Cust. Ledger Entry No." <>
                 DtldCustLedgEntry2."Applied Cust. Ledger Entry No."
              THEN BEGIN
                SETCURRENTKEY("Entry No.");
                SETRANGE("Entry No.",DtldCustLedgEntry2."Cust. Ledger Entry No.");
                IF FIND('-') THEN
                  MARK(TRUE);
              END;
            UNTIL DtldCustLedgEntry2.NEXT = 0;
        END ELSE BEGIN
          SETCURRENTKEY("Entry No.");
          SETRANGE("Entry No.",DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
          IF FIND('-') THEN
            MARK(TRUE);
        END;
      UNTIL DtldCustLedgEntry1.NEXT = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    IF DtldCustLedgEntry1.FINDSET THEN BEGIN
    #5..14
          IF DtldCustLedgEntry2.FINDSET THEN BEGIN
    #16..21
                IF FINDFIRST THEN
    #23..25
          END;
    #26..28
          IF FINDFIRST THEN
    #30..32
    END;
    */
    //end;


    //Unsupported feature: CodeModification on "SetTempCustLedgEntry(PROCEDURE 2)". Please convert manually.

    //procedure SetTempCustLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NewTempCustLedgEntryNo <> 0 THEN BEGIN
      SETRANGE("Entry No.",NewTempCustLedgEntryNo);
      FIND('-');
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NewTempCustLedgEntryNo <> 0 THEN BEGIN
      SETRANGE("Entry No.",NewTempCustLedgEntryNo);
      FINDFIRST;
    END;
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

