page 60084 "Tender Subform"
{
    // version B2B1.0,DWS1.0,Rev01

    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "Tender Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Schedule Type"; "Schedule Type")
                {
                }
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Schedule No"; "Schedule No")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field("Unit Price"; "Unit Price")
                {

                    trigger OnValidate();
                    begin
                        IF "Unit Price" < "Unit Cost" THEN BEGIN
                            MESSAGE('Unit Price Must Be More Than Unit Cost');
                            "Unit Price" := "Unit Cost";
                        END;
                    end;
                }
                field(UOM; UOM)
                {
                }
                field(Description; Description)
                {
                    Editable = true;
                }
                field("Description 2"; "Description 2")
                {
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Unit Cost"; "Unit Cost")
                {

                    trigger OnValidate();
                    begin
                        item.SETRANGE(item."No.", "No.");
                        IF item.FINDFIRST THEN BEGIN
                            IF ("Unit Cost" < item."Avg Unit Cost") THEN
                                ERROR('Unit cost must be greater than item unit Cost');
                        END;
                    end;
                }
                field("Production Bom No."; "Production Bom No.")
                {
                }
                field("Production Bom Version No."; "Production Bom Version No.")
                {
                }
                field("Design Cost"; "Design Cost")
                {
                }
                field("CRM Cost"; "CRM Cost")
                {
                }
                field("Total Amount"; "Total Amount")
                {
                }
                field("Estimated Unit Cost"; "Estimated Unit Cost")
                {
                }
                field("Cust. Estimated Unit Cost"; "Cust. Estimated Unit Cost")
                {
                }
                field("Cust.Estimated Total Cost"; "Cust.Estimated Total Cost")
                {
                }
                field("L1 Quote Value"; "L1 Quote Value")
                {
                }
                field("L2 Quote Value"; "L2 Quote Value")
                {
                }
                field("L3 Quote Value"; "L3 Quote Value")
                {
                }
                field("L4 Quote Value"; "L4 Quote Value")
                {
                }
                field("L5 Quote Value"; "L5 Quote Value")
                {
                }
                field("Estimated Total Unit Cost"; "Estimated Total Unit Cost")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                CaptionML = ENU = '&Line',
                            ENN = '&Line';
                Image = Line;
                action("Sc&hedule")
                {
                    Caption = 'Sc&hedule';

                    trigger OnAction();
                    begin

                        //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowSchedule;

                    end;
                }
            }
        }
    }

    trigger OnInit();
    begin
        SalesPerson.SETFILTER(SalesPerson."Salesperson/Purchaser", 'sale');
        // Rev01 >>
        // SalesPerson.SETRANGE(SalesPerson.Code,USERID);
        User.RESET;
        User.SETRANGE("User Name", USERID);
        IF User.FINDFIRST THEN
            SalesPerson.SETRANGE(SalesPerson.Code, User.EmployeeID);
        //SalesPerson.SETRANGE(SalesPerson.Code,MiscUser.ReturnTrimmedUserID(USERID));
        // Rev01 <<
        IF SalesPerson.FINDFIRST THEN;
    end;

    var
        Temp: Decimal;
        SalesPerson: Record "Salesperson/Purchaser";
        item: Record Item;
        MiscUser: Codeunit "Misc.User";
        User: Record User;

    [LineStart(10503)]
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader: Record "Design Worksheet Header";
        DesignWorksheetLine: Record "Design Worksheet Line";
        Item: Record Item;
        ItemDesignWorksheetHeader: Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine: Record "Item Design Worksheet Line";
    begin
        /*
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Tender);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        Page.RUNMODAL(Page::"Design Worksheet",DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
        */
        ItemDesignWorksheetHeader.RESET;
        IF ItemDesignWorksheetHeader.GET("No.") THEN BEGIN
            DesignWorksheetHeader.INIT;
            DesignWorksheetHeader.TRANSFERFIELDS(ItemDesignWorksheetHeader);
            DesignWorksheetHeader."Document No." := "Document No.";
            DesignWorksheetHeader."Document Line No." := "Line No.";
            DesignWorksheetHeader."Document Type" := DesignWorksheetHeader."Document Type"::Tender;
            IF DesignWorksheetHeader.INSERT THEN;
            ItemDesignWorksheetLine.RESET;
            ItemDesignWorksheetLine.SETRANGE(ItemDesignWorksheetLine."Item No", ItemDesignWorksheetHeader."Item No.");
            IF ItemDesignWorksheetLine.FINDSET THEN
                REPEAT
                    DesignWorksheetLine.INIT;
                    DesignWorksheetLine.TRANSFERFIELDS(ItemDesignWorksheetLine);
                    DesignWorksheetLine."Document No." := "Document No.";
                    DesignWorksheetLine."Document Line No." := "Line No.";
                    DesignWorksheetLine."Document Type" := DesignWorksheetLine."Document Type"::Tender;
                    IF DesignWorksheetLine.INSERT THEN;
                UNTIL ItemDesignWorksheetLine.NEXT = 0;
        END;
        COMMIT;
        DesignWorksheetHeader.SETRANGE("Document Type", DesignWorksheetHeader."Document Type"::Tender);
        DesignWorksheetHeader.SETRANGE("Document No.", "Document No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.", "Line No.");
        PAGE.RUNMODAL(PAGE::"Design Worksheet", DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);

    end;

    [LineStart(10545)]
    procedure ShowSchedule2();
    var
        Schedule: Record Schedule2;
    begin
        Schedule.RESET;
        Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
        Schedule.SETRANGE("Document No.", "Document No.");
        Schedule.SETRANGE("Document Line No.", "Line No.");
        //Schedule.SETRANGE("Item No.","No.");
        //Schedule.SETRANGE(Quantity,Quantity);
        Schedule.FILTERGROUP(2);
        PAGE.RUN(60125, Schedule);
        Schedule.FILTERGROUP(0);
    end;

    [LineStart(10556)]
    procedure ShowSchedule3();
    var
        Schedule: Record Schedule2;
        TenderLine: Record "Tender Line";
    begin
        /*
        TenderLine.RESET;
        TenderLine.SETRANGE("Document No.","Document No.");
        TenderLine.SETRANGE("Line No.","Document Line No.");
        IF TenderLine.FINDFIRST THEN BEGIN
          Schedule.INITl
          VALIDATE("Item No.",TenderLine."No.");
          Quantity := TenderLine.Quantity;
          TenderLine.CALCFIELDS("Estimated Unit Cost");
          //"Estimated Total Unit Cost" := TenderLine."Estimated Total Unit Cost";
        END ELSE BEGIN
          SalesLine.RESET;
          SalesLine.SETRANGE("Document Type","Document Type");
          SalesLine.SETRANGE("Document No.","Document No.");
          SalesLine.SETRANGE("Line No.","Document Line No.");
          IF SalesLine.FINDFIRST THEN BEGIN
           VALIDATE("Item No.",SalesLine."No.");
            Quantity := SalesLine.Quantity;
          END
        END
        */
        TenderLine.RESET;
        TenderLine.SETRANGE("Document No.", "Document No.");
        TenderLine.SETRANGE("Line No.", "Line No.");
        IF TenderLine.FINDSET THEN
            REPEAT
                Schedule.INIT;
                Schedule."Document Type" := Schedule."Document Type"::Tender;
                Schedule."Document No." := TenderLine."Document No.";
                Schedule."Document Line No." := TenderLine."Line No.";
                Schedule."Line No." := TenderLine."Line No.";
                Schedule.Type := Schedule.Type::Item;
                Schedule.VALIDATE("No.", TenderLine."No.");
                Schedule.Quantity := TenderLine.Quantity;
                //TenderLine.CALCFIELDS("Estimated Unit Cost");
                IF Schedule.INSERT THEN;
            UNTIL TenderLine.NEXT = 0;
        COMMIT;

        Schedule.RESET;
        Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
        Schedule.SETRANGE("Document No.", "Document No.");
        Schedule.SETRANGE("Document Line No.", "Line No.");
        //Schedule.SETRANGE("Item No.","No.");
        //Schedule.SETRANGE(Quantity,Quantity);
        Schedule.FILTERGROUP(2);
        PAGE.RUN(60125, Schedule);

        Schedule.FILTERGROUP(0);

    end;

    [LineStart(10607)]
    procedure ShowSchedule();
    var
        Schedule: Record Schedule2;
        TenderLine: Record "Tender Line";
    begin
        /*
        TenderLine.RESET;
        TenderLine.SETRANGE("Document No.","Document No.");
        TenderLine.SETRANGE("Line No.","Document Line No.");
        IF TenderLine.FINDFIRST THEN BEGIN
          Schedule.INITl
          VALIDATE("Item No.",TenderLine."No.");
          Quantity := TenderLine.Quantity;
          TenderLine.CALCFIELDS("Estimated Unit Cost");
          //"Estimated Total Unit Cost" := TenderLine."Estimated Total Unit Cost";
        END ELSE BEGIN
          SalesLine.RESET;
          SalesLine.SETRANGE("Document Type","Document Type");
          SalesLine.SETRANGE("Document No.","Document No.");
          SalesLine.SETRANGE("Line No.","Document Line No.");
          IF SalesLine.FINDFIRST THEN BEGIN
           VALIDATE("Item No.",SalesLine."No.");
            Quantity := SalesLine.Quantity;
          END
        END
        */
        IF Type = Type::Item THEN BEGIN
            TenderLine.RESET;
            TenderLine.SETRANGE("Document No.", "Document No.");
            TenderLine.SETRANGE("Line No.", "Line No.");
            IF TenderLine.FINDSET THEN
                REPEAT
                    Schedule.INIT;
                    Schedule."Document Type" := Schedule."Document Type"::Tender;
                    Schedule."Document No." := TenderLine."Document No.";
                    Schedule."Document Line No." := TenderLine."Line No.";
                    Schedule."Line No." := TenderLine."Line No.";
                    Schedule.Type := Schedule.Type::Item;
                    Schedule.VALIDATE("No.", TenderLine."No.");
                    Schedule.Quantity := TenderLine.Quantity;
                    Schedule."Estimated Total Unit Price" := Schedule."Estimated Unit Price" * Quantity;
                    //TenderLine.CALCFIELDS("Estimated Unit Cost");
                    IF Schedule.INSERT THEN;
                UNTIL TenderLine.NEXT = 0;
            COMMIT;

            Schedule.RESET;
            Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
            Schedule.SETRANGE("Document No.", "Document No.");
            Schedule.SETRANGE("Document Line No.", "Line No.");
            //Schedule.SETRANGE("Item No.","No.");
            //Schedule.SETRANGE(Quantity,Quantity);
            Schedule.FILTERGROUP(2);
            PAGE.RUN(60125, Schedule);

            Schedule.FILTERGROUP(0);
        END ELSE
            IF Type = Type::"G/L Account" THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                Schedule.FILTERGROUP(2);
                PAGE.RUN(60125, Schedule);
                Schedule.FILTERGROUP(0);

            END;

    end;
}

