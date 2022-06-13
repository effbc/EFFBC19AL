pageextension 70135 ProdOrderCompLineListExt extends "Prod. Order Comp. Line List"
{


    layout
    {


        /*  modify("Control1")
          {



              ShowCaption = false;
          }*/



        addafter("Item No.")
        {
            field("Source No."; Rec."Source No.")
            {
            }
        }
        addafter("Variant Code")
        {
            field("Product Group Code"; Rec."Product Group Code")
            {
            }
            field("Production Plan Date"; Rec."Production Plan Date")
            {
            }
            field("Type of Solder"; Rec."Type of Solder")
            {
            }
        }
        addafter("Lead-Time Offset")
        {
            field(ProductGroup; ProductGroup)
            {
                Caption = 'Product Group';
            }
        }
    }
    actions
    {



    }

    var
        Item: Record Item;
        ProductGroup: Code[20];
        ProductionOrder: Record "Production Order";



}

