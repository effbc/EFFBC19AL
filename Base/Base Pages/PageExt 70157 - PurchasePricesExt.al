pageextension 70157 PurchasePricesExt extends 7012
{

    layout
    {


        /*modify("Control1")
        {

          

            ShowCaption = false;
        }*/



        addafter("Ending Date")
        {
            field("Maximum Quantity"; Rec."Maximum Quantity")
            {
            }
            field(Make; Rec.Make)
            {
            }
            field("Part Number"; Rec."Part Number")
            {
            }
            field(Remarks; Rec.Remarks)
            {
            }
        }
    }
    actions
    {



    }



}

