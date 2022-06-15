pageextension 70145 PurchaseInvoicesExt extends "Purchase Invoices"
{
    // version NAVW19.00.00.46621

    layout
    {



        addfirst()
        {

            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
                ApplicationArea = All;
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("USER ID"; rec."USER ID")
            {
                ApplicationArea = All;
            }
        }
        addafter("Job Queue Status")
        {
            field("Vendor Invoice No."; rec."Vendor Invoice No.")
            {
                ApplicationArea = All;
            }
            field("Vendor Invoice Date"; rec."Vendor Invoice Date")
            {
                ApplicationArea = All;
            }
            field(Structure; Rec.structure)
            {
                ApplicationArea = All;
            }
            field("Sales Order Ref No."; rec."Sales Order Ref No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


        modify(Statistics)
        {
            Promoted = true;
        }


        modify(Post)
        {
            Promoted = true;
            PromotedIsBig = true;
        }


        modify(PostAndPrint)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(PostBatch)
        {
            Promoted = true;
        }
    }



}

