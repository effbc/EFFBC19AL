pageextension 70242 TransferListExt extends "Transfer List (Cap. Cons.)"
{
    // version NAVIN7.00

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


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 19". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 19". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 14". Please convert manually.


        //Unsupported feature: Change Name on "Action 15". Please convert manually.

        modify("Action 150")
        {

            //Unsupported feature: Change Ellipsis on "Action 150". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 150". Please convert manually.

        }

        //Unsupported feature: CodeModification on "Action 15.OnAction". Please convert manually.

        //trigger OnAction();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(TransHeader);
        IF TransHeader.FIND('-') THEN
          REPEAT
            ReleaseTransferDoc.RUN(TransHeader);
          UNTIL TransHeader.NEXT = 0;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(TransHeader);
         IF TransHeader.FINDSET THEN BEGIN
        #3..5
        END;
        */
        //end;
    }


    //Unsupported feature: PropertyModification on "Action 15.OnAction.TransHeader(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 15.OnAction.TransHeader : 5740;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 15.OnAction.TransHeader : "Transfer Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 15.OnAction.ReleaseTransferDoc(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 15.OnAction.ReleaseTransferDoc : 5708;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 15.OnAction.ReleaseTransferDoc : "Release Transfer Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 150.OnAction.DocPrint(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 150.OnAction.DocPrint : 229;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 150.OnAction.DocPrint : "Document-Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DimMgt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DimMgt : 408;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimMgt : DimensionManagement;
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

