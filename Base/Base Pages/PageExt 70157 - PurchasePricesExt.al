pageextension 70157 PurchasePricesExt extends "Purchase Prices"
{
    // version NAVW19.00.00.48628

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "VendNoFilterCtrl(Control 26)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "ItemNoFIlterCtrl(Control 32)". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 14")
        {
            field("Maximum Quantity"; "Maximum Quantity")
            {
            }
            field(Make; Make)
            {
            }
            field("Part Number"; "Part Number")
            {
            }
            field(Remarks; Remarks)
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 3". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "VendNoFilterCtrl(Control 26).OnLookup.VendList(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VendNoFilterCtrl : 27;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VendNoFilterCtrl : "Vendor List";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemNoFIlterCtrl(Control 32).OnLookup.ItemList(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemNoFIlterCtrl : 31;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemNoFIlterCtrl : "Item List";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Control 30.OnValidate.ApplicationMgt(Variable 1030)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Control 30.OnValidate.ApplicationMgt : 1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Control 30.OnValidate.ApplicationMgt : ApplicationManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetCaption(PROCEDURE 3).ObjTransl(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetCaption : 377;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetCaption : "Object Translation";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "VendNoFilterOnAfterValidate(PROCEDURE 19075608).Item(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VendNoFilterOnAfterValidate : 27;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VendNoFilterOnAfterValidate : Item;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CopyPrices(PROCEDURE 6).Vendor(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CopyPrices : 23;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CopyPrices : Vendor;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CopyPrices(PROCEDURE 6).PurchasePrice(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CopyPrices : 7012;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CopyPrices : "Purchase Price";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CopyPrices(PROCEDURE 6).SelectedPurchasePrice(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CopyPrices : 7012;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CopyPrices : "Purchase Price";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CopyPrices(PROCEDURE 6).PurchasePrices(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CopyPrices : 7012;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CopyPrices : "Purchase Prices";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Vend(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Vend : 23;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Vend : Vendor;
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

