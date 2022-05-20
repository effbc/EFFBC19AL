pageextension 70260 WhseItemJournalExt extends "Whse. Item Journal"
{
    // version NAVW19.00.00.48822,Rev01

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 9". Please convert manually.


        //Unsupported feature: Change Name on "Control 9". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 9". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 63". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 63". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 67". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 67". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.

        modify("Control 22")
        {

            //Unsupported feature: Change Name on "Control 22". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 1900669001")
        {

            //Unsupported feature: Change Name on "Control 1900669001". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1901652601". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 1901652601")
        {
            group("Work Date")
            {
                Caption = 'Work Date';
                field(WorkDate; WORKDATE)
                {
                    Editable = false;
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 4". Please convert manually.


        //Unsupported feature: Change Name on "Action 16". Please convert manually.


        //Unsupported feature: Change Name on "Action 5". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 8". Please convert manually.


        //Unsupported feature: Change Name on "Action 8". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 38". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 38". Please convert manually.


        //Unsupported feature: Change Name on "Action 38". Please convert manually.

        modify("Action 41")
        {

            //Unsupported feature: Change RunObject on "Action 41". Please convert manually.


            //Unsupported feature: Change RunPageLink on "Action 41". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 41". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 42". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 42". Please convert manually.


        //Unsupported feature: Change Name on "Action 42". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 3". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 3". Please convert manually.


        //Unsupported feature: Change Name on "Action 3". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 32". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 33". Please convert manually.


        //Unsupported feature: Change Name on "Action 33". Please convert manually.

        modify("Action 34")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 34". Please convert manually.

        }
        modify("Action 35")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 35". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "ReportPrint(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReportPrint : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReportPrint : "Test Report-Print";
    //Variable type has not been exported.


    //Unsupported feature: CodeModification on "OnNewRecord". Please convert manually.

    //trigger OnNewRecord(BelowxRec : Boolean);
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetUpNewLine(xRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
      SetUpNewLine(xRec);
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

