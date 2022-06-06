pageextension 70020 BinTypesExt extends "Bin Types"
{
    

    layout
    {

       

       /* modify("Control1")
        {

            

            ShowCaption = false;
        }

       
        modify("Control 2")
        {
            Visible = false;
        }*/
        addfirst("Control1")
        {
            field("Item No"; Rec."Item No")
            {
            }
        }
        addafter(Description)
        {
            field(QTY; QTY)
            {
            }
            field("Material Required Day"; Rec."Material Required Day")
            {
            }
        }
    }

  

}

