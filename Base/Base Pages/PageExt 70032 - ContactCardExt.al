pageextension 70032 ContactCardExt extends "Contact Card"
{

    layout
    {


        modify("Post Code")
        {


            CaptionML = ENU = 'Post Code/City';


        }


        addafter("Foreign Trade")
        {
            group(Details)
            {
                Caption = 'Details';
                field("Contact Status"; Rec."Contact Status")
                {
                }
                field("Initiated By"; Rec."Initiated By")
                {
                }
                field("Enquiry Type"; Rec."Enquiry Type")
                {
                }
                field("Govt./Private"; Rec."Govt./Private")
                {
                }
                field("Domestic/Foreign"; Rec."Domestic/Foreign")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Product Category Code"; Rec."Product Category Code")
                {
                }
            }
        }
    }
    actions
    {


        modify(SalesQuotes)
        {


            Promoted = true;



        }



        modify(Statistics)
        {


            Promoted = true;

        }

        modify("Apply Template")
        {



            Promoted = true;


        }
        modify("Create &Interaction")
        {



            Promoted = true;



        }


        modify(ContactCoverSheet)
        {
            Promoted = true;


        }
    }



}

