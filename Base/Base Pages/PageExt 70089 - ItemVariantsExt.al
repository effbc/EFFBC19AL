pageextension 70089 ItemVariantsExt extends "Item Variants"
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

        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 13". Please convert manually.


        //Unsupported feature: Change SourceExpr on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change SourceExpr on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change SourceExpr on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 2")
        {
            field("Operating Temperature"; "Operating Temperature")
            {
            }
            field("Storage Temperature"; "Storage Temperature")
            {
            }
        }
        addafter("Control 4")
        {
            field(Package; Package)
            {
            }
            field(Priority; Priority)
            {
            }
        }
        addafter("Control 6")
        {
            field("Item Status"; "Item Status")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 11". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 12". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 12". Please convert manually.


        //Unsupported feature: Change Name on "Action 12". Please convert manually.

    }

    var
        SMTP_MAIL: Codeunit "SMTP Mail";


    //Unsupported feature: CodeInsertion on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //begin
    /*

    {
    IF UPPERCASE(USERID) IN ['EFFTRONICS\PARVATHI','EFFTRONICS\VIJAYA','SUPER','EFFTRONICS\ANUSHAG','EFFTRONICS\RAMALAKSHMI','EFFTRONICS\KARUNA','EFFTRONICS\NAGAGAYATRI','EFFTRONICS\SUPRIYA']  THEN
      CurrPage.EDITABLE:= TRUE
    ELSE
      CurrPage.EDITABLE:= FALSE;
    }

    //added by Vishnu Priya on 10-08-2019
      IF NOT (SMTP_MAIL.Permission_Checking(USERID,'ITEM-VARIENT-RIGHTS'))
        THEN
         CurrPage.EDITABLE:= FALSE
         ELSE
         CurrPage.EDITABLE:= TRUE;
    //end by Vishnu Priya on 10-08-2019
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

