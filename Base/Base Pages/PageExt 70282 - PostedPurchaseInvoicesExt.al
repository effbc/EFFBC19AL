pageextension 70282 PostedPurchaseInvoicesExt extends 146
{
    layout
    {
        addfirst(Control1)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
            }
        }
        addafter("Order Address Code")
        {
            field("Form Code"; "Form Code")
            {

            }

            field(Structure; Structure)
            {

            }
            field("Form No."; "Form No.")
            {

            }

            field("Vendor Invoice Date"; "Vendor Invoice Date")
            {

            }
            field("Vendor Excise Invoice No."; "Vendor Excise Invoice No.")
            {

            }
            field("Vend. Excise Inv. Date"; "Vend. Excise Inv. Date")
            {

            }
            field("Actual Invoiced Date"; "Actual Invoiced Date")
            {

            }
        }
        addafter("Ship-to Country/Region Code")
        {
            field("Amount to Vendor"; "Amount to Vendor")
            {

            }
        }
        addafter("Shipment Method Code")
        {
            field("Currency Factor"; "Currency Factor")
            {

            }
            field("Excise Claimed Date"; "Excise Claimed Date")
            {
                Caption = 'GST Claimed Date';
            }
            field(RCM_Paid_Date; RCM_Paid_Date)
            {

            }
            field("User ID"; "User ID")
            {

            }

        }
    }

    actions
    {

    }

    trigger OnOpenPage()
    begin
        /* pih.RESET;
        pih.SETFILTER("No.", '<> %1', '');
        IF pih.FINDLAST THEN BEGIN
            //  id :=0;
            REPEAT
                id := pih.ADDLINK('https://app.powerbi.com/view?r=eyJrIjoiODUyOWNkYWYtZGY4Yy00YjI2LWE5MTYtMTk3N2U0NDgxZjJmIiwidCI6IjZhZDY1ZDZkLWZkODctNDQ5OC04ZTkyLTUzNGM3YTA3ZjlmOCIsImMiOjEwfQ%3D%3D', 'Receipts List');
            UNTIL pih.NEXT = 0;
            id := pih.ADDLINK('', '');
        END; */
    end;

    var
        pih: Record "Purch. Inv. Header";
        id: Char;
}