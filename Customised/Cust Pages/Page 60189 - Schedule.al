page 60189 Schedule
{
    // version SH1.0

    AutoSplitKey = true;
    DelayedInsert = true;
    Editable = false;
    PageType = List;
    SourceTable = Schedule2;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                }
                field("M/S Item"; "M/S Item")
                {
                }
                field("No."; "No.")
                {
                }
                field("Document Line No."; "Document Line No.")
                {
                }
                field("Line No."; "Line No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Qty. Per"; "Qty. Per")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Qty. Shipped"; "Qty. Shipped")
                {
                }
                field("Outstanding Qty."; "Outstanding Qty.")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("Estimated Total Unit Cost"; "Estimated Total Unit Cost")
                {
                }
                field("Lot No."; "Lot No.")
                {
                }
                field("Serial No."; "Serial No.")
                {
                    Editable = true;
                }
                field("Estimated Unit Price"; "Estimated Unit Price")
                {
                }
                field("Estimated Total Unit Price"; "Estimated Total Unit Price")
                {
                }
                field(Percentage; Percentage)
                {
                }
                field("Calcaulated Amont"; "Calcaulated Amont")
                {
                }
                field("RDSO Required"; "RDSO Required")
                {
                }
                field("Insp. Letter Sent"; "Insp. Letter Sent")
                {
                }
                field(Date; Date)
                {
                }
                field(Priority; Priority)
                {
                }
                field(Remarks; Remarks)
                {
                }
                field("RPO Completion Date"; "RPO Completion Date")
                {
                }
                field("Tender Schedule"; "Tender Schedule")
                {
                }
                field("Sales Description"; "Sales Description")
                {
                }
                field("Design Conclusions1"; "Design Conclusions1")
                {
                    Editable = false;
                    Enabled = true;
                }
                field(Dispatched; Dispatched)
                {
                }
                field(Status; Status)
                {
                }
                field(SetSelection; SetSelection)
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
                Caption = '&Line';
                Visible = true;
                action(CopyBomSc)
                {
                    Caption = 'CopyBomSc';
                    Visible = false;

                    trigger OnAction();
                    begin
                        CopyScheduleItems;
                    end;
                }
                action(Test)
                {

                    trigger OnAction();
                    begin
                        MESSAGE('Hi');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnClosePage();
    begin
        Schedule.RESET;
        Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
        Schedule.SETRANGE("Document No.", "Document No.");
        Schedule.SETRANGE("Document Line No.", "Document Line No.");
        IF Schedule.FINDSET THEN
            REPEAT
                TotAmt += Schedule."Calcaulated Amont";
            UNTIL Schedule.NEXT = 0;
        TenderLine.RESET;
        TenderLine.SETRANGE("Document No.", "Document No.");
        TenderLine.SETRANGE("Line No.", "Document Line No.");
        IF TenderLine.FINDFIRST THEN BEGIN
            TenderLine."Total Amount" := TotAmt;
            TenderLine.MODIFY;
        END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        //Quantity := 0;
        SETCURRENTKEY("M/S Item");
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    begin
        //RESET;
        SETCURRENTKEY("M/S Item");
    end;

    var
        TenderLine: Record "Tender Line";
        TotAmt: Decimal;
        Schedule: Record Schedule2;

    [LineStart(15423)]
    procedure CopyScheduleItems();
    var
        Schedule: Record Schedule2;
        Schedule2: Record Schedule2;
        Schedule3: Record Schedule2;
        ProdBOMLine: Record "Production BOM Line";
        Item: Record Item;
    begin
        Schedule.RESET;
        Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
        Schedule.SETRANGE("Document No.", "Document No.");
        Schedule.SETRANGE("Document Line No.", "Document Line No.");
        Schedule.SETRANGE(Type, Schedule.Type::"G/l Account");
        IF Schedule.FINDSET THEN
            REPEAT
                IF Item.GET(Schedule."No.") THEN;
                ProdBOMLine.RESET;
                ProdBOMLine.SETRANGE("Production BOM No.", Item."Production BOM No.");
                ProdBOMLine.SETRANGE(ProdBOMLine.Type, ProdBOMLine.Type::Item);
                IF ProdBOMLine.FINDSET THEN
                    REPEAT
                        IF Item.GET(ProdBOMLine."No.") THEN BEGIN//(AND Item."User ID"
                            Schedule2.RESET;
                            Schedule2.SETRANGE("Document Type", Schedule2."Document Type"::Order);
                            Schedule2.SETRANGE("Document No.", "Document No.");
                            Schedule2.SETRANGE("Document Line No.", "Document Line No.");
                            IF Schedule2.FINDLAST THEN BEGIN
                                Schedule3.INIT;
                                Schedule3."Document Type" := Schedule3."Document Type"::Order;
                                Schedule3."Document No." := "Document No.";
                                Schedule3."Document Line No." := "Document Line No.";
                                Schedule3."Line No." := Schedule2."Line No." + 10000;
                                Schedule3.Type := Schedule3.Type::"G/l Account";
                                Schedule3.VALIDATE("No.", Item."No.");
                                Schedule3.INSERT;
                            END;
                        END;
                    UNTIL ProdBOMLine.NEXT = 0;
            UNTIL Schedule.NEXT = 0;
    end;

    [LineStart(15456)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        SETCURRENTKEY("M/S Item");
    end;
}

