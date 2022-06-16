pageextension 70217 ServiceTasksExt extends "Service Tasks"
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 42". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 42". Please convert manually.


        //Unsupported feature: Change Name on "Control 63". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 63". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 56". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 56". Please convert manually.


        //Unsupported feature: Change Name on "Control 60". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 60". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change RunObject on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 57". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 57". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 49". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 49". Please convert manually.


        //Unsupported feature: Change Name on "Control 61". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 61". Please convert manually.


        //Unsupported feature: Change Name on "Control 45". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.

        modify("Control 44")
        {

            //Unsupported feature: Change Name on "Control 44". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change ImplicitType on "Description2(Control 31)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 26")
        {
            field(Tested; Tested)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 51". Please convert manually.

        modify("Action 53")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 53". Please convert manually.

        }
        modify("Action 54")
        {

            //Unsupported feature: Change RunObject on "Action 54". Please convert manually.


            //Unsupported feature: Change RunPageLink on "Action 54". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 54". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 36". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 37". Please convert manually.


        //Unsupported feature: Change Name on "Action 37". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 48". Please convert manually.


        //Unsupported feature: Change Name on "Action 48". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "Action 53.OnAction.PageManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 53.OnAction.PageManagement : 700;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 53.OnAction.PageManagement : "Page Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetRespDateFilter(PROCEDURE 6).ApplicationManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetRespDateFilter : 1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetRespDateFilter : ApplicationManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemLedgerEntry(Variable 1013)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemLedgerEntry : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemLedgerEntry : "Item Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RepairStatus(Variable 1010)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RepairStatus : 5927;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RepairStatus : "Repair Status";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Cust(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Cust : 18;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Cust : Customer;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServHeader(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServHeader : 5900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServHeader : "Service Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServItemLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServItemLine : 5901;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServItemLine : "Service Item Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Res(Variable 1011)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Res : 156;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Res : Resource;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ResourceGroup(Variable 1015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ResourceGroup : 152;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ResourceGroup : "Resource Group";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UserMgt(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UserMgt : 5700;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserMgt : "User Setup Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AllocationStatus(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AllocationStatus :  ,Nonactive,Active,Finished,Canceled,Reallocation Needed;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AllocationStatus : " ",Nonactive,Active,Finished,Canceled,"Reallocation Needed";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempAllocationStatus(Variable 1018)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempAllocationStatus :  ,Nonactive,Active,Finished,Canceled,Reallocation Needed;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempAllocationStatus : " ",Nonactive,Active,Finished,Canceled,"Reallocation Needed";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

