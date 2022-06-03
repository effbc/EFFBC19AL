pageextension 70086 ItemTrackingLinesExt extends "Item Tracking Lines"
{
    // version NAVW19.00.00.50785,NAVIN9.00.00.50785,Rev01

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 59")
        {

            //Unsupported feature: Change Name on "Control 59". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 1903651101")
        {

            //Unsupported feature: Change Name on "Control 1903651101". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1900546401". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901742101". Please convert manually.

        modify("Control 87")
        {

            //Unsupported feature: Change Name on "Control 87". Please convert manually.


            //Unsupported feature: Change ImplicitType on "Control 87". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1903866601". Please convert manually.

        modify("Control 88")
        {

            //Unsupported feature: Change Name on "Control 88". Please convert manually.


            //Unsupported feature: Change ImplicitType on "Control 88". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change BlankZero on "Quantity3(Control 40)". Please convert manually.


        //Unsupported feature: Change BlankZero on "Handle3(Control 41)". Please convert manually.


        //Unsupported feature: Change BlankZero on "Invoice3(Control 42)". Please convert manually.

        modify("Control 82")
        {

            //Unsupported feature: Change Name on "Control 82". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Lookup on "Control 84". Please convert manually.


        //Unsupported feature: Change Name on "Control 84". Please convert manually.


        //Unsupported feature: Change Name on "Control 85". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change Visible on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 75". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 75". Please convert manually.


        //Unsupported feature: Change Name on "Control 48". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 48". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 80". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 80". Please convert manually.


        //Unsupported feature: CodeModification on "Control 22.OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SerialNoOnAfterValidate;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        Item.GET(Item."No.");
        IF (Item."Item Tracking Code"='LOT') AND ("Serial No."<>'')THEN
        ERROR('Please donot enter serial No.');
        SerialNoOnAfterValidate;

        // Rev01 >>
        IF "Source ID" = 'OUTPUT' THEN BEGIN
          ILERec.RESET;
          ILERec.SETCURRENTKEY("Item No.");
          ILERec.SETRANGE("Item No.","Item No.");
          ILERec.SETRANGE("Serial No.","Serial No.");
          IF ILERec.FINDFIRST THEN
            ERROR('Already serial no exits');
        END;
        // Rev01 <<
        */
        //end;


        //Unsupported feature: CodeModification on "Control 12.OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        QuantityBaseOnValidate;
        QuantityBaseOnAfterValidate;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {
        IF NOT CheckLine(Rec) THEN
          EXIT;
        }
        ILN.SETRANGE(ILN."Lot No.","Lot No.");
        ILN.SETRANGE(ILN."Item No","Item No.");
        IF ILN.FINDFIRST THEN
        BEGIN
        IF "Quantity (Base)"=0 THEN
        ILN.DELETE;
        END;
        */
        //end;
        moveafter("Lot No."; "Control 53")
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change RunObject on ""Reclass_SerialNoInfoCard"(Action 67)". Please convert manually.


        //Unsupported feature: Change RunPageLink on ""Reclass_SerialNoInfoCard"(Action 67)". Please convert manually.


        //Unsupported feature: Change RunObject on ""Reclass_LotNoInfoCard"(Action 68)". Please convert manually.


        //Unsupported feature: Change RunPageLink on ""Reclass_LotNoInfoCard"(Action 68)". Please convert manually.


        //Unsupported feature: Change Name on "Action 69". Please convert manually.


        //Unsupported feature: Change RunPageOnRec on "NewLotNoInformation(Action 71)". Please convert manually.


        //Unsupported feature: Change RunObject on ""Line_SerialNoInfoCard"(Action 73)". Please convert manually.


        //Unsupported feature: Change RunPageLink on ""Line_SerialNoInfoCard"(Action 73)". Please convert manually.


        //Unsupported feature: Change RunObject on ""Line_LotNoInfoCard"(Action 74)". Please convert manually.


        //Unsupported feature: Change RunPageLink on ""Line_LotNoInfoCard"(Action 74)". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Visible on ""Assign Serial No."(Action 51)". Please convert manually.


        //Unsupported feature: Change Visible on ""Assign Lot No."(Action 52)". Please convert manually.


        //Unsupported feature: Change Name on "Action 77". Please convert manually.


        //Unsupported feature: Change Visible on "Action 77". Please convert manually.


        //Unsupported feature: Change Name on "Action 79". Please convert manually.


        //Unsupported feature: Change Visible on "Action 79". Please convert manually.


        //Unsupported feature: Change Name on "Action 44". Please convert manually.


        //Unsupported feature: Change Name on "Action 45". Please convert manually.

        modify("Select Entries")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 64")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 64". Please convert manually.

        }


        //Unsupported feature: CodeInsertion on "NewSerialNoInformation(Action 70).OnAction". Please convert manually.

        //trigger (Variable: SerialNoInfoPage)();
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: CodeModification on "NewSerialNoInformation(Action 70).OnAction". Please convert manually.

        //trigger OnAction();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("New Serial No.");

        CLEAR(SerialNoInfoForm);
        SerialNoInfoForm.Init(Rec);

        SerialNoInfoNew.SETRANGE("Item No.","Item No.");
        SerialNoInfoNew.SETRANGE("Variant Code","Variant Code");
        SerialNoInfoNew.SETRANGE("Serial No.","New Serial No.");

        SerialNoInfoForm.SETTABLEVIEW(SerialNoInfoNew);
        SerialNoInfoForm.RUN;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("New Serial No.");

        CLEAR(SerialNoInfoPage);
        SerialNoInfoPage.Init(Rec);
        #5..9
        SerialNoInfoPage.SETTABLEVIEW(SerialNoInfoNew);
        SerialNoInfoPage.RUN;
        */
        //end;


        //Unsupported feature: CodeInsertion on "NewLotNoInformation(Action 71).OnAction". Please convert manually.

        //trigger (Variable: LotNoInfoPage)();
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: CodeModification on "NewLotNoInformation(Action 71).OnAction". Please convert manually.

        //trigger OnAction();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("New Lot No.");

        CLEAR(LotNoInfoForm);
        LotNoInfoForm.Init(Rec);

        LotNoInfoNew.SETRANGE("Item No.","Item No.");
        LotNoInfoNew.SETRANGE("Variant Code","Variant Code");
        LotNoInfoNew.SETRANGE("Lot No.","New Lot No.");

        LotNoInfoForm.SETTABLEVIEW(LotNoInfoNew);
        LotNoInfoForm.RUN;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("New Lot No.");

        CLEAR(LotNoInfoPage);
        LotNoInfoPage.Init(Rec);
        #5..9
        LotNoInfoPage.SETTABLEVIEW(LotNoInfoNew);
        LotNoInfoPage.RUN;
        */
        //end;
        addafter("Action 79")
        {
            separator(Action1102152000)
            {
            }
            action("Assign Serial No.'s")
            {
                Caption = 'Assign Serial No.''s';
                Visible = false;

                trigger OnAction();
                var
                    "AssignSerialNo.": Record "Assign Serial No.";
                begin
                    "AssignSerialNo.".DELETEALL;
                    "AssignSerialNo.".INIT;
                    "AssignSerialNo."."Entry No." := "AssignSerialNo."."Entry No." + 1;
                    "AssignSerialNo."."Item No." := "Item No.";
                    "AssignSerialNo."."Location Code" := "Location Code";
                    "AssignSerialNo."."Quantity (Base)" := "Quantity (Base)";
                    "AssignSerialNo.".Description := Description;
                    "AssignSerialNo."."Creation Date" := "Creation Date";
                    "AssignSerialNo."."Source Type" := "Source Type";
                    "AssignSerialNo."."Source Subtype" := "Source Subtype";
                    "AssignSerialNo."."Source ID" := "Source ID";
                    "AssignSerialNo."."Source Batch Name" := "Source Batch Name";
                    "AssignSerialNo."."Source Prod. Order Line" := "Source Prod. Order Line";
                    "AssignSerialNo."."Source Ref. No." := "Source Ref. No.";
                    "AssignSerialNo."."Appl.-to Item Entry" := "Appl.-to Item Entry";
                    "AssignSerialNo."."Transfer Item Entry No." := "Transfer Item Entry No.";
                    "AssignSerialNo."."Serial No." := "Serial No.";
                    "AssignSerialNo.".Positive := Positive;
                    "AssignSerialNo."."Qty. per Unit of Measure" := "Qty. per Unit of Measure";
                    "AssignSerialNo."."Warranty Date" := "Warranty Date";
                    "AssignSerialNo."."Expiration Date" := "Expiration Date";
                    "AssignSerialNo."."Qty. to Handle (Base)" := "Qty. to Handle (Base)";
                    "AssignSerialNo."."Qty. to Invoice (Base)" := "Qty. to Invoice (Base)";
                    "AssignSerialNo."."Quantity Handled (Base)" := "Quantity Handled (Base)";
                    "AssignSerialNo."."Quantity Invoiced (Base)" := "Quantity Invoiced (Base)";
                    "AssignSerialNo."."Qty. to Handle" := "Qty. to Handle";
                    "AssignSerialNo."."Qty. to Invoice" := "Qty. to Invoice";
                    "AssignSerialNo."."Buffer Status" := "Buffer Status";
                    "AssignSerialNo."."New Serial No." := "New Serial No.";
                    "AssignSerialNo."."New Lot No." := "New Lot No.";
                    "AssignSerialNo."."Lot No." := "Lot No.";
                    "AssignSerialNo."."Variant Code" := "Variant Code";
                    "AssignSerialNo."."Bin Code" := "Bin Code";
                    "AssignSerialNo.".Correction := Correction;
                    "AssignSerialNo."."Quantity actual Handled (Base)" := "Quantity actual Handled (Base)";
                    "AssignSerialNo.".INSERT;
                    REPORT.RUN(60013, TRUE, FALSE, "AssignSerialNo.");
                    CurrPage.UPDATE(FALSE);
                end;
            }
            action("&Serial Lot")
            {
                Caption = '&Serial Lot';

                trigger OnAction();
                begin
                    IF InsertIsBlocked THEN
                        EXIT;
                    Item.GET(Item."No.");
                    IF (Item."Item Tracking Code" = 'LOT') THEN
                        ERROR('Tracking code for Item is only lot')
                    ELSE
                        CreateCustomizedSN;
                end;
            }
            action("Only L&ot")
            {
                Caption = 'Only L&ot';

                trigger OnAction();
                begin
                    //DRK <<
                    IF InsertIsBlocked THEN
                        EXIT;
                    AssignEffLotNo;
                    //DRK >>
                end;
            }
            action("&Manual Serial No.'s")
            {
                Caption = '&Manual Serial No.''s';

                trigger OnAction();
                begin
                    IF InsertIsBlocked THEN
                        EXIT;
                    Item.GET(Item."No.");
                    IF (Item."Item Tracking Code" = 'LOT') THEN
                        ERROR('Tracking code for Item is only lot')
                    ELSE
                        ManualSerialNo;
                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "NewSerialNoInformation(Action 70).OnAction.SerialNoInfoNew(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //NewSerialNoInformation : 6504;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NewSerialNoInformation : "Serial No. Information";
    //Variable type has not been exported.

    var
        SerialNoInfoPage: Page "Serial No. Information Card";


    //Unsupported feature: PropertyModification on "NewLotNoInformation(Action 71).OnAction.LotNoInfoNew(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //NewLotNoInformation : 6505;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NewLotNoInformation : "Lot No. Information";
    //Variable type has not been exported.

    var
        LotNoInfoPage: Page "Lot No. Information Card";


    //Unsupported feature: PropertyModification on "OnDeleteRecord.TrackingSpec(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnDeleteRecord.TrackingSpec : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnDeleteRecord.TrackingSpec : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OnDeleteRecord.WMSManagement(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnDeleteRecord.WMSManagement : 7302;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnDeleteRecord.WMSManagement : "WMS Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OnModifyRecord.xTempTrackingSpec(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnModifyRecord.xTempTrackingSpec : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnModifyRecord.xTempTrackingSpec : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetSource(PROCEDURE 1).ReservEntry(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetSource : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetSource : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetSource(PROCEDURE 1).TempTrackingSpecification(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetSource : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetSource : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetSource(PROCEDURE 1).TempTrackingSpecification2(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetSource : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetSource : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetSource(PROCEDURE 1).CreateReservEntry(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetSource : 99000830;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetSource : "Create Reserv. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AddReservEntriesToTempRecSet(PROCEDURE 15).FromReservEntry(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AddReservEntriesToTempRecSet : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AddReservEntriesToTempRecSet : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalculateSums(PROCEDURE 2).xTrackingSpec(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalculateSums : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalculateSums : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempRecIsValid(PROCEDURE 6).ReservEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempRecIsValid : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempRecIsValid : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RegisterChange(PROCEDURE 11).ReservEntry1(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RegisterChange : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RegisterChange : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RegisterChange(PROCEDURE 11).ReservEntry2(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RegisterChange : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RegisterChange : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RegisterChange(PROCEDURE 11).CreateReservEntry(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RegisterChange : 99000830;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RegisterChange : "Create Reserv. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RegisterChange(PROCEDURE 11).ReservationMgt(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RegisterChange : 99000845;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RegisterChange : "Reservation Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UpdateOrderTracking(PROCEDURE 26).TempReservEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateOrderTracking : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateOrderTracking : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetQtyToHandleAndInvoice(PROCEDURE 7).ReservEntry1(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetQtyToHandleAndInvoice : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetQtyToHandleAndInvoice : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetQtyToHandleAndInvoice(PROCEDURE 7).ReservationMgt(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetQtyToHandleAndInvoice : 99000845;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetQtyToHandleAndInvoice : "Reservation Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectPostedTransferEntries(PROCEDURE 16).ItemEntryRelation(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectPostedTransferEntries : 6507;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectPostedTransferEntries : "Item Entry Relation";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectPostedTransferEntries(PROCEDURE 16).ItemLedgerEntry(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectPostedTransferEntries : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectPostedTransferEntries : "Item Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectPostedDetailedGSTEntries(PROCEDURE 1500183).ItemEntryRelation(Variable 1500186)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectPostedDetailedGSTEntries : 6507;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectPostedDetailedGSTEntries : "Item Entry Relation";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectPostedDetailedGSTEntries(PROCEDURE 1500183).ItemLedgerEntry(Variable 1500187)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectPostedDetailedGSTEntries : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectPostedDetailedGSTEntries : "Item Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectPostedAssemblyEntries(PROCEDURE 38).ItemEntryRelation(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectPostedAssemblyEntries : 6507;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectPostedAssemblyEntries : "Item Entry Relation";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectPostedAssemblyEntries(PROCEDURE 38).ItemLedgerEntry(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectPostedAssemblyEntries : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectPostedAssemblyEntries : "Item Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectPostedOutputEntries(PROCEDURE 30).ItemLedgerEntry(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectPostedOutputEntries : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectPostedOutputEntries : "Item Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectPostedOutputEntries(PROCEDURE 30).ProdOrderRoutingLine(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectPostedOutputEntries : 5409;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectPostedOutputEntries : "Prod. Order Routing Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ZeroLineExists(PROCEDURE 18).xTrackingSpec(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ZeroLineExists : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ZeroLineExists : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AssignSerialNo(PROCEDURE 20).EnterQuantityToCreate(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AssignSerialNo : 6513;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AssignSerialNo : "Enter Quantity to Create";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CreateCustomizedSN(PROCEDURE 22).EnterCustomizedSN(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CreateCustomizedSN : 6515;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CreateCustomizedSN : "Enter Customized SN";
    //Variable type has not been exported.

    var
        ItemLotNumbers: Record "Item Lot Numbers1";


    //Unsupported feature: PropertyModification on "CreateCustomizedSNBatch(PROCEDURE 28).TextManagement(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CreateCustomizedSNBatch : 41;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CreateCustomizedSNBatch : TextManagement;
    //Variable type has not been exported.

    var
        ItemLotNumbers: Record "Item Lot Numbers1";


    //Unsupported feature: PropertyModification on "TestTempSpecificationExists(PROCEDURE 23).TempSpecification(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TestTempSpecificationExists : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TestTempSpecificationExists : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ModifyTrackingSpecification(PROCEDURE 40).CrntTempTrackingSpec(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ModifyTrackingSpecification : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ModifyTrackingSpecification : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SelectEntries(PROCEDURE 36).xTrackingSpec(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SelectEntries : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SelectEntries : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReserveItemTrackingLine(PROCEDURE 46).LateBindingMgt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReserveItemTrackingLine : 6502;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReserveItemTrackingLine : "Late Binding Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReestablishReservations(PROCEDURE 47).LateBindingMgt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReestablishReservations : 6502;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReestablishReservations : "Late Binding Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SynchronizeWarehouseItemTracking(PROCEDURE 53).WarehouseShipmentLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SynchronizeWarehouseItemTracking : 7321;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SynchronizeWarehouseItemTracking : "Warehouse Shipment Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SynchronizeWarehouseItemTracking(PROCEDURE 53).ItemTrackingMgt(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SynchronizeWarehouseItemTracking : 6500;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SynchronizeWarehouseItemTracking : "Item Tracking Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DeleteWhseItemTracking(PROCEDURE 52).WhseItemTrackingLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteWhseItemTracking : 6550;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteWhseItemTracking : "Whse. Item Tracking Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IsOrderToOrderBindingToTransfer(PROCEDURE 59).ReservEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IsOrderToOrderBindingToTransfer : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsOrderToOrderBindingToTransfer : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "xTempItemTrackingLine(Variable 1009)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //xTempItemTrackingLine : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //xTempItemTrackingLine : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalItemTrackingLine(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalItemTrackingLine : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalItemTrackingLine : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempItemTrackLineInsert(Variable 1054)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempItemTrackLineInsert : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempItemTrackLineInsert : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempItemTrackLineModify(Variable 1055)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempItemTrackLineModify : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempItemTrackLineModify : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempItemTrackLineDelete(Variable 1056)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempItemTrackLineDelete : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempItemTrackLineDelete : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempItemTrackLineReserv(Variable 1060)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempItemTrackLineReserv : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempItemTrackLineReserv : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Item(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Item : 27;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Item : Item;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemTrackingCode(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemTrackingCode : 6502;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemTrackingCode : "Item Tracking Code";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempReservEntry(Variable 1015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempReservEntry : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempReservEntry : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "NoSeriesMgt(Variable 1030)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //NoSeriesMgt : 396;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoSeriesMgt : NoSeriesManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemTrackingMgt(Variable 1020)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemTrackingMgt : 6500;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemTrackingMgt : "Item Tracking Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservEngineMgt(Variable 1034)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservEngineMgt : 99000831;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservEngineMgt : "Reservation Engine Mgt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemTrackingDataCollection(Variable 1058)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemTrackingDataCollection : 6501;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemTrackingDataCollection : "Item Tracking Data Collection";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FormRunMode(Variable 1026)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FormRunMode : ,Reclass,Combined Ship/Rcpt,Drop Shipment,Transfer;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FormRunMode : ,Reclass,"Combined Ship/Rcpt","Drop Shipment",Transfer;
    //Variable type has not been exported.

    var
        "--B2B--": Integer;
        ItemLedgerEntry: Record "Item Ledger Entry";
        NewLotNo: Code[20];
        NewNumber: Integer;
        ExistingNo: Code[20];
        PostingDate: Date;
        PurchHeader: Record "Purchase Header";
        Serial: Boolean;
        DateValue: Text[30];
        MonthValue: Text[30];
        Star: Label '*';
        ILN: Record "Item Lot Numbers1";
        LCode: Code[10];
        SalesHeader: Record "Sales Header";
        TempItemTrackingLine: Record "Tracking Specification" temporary;
        app: Code[10];
        length: Integer;
        j: Integer;

    var
        ILERec: Record "Item Ledger Entry";


    //Unsupported feature: CodeModification on "OnDeleteRecord". Please convert manually.

    //trigger OnDeleteRecord() : Boolean;
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TrackingSpec."Item No." := "Item No.";
    TrackingSpec."Location Code" := "Location Code";
    TrackingSpec."Source Type" := "Source Type";
    TrackingSpec."Source Subtype" := "Source Subtype";
    WMSManagement.CheckItemTrackingChange(TrackingSpec,Rec);

    IF NOT DeleteIsBlocked THEN BEGIN
      AlreadyDeleted := TempItemTrackLineDelete.GET("Entry No.");
      TempItemTrackLineDelete.TRANSFERFIELDS(Rec);
      DELETE(TRUE);
    #11..20
    CalculateSums;

    EXIT(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
       ILN.SETRANGE(ILN."Lot No.","Lot No.");
       ILN.SETRANGE(ILN."Item No","Item No.");
       IF ILN.FINDFIRST THEN
       ILN.DELETE;
    #8..23
    */
    //end;


    //Unsupported feature: CodeModification on "OnInsertRecord". Please convert manually.

    //trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Entry No." <> 0 THEN
      EXIT(FALSE);
    "Entry No." := NextEntryNo;
    IF (NOT InsertIsBlocked) AND (NOT ZeroLineExists) THEN
      IF NOT TestTempSpecificationExists THEN BEGIN
        TempItemTrackLineInsert.TRANSFERFIELDS(Rec);
        TempItemTrackLineInsert.INSERT;
        INSERT;
        ItemTrackingDataCollection.UpdateLotSNDataSetWithChange(
          TempItemTrackLineInsert,CurrentSignFactor * SourceQuantityArray[1] < 0,CurrentSignFactor,0);
      END;
    CalculateSums;

    EXIT(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
        TestRPOStatus;     //Added by Pranavi on 01-Dec-2015 for not allowing to asign serial or lot number without FPO convertion
        //COMMNETED FOR f_YEAR BILLS
    #7..14
    */
    //end;


    //Unsupported feature: CodeModification on "OnModifyRecord". Please convert manually.

    //trigger OnModifyRecord() : Boolean;
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF InsertIsBlocked THEN
      IF (xRec."Lot No." <> "Lot No.") OR
         (xRec."Serial No." <> "Serial No.") OR
    #4..15

      IF TempItemTrackLineModify.GET("Entry No.") THEN
        TempItemTrackLineModify.DELETE;
      IF TempItemTrackLineInsert.GET("Entry No.") THEN BEGIN
        TempItemTrackLineInsert.TRANSFERFIELDS(Rec);
        TempItemTrackLineInsert.MODIFY;
    #22..30
    CalculateSums;

    EXIT(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
      TestRPOStatus;    //Added by Pranavi on 01-Dec-2015 for not allowing to asign serial or lot number without FPO convertion
      //COMMENTED FOR F_YEAR BILLS
    #19..33
    */
    //end;


    //Unsupported feature: CodeModification on "SetSource(PROCEDURE 1)". Please convert manually.

    //procedure SetSource();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetItem(TrackingSpecification."Item No.");
    ForBinCode := TrackingSpecification."Bin Code";
    SetFilters(TrackingSpecification);
    #4..103
        TempTrackingSpecification := TrackingSpecification;
        TempTrackingSpecification.INSERT;
      UNTIL TrackingSpecification.NEXT = 0;

    // Data regarding posted quantities on transfers is collected from Item Ledger Entries:
    IF TrackingSpecification."Source Type" = DATABASE::"Transfer Line" THEN
    #110..169

    FunctionsDemandVisible := CurrentSignFactor * SourceQuantityArray[1] < 0;
    FunctionsSupplyVisible := NOT FunctionsDemandVisible;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..106
    //B2B
    // Schedule Components
    IF TrackingSpecification."Source Type" = DATABASE::Schedule2 THEN
        CollectPostedMTEntries(TrackingSpecification,TempTrackingSpecification);
    //B2B
    // Schedule Components
    #107..172
    */
    //end;


    //Unsupported feature: CodeModification on "AddReservEntriesToTempRecSet(PROCEDURE 15)". Please convert manually.

    //procedure AddReservEntriesToTempRecSet();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ReservEntry.FINDSET THEN
      REPEAT
        IF Color = 0 THEN BEGIN
          TempReservEntry := ReservEntry;
          TempReservEntry.INSERT;
        END;
        IF ReservEntry.TrackingExists THEN BEGIN
          AddTracking := TRUE;
          IF SecondSourceID = DATABASE::"Warehouse Shipment Line" THEN
            IF FromReservEntry.GET(ReservEntry."Entry No.",NOT ReservEntry.Positive) THEN
              AddTracking := (FromReservEntry."Source Type" = DATABASE::"Assembly Header") = IsAssembleToOrder
            ELSE
              AddTracking := NOT IsAssembleToOrder;

          IF AddTracking THEN BEGIN
            TempTrackingSpecification.TRANSFERFIELDS(ReservEntry);
    #17..30
          END;
        END;
      UNTIL ReservEntry.NEXT = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
          IF (SecondSourceID = DATABASE::"Warehouse Shipment Line") AND
             FromReservEntry.GET(ReservEntry."Entry No.",NOT ReservEntry.Positive)
          THEN
            AddTracking := (FromReservEntry."Source Type" = DATABASE::"Assembly Header") = IsAssembleToOrder;
    #14..33
    */
    //end;


    //Unsupported feature: CodeModification on "AssignSerialNo(PROCEDURE 20)". Please convert manually.

    //procedure AssignSerialNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ZeroLineExists THEN
      DELETE;

    #4..9

    QtyToCreateInt := QtyToCreate;

    CLEAR(EnterQuantityToCreate);
    EnterQuantityToCreate.SetFields("Item No.","Variant Code",QtyToCreate,FALSE);
    IF EnterQuantityToCreate.RUNMODAL = ACTION::OK THEN BEGIN
      EnterQuantityToCreate.GetFields(QtyToCreateInt,CreateLotNo);
      AssignSerialNoBatch(QtyToCreateInt,CreateLotNo);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
      //B2B UD
      CreateLotNo := TRUE;
      //B2B UD
    #13..18
    */
    //end;


    //Unsupported feature: CodeModification on "AssignSerialNoBatch(PROCEDURE 29)". Please convert manually.

    //procedure AssignSerialNoBatch();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF QtyToCreate <= 0 THEN
      ERROR(Text009);
    IF QtyToCreate MOD 1 <> 0 THEN
      ERROR(Text008);

    GetItem("Item No.");

    IF CreateLotNo THEN BEGIN
      TESTFIELD("Lot No.",'');
      Item.TESTFIELD("Lot Nos.");
      VALIDATE("Lot No.",NoSeriesMgt.GetNextNo(Item."Lot Nos.",WORKDATE,TRUE));
    END;

    Item.TESTFIELD("Serial Nos.");
    ItemTrackingDataCollection.SetSkipLot(TRUE);
    #16..29
        TempItemTrackLineInsert,CurrentSignFactor * SourceQuantityArray[1] < 0,CurrentSignFactor,0);
    END;
    CalculateSums;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
      {//B2B UD >>
    #8..12
      }//B2B UD <<
      //B2B UD >>
      IF CreateLotNo THEN
        VALIDATE("Lot No.",CreateLotNumber);
      //B2B UD <<
    #13..32
    */
    //end;

    procedure ItemLotNumbers();
    begin
    end;

    procedure ItemLotNumbers();
    begin
    end;


    //Unsupported feature: CodeModification on "CreateCustomizedSNBatch(PROCEDURE 28)". Please convert manually.

    //procedure CreateCustomizedSNBatch();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TextManagement.EvaluateIncStr(CustomizedSN,CustomizedSN);
    NoSeriesMgt.TestManual(Item."Serial Nos.");

    IF QtyToCreate <= 0 THEN
      ERROR(Text009);
    IF QtyToCreate MOD 1 <> 0 THEN
      ERROR(Text008);

    IF CreateLotNo THEN BEGIN
      TESTFIELD("Lot No.",'');
      Item.TESTFIELD("Lot Nos.");
      VALIDATE("Lot No.",NoSeriesMgt.GetNextNo(Item."Lot Nos.",WORKDATE,TRUE));
    END;

    FOR i := 1 TO QtyToCreate DO BEGIN
      VALIDATE("Quantity Handled (Base)",0);
      VALIDATE("Quantity Invoiced (Base)",0);
      VALIDATE("Serial No.",CustomizedSN);
      VALIDATE("Quantity (Base)",QtySignFactor);
      "Entry No." := NextEntryNo;
      IF TestTempSpecificationExists THEN
    #22..33
      END;
    END;
    CalculateSums;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    IF PurchHeader.GET(PurchHeader."Document Type"::Order,"Source ID") THEN BEGIN
      PurchHeader.TESTFIELD("Posting Date");
     // MESSAGE(FORMAT("Source ID"));
      PostingDate := PurchHeader."Posting Date";
    END ELSE IF SalesHeader.GET(SalesHeader."Document Type"::Order,"Source ID") THEN
    BEGIN
      SalesHeader.TESTFIELD("Posting Date");
      PostingDate := SalesHeader."Posting Date";
    END;


    IF "Location Code"='STR' THEN
    LCode:='ST';
    IF "Location Code"='R&D STR' THEN
    LCode:='RD';
    IF "Location Code"='CS STR' THEN
    LCode:='CS';
    IF "Location Code"='SITE' THEN
    LCode:='IN';

    //PostingDate:=TODAY;
    IF DATE2DMY(PostingDate,1) < 10 THEN
      DateValue := '0'+FORMAT(DATE2DMY(PostingDate,1))
    ELSE DateValue := FORMAT(DATE2DMY(PostingDate,1));

    IF DATE2DMY(PostingDate,2) < 10 THEN
      MonthValue := '0'+FORMAT(DATE2DMY(PostingDate,2))
    ELSE MonthValue := FORMAT(DATE2DMY(PostingDate,2));

    ItemLotNumbers.RESET;
    ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No","Item No.");
    ItemLotNumbers.SETFILTER("Lot No.",'%1',(COPYSTR(FORMAT(DATE2DMY(PostingDate,3)),3)+MonthValue+
                                             DateValue+COPYSTR(LCode,1,2)+Star));

    IF ItemLotNumbers.FINDLAST THEN BEGIN
      NewLotNo := INCSTR(ItemLotNumbers."Lot No.");
      "Lot No.":=NewLotNo;
    //  MESSAGE(NewLotNo);
      ItemLotNumbers.INIT;
      ItemLotNumbers."Item No" := "Item No.";
      ItemLotNumbers."Lot No." := "Lot No.";
      ItemLotNumbers.Location:=LCode;
      ItemLotNumbers.INSERT;
    END ELSE BEGIN
      NewLotNo := COPYSTR(FORMAT(DATE2DMY(PostingDate,3)),3)+MonthValue+DateValue+COPYSTR(LCode,1,2)+'01';
     // NewLotNo := INCSTR(ItemLotNumbers."Lot No.");
      "Lot No.":=NewLotNo;
      ItemLotNumbers.INIT;
      ItemLotNumbers."Item No" := "Item No.";
      ItemLotNumbers."Lot No." := "Lot No.";
      ItemLotNumbers.Location:=LCode;
      ItemLotNumbers.INSERT;
    END;
    //EXIT(NewLotNo);




     { IF CreateLotNo THEN BEGIN
    #10..12
      END;  }
     app:='';
    length:=STRLEN(CustomizedSN);//anil added
    FOR i:=1 TO 6-length DO BEGIN
     app:='0'+app;
    #13..17
      // VALIDATE("Serial No.",CustomizedSN);
      IF length<>STRLEN(CustomizedSN) THEN BEGIN
        app:='';
        MESSAGE(FORMAT(QtyToCreate));
      //  length:=STRLEN(CustomizedSN);
        length:=STRLEN(CustomizedSN);//anil added
        FOR j:=1 TO 6-length DO BEGIN
          app:='0'+app;
        END;
      END;
      VALIDATE("Serial No.",app+CustomizedSN);
    #19..36
    */
    //end;


    procedure CloseForm();
    begin
        CurrPage.CLOSE;
    end;


    procedure AssignSerialNos(TrackingSpecification: Record "Tracking Specification");
    var
        TempTrackingSpecifications: Record "Tracking Specification";
        TransferLine: Record "Transfer Line";
    begin
        TempTrackingSpecifications.DELETEALL;
        TempTrackingSpecifications."Entry No." := TempTrackingSpecifications."Entry No." + 1;
        TempTrackingSpecifications."Item No." := TrackingSpecification."Item No.";
        TempTrackingSpecifications."Location Code" := TrackingSpecification."Location Code";
        TempTrackingSpecifications."Quantity (Base)" := TrackingSpecification."Quantity (Base)";
        TempTrackingSpecifications.Description := TrackingSpecification.Description;
        TempTrackingSpecifications."Creation Date" := TrackingSpecification."Creation Date";
        TempTrackingSpecifications."Source Type" := TrackingSpecification."Source Type";
        TempTrackingSpecifications."Source Subtype" := TrackingSpecification."Source Subtype";
        TempTrackingSpecifications."Source ID" := TrackingSpecification."Source ID";
        TempTrackingSpecifications."Source Batch Name" := TrackingSpecification."Source Batch Name";
        TempTrackingSpecifications."Source Prod. Order Line" := TrackingSpecification."Source Prod. Order Line";
        TempTrackingSpecifications."Source Ref. No." := TrackingSpecification."Source Ref. No.";
        TempTrackingSpecifications."Appl.-to Item Entry" := TrackingSpecification."Appl.-to Item Entry";
        TempTrackingSpecifications."Transfer Item Entry No." := TrackingSpecification."Transfer Item Entry No.";
        TempTrackingSpecifications."Serial No." := TrackingSpecification."Serial No.";
        TempTrackingSpecifications.Positive := TrackingSpecification.Positive;
        TempTrackingSpecifications."Qty. per Unit of Measure" := TrackingSpecification."Qty. per Unit of Measure";
        TempTrackingSpecifications."Warranty Date" := TrackingSpecification."Warranty Date";
        TempTrackingSpecifications."Expiration Date" := TrackingSpecification."Expiration Date";
        TempTrackingSpecifications."Qty. to Handle (Base)" := TrackingSpecification."Qty. to Handle (Base)";
        TempTrackingSpecifications."Qty. to Invoice (Base)" := TrackingSpecification."Qty. to Invoice (Base)";
        TempTrackingSpecifications."Quantity Handled (Base)" := TrackingSpecification."Quantity Handled (Base)";
        TempTrackingSpecifications."Quantity Invoiced (Base)" := TrackingSpecification."Quantity Invoiced (Base)";
        TempTrackingSpecifications."Qty. to Handle" := TrackingSpecification."Qty. to Handle";
        TempTrackingSpecifications."Qty. to Invoice" := TrackingSpecification."Qty. to Invoice";
        TempTrackingSpecifications."Buffer Status" := TrackingSpecification."Buffer Status";
        TempTrackingSpecifications."New Serial No." := TrackingSpecification."New Serial No.";
        TempTrackingSpecifications."New Lot No." := TrackingSpecification."New Lot No.";
        TempTrackingSpecifications."Lot No." := TrackingSpecification."Lot No.";
        TempTrackingSpecifications."Variant Code" := TrackingSpecification."Variant Code";
        TempTrackingSpecifications."Bin Code" := TrackingSpecification."Bin Code";
        TempTrackingSpecifications.Correction := TrackingSpecification.Correction;
        TempTrackingSpecifications."Quantity actual Handled (Base)" := TrackingSpecification."Quantity actual Handled (Base)";
        TempTrackingSpecifications.INSERT;
    end;


    procedure "--B2B---------"();
    begin
    end;


    procedure CreateLotNumber(): Code[20];
    var
        ItemLotNumbers: Record "Item Lot Numbers1";
    begin
        IF PurchHeader.GET(PurchHeader."Document Type"::Order, "Source ID") THEN BEGIN
            PurchHeader.TESTFIELD("Posting Date");
            PostingDate := PurchHeader."Posting Date";
        END;

        IF "Location Code" = 'STR' THEN
            LCode := 'ST';
        IF "Location Code" = 'R&D STR' THEN
            LCode := 'RD';
        IF "Location Code" = 'CS STR' THEN
            LCode := 'CS';
        IF "Location Code" = 'SITE' THEN
            LCode := 'IN';

        // added by vishnu Priya on 21-10-2020
        IF "Location Code" = 'CONSTRUCTI' THEN
            LCode := 'ST';
        // added by vishnu Priya on 21-10-2020



        IF DATE2DMY(PostingDate, 1) < 10 THEN
            DateValue := '0' + FORMAT(DATE2DMY(PostingDate, 1))
        ELSE
            DateValue := FORMAT(DATE2DMY(PostingDate, 1));

        IF DATE2DMY(PostingDate, 2) < 10 THEN
            MonthValue := '0' + FORMAT(DATE2DMY(PostingDate, 2))
        ELSE
            MonthValue := FORMAT(DATE2DMY(PostingDate, 2));

        ItemLotNumbers.RESET;
        ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No", "Item No.");
        ItemLotNumbers.SETFILTER("Lot No.", '%1', (COPYSTR(FORMAT(DATE2DMY(PostingDate, 3)), 3) + MonthValue +
                                                 DateValue + COPYSTR(LCode, 1, 2) + Star));

        IF ItemLotNumbers.FINDLAST THEN BEGIN
            NewLotNo := INCSTR(ItemLotNumbers."Lot No.");
            "Lot No." := NewLotNo;
            //  MESSAGE(NewLotNo);
            ItemLotNumbers.INIT;
            ItemLotNumbers."Item No" := "Item No.";
            ItemLotNumbers."Lot No." := NewLotNo;
            ItemLotNumbers.Location := LCode;
            ItemLotNumbers.INSERT;
        END ELSE BEGIN
            NewLotNo := COPYSTR(FORMAT(DATE2DMY(PostingDate, 3)), 3) + MonthValue + DateValue + COPYSTR(LCode, 1, 2) + '01';
            "Lot No." := NewLotNo;
            ItemLotNumbers.INIT;
            ItemLotNumbers."Item No" := "Item No.";
            ItemLotNumbers."Lot No." := NewLotNo;
            ItemLotNumbers.Location := LCode;
            ItemLotNumbers.INSERT;
        END;
        EXIT(NewLotNo);


        /*
        IF PurchHeader.GET(PurchHeader."Document Type"::Order,"Source ID") THEN
          PostingDate := PurchHeader."Posting Date";
        
        ItemLotNumbers.RESET;
        ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No","Item No.");
        ItemLotNumbers.SETFILTER("Lot No.",'%1',(FORMAT(DATE2DMY(PostingDate,3))+FORMAT(DATE2DMY(PostingDate,2))+
                                                 FORMAT(DATE2DMY(PostingDate,1))+'/'+USERID+'/'+Star));
        IF ItemLotNumbers.FINDLAST THEN BEGIN
          NewLotNo := INCSTR(ItemLotNumbers."Lot No.");
          MESSAGE(NewLotNo);
          ItemLotNumbers.INIT;
          ItemLotNumbers."Item No" := "Item No.";
          ItemLotNumbers."Lot No." := NewLotNo;
          ItemLotNumbers.INSERT;
        END ELSE BEGIN
          NewLotNo := FORMAT(DATE2DMY(PostingDate,3))+FORMAT(DATE2DMY(PostingDate,2))+
                      FORMAT(DATE2DMY(PostingDate,1))+'/'+USERID+'/'+'01';
          ItemLotNumbers.INIT;
          ItemLotNumbers."Item No" := "Item No.";
          ItemLotNumbers."Lot No." := NewLotNo;
          ItemLotNumbers.INSERT;
        END;
        EXIT(NewLotNo);
        */

    end;


    procedure AssignEffLotNo();
    var
        QtyToCreate: Decimal;
    begin
        /*
        TempItemTrackLineInsert := Rec;       //b2b
        
        WITH TempItemTrackLineInsert DO BEGIN //b2b
          IF ZeroLineExists THEN
            DELETE;
          TESTFIELD("Quantity Handled (Base)",0);
          TESTFIELD("Quantity Invoiced (Base)",0);
          IF (SourceQuantityArray[2] * UndefinedQtyArray[2] <= 0) OR
             (ABS(SourceQuantityArray[2]) < ABS(UndefinedQtyArray[2])) THEN
            QtyToCreate := 0
          ELSE
            QtyToCreate := UndefinedQtyArray[2];
        
          GetItem("Item No.");
        
          //Item.TESTFIELD("Lot Nos.");
          //VALIDATE("Lot No.",NoSeriesMgt.GetNextNo(Item."Lot Nos.",WORKDATE,TRUE));
          //DRK <<
          VALIDATE("Lot No.",CreateLotNumber);
          //DRK >>
          IF NOT Serial THEN
            VALIDATE("Quantity (Base)",QtyToCreate);
          "Entry No." := NextEntryNo;
          TestTempSpecificationExists;
          INSERT;
          CalculateSums;
          Rec := TempItemTrackLineInsert;//b2b
          MODIFY;
        END;
        */

        IF ZeroLineExists THEN
            DELETE;

        IF (SourceQuantityArray[1] * UndefinedQtyArray[1] <= 0) OR
           (ABS(SourceQuantityArray[1]) < ABS(UndefinedQtyArray[1]))
        THEN
            QtyToCreate := 0
        ELSE
            QtyToCreate := SourceQuantityArray[2];

        GetItem("Item No.");

        //Item.TESTFIELD("Lot Nos.");
        //VALIDATE("Lot No.",NoSeriesMgt.GetNextNo(Item."Lot Nos.",WORKDATE,TRUE));
        VALIDATE("Lot No.", CreateLotNumber);
        "Qty. per Unit of Measure" := QtyPerUOM;
        VALIDATE("Quantity (Base)", QtyToCreate);
        "Entry No." := NextEntryNo;
        TestTempSpecificationExists;
        INSERT;
        TempItemTrackLineInsert.TRANSFERFIELDS(Rec);
        TempItemTrackLineInsert.INSERT;
        ItemTrackingDataCollection.UpdateLotSNDataSetWithChange(
          TempItemTrackLineInsert, CurrentSignFactor * SourceQuantityArray[1] < 0, CurrentSignFactor, 0);
        CalculateSums;

        /*
        TempItemTrackingLine := Rec;
        
        WITH TempItemTrackingLine DO BEGIN
          IF ZeroLineExists THEN
            DELETE;
          TESTFIELD("Quantity Handled (Base)",0);
          TESTFIELD("Quantity Invoiced (Base)",0);
          IF (SourceQuantityArray[1] * UndefinedQtyArray[1] <= 0) OR
             (ABS(SourceQuantityArray[1]) < ABS(UndefinedQtyArray[1])) THEN
            QtyToCreate := 0
          ELSE
            QtyToCreate := UndefinedQtyArray[1];
        
          GetItem("Item No.");
        
          //Item.TESTFIELD("Lot Nos.");
          //VALIDATE("Lot No.",NoSeriesMgt.GetNextNo(Item."Lot Nos.",WORKDATE,TRUE));
          //DRK <<
          VALIDATE("Lot No.",CreateLotNumber);
          //DRK >>
          IF NOT Serial THEN
            VALIDATE("Quantity (Base)",QtyToCreate);
          "Entry No." := NextEntryNo;
          TestTempSpecificationExists;
          INSERT;
          CalculateSums;
          Rec := TempItemTrackingLine;
        END;
        */

    end;


    procedure ManualSerialNo();
    var
        QtyToCreate: Decimal;
        Increment: Integer;
        CreateLotNo: Boolean;
        CustomizedSN: Code[20];
        ItemLotNumbers: Record "Item Lot Numbers1";
        i: Integer;
        counter: Integer;
    begin
        //NoSeriesMgt.TestManual(Item."Serial Nos.");
        /*
        TempItemTrackLineInsert := Rec;
        
        WITH TempItemTrackLineInsert DO BEGIN
        
          TESTFIELD("Quantity Handled (Base)",0);
          TESTFIELD("Quantity Invoiced (Base)",0);
        
          IF (SourceQuantityArray[2] * UndefinedQtyArray[2] <= 0) OR
             (ABS(SourceQuantityArray[2]) < ABS(UndefinedQtyArray[2])) THEN
            QtyToCreate := 0
          ELSE
            QtyToCreate := SourceQuantityArray[2];
           GetItem("Item No.");
        
        IF PurchHeader.GET(PurchHeader."Document Type"::Order,"Source ID") THEN
        BEGIN
          PurchHeader.TESTFIELD("Posting Date");
          PostingDate := PurchHeader."Posting Date";
        END ELSE IF SalesHeader.GET(SalesHeader."Document Type"::Order,"Source ID") THEN
        BEGIN
          SalesHeader.TESTFIELD("Posting Date");
          PostingDate := SalesHeader."Posting Date";
        END;
        
        IF "Location Code"='STR' THEN
        LCode:='ST';
        IF "Location Code"='R&D STR' THEN
        LCode:='RD';
        IF "Location Code"='CS STR' THEN
        LCode:='CS';
        IF "Location Code"='SITE' THEN
        LCode:='IN';
        
        
        IF DATE2DMY(PostingDate,1) < 10 THEN
          DateValue := '0'+FORMAT(DATE2DMY(PostingDate,1))
        ELSE DateValue := FORMAT(DATE2DMY(PostingDate,1));
        
        IF DATE2DMY(PostingDate,2) < 10 THEN
          MonthValue := '0'+FORMAT(DATE2DMY(PostingDate,2))
        ELSE MonthValue := FORMAT(DATE2DMY(PostingDate,2));
        
        ItemLotNumbers.RESET;
        ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No","Item No.");
        ItemLotNumbers.SETFILTER("Lot No.",'%1',(COPYSTR(FORMAT(DATE2DMY(PostingDate,3)),3)+MonthValue+
                                                 DateValue+COPYSTR(LCode,1,2)+Star));
        
        IF ItemLotNumbers.FINDLAST THEN BEGIN
          NewLotNo := INCSTR(ItemLotNumbers."Lot No.");
          "Lot No.":=NewLotNo;
          ItemLotNumbers.INIT;
          ItemLotNumbers."Item No" := "Item No.";
          ItemLotNumbers."Lot No." := "Lot No.";
          ItemLotNumbers.Location:=LCode;
          ItemLotNumbers.INSERT;
        END ELSE BEGIN
          NewLotNo := COPYSTR(FORMAT(DATE2DMY(PostingDate,3)),3)+MonthValue+DateValue+COPYSTR(LCode,1,2)+'01';
          "Lot No.":=NewLotNo;
          ItemLotNumbers.INIT;
          ItemLotNumbers."Item No" := "Item No.";
          ItemLotNumbers."Lot No." := "Lot No.";
          ItemLotNumbers.Location:=LCode;
          ItemLotNumbers.INSERT;
        END;
        
          FOR i := 1 TO QtyToCreate DO BEGIN
          VALIDATE("Quantity (Base)",QtySignFactor);
            "Entry No." := NextEntryNo;
           TestTempSpecificationExists;
          TempItemTrackLineInsert.TRANSFERFIELDS(Rec);
          TempItemTrackLineInsert."Entry No." := "Entry No.";
          TempItemTrackLineInsert.INSERT;
        
                          INSERT;
          ItemTrackingDataCollection.UpdateLotSNDataSetWithChange(
            TempItemTrackLineInsert,CurrentSignFactor * SourceQuantityArray[1] < 0,CurrentSignFactor,0);
        
            IF i < QtyToCreate THEN BEGIN
              counter := Increment;
              REPEAT
                CustomizedSN := INCSTR(CustomizedSN);
                counter := counter - 1;
              UNTIL counter <= 0;
        
            END;
        
          END;
        
          CalculateSums;
        
        END;
        *///B2B commented
        IF ZeroLineExists THEN
            DELETE;

        IF (SourceQuantityArray[1] * UndefinedQtyArray[1] <= 0) OR
           (ABS(SourceQuantityArray[1]) < ABS(UndefinedQtyArray[1]))
        THEN
            QtyToCreate := 0
        ELSE
            QtyToCreate := UndefinedQtyArray[2];

        GetItem("Item No.");
        IF PurchHeader.GET(PurchHeader."Document Type"::Order, "Source ID") THEN BEGIN
            PurchHeader.TESTFIELD("Posting Date");
            PostingDate := PurchHeader."Posting Date";
        END ELSE
            IF SalesHeader.GET(SalesHeader."Document Type"::Order, "Source ID") THEN BEGIN
                SalesHeader.TESTFIELD("Posting Date");
                PostingDate := SalesHeader."Posting Date";
            END;

        IF "Location Code" = 'STR' THEN
            LCode := 'ST';
        IF "Location Code" = 'R&D STR' THEN
            LCode := 'RD';
        IF "Location Code" = 'CS STR' THEN
            LCode := 'CS';
        IF "Location Code" = 'SITE' THEN
            LCode := 'IN';


        IF DATE2DMY(PostingDate, 1) < 10 THEN
            DateValue := '0' + FORMAT(DATE2DMY(PostingDate, 1))
        ELSE
            DateValue := FORMAT(DATE2DMY(PostingDate, 1));

        IF DATE2DMY(PostingDate, 2) < 10 THEN
            MonthValue := '0' + FORMAT(DATE2DMY(PostingDate, 2))
        ELSE
            MonthValue := FORMAT(DATE2DMY(PostingDate, 2));

        ItemLotNumbers.RESET;
        ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No", "Item No.");
        ItemLotNumbers.SETFILTER("Lot No.", '%1', (COPYSTR(FORMAT(DATE2DMY(PostingDate, 3)), 3) + MonthValue +
                                                 DateValue + COPYSTR(LCode, 1, 2) + Star));

        IF ItemLotNumbers.FINDLAST THEN BEGIN
            NewLotNo := INCSTR(ItemLotNumbers."Lot No.");
            "Lot No." := NewLotNo;
            ItemLotNumbers.INIT;
            ItemLotNumbers."Item No" := "Item No.";
            ItemLotNumbers."Lot No." := "Lot No.";
            ItemLotNumbers.Location := LCode;
            ItemLotNumbers.INSERT;
        END ELSE BEGIN
            NewLotNo := COPYSTR(FORMAT(DATE2DMY(PostingDate, 3)), 3) + MonthValue + DateValue + COPYSTR(LCode, 1, 2) + '01';
            "Lot No." := NewLotNo;
            ItemLotNumbers.INIT;
            ItemLotNumbers."Item No" := "Item No.";
            ItemLotNumbers."Lot No." := "Lot No.";
            ItemLotNumbers.Location := LCode;
            ItemLotNumbers.INSERT;
        END;

        //Item.TESTFIELD("Lot Nos.");
        //VALIDATE("Lot No.",NoSeriesMgt.GetNextNo(Item."Lot Nos.",WORKDATE,TRUE));
        FOR i := 1 TO QtyToCreate DO BEGIN
            "Qty. per Unit of Measure" := QtyPerUOM;
            VALIDATE("Quantity (Base)", QtySignFactor);
            "Entry No." := NextEntryNo;
            TestTempSpecificationExists;
            INSERT;
            TempItemTrackLineInsert.TRANSFERFIELDS(Rec);
            TempItemTrackLineInsert.INSERT;
            ItemTrackingDataCollection.UpdateLotSNDataSetWithChange(
              TempItemTrackLineInsert, CurrentSignFactor * SourceQuantityArray[1] < 0, CurrentSignFactor, 0);
            CalculateSums;
        END;

    end;


    procedure TestRPOStatus();
    var
        SLn: Record "Sales Line";
        ILEs: Record "Item Ledger Entry";
        RPOs: Record "Production Order";
        REs: Record "Reservation Entry";
        Lot: Text;
    begin
        //Added by Pranavi on 01-12-2015 for not allowing to asign serial or lot number if RPO is not finished
        IF "Source Type" = 37 THEN BEGIN
            IF NOT ("Source ID" IN ['EFF/SAL/15-16/0112']) THEN BEGIN
                IF ("Serial No." <> '') OR ("Lot No." <> '') THEN BEGIN
                    ILEs.RESET;
                    ILEs.SETFILTER(ILEs."Entry Type", '%1', ILEs."Entry Type"::Output);
                    ILEs.SETFILTER(ILEs."Item No.", "Item No.");
                    ILEs.SETFILTER(ILEs."Serial No.", "Serial No.");
                    ILEs.SETFILTER(ILEs."Lot No.", "Lot No.");
                    IF ILEs.FINDFIRST THEN BEGIN
                        Lot := '';
                        IF ILEs."Lot No." <> '' THEN
                            Lot := ' Lot No.: ' + ILEs."Lot No.";
                        RPOs.RESET;
                        RPOs.SETFILTER(RPOs.Status, '%1', RPOs.Status::Released);
                        RPOs.SETFILTER(RPOs."No.", ILEs."Order No.");
                        //IF RPOs.FINDFIRST THEN
                        //ERROR('Released Prod Order '+ILEs."Order No."+' is not Finished for Item '+ILEs."Item No."+'\Serial No.: '+ILEs."Serial No."+Lot);
                    END;
                END;
            END;
        END;
        //End by Pranavi
    end;


    procedure "----B2BSP---"();
    begin
    end;

    local procedure CollectPostedMTEntries(TrackingSpecification: Record "Tracking Specification"; var TempTrackingSpecification: Record "Tracking Specification" temporary);
    var
        ItemEntryRelation: Record "Item Entry Relation";
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        // Used for collecting information about Schedule Components from the created Item Ledger Entries.
        IF TrackingSpecification."Source Type" <> DATABASE::Schedule2 THEN
            EXIT;

        ItemEntryRelation.SETCURRENTKEY("Order No.", "Order Line No.");
        ItemEntryRelation.SETRANGE("Order No.", TrackingSpecification."Source ID");
        ItemEntryRelation.SETRANGE("Order Line No.", TrackingSpecification."Source Prod. Order Line");
        ItemEntryRelation.SETRANGE("Source Ref. No.", TrackingSpecification."Source Ref. No.");
        IF ItemEntryRelation.FIND('-') THEN
            REPEAT
                ItemLedgerEntry.GET(ItemEntryRelation."Item Entry No.");
                TempTrackingSpecification := TrackingSpecification;
                TempTrackingSpecification."Entry No." := ItemLedgerEntry."Entry No.";
                TempTrackingSpecification."Item No." := ItemLedgerEntry."Item No.";
                TempTrackingSpecification."Serial No." := ItemLedgerEntry."Serial No.";
                TempTrackingSpecification."Lot No." := ItemLedgerEntry."Lot No.";
                TempTrackingSpecification."Quantity (Base)" := ItemLedgerEntry.Quantity;
                TempTrackingSpecification."Quantity Handled (Base)" := ItemLedgerEntry.Quantity;
                TempTrackingSpecification."Quantity Invoiced (Base)" := ItemLedgerEntry.Quantity;
                TempTrackingSpecification."Qty. per Unit of Measure" := ItemLedgerEntry."Qty. per Unit of Measure";
                TempTrackingSpecification.InitQtyToShip;
                TempTrackingSpecification.INSERT;
            UNTIL ItemEntryRelation.NEXT = 0;
    end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

