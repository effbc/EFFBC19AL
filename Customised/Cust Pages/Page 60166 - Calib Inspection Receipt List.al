page 60166 "Calib Inspection Receipt List"
{
    // version Cal1.0,Rev01

    Editable = false;
    PageType = List;
    SourceTable = "Inspection Receipt Header";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No.";"No.")
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
                field("Item No.";"Item No.")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field(Results;Results)
                {
                }
                field(Recommendations;Recommendations)
                {
                }
                field("Calibration Status";"Calibration Status")
                {
                }
                field(Status;Status)
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
                          PAGE.RUN(PAGE::"Calibration Inspection Receipt",Rec)
                        ELSE
                          PAGE.RUN(PAGE::CalibPostedInspReceipt,Rec);
                    end;
                }
                separator("----")
                {
                    Caption = '----';
                }
                action("Purchase Receipt")
                {
                    Caption = 'Purchase Receipt';
                    Image = ReturnReceipt;
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
}

