pageextension 70171 ResourceJournalExt extends "Resource Journal"
{
    // version NAVW19.00.00.45778,Rev01

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 59". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 59". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 300". Please convert manually.


        //Unsupported feature: Change Name on "Control 300". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 302". Please convert manually.


        //Unsupported feature: Change Name on "Control 302". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 304". Please convert manually.


        //Unsupported feature: Change Name on "Control 304". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 306". Please convert manually.


        //Unsupported feature: Change Name on "Control 306". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 308". Please convert manually.


        //Unsupported feature: Change Name on "Control 308". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 310". Please convert manually.


        //Unsupported feature: Change Name on "Control 310". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 55". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 55". Please convert manually.


        //Unsupported feature: Change Name on "Control 57". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 57". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 51". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 51". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 5". Please convert manually.


        //Unsupported feature: Change Name on "Control 7". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 7". Please convert manually.

        modify("Control 41")
        {

            //Unsupported feature: Change Name on "Control 41". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 1903222401")
        {

            //Unsupported feature: Change Name on "Control 1903222401". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1901652401". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 43". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.


        //Unsupported feature: CodeModification on "Control 39.OnLookup". Please convert manually.

        //trigger OnLookup();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        ResJnlManagement.LookupName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3

        {IF CurrentJnlBatchName='INS-RWL' THEN
        BEGIN
        CurrPage.Zones.VISIBLE:=TRUE;
        CurrPage.Division.VISIBLE:=TRUE;
        CurrPage.Station.VISIBLE:=TRUE;
        CurrPage.State.VISIBLE:=FALSE;
        CurrPage.District.VISIBLE:=FALSE;
        CurrPage.City.VISIBLE:=FALSE;
        CurrPage."Product type".VISIBLE:=TRUE;
        CurrPage."Sale order no".VISIBLE:=TRUE;
        CurrPage."Serial no".VISIBLE:=TRUE;
        CurrPage."Work Description".VISIBLE:=FALSE;
        CurrPage."Training/Demo".VISIBLE:=FALSE;
        CurrPage.Designation.VISIBLE:=FALSE;
        CurrPage.Location.VISIBLE:=FALSE;
        CurrPage."Action taken".VISIBLE:=FALSE;
        CurrPage.Reason.VISIBLE:=FALSE;
        CurrPage.Remarks.VISIBLE:=FALSE;
        CurrPage."Work Type Code".VISIBLE:=TRUE;
        END ELSE
        IF CurrentJnlBatchName='MAIN' THEN
        BEGIN
        CurrPage."Document No.".VISIBLE:=TRUE;
        //CurrPage."Document No.".ENABLED:=FALSE
        CurrPage.Zones.VISIBLE:=TRUE;
        CurrPage.Division.VISIBLE:=TRUE;
        CurrPage.Station.VISIBLE:=TRUE;
        CurrPage.State.VISIBLE:=FALSE;
        CurrPage.District.VISIBLE:=FALSE;
        CurrPage.City.VISIBLE:=FALSE;
        CurrPage."Product type".VISIBLE:=TRUE;
        CurrPage."Sale order no".VISIBLE:=FALSE;
        CurrPage."Serial no".VISIBLE:=FALSE;
        CurrPage."Work Description".VISIBLE:=TRUE;
        CurrPage."Training/Demo".VISIBLE:=FALSE;
        CurrPage.Designation.VISIBLE:=FALSE;
        CurrPage.Location.VISIBLE:=FALSE;
        CurrPage."Action taken".VISIBLE:=FALSE;
        CurrPage.Reason.VISIBLE:=FALSE;
        CurrPage.Remarks.VISIBLE:=FALSE;
        CurrPage."Work Type Code".VISIBLE:=FALSE;
        END ELSE
        IF CurrentJnlBatchName='GENERAL' THEN
        BEGIN
        CurrPage.Zones.VISIBLE:=TRUE;
        CurrPage.Division.VISIBLE:=TRUE;
        CurrPage.Station.VISIBLE:=TRUE;
        CurrPage.State.VISIBLE:=FALSE;
        CurrPage.District.VISIBLE:=FALSE;
        CurrPage.City.VISIBLE:=FALSE;
        CurrPage.Place.VISIBLE:=FALSE;
        CurrPage."Work Description".VISIBLE:=TRUE;
        CurrPage."Product type".VISIBLE:=TRUE;
        CurrPage."Sale order no".VISIBLE:=FALSE;
        CurrPage."Serial no".VISIBLE:=FALSE;
        CurrPage."Action taken".VISIBLE:=TRUE;
        CurrPage."Work Type Code".VISIBLE:=FALSE;
        CurrPage."Training/Demo".VISIBLE:=FALSE;
        CurrPage.Designation.VISIBLE:=FALSE;
        CurrPage.Location.VISIBLE:=FALSE;
        CurrPage."Work Description".VISIBLE:=TRUE;
        CurrPage.Remarks.VISIBLE:=TRUE;
        END ELSE
        IF CurrentJnlBatchName='DEMO' THEN
        BEGIN
        CurrPage."Shortcut Dimension 1 Code".VISIBLE:=TRUE;
        CurrPage.Zones.VISIBLE:=TRUE;
        CurrPage.Division.VISIBLE:=TRUE;
        CurrPage.Station.VISIBLE:=TRUE;
        CurrPage.State.VISIBLE:=FALSE;
        CurrPage.District.VISIBLE:=FALSE;
        CurrPage.City.VISIBLE:=FALSE;
        CurrPage.Place.VISIBLE:=FALSE;
        CurrPage."Work Description".VISIBLE:=FALSE;
        CurrPage."Product type".VISIBLE:=TRUE;
        CurrPage."Sale order no".VISIBLE:=FALSE;
        CurrPage."Serial no".VISIBLE:=FALSE;
        CurrPage."Action taken".VISIBLE:=FALSE;
        CurrPage.Reason.VISIBLE:=FALSE;
        CurrPage.Remarks.VISIBLE:=FALSE;
        CurrPage."Work Type Code".VISIBLE:=FALSE;
        CurrPage."Service item".VISIBLE:=FALSE;
        END ELSE
        IF CurrentJnlBatchName='LEAVE' THEN
        BEGIN
        CurrPage.Zones.VISIBLE:=FALSE;
        CurrPage.Division.VISIBLE:=FALSE;
        CurrPage.Station.VISIBLE:=FALSE;
        CurrPage.State.VISIBLE:=FALSE;
        CurrPage.District.VISIBLE:=FALSE;
        CurrPage.City.VISIBLE:=FALSE;
        CurrPage.Place.VISIBLE:=FALSE;
        CurrPage."Work Description".VISIBLE:=TRUE;
        CurrPage."Product type".VISIBLE:=FALSE;
        CurrPage."Sale order no".VISIBLE:=FALSE;
        CurrPage."Serial no".VISIBLE:=FALSE;
        CurrPage."Action taken".VISIBLE:=FALSE;
        CurrPage.Reason.VISIBLE:=FALSE;
        CurrPage.Remarks.VISIBLE:=FALSE;
        CurrPage."Work Type Code".VISIBLE:=FALSE;
        CurrPage."Training/Demo".VISIBLE:=FALSE;
        CurrPage.Designation.VISIBLE:=FALSE;
        CurrPage.Location.VISIBLE:=FALSE;
        CurrPage."Service item".VISIBLE:=FALSE;

        END ELSE
        IF CurrentJnlBatchName='TRAINING' THEN
        BEGIN
        CurrPage."Shortcut Dimension 1 Code".VISIBLE:=TRUE;
        CurrPage."Shortcut Dimension 2 Code".VISIBLE:=TRUE;
        CurrPage.Zones.VISIBLE:=TRUE;
        CurrPage.Division.VISIBLE:=TRUE;
        CurrPage.Station.VISIBLE:=TRUE;
        CurrPage.State.VISIBLE:=FALSE;
        CurrPage.District.VISIBLE:=FALSE;
        CurrPage.City.VISIBLE:=FALSE;
        CurrPage.Place.VISIBLE:=FALSE;
        CurrPage."Work Description".VISIBLE:=FALSE;
        CurrPage."Product type".VISIBLE:=FALSE;
        CurrPage."Sale order no".VISIBLE:=FALSE;
        CurrPage."Serial no".VISIBLE:=FALSE;
        CurrPage."Action taken".VISIBLE:=FALSE;
        CurrPage.Reason.VISIBLE:=FALSE;
        CurrPage.Remarks.VISIBLE:=FALSE;
        CurrPage."Work Type Code".VISIBLE:=FALSE;
        CurrPage."Service item".VISIBLE:=FALSE;

        END ELSE IF CurrentJnlBatchName='IN-DEPT' THEN
        BEGIN
        CurrPage.Zones.VISIBLE:=TRUE;
        CurrPage.Division.VISIBLE:=TRUE;
        CurrPage.Station.VISIBLE:=TRUE;
        CurrPage.State.VISIBLE:=FALSE;
        CurrPage.District.VISIBLE:=FALSE;
        CurrPage.City.VISIBLE:=FALSE;
        CurrPage.Place.VISIBLE:=FALSE;
        CurrPage."Work Description".VISIBLE:=TRUE;
        CurrPage."Product type".VISIBLE:=FALSE;
        CurrPage."Sale order no".VISIBLE:=FALSE;
        CurrPage."Serial no".VISIBLE:=FALSE;
        CurrPage."Action taken".VISIBLE:=FALSE;
        CurrPage.Reason.VISIBLE:=FALSE;
        CurrPage.Remarks.VISIBLE:=FALSE;
        CurrPage."Shortcut Dimension 2 Code".VISIBLE:=FALSE;
        CurrPage."Work Type Code".VISIBLE:=FALSE;
        CurrPage."Training/Demo".VISIBLE:=FALSE;
        CurrPage.Designation.VISIBLE:=FALSE;
        CurrPage.Location.VISIBLE:=FALSE;
        CurrPage."Service item".VISIBLE:=FALSE;

        END ELSE
        BEGIN
        CurrPage.Zones.VISIBLE:=TRUE;
        CurrPage.Division.VISIBLE:=TRUE;
        CurrPage.Station.VISIBLE:=TRUE;
        CurrPage.State.VISIBLE:=TRUE;
        CurrPage.District.VISIBLE:=TRUE;
        CurrPage.City.VISIBLE:=TRUE;
        //CurrPage.Place.VISIBLE:=TRUE;

        CurrPage."Product type".VISIBLE:=TRUE;
        CurrPage."Sale order no".VISIBLE:=TRUE;
        CurrPage."Serial no".VISIBLE:=TRUE;
        CurrPage."Work Description".VISIBLE:=TRUE;
        END;}
        */
        //end;
        modify("Control 12")
        {
            Visible = false;
        }
        addfirst("Control 1")
        {
            field("Journal Template Name"; "Journal Template Name")
            {
            }
            field("Line No."; "Line No.")
            {
            }
            field(Place; Place)
            {
            }
        }
        addafter("Control 8")
        {
            field(Location; Location)
            {
            }
            field(Description; Description)
            {
                Caption = 'Name';
            }
        }
        addafter("Control 46")
        {
            field(Reason; Reason)
            {
                Caption = 'Work Desc';
            }
            field(Remarks; Remarks)
            {
            }
            field("Planned Hr's"; "Planned Hr's")
            {
                Caption = 'Planned Hr''s';
            }
            field(Status; Status)
            {
            }
        }
        addafter("Control 1903222401")
        {
            field(WorkDate; WORKDATE)
            {
                Editable = false;
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 61". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 62". Please convert manually.


        //Unsupported feature: Change Name on "Action 62". Please convert manually.


        //Unsupported feature: Change Name on "Action 37". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 42". Please convert manually.


        //Unsupported feature: Change Name on "Action 42". Please convert manually.

        modify("Action 45")
        {

            //Unsupported feature: Change RunObject on "Action 45". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 45". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 36". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 47". Please convert manually.


        //Unsupported feature: Change Name on "Action 47". Please convert manually.

        modify(Post)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 49")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 49". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 9". Please convert manually.

        modify(SuggestLinesFromTimeSheets)
        {

            //Unsupported feature: Change Ellipsis on "SuggestLinesFromTimeSheets(Action 11)". Please convert manually.

            Promoted = true;
        }
    }


    //Unsupported feature: PropertyModification on "SuggestLinesFromTimeSheets(Action 11).OnAction.SuggestResJnlLines(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SuggestLinesFromTimeSheets : 951;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SuggestLinesFromTimeSheets : "Suggest Res. Jnl. Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ResJnlManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ResJnlManagement : 270;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ResJnlManagement : ResJnlManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReportPrint(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReportPrint : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReportPrint : "Test Report-Print";
    //Variable type has not been exported.

    var
        ResLedgEntry: Record "Res. Ledger Entry";

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

