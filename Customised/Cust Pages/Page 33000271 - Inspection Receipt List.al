page 33000271 "Inspection Receipt List"
{
    // version C1.0,Rev01

    CardPageID = "Inspection Receipt";
    Editable = false;
    PageType = List;
    SaveValues = true;
    SourceTable = "Inspection Receipt Header";
    SourceTableView = SORTING(No.) WHERE(Status = FILTER(No), Source Type=CONST(In Bound));

    layout
    {
        area(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Document Date"; "Document Date")
                {
                }
                field("Parent IDS"; "Parent IDS")
                {
                }
                field("Ids Reference No."; "Ids Reference No.")
                {
                }
                field("No."; "No.")
                {
                }
                field("Created Date"; "Created Date")
                {
                }
                field("Receipt No."; "Receipt No.")
                {
                }
                field("Rejection Category"; "Rejection Category")
                {
                }
                field("Rejection Reason"; "Rejection Reason")
                {
                }
                field("Order No."; "Order No.")
                {
                }
                field("Nature Of Rejection"; "Nature Of Rejection")
                {
                }
                field("Trans. Order No."; "Trans. Order No.")
                {
                }
                field("Stock Rcvd from QC"; "Stock Rcvd from QC")
                {
                }
                field("OutPut Jr Serial No."; "OutPut Jr Serial No.")
                {
                }
                field("IDS creation Date"; "IDS creation Date")
                {
                }
                field("Vendor No."; "Vendor No.")
                {
                }
                field("Qty. To Vendor (Rejected)"; "Qty. To Vendor (Rejected)")
                {
                }
                field("Qty. To Receive(Rework)"; "Qty. To Receive(Rework)")
                {
                }
                field("Qty. Received(Rework)"; "Qty. Received(Rework)")
                {
                }
                field("Qty. Sent To Vendor (Rejected)"; "Qty. Sent To Vendor (Rejected)")
                {
                }
                field("Qty. Rework"; "Qty. Rework")
                {
                }
                field("Lot No."; "Lot No.")
                {
                }
                field("Prod. Order Line"; "Prod. Order Line")
                {
                }
                field("IDS Posted By"; "IDS Posted By")
                {
                }
                field("IR Posted By"; "IR Posted By")
                {
                }
                field("Prod. Description"; "Prod. Description")
                {
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                }
                field("Vendor Name"; "Vendor Name")
                {
                }
                field("Reason for Pending"; "Reason for Pending")
                {
                    Editable = true;
                }
                field("Operation Description"; "Operation Description")
                {
                }
                field(Resource; Resource)
                {
                }
                field("Product Group Code"; "Product Group Code")
                {
                }
                field("Item Sub Group Code"; "Item Sub Group Code")
                {
                }
                field("Item Sub Sub Group Code"; "Item Sub Sub Group Code")
                {
                }
                field("Item Category Code"; "Item Category Code")
                {
                }
                field("Rework Level"; "Rework Level")
                {
                }
                field("Rework Reference No."; "Rework Reference No.")
                {
                }
                field("Rework Inspect DS Created"; "Rework Inspect DS Created")
                {
                }
                field("Last Rework Level"; "Last Rework Level")
                {
                }
                field("Item Ledger Entry No."; "Item Ledger Entry No.")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field("Item Description"; "Item Description")
                {
                }
                field("Purch Line No"; "Purch Line No")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Qty. Accepted"; "Qty. Accepted")
                {
                }
                field("Qty. Rejected"; "Qty. Rejected")
                {
                }
                field(Status; Status)
                {
                }
                field("Issues For Pending"; "Issues For Pending")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Receipt")
            {
                Caption = '&Receipt';
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    ShortCutKey = 'Shift+F5';

                    trigger OnAction();
                    begin
                        IF NOT Status THEN
                            PAGE.RUN(PAGE::"Inspection Receipt", Rec)
                        ELSE
                            PAGE.RUN(PAGE::"Posted Inspection Receipt", Rec);
                    end;
                }
                separator("----")
                {
                    Caption = '----';
                }
                action("Purchase Receipt")
                {
                    Caption = 'Purchase Receipt';
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Posted Purchase Receipt";
                    RunPageLink = No.=FIELD(Receipt No.);
                }
            }
        }
    }

    var
        CopyDocMgt : Codeunit "Copy Document Mgt.";
        PurchHeader : Record "Purchase Header";
        DocType : Option Quote,"Blanket Order","Order",Invoice,"Return Order","Credit Memo","Posted Receipt","Posted Invoice","Posted Return Shipment","Posted Credit Memo";
        Text000 : Label 'Receipt %1 has been converted to Return Order.';
        Text001 : Label 'Return Order already created for the Inspection Report %1.';
        Text002 : Label 'Inspection Report %1 status is Under Progress.';
        Text003 : Label 'Return Order already created for the Inspection Report %1.';
        Text005 : Label 'Do you want to create Return Order?';
        CreateOrder : Boolean;
        InspectJnlLine : Codeunit "Inspection Jnl.-Post Line";
        QualityType : Option Accepted,"Accepted Under Deviation",Rework,Rejected;
        UndefinedQty : Decimal;
}

