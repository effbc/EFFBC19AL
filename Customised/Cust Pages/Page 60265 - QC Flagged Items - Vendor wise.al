page 60265 "QC Flagged Items - Vendor wise"
{
    // Page Created by Vishnu Priya on 30-06-2020 for the QC Flag items  listing.

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Inspection Receipt Header";
    SourceTableView = SORTING(Item No.,Vendor No.) ORDER(Ascending) WHERE(Flag=FILTER(Yes),Status=CONST(Yes));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Receipt No.";"Receipt No.")
                {
                    Caption = 'Inward Number';
                    Editable = false;
                }
                field("No.";"No.")
                {
                    Caption = 'IR Number';
                    Editable = false;
                }
                field("Order No.";"Order No.")
                {
                    Caption = 'Purchase Order Number';
                    Editable = false;
                }
                field("Posted Date";"Posted Date")
                {
                    Editable = false;
                }
                field("Vendor No.";"Vendor No.")
                {
                    Editable = false;
                }
                field("Vendor Name";"Vendor Name")
                {
                    Editable = false;
                }
                field("Item No.";"Item No.")
                {
                    Editable = false;
                }
                field("Item Description";"Item Description")
                {
                    Editable = false;
                }
                field(Make;Make)
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                }
                field(Status;Status)
                {
                    Editable = false;
                }
                field("Lot No.";"Lot No.")
                {
                    Editable = false;
                }
                field("Qty. Accepted";"Qty. Accepted")
                {
                    Editable = false;
                }
                field("Qty. Rejected";"Qty. Rejected")
                {
                    Editable = false;
                }
                field("Posted By";"Posted By")
                {
                    Editable = false;
                }
                field("Action Required";"Action Required")
                {
                }
                field("Action To Be Taken";"Action To Be Taken")
                {
                }
                field("Concerned Dept";"Concerned Dept")
                {
                }
                field("Tentative Clearance Date";"Tentative Clearance Date")
                {
                }
                field("Flag Cleared Date";"Flag Cleared Date")
                {
                }
                field("Action Completed time";"Action Completed time")
                {
                }
                field(Sample;Sample)
                {
                    Editable = false;
                }
                field(Flag;Flag)
                {

                    trigger OnValidate();
                    begin
                        IF Rec.Flag = TRUE THEN
                          BEGIN
                            IRH.RESET;
                            IRH.SETRANGE(Flag,TRUE);
                            IRH.SETFILTER("Item No.",Rec."Item No.");
                            IRH.SETFILTER("Vendor No.",Rec."Vendor No.");
                            IF IRH.FINDFIRST THEN
                              ERROR('Item was QC Flagged with the same vendor in IR Number: '+ IRH."No.");
                          END;
                    end;
                }
            }
            field("xRec.COUNT";xRec.COUNT)
            {
                Editable = false;
                Style = Unfavorable;
                StyleExpr = TRUE;
            }
        }
    }

    actions
    {
    }

    var
        IRH : Record "Inspection Receipt Header";
}

