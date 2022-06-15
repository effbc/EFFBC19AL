page 60126 "Sale Order PO Details"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    SourceTable = "SO Prod.Order Details";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field(Quantity; Quantity)
                {
                }
                field(Status; Status)
                {
                }
                field("Due Date"; "Due Date")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        SalesLine.SETRANGE("Document No.", "Sales Order No.");
        SalesLine.SETRANGE("Line No.", "Sales Order Line No.");
        IF SalesLine.FINDFIRST THEN
            "Sales Line Qty." := SalesLine.Quantity;
    end;

    trigger OnOpenPage();
    begin
        Type := Type::" ";
        "No." := ' ';
    end;

    var
        SalesLine: Record "Sales Line";
}

