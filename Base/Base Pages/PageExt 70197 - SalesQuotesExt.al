pageextension 70197 SalesQuotesExt extends 9300
{


    layout
    {






        addafter("Sell-to Customer Name")
        {
            field(Product; REc.Product)
            {
            }
            field("Nature of Enquiry"; Rec."Nature of Enquiry")
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



        modify(Print)
        {



            Promoted = true;


        }


        modify(MakeOrder)
        {
            Promoted = true;
        }


    }



}

