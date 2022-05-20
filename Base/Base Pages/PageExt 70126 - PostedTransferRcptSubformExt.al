pageextension 70126 PostedTransferRcptSubformExt extends "Posted Transfer Rcpt. Subform"
{
    // version NAVW19.00.00.48822,NAVIN9.00.00.48822,B2B1.0

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500004". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500008". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500008". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500005". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500005". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500007". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500009". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500009". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500020". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500020". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.

        addafter("Control 18")
        {
            field("Line No."; "Line No.")
            {
            }
        }
        addafter("Control 10")
        {
            field("Reason Code"; "Reason Code")
            {
            }
            field("Position Reference No."; "Position Reference No.")
            {
            }
        }
        addafter("Control 1500020")
        {
            field("Allow Excess Qty."; "Allow Excess Qty.")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907935204". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1901313004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901313004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900545004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1903119404". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "ShowStrDetailsForm(PROCEDURE 1500000).StrOrderLineDetails(Variable 1280001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowStrDetailsForm : 13798;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowStrDetailsForm : "Posted Str Order Line Details";
    //Variable type has not been exported.

    var
        StrOrderLineDetailsPage: Page "Posted Str Order Line Details";

    procedure StrOrderLineDetailsPage();
    begin
    end;


    //Unsupported feature: CodeModification on "ShowStrDetailsForm(PROCEDURE 1500000)". Please convert manually.

    //procedure ShowStrDetailsForm();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StrOrderLineDetails.RESET;
    StrOrderLineDetails.SETCURRENTKEY("Invoice No.",Type,"Item No.");
    StrOrderLineDetails.SETRANGE("Invoice No.","Document No.");
    StrOrderLineDetails.SETRANGE(Type,StrOrderLineDetails.Type::Transfer);
    StrOrderLineDetails.SETRANGE("Item No.","Item No.");
    StrOrderLineDetails.SETRANGE("Line No.","Line No.");
    StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
    StrOrderLineDetailsForm.RUNMODAL;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    StrOrderLineDetailsPage.SETTABLEVIEW(StrOrderLineDetails);
    StrOrderLineDetailsPage.RUNMODAL;
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

