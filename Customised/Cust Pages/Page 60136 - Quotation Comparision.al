page 60136 "Quotation Comparision"
{
    // version POAU

    PageType = Worksheet;
    SourceTable = "Quotation Comparision";

    layout
    {
        area(content)
        {
            field(RFQNumber; RFQNumber)
            {
                TableRelation = "Mech & Wirning Items"."Production Order No." WHERE(Quantity = CONST(No));

                trigger OnValidate();
                begin
                    RFQNumberOnAfterValidate;
                end;
            }
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(ActualExpansionStatus; ActualExpansionStatus)
                {
                    Caption = 'Expand';
                    Editable = false;
                    OptionCaption = 'Integer';

                    trigger OnValidate();
                    begin
                        ActualExpansionStatusOnPush;
                    end;
                }
                field("ICN No."; "ICN No.")
                {
                }
                field("Quote No."; "Quote No.")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Vendor No."; "Vendor No.")
                {
                }
                field("Total Amount"; "Total Amount")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field(Description; Description)
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Manufacturer Code"; "Manufacturer Code")
                {
                }
                field("Carry Out Action"; "Carry Out Action")
                {
                }
                field(Rate; Rate)
                {
                }
                field("Amt. including Tax"; "Amt. including Tax")
                {
                    BlankNumbers = BlankZero;
                }
                field(Price; Price)
                {
                }
                field(Delivery; Delivery)
                {
                }
                field(Quality; Quality)
                {
                }
                field(Rating; Rating)
                {
                    BlankNumbers = BlankZero;
                }
                field("Payment Term Code"; "Payment Term Code")
                {
                }
                field("Payment Terms"; "Payment Terms")
                {
                    BlankNumbers = BlankZero;
                }
                field("Total Weightage"; "Total Weightage")
                {
                }
                field(Amount; Amount)
                {
                }
                field("Line Amount"; "Line Amount")
                {
                }
                field("Delivery Date"; "Delivery Date")
                {
                }
            }
            field(Control1102152050; '')
            {
                CaptionClass = Text19068734;
                ShowCaption = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Calculate Plan")
                {
                    Caption = '&Calculate Plan';

                    trigger OnAction();
                    begin
                        POAutomation.InsertQuotationLines(RFQNumber);
                        QuoteCompare.RESET;
                        CurrPage.UPDATE(FALSE);

                        InitTempTable;
                        SetRecFilters;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                separator(Action1102152011)
                {
                }
                action("C&arryout Action")
                {
                    Caption = 'C&arryout Action';

                    trigger OnAction();
                    begin
                        //REPORT.RUN(50057);
                        REPORT.RUN(50066);
                        QuotationComparisionDelete.DELETEALL;
                    end;
                }
                action(Comments)
                {
                    Caption = 'Comments';
                    RunObject = Page "PCB Vendors List";
                    Visible = false;
                }
            }
            group("E&xpand")
            {
                Caption = 'E&xpand';
                action("E&xpand All")
                {
                    Caption = 'E&xpand All';

                    trigger OnAction();
                    begin
                        ExpandAll;
                    end;
                }
                action("C&ollapse All")
                {
                    Caption = 'C&ollapse All';

                    trigger OnAction();
                    begin
                        InitTempTable;
                    end;
                }
                separator(Action1102152039)
                {
                }
            }
            group("&Print")
            {
                Caption = '&Print';
                action("Quotation Comparision")
                {
                    Caption = 'Quotation Comparision';

                    trigger OnAction();
                    begin
                        ReqLine.RESET;
                        //ReqLine.SETRANGE("Line No.","Line No.");
                        ReqLine.SETRANGE("RFQ No.", RFQNumber);
                        REPORT.RUN(50058, TRUE, FALSE, ReqLine);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        SetExpansionStatus;
        OnAfterGetCurrRecord;
        QuoteNoOnFormat;
        LocationCodeOnFormat;
        VendorNoOnFormat;
        TotalAmountOnFormat;
        DescriptionOnFormat;
    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        TempReqLine := Rec;

        WHILE (TempReqLine.NEXT <> 0) AND (TempReqLine.Level > Level) DO
            TempReqLine.DELETE(TRUE);
        TempReqLine := Rec;
        EXIT(TempReqLine.DELETE);
    end;

    trigger OnFindRecord(Which: Text): Boolean;
    var
        Found: Boolean;
    begin
        TempReqLine.COPY(Rec);
        Found := TempReqLine.FIND(Which);
        Rec := TempReqLine;
        EXIT(Found);
    end;

    trigger OnModifyRecord(): Boolean;
    begin
        MODIFY(TRUE);
        TempReqLine := Rec;
        IF "Line No." <> 0 THEN
            TempReqLine.MODIFY;
        EXIT(FALSE);
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnNextRecord(Steps: Integer): Integer;
    var
        ResultSteps: Integer;
    begin
        TempReqLine.COPY(Rec);
        ResultSteps := TempReqLine.NEXT(Steps);
        Rec := TempReqLine;
        EXIT(ResultSteps);
    end;

    trigger OnOpenPage();
    begin
        RFQNumber := "RFQ No.";
        IF RFQNumber <> '' THEN
            IF NOT RFQNumbers.GET(RFQNumber) THEN
                RFQNumber := '';

        IF RFQNumber = '' THEN BEGIN
            RFQNumbers.SETRANGE(Quantity, FALSE);
            IF RFQNumbers.FINDFIRST THEN
                RFQNumber := RFQNumbers."Production Order No."
            ELSE
                RFQNumber := '';
        END;
        SelectCurrentRFQNo;

        InitTempTable;
        SetRecFilters;
        CurrPage.UPDATE(FALSE);
    end;

    var
        ActualExpansionStatus: Integer;
        ReqLine: Record "Quotation Comparision";
        TempReqLine: Record "Quotation Comparision" temporary;
        RFQNumber: Code[20];
        RFQNumbers: Record "Mech & Wirning Items";
        QuoteCompare: Record "Quotation Comparision";
        QuotationComparision: Record "Quotation Comparision";
        QuotationComparisionDelete: Record "Quotation Comparision";
        POAutomation: Codeunit "PO Automation";
        [InDataSet]
        "Quote No.Emphasize": Boolean;
        [InDataSet]
        "Location CodeEmphasize": Boolean;
        [InDataSet]
        "Vendor No.Emphasize": Boolean;
        [InDataSet]
        "Total AmountEmphasize": Boolean;
        [InDataSet]
        DescriptionEmphasize: Boolean;
        Text19068734: Label 'RFQ No.';

    [LineStart(11966)]
    local procedure IsExpanded(ActualReqLine: Record "Quotation Comparision"): Boolean;
    begin
        TempReqLine := ActualReqLine;
        IF TempReqLine.NEXT = 0 THEN
            EXIT(FALSE);
        EXIT(TempReqLine.Level > ActualReqLine.Level);
    end;

    [LineStart(11972)]
    local procedure ToggleExpandCollapse();
    var
        ReqLine: Record "Quotation Comparision";
    begin
        IF ActualExpansionStatus = 0 THEN BEGIN // Has children, but not expanded
            ReqLine.SETRANGE(Level, Level, Level + 1);
            ReqLine := Rec;
            IF ReqLine.NEXT <> 0 THEN
                REPEAT
                    IF ReqLine.Level > Level THEN BEGIN
                        TempReqLine := ReqLine;
                        IF TempReqLine.INSERT THEN;
                    END;
                UNTIL (ReqLine.NEXT = 0) OR (ReqLine.Level = Level);
        END ELSE
            IF ActualExpansionStatus = 1 THEN BEGIN // Has children and is already expanded
                TempReqLine := Rec;
                WHILE (TempReqLine.NEXT <> 0) AND (TempReqLine.Level > Level) DO
                    TempReqLine.DELETE;
            END;
        CurrPage.UPDATE;
    end;

    [LineStart(11991)]
    procedure SetExpansionStatus();
    begin
        CASE TRUE OF
            IsExpanded(Rec):
                ActualExpansionStatus := 1;
            Level = 0:
                ActualExpansionStatus := 0
            ELSE
                ActualExpansionStatus := 2;
        END;
    end;

    [LineStart(12001)]
    procedure InitTempTable();
    begin
        ReqLine.RESET;
        ReqLine.COPYFILTERS(TempReqLine);
        TempReqLine.DELETEALL;
        IF ReqLine.FINDSET THEN
            REPEAT
                IF ReqLine.Level = 0 THEN BEGIN
                    TempReqLine := ReqLine;
                    TempReqLine.INSERT;
                END;
            UNTIL ReqLine.NEXT = 0;
    end;

    [LineStart(12013)]
    local procedure ExpandAll();
    var
        ReqLine: Record "Quotation Comparision";
    begin
        ReqLine.RESET;
        ReqLine.COPYFILTERS(TempReqLine);
        TempReqLine.DELETEALL;

        IF ReqLine.FINDSET THEN
            REPEAT
                TempReqLine := ReqLine;
                TempReqLine.INSERT;
            UNTIL ReqLine.NEXT = 0;
    end;

    [LineStart(12024)]
    procedure SetRecFilters();
    begin
        RESET;
        FILTERGROUP(2);
        //SETRANGE(Level,0);
        FILTERGROUP(0);
        CurrPage.UPDATE(FALSE);
    end;

    [LineStart(12031)]
    local procedure SelectCurrentRFQNo();
    begin
        SETRANGE("RFQ No.", RFQNumber);
        CurrPage.UPDATE(FALSE);
    end;

    [LineStart(12035)]
    local procedure RFQNumberOnAfterValidate();
    begin
        SelectCurrentRFQNo;
    end;

    [LineStart(12038)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        IF GET("Line No.") THEN BEGIN
            TempReqLine := Rec;
            IF "Line No." <> 0 THEN
                TempReqLine.MODIFY
        END ELSE
            IF TempReqLine.GET("Line No.") THEN
                TempReqLine.DELETE;
    end;

    [LineStart(12048)]
    local procedure ActualExpansionStatusOnPush();
    begin
        ToggleExpandCollapse;
    end;

    [LineStart(12051)]
    local procedure QuoteNoOnFormat();
    begin
        IF Level = 0 THEN
            "Quote No.Emphasize" := TRUE
        ELSE
            "Quote No.Emphasize" := FALSE;
    end;

    [LineStart(12057)]
    local procedure LocationCodeOnFormat();
    begin
        IF Level = 0 THEN
            "Location CodeEmphasize" := TRUE
        ELSE
            "Location CodeEmphasize" := FALSE;
    end;

    [LineStart(12063)]
    local procedure VendorNoOnFormat();
    begin
        IF Level = 0 THEN
            "Vendor No.Emphasize" := TRUE
        ELSE
            "Vendor No.Emphasize" := FALSE;
    end;

    [LineStart(12069)]
    local procedure TotalAmountOnFormat();
    begin
        IF Level = 0 THEN
            "Total AmountEmphasize" := TRUE
        ELSE
            "Total AmountEmphasize" := FALSE;
    end;

    [LineStart(12075)]
    local procedure DescriptionOnFormat();
    begin
        IF Level = 0 THEN
            DescriptionEmphasize := TRUE
        ELSE
            DescriptionEmphasize := FALSE;
    end;
}

