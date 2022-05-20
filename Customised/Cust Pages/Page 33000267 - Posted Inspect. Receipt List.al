page 33000267 "Posted Inspect. Receipt List"
{
    // version QC1.0

    CardPageID = "Posted Inspection Receipt";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Inspection Receipt Header";
    SourceTableView = WHERE(Status=FILTER(<>No));

    layout
    {
        area(content)
        {
            field("No of IRs";xRec.COUNT)
            {
                Caption = 'No of IRs';
            }
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                field("No.";"No.")
                {
                }
                field("Item Description";"Item Description")
                {
                }
                field("Receipt No.";"Receipt No.")
                {
                }
                field("Vendor No.";"Vendor No.")
                {
                }
                field("Vendor Name";"Vendor Name")
                {
                }
                field("Rework Reference No.";"Rework Reference No.")
                {
                }
                field("Rework Inspect DS Created";"Rework Inspect DS Created")
                {
                }
                field("Last Rework Level";"Last Rework Level")
                {
                }
                field("Item Ledger Entry No.";"Item Ledger Entry No.")
                {
                }
                field("Rework Level";"Rework Level")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Purch Line No";"Purch Line No")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Qty. Accepted";"Qty. Accepted")
                {
                }
                field("Qty. Rejected";"Qty. Rejected")
                {
                }
                field(Status;Status)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Stock Rcvd from QC";"Stock Rcvd from QC")
                {
                }
                field("Product Group Code";"Product Group Code")
                {
                }
                field("Nature Of Rejection";"Nature Of Rejection")
                {
                }
                field("IDS Posted By";"IDS Posted By")
                {
                }
                field("IDS creation Date";"IDS creation Date")
                {
                }
                field("Item Sub Group Code";"Item Sub Group Code")
                {
                }
                field("Lot No.";"Lot No.")
                {
                }
                field("IR Posted By";"IR Posted By")
                {
                }
                field("Posted Date";"Posted Date")
                {
                }
                field("Posted By";"Posted By")
                {
                }
                field("Order No.";"Order No.")
                {
                }
                field(Make;Make)
                {
                }
                field(BINAddress;BINAddress)
                {
                    Caption = 'BIN Address';
                }
                field(UnitCost;UnitCost)
                {
                    Caption = 'UnitCost';
                }
                field("Issues For Pending";"Issues For Pending")
                {
                }
                field("Qty. Accepted Under Deviation";"Qty. Accepted Under Deviation")
                {
                }
                field("Qty. Accepted UD Reason";"Qty. Accepted UD Reason")
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
                separator("---")
                {
                    Caption = '---';
                }
                action("Purchase Receipt")
                {
                    Caption = 'Purchase Receipt';
                    RunObject = Page "Posted Purchase Receipt";
                    RunPageLink = No.=FIELD(Receipt No.);
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        BINAddress := '';
        Item.RESET;
        Item.SETRANGE(Item."No.","Item No.");
        IF Item.FINDFIRST THEN
          BINAddress := Item."BIN Address";

        UnitCost:=0;
        PRL.RESET;
        PRL.SETRANGE(PRL."Document No.","Receipt No.");
        PRL.SETRANGE(PRL."No.","Item No.");
        IF PRL.FINDFIRST THEN
        BEGIN
          PL.RESET;
          PL.SETRANGE(PL."Document Type",PL."Document Type"::Order);
          PL.SETRANGE(PL."Document No.",PRL."Order No.");
          PL.SETRANGE(PL."No.",PRL."No.");
          PL.SETRANGE(PL."Line No.",PRL."Order Line No.");
          IF PL.FINDFIRST THEN
            UnitCost := PL."Direct Unit Cost"
          ELSE
            UnitCost := PRL."Unit Cost";
        END;
    end;

    trigger OnOpenPage();
    begin
        BINAddress := '';
    end;

    var
        CopyDocMgt : Codeunit "Copy Document Mgt.";
        PurchHeader : Record "Purchase Header";
        PurchLine : Record "Purchase Line";
        DocType : Option Quote,"Blanket Order","Order",Invoice,"Return Order","Credit Memo","Posted Receipt","Posted Invoice","Posted Return Shipment","Posted Credit Memo";
        Text000 : Label 'Receipt %1 has been converted to Return Order.';
        Text001 : Label 'Return Order already created for the Inspection Report %1.';
        Text002 : Label 'Inspection Report %1 status is Under Progress.';
        Text003 : Label 'Return Order already created for the Inspection Report %1.';
        Text005 : Label 'Do you want to create Return Order?';
        CreateOrder : Boolean;
        BINAddress : Code[20];
        Item : Record Item;
        PRL : Record "Purch. Rcpt. Line";
        UnitCost : Decimal;
        PL : Record "Purchase Line";
}

