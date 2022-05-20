pageextension 70104 NODNOCExt extends "NOD/NOC"
{
    // version NAVIN9.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280003". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280003". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280005". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280005". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1280008". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1280008". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280008". Please convert manually.


        //Unsupported feature: CodeInsertion on ""No."(Control 1280003)". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //begin
        /*
        IF Type=Type::Party THEN
        BEGIN
        TDSP.SETRANGE(TDSP.Code,"No.");
        IF TDSP.FINDFIRST THEN
        Name:=TDSP.Name;
        INSERT;
        END;
        IF Type=Type::Customer THEN
        BEGIN
        CUS.SETRANGE(CUS."No.","No.");
        IF CUS.FINDFIRST THEN
        Name:=CUS.Name;
        INSERT;
        END;

        IF Type=Type::Vendor THEN
        BEGIN
        VEN.SETRANGE(VEN."No.","No.");
        IF VEN.FINDFIRST THEN
        Name:=VEN.Name;
        INSERT;
        END;
        */
        //end;
        addafter("Control 1280005")
        {
            field(Name; Name)
            {
                Caption = 'Name';
                Editable = false;
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1500333". Please convert manually.


        //Unsupported feature: Change Name on "Action 1500334". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 1500335". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 1500335". Please convert manually.


        //Unsupported feature: Change Name on "Action 1500335". Please convert manually.

    }

    var
        TDSP: Record Party;
        Name: Text[50];
        CUS: Record Customer;
        VEN: Record Vendor;

    //Unsupported feature: PropertyChange. Please convert manually.

}

