pageextension 70261 WhsePhysInvtJournalExt extends "Whse. Phys. Invt. Journal"
{
    // version NAVW19.00.00.48822,Rev01

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 9". Please convert manually.


        //Unsupported feature: Change Name on "Control 9". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 9". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 63". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 63". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 48". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 48". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 51". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 51". Please convert manually.


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 42". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 42". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 67". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 67". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 19". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 19". Please convert manually.

        modify("Control 22")
        {

            //Unsupported feature: Change Name on "Control 22". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 1900669001")
        {

            //Unsupported feature: Change Name on "Control 1900669001". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1901652601". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 1901652601")
        {
            group("Work Date")
            {
                Caption = 'Work Date';
                field(WorkDate; WORKDATE)
                {
                    Editable = false;
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 29". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 30". Please convert manually.


        //Unsupported feature: Change Name on "Action 30". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 4". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 4". Please convert manually.


        //Unsupported feature: Change Name on "Action 4". Please convert manually.

        modify("Action 31")
        {

            //Unsupported feature: Change RunObject on "Action 31". Please convert manually.


            //Unsupported feature: Change RunPageLink on "Action 31". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 31". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 44". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 44". Please convert manually.


        //Unsupported feature: Change Name on "Action 44". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 16". Please convert manually.

        modify("Action 17")
        {

            //Unsupported feature: Change Ellipsis on "Action 17". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 17". Please convert manually.

        }

        //Unsupported feature: Change Ellipsis on "Action 5". Please convert manually.


        //Unsupported feature: Change Name on "Action 5". Please convert manually.

        modify("Action 50")
        {

            //Unsupported feature: Change Ellipsis on "Action 50". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 50". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 32". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 33". Please convert manually.


        //Unsupported feature: Change Name on "Action 33". Please convert manually.

        modify("Action 34")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 34". Please convert manually.

        }
        modify("Action 35")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 35". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Action 17.OnAction.BinContent(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 17.OnAction.BinContent : 7302;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 17.OnAction.BinContent : "Bin Content";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 17.OnAction.WhseCalcInventory(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 17.OnAction.WhseCalcInventory : 7390;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 17.OnAction.WhseCalcInventory : "Whse. Calculate Inventory";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 5.OnAction.PhysInvtCountMgt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 5.OnAction.PhysInvtCountMgt : 7380;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 5.OnAction.PhysInvtCountMgt : "Phys. Invt. Count.-Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 5.OnAction.SortingMethod(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 5.OnAction.SortingMethod :  ,Item,Bin;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 5.OnAction.SortingMethod : " ",Item,Bin;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhseJournalBatch(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhseJournalBatch : 7310;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhseJournalBatch : "Warehouse Journal Batch";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhsePhysInventoryList(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhsePhysInventoryList : 7307;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhsePhysInventoryList : "Whse. Phys. Inventory List";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReportPrint(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReportPrint : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReportPrint : "Test Report-Print";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

