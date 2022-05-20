pageextension 70087 ItemTrackingSummaryExt extends "Item Tracking Summary"
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

        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 31". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 31". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.

        modify("Control 50")
        {

            //Unsupported feature: Change Name on "Control 50". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 1901775901")
        {

            //Unsupported feature: Change Name on "Control 1901775901". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1900545401". Please convert manually.


        //Unsupported feature: Change ImplicitType on "MaxQuantity1(Control 27)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900724401". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Selected1(Control 5)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900724101". Please convert manually.


        //Unsupported feature: Change BlankZero on "Undefined1(Control 6)". Please convert manually.

        addafter("Control 22")
        {
            field("External Dcument.no"; "External Dcument.no")
            {
            }
        }
    }


    //Unsupported feature: PropertyModification on "SetSources(PROCEDURE 1).xEntrySummary(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetSources : 338;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetSources : "Entry Summary";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UpdateSelectedQuantity(PROCEDURE 4).xEntrySummary(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateSelectedQuantity : 338;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateSelectedQuantity : "Entry Summary";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DrillDownEntries(PROCEDURE 7).TempReservEntry2(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DrillDownEntries : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DrillDownEntries : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DrillDownBinContent(PROCEDURE 11).BinContent(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DrillDownBinContent : 7302;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DrillDownBinContent : "Bin Content";
    //Variable type has not been exported.

    var
        BinContentPage: Page "Bin Content";


    //Unsupported feature: PropertyModification on "TempReservEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempReservEntry : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempReservEntry : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemTrackingDataCollection(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemTrackingDataCollection : 6501;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemTrackingDataCollection : "Item Tracking Data Collection";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CurrItemTrackingCode(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CurrItemTrackingCode : 6502;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CurrItemTrackingCode : "Item Tracking Code";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "xFilterRec(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //xFilterRec : 338;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //xFilterRec : "Entry Summary";
    //Variable type has not been exported.

    procedure BinContentPage();
    begin
    end;


    //Unsupported feature: CodeModification on "DrillDownBinContent(PROCEDURE 11)". Please convert manually.

    //procedure DrillDownBinContent();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF CurrBinCode = '' THEN
      EXIT;
    TempReservEntry.RESET;
    #4..18
    IF FieldNumber = FIELDNO("Bin Content") THEN
      BinContent.SETRANGE("Bin Code",CurrBinCode);

    BinContentForm.SETTABLEVIEW(BinContent);
    BinContentForm.RUNMODAL;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..21
    BinContentPage.SETTABLEVIEW(BinContent);
    BinContentPage.RUNMODAL;
    */
    //end;


    //Unsupported feature: CodeModification on "UpdateIfFiltersHaveChanged(PROCEDURE 9)". Please convert manually.

    //procedure UpdateIfFiltersHaveChanged();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // In order to update Selected Quantity when filters have been changed on the form.
    IF GETFILTERS = xFilterRec.GETFILTERS THEN
      EXIT;

    UpdateSelectedQuantity;
    xFilterRec.COPY(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // In order to update Selected Quantity when filters have been changed on the Page.
    #2..6
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

