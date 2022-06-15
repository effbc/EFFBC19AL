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
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("USER ID"; rec."USER ID")
            {
            }
        }
        addafter("Job Queue Status")
        {
            field("Vendor Invoice No."; rec."Vendor Invoice No.")
            {
            }
            field("Vendor Invoice Date"; rec."Vendor Invoice Date")
            {
            }
            field(Structure; Rec.structure)
            {
            }
            field("Sales Order Ref No."; rec."Sales Order Ref No.")
            {
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

