pageextension 70050 EnterQuantitytoCreateExt extends "Enter Quantity to Create"
{
    // version NAVW17.00

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 9". Please convert manually.


        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change Name on "Control 7". Please convert manually.


        //Unsupported feature: Change Editable on "Control 7". Please convert manually.


        //Unsupported feature: CodeModification on "Control 3.OnLookup". Please convert manually.

        //trigger OnLookup();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ItemVariant.RESET;
        ItemVariant.SETRANGE("Item No.",ItemNo);
        ItemVariant."Item No." := ItemNo;
        ItemVariant.Code := VariantCode;
        PAGE.RUNMODAL(0,ItemVariant);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        ItemVariant.Make := VariantCode;
        PAGE.RUNMODAL(0,ItemVariant);
        */
        //end;
    }


    //Unsupported feature: PropertyModification on "Item(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Item : 27;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Item : Item;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemVariant(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemVariant : 5401;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemVariant : "Item Variant";
    //Variable type has not been exported.


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ItemNo := InitItemNo;
    VariantCode := InitVariantCode;
    QtyToCreate := InitQtyToCreate;
    CreateNewLotNo := InitCreateNewLotNo;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    CreateNewLotNo := TRUE;
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

