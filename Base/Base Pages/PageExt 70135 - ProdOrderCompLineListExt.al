pageextension 70135 ProdOrderCompLineListExt extends "Prod. Order Comp. Line List"
{
    // version NAVW19.00.00.45778

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


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 51". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 51". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 300". Please convert manually.


        //Unsupported feature: Change Name on "Control 300". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 302". Please convert manually.


        //Unsupported feature: Change Name on "Control 302". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 304". Please convert manually.


        //Unsupported feature: Change Name on "Control 304". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 306". Please convert manually.


        //Unsupported feature: Change Name on "Control 306". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 308". Please convert manually.


        //Unsupported feature: Change Name on "Control 308". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 310". Please convert manually.


        //Unsupported feature: Change Name on "Control 310". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 55". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 55". Please convert manually.


        //Unsupported feature: Change Name on "Control 57". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 57". Please convert manually.


        //Unsupported feature: Change Name on "Control 59". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 59". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 61". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 61". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 63". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 63". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 8")
        {
            field("Source No."; "Source No.")
            {
            }
        }
        addafter("Control 53")
        {
            field("Product Group Code"; "Product Group Code")
            {
            }
            field("Production Plan Date"; "Production Plan Date")
            {
            }
            field("Type of Solder"; "Type of Solder")
            {
            }
        }
        addafter("Control 63")
        {
            field(ProductGroup; ProductGroup)
            {
                Caption = 'Product Group';
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 12". Please convert manually.


        //Unsupported feature: Change Name on "Action 6500". Please convert manually.

    }

    var
        Item: Record Item;
        ProductGroup: Code[20];
        ProductionOrder: Record "Production Order";


    //Unsupported feature: CodeModification on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);

    CLEAR(ProductGroup);
    ProductionOrder.GET(ProductionOrder.Status::Released,"Prod. Order No.");
    IF ProductionOrder."Source Type" = ProductionOrder."Source Type"::Item THEN
      IF Item.GET(ProductionOrder."Source No.") THEN
        ProductGroup := Item."Item Sub Group Code";
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

