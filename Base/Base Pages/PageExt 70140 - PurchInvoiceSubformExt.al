pageextension 70140 PurchInvoiceSubformExt extends "Purch. Invoice Subform"
{

    layout
    {
        /* modify("Control 1")
        {
            ShowCaption = false;
        }
        modify(Control39)
        {
            ShowCaption = false;
        }
        modify(Control33)
        {
            ShowCaption = false;
        }
        modify(Control15)
        {
            ShowCaption = false;
        }
        modify(RefreshTotals)
        {
            ShowCaption = false;
        } */
        modify("Line No.")
        {
            Visible = false;
        }
        addafter("No.")
        {
            field("Purchase_Order No."; "Purchase_Order No.")
            {
                DrillDown = false;
                Lookup = true;
                LookupPageID = 50;

                trigger OnDrillDown();
                begin
                    /*IF PAGE.RUNMODAL(PAGE::"Purchase Order") = ACTION::DrillDown
                      THEN
                        "Purchase_Order No." := "Purchase Order".No_;*/
                    //CODEUNIT.RUN(CODEUNIT::"Show Avg. Calc. - Item",Rec);
                    // PAGE.RUN(PAGE::"Purchase Order",Rec);

                end;

                trigger OnLookup(var Text: Text): Boolean;
                begin
                    PH.RESET;
                    PH.SETFILTER("No.", "Purchase_Order No.");
                    IF PH.FINDFIRST THEN
                        PAGE.RUNMODAL(50, PH);
                end;
            }
            field("Excise Amount"; "Excise Amount")
            {
            }
            field("CESS Amount"; "CESS Amount")
            {
            }
            field("VAT Calculation Type"; "VAT Calculation Type")
            {
            }
            field("Frieght Charges"; "Frieght Charges")
            {
            }
            field("Tax Amount"; "Tax Amount")
            {
            }
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
            }
            field("Service Tax Group"; "Service Tax Group")
            {
            }
            field("Currency Code"; "Currency Code")
            {
            }
            field("QC Enabled"; "QC Enabled")
            {
            }
            field("Excise Bus. Posting Group"; "Excise Bus. Posting Group")
            {
                Editable = true;
            }
            field("Charges To Vendor"; "Charges To Vendor")
            {
            }
            field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
            {
            }
            field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
            {
            }

            field("Amount To Vendor"; "Amount To Vendor")
            {
            }
            field("Tax %"; "Tax %")
            {
            }
            field("Tax Base Amount"; "Tax Base Amount")
            {
            }
        }
        addafter("Indirect Cost %")
        {
            field("Unit Cost"; "Unit Cost")
            {
            }
        }
        addafter("Line Amount")
        {
            field("TDS Amount"; "TDS Amount")
            {
            }
            field("TDS %"; "TDS %")
            {
            }
        }
        addbefore("Job No.")
        {
            field("GST %"; "GST %")
            {
            }
            field("GST Jurisdiction Type"; "GST Jurisdiction Type")
            {
            }
        }
        addafter("Job Line Discount %")
        {
            field("GST Reverse Charge"; "GST Reverse Charge")
            {
                Editable = true;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field(Sample; Sample)
            {
            }
        }
        addafter(ShortcutDimCode8)
        {
            field("TDS Group"; "TDS Group")
            {
            }
            field("Assessee Code"; "Assessee Code")
            {
            }
            field("Receipt No."; "Receipt No.")
            {
                Lookup = true;
                LookupPageID = 136;

                trigger OnLookup(var Text: Text): Boolean;
                begin
                    PRH.RESET;
                    PRH.SETFILTER("No.", "Receipt No.");
                    IF PRH.FINDFIRST THEN BEGIN
                        PAGE.RUNMODAL(136, PRH);
                    END;
                end;
            }
        }
    }
    actions
    {
        modify(GetReceiptLines)
        {
            trigger OnBeforeAction()
            begin
                TotalPurchaseHeader.RESET;
                TotalPurchaseHeader.SETRANGE("No.", Rec."Document No.");
                IF TotalPurchaseHeader.FINDFIRST THEN BEGIN
                    IF TotalPurchaseHeader."Purchase Journal" = TRUE
                      THEN
                        ERROR('Final Print Already Taken You can not pick the Receipts now')
                    ELSE
                        ;
                end;
        }

    }


    trigger OnOpenPage()
    begin
        /* IF PurchHeader."Purchase Journal" = TRUE
                    THEN BEGIN
             CurrPage.EDITABLE(FALSE);
             CurrPage.UPDATE;
         END; */
    end;

    var
        "--B2b--": Integer;
        PurchInfoPaneMgt: Codeunit "Purchases Info-Pane Management";
        PH: Record "Purchase Header";
        PRH: Record "Purch. Rcpt. Header";


    procedure StrOrderLineDetailsPage();
    begin
    end;
}

