pageextension 70228 StructureOrderDetailsExt extends "Structure Order Details"
{


    layout
    {


        modify("Control 1")
        {



            ShowCaption = false;
        }


        addafter("Control 30")
        {
            field("Third Party Name"; "Third Party Name")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
    }

    var
        "Purchase Header": Record "Purchase Header";
        "G|l": Record "General Ledger Setup";
        PURCHASE_LINE: Record "Purchase Line";




}

