pageextension 70045 DimensionValueListExt extends "Dimension Value List"
{
    // version NAVW17.00

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change Editable on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change Editable on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Visible on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change Editable on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 4")
        {
            field(Address1; Address1)
            {
            }
            field(Address2; Address2)
            {
            }
        }
        addafter("Control 6")
        {
            field("Global Dimension No."; "Global Dimension No.")
            {
            }
        }
    }


    //Unsupported feature: PropertyModification on "GetSelectionFilter(PROCEDURE 4).DimVal(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSelectionFilter : 349;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSelectionFilter : "Dimension Value";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSelectionFilter(PROCEDURE 4).SelectionFilterManagement(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSelectionFilter : 46;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSelectionFilter : SelectionFilterManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GLSetup(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GLSetup : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLSetup : "General Ledger Setup";
    //Variable type has not been exported.

    var
        [InDataSet]
        CodeEditable: Boolean;
        [InDataSet]
        NameEditable: Boolean;


    //Unsupported feature: CodeInsertion on "OnInit". Please convert manually.

    //trigger OnInit();
    //Parameters and return type have not been exported.
    //begin
    /*
    NameEditable := TRUE;
    CodeEditable := TRUE;
    */
    //end;


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GLSetup.GET;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    GLSetup.GET;
    SETRANGE(Blocked,FALSE);
    CodeEditable :=FALSE;
    NameEditable :=FALSE;
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

