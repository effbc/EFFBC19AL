report 80010 "Payments on Hold3"
{
    // version NAVW17.00

    DefaultLayout = RDLC;
    RDLCLayout = './Payments on Hold3.rdlc';
    Caption = 'Payments on Hold';

    dataset
    {
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
        {
            DataItemTableView = SORTING(Document No., Line No.) ORDER(Ascending) WHERE(Quantity = FILTER(> 0), Type = CONST(Item));

            trigger OnAfterGetRecord();
            begin
                "Item Vedor".SETCURRENTKEY("Item Vedor"."Item No.", "Item Vedor"."Variant Code", "Item Vedor"."Vendor No.");
                "Item Vedor".SETRANGE("Item Vedor"."Item No.", "Purch. Rcpt. Line"."No.");
                "Item Vedor".SETRANGE("Item Vedor"."Vendor No.", "Purch. Rcpt. Line"."Buy-from Vendor No.");
                IF NOT ("Item Vedor".FIND('-')) THEN BEGIN
                    "Item Vedor".INIT;
                    "Item Vedor"."Vendor No." := "Purch. Rcpt. Line"."Buy-from Vendor No.";
                    "Item Vedor"."Item No." := "Purch. Rcpt. Line"."No.";
                    "Item Vedor"."Variant Code" := '';
                    "Item Vedor".INSERT;

                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        "Item Vedor": Record "Item Vendor";
}

