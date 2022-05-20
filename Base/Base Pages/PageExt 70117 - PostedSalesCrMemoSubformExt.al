pageextension 70117 PostedSalesCrMemoSubformExt extends "Posted Sales Cr. Memo Subform"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067

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


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500004". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500008". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500008". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500010". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500010". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 66". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 66". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 52". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 52". Please convert manually.


        //Unsupported feature: Change Name on "Control 50". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 11". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 11". Please convert manually.


        //Unsupported feature: Change Name on "Control 72". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 72". Please convert manually.


        //Unsupported feature: Change Name on "Control 70". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 70". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500014". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500014". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500013". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500013". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500012". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500012". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500009". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500009". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500007". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500001". Please convert manually.

        modify("Control 1500005")
        {

            //Unsupported feature: Change Name on "Control 1500005". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 1500003")
        {

            //Unsupported feature: Change Name on "Control 1500003". Please convert manually.

            ShowCaption = false;
        }
        addafter("Control 2")
        {
            field("Line No."; "Line No.")
            {
            }
        }
        addafter("Control 1500003")
        {
            field(Amount; Amount)
            {
            }
            field("Amount Including VAT"; "Amount Including VAT")
            {
            }
            field("Excise Amount"; "Excise Amount")
            {
            }
            field("Excise Base Amount"; "Excise Base Amount")
            {
                Editable = false;
            }
            field("Amount To Customer"; "Amount To Customer")
            {
            }
            field("BED Amount"; "BED Amount")
            {
            }
            field("Tax Amount"; "Tax Amount")
            {
            }
            field("Tax Base Amount"; "Tax Base Amount")
            {
            }
            field("Service Tax SBC %"; "Service Tax SBC %")
            {
            }
            field("Service Tax SBC Amount"; "Service Tax SBC Amount")
            {
            }
            field("KK Cess%"; "KK Cess%")
            {
            }
            field("KK Cess Amount"; "KK Cess Amount")
            {
            }
            field("Service Tax eCess Amount"; "Service Tax eCess Amount")
            {
            }
            field("Service Tax SHE Cess Amount"; "Service Tax SHE Cess Amount")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907935204". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Dimensions(Action 1901741704)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "ItemReturnReceiptLines(Action 1900207104)". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907454904". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "ShowStrDetailsForm(PROCEDURE 1280000).SalesCrHeader(Variable 1280002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowStrDetailsForm : 114;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowStrDetailsForm : "Sales Cr.Memo Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ShowStrDetailsForm(PROCEDURE 1280000).StrOrderLineDetails(Variable 1280001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowStrDetailsForm : 13798;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowStrDetailsForm : "Posted Str Order Line Details";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ShowStrDetailsForm(PROCEDURE 1280000).StrOrderLineDetailsForm(Variable 1280000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowStrDetailsForm : 16309;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowStrDetailsForm : "Posted Str Order Line Details";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalSalesCrMemoHeader(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalSalesCrMemoHeader : 114;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalSalesCrMemoHeader : "Sales Cr.Memo Header";
    //Variable type has not been exported.


    //Unsupported feature: CodeInsertion on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //begin
    /*
    IF USERID IN ['EFFTRONICS\SUJANI','EFFTRONICS\VISHNUPRIYA','EFFTRONICS\VIJAYA'] THEN
      CurrPage.EDITABLE;
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

