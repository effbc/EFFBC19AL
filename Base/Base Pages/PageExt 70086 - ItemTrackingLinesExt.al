pageextension 70086 ItemTrackingLinesExt extends "Item Tracking Lines"
{

    layout
    {

        /*modify("Control59")
        {

            ShowCaption = false;
        }
        modify("Control1903651101")
        {


            ShowCaption = false;
        }*/



        modify(Text020)
        {



            ShowCaption = false;
        }



        /* modify("Control88")
         {

             ShowCaption = false;
         }


         modify("Control82")
         {


             ShowCaption = false;
         }


         modify("Control1")
         {

             ShowCaption = false;
         }*/


        moveafter("Lot No."; "Expiration Date")
    }
    actions
    {



        modify("Select Entries")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action64")
        {
            Promoted = true;
            PromotedIsBig = true;


        }




        addafter("Refresh Availability")
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



    var
        SerialNoInfoPage: Page "Serial No. Information Card";



    var
        LotNoInfoPage: Page "Lot No. Information Card";



        ItemLotNumbers: Record "Item Lot Numbers1";

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


        ILERec: Record "Item Ledger Entry";



    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        myInt: Integer;
    begin
        TestRPOStatus;  //Added by Pranavi on 01-Dec-2015 for not allowing to asign serial or lot number without FPO convertion
                        //COMMNETED FOR f_YEAR BILLS
    end;

    trigger OnModifyRecord(): Boolean
    var
        myInt: Integer;
    begin
        TestRPOStatus;    //Added by Pranavi on 01-Dec-2015 for not allowing to asign serial or lot number without FPO convertion
                          //COMMENTED FOR F_YEAR BILLS

    end;

    trigger OnDeleteRecord(): Boolean
    var
        myInt: Integer;
    begin
        ILN.SETRANGE(ILN."Lot No.", "Lot No.");
        ILN.SETRANGE(ILN."Item No", "Item No.");
        IF ILN.FINDFIRST THEN
            ILN.DELETE;
    end;


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




    end;


    procedure AssignEffLotNo();
    var
        QtyToCreate: Decimal;
    begin



        IF ZeroLineExists THEN
            Rec.DELETE;

        IF (SourceQuantityArray[1] * UndefinedQtyArray[1] <= 0) OR
           (ABS(SourceQuantityArray[1]) < ABS(UndefinedQtyArray[1]))
        THEN
            QtyToCreate := 0
        ELSE
            QtyToCreate := SourceQuantityArray[2];

        GetItem(Rec."Item No.");

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

        GetItem(Rec."Item No.");
        IF PurchHeader.GET(PurchHeader."Document Type"::Order, "Source ID") THEN BEGIN
            PurchHeader.TESTFIELD("Posting Date");
            PostingDate := PurchHeader."Posting Date";
        END ELSE
            IF SalesHeader.GET(SalesHeader."Document Type"::Order, "Source ID") THEN BEGIN
                SalesHeader.TESTFIELD("Posting Date");
                PostingDate := SalesHeader."Posting Date";
            END;

        IF Rec."Location Code" = 'STR' THEN
            LCode := 'ST';
        IF Rec."Location Code" = 'R&D STR' THEN
            LCode := 'RD';
        IF Rec."Location Code" = 'CS STR' THEN
            LCode := 'CS';
        IF Rec."Location Code" = 'SITE' THEN
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
            Rec."Lot No." := NewLotNo;
            ItemLotNumbers.INIT;
            ItemLotNumbers."Item No" := Rec."Item No.";
            ItemLotNumbers."Lot No." := Rec."Lot No.";
            ItemLotNumbers.Location := LCode;
            ItemLotNumbers.INSERT;
        END ELSE BEGIN
            NewLotNo := COPYSTR(FORMAT(DATE2DMY(PostingDate, 3)), 3) + MonthValue + DateValue + COPYSTR(LCode, 1, 2) + '01';
            Rec."Lot No." := NewLotNo;
            ItemLotNumbers.INIT;
            ItemLotNumbers."Item No" := Rec."Item No.";
            ItemLotNumbers."Lot No." := Rec."Lot No.";
            ItemLotNumbers.Location := LCode;
            ItemLotNumbers.INSERT;
        END;

        //Item.TESTFIELD("Lot Nos.");
        //VALIDATE("Lot No.",NoSeriesMgt.GetNextNo(Item."Lot Nos.",WORKDATE,TRUE));
        FOR i := 1 TO QtyToCreate DO BEGIN
            Rec."Qty. per Unit of Measure" := QtyPerUOM;
            Rec.VALIDATE("Quantity (Base)", QtySignFactor);
            Rec."Entry No." := NextEntryNo;
            TestTempSpecificationExists;
            Rec.INSERT;
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
            IF NOT (Rec."Source ID" IN ['EFF/SAL/15-16/0112']) then begin
                IF (Rec."Serial No." <> '') OR (Rec."Lot No." <> '') THEN BEGIN
                    ILEs.RESET;
                    ILEs.SETFILTER(ILEs."Entry Type", '%1', ILEs."Entry Type"::Output);
                    ILEs.SETFILTER(ILEs."Item No.", Rec."Item No.");
                    ILEs.SETFILTER(ILEs."Serial No.", Rec."Serial No.");
                    ILEs.SETFILTER(ILEs."Lot No.", Rec."Lot No.");
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



}

