pageextension 70214 ServiceOrderExt extends 5900
{
    // version NAVW19.00.00.51685,NAVIN9.00.00.51685,B2B1.0

    layout
    {


        modify("Bill-to Post Code")
        {



            CaptionML = ENU = 'Bill-to Post Code/City';


        }

        modify("Ship-to Post Code")
        {


            CaptionML = ENU = 'Ship-to Post Code/City';


        }


        modify("Control 17")
        {
            Visible = false;
        }

        modify("Order Time")
        {
            trigger OnBeforeValidate()
            begin
                OrderTimeC1000000005OnAfterVal;
            end;
        }





        addafter("Responsibility Center")
        {
            field("No. of Archived Versions"; "No. of Archived Versions")
            {
            }
        }
        addafter("Assigned User ID")
        {
            field(Purpose; Purpose)
            {
            }
            field("Material Issue no."; "Material Issue no.")
            {
            }
        }
        addafter("Release Status")
        {
            field("Customer Cards"; "Customer Cards")
            {
                Editable = false;
            }
            field("Transation ID"; "Transation ID")
            {
                Editable = false;
            }
        }
        addafter("Max. Labor Unit Price")
        {
            field("<Service Order Type2>"; "Service Order Type")
            {
            }
        }
        addafter("Ship-to E-Mail")
        {
            field("Shipping No. Series"; "Shipping No. Series")
            {
            }
            field("Posting No. Series"; "Posting No. Series")
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



        modify("S&hipments")
        {



            Promoted = true;


        }



        /*modify("Create Whse Shipment")
        {

      

            Promoted = true;

           

        }*/







        modify("Release to Ship")
        {
            Promoted = true;



        }
        modify(Reopen)
        {
            Promoted = true;
        }
        modify("Create Whse Shipment")
        {



            Promoted = true;
        }



        modify(Post)
        {


            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Post and &Print")
        {



            Promoted = true;
            PromotedIsBig = true;



        }



        modify("&Print")
        {



            Promoted = true;



        }
        addafter("Update Reference Invoice No")
        {
            action("Archi&ve Document")
            {
                Caption = 'Archi&ve Document';

                trigger OnAction();
                var
                    ArchiveManagement: Codeunit ArchiveManagement;
                    ServiceHeaderArchive: Record "Service Header Archive";
                begin
                    ArchiveManagement.ArchiveServiceDocument(Rec);
                    CurrPage.UPDATE(FALSE);
                end;
            }
        }
    }




    local procedure OrderTimeC1000000005OnAfterVal();
    begin
        Rec.UpdateResponseDateTime;
        CurrPage.UPDATE;
    end;


}

