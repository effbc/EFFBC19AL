pageextension 70209 ServiceItemWorksheetSubformExt extends 5907
{




    layout
    {



        /*modify(Control1)
        {

            

            ShowCaption = false;
        }*/

     
        modify("Control 48")
        {

          

            CaptionML = ENU = 'Product-Module';

           
        }

       
        addafter("Control 8")
        {
            field(Levels; Levels)
            {
            }
        }
        addafter("Control 48")
        {
            field("Fault Area Description"; "Fault Area Description")
            {
                Caption = 'Product-Module Desc';
                Editable = false;
                Visible = false;
            }
            field("Sub Module Code"; "Sub Module Code")
            {
                Visible = false;
            }
            field("Sub Module Descrption"; "Sub Module Descrption")
            {
                Editable = false;
                Visible = false;
            }
        }
        addafter("Control 54")
        {
            field("Fault Code Description"; "Fault Code Description")
            {
                Caption = 'Problem description';
                Editable = false;
            }
            field("Fault Reason Description"; "Fault Reason Description")
            {
                Caption = 'Cause identified';
            }
        }
        addafter("Control 34")
        {
            field("Resolution Description"; "Resolution Description")
            {
                Editable = false;
            }
            field("Symptom Description"; "Symptom Description")
            {
            }
            field(Observations; Observations)
            {
            }
            field("Component Legending"; "Component Legending")
            {
            }
            field(Status; Status)
            {
            }
        }
     
    }
  


    

   

    var
        "Reservation entry": Record "Reservation Entry";
        status: Record "Repair Status";
        "ITEMLEDGER ENTRY": Record "Item Ledger Entry";
        "TRACKING SPE": Record "Tracking Specification";
        "SERIAL NO": Code[10];
        "line no": Integer;
        text: Text[30];


    trigger OnModifyRecord(): Boolean

    var

    begin
        //added by pranavi to make the fault code, cause, resolution code, symptom code fields to be mandatory to enter on 10-01-2015
        IF Rec.Type <> Type::Resource THEN BEGIN
            Rec.TESTFIELD("Fault Code");
            Rec.TESTFIELD("Fault Reason Code");
            Rec.TESTFIELD("Resolution Code");
            Rec.TESTFIELD("Symptom Code");
        END;
        //end by pranavi
    end;


    
}
