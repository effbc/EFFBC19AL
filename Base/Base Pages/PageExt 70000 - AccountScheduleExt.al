pageextension 70000 AccountScheduleExt extends "Account Schedule"
{
    layout
    {

        /*  modify(Control1)
         {
             ShowCaption = false;
         } */
        addafter("Totaling Type")


        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


            //Unsupported feature: Change Lookup on "Control 18". Please convert manually.


            //Unsupported feature: Change Name on "Control 18". Please convert manually.


            //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.

        modify("Control1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.


            //Unsupported feature: Change Editable on "Control 1". Please convert manually.

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


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 35". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 35". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 43". Please convert manually.


        //Unsupported feature: Change Name on "Control 45". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 45". Please convert manually.


        //Unsupported feature: Change Name on "Control 47". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 47". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 9". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 9". Please convert manually.


        //Unsupported feature: Change Name on "Control 31". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 31". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 6")
>>>>>>> faaa23fc9c142af0d0c1f6ec12bbefdca359d3ad
        {
            field("Dimension 1 Filter"; "Dimension 1 Filter")
            {
            }
            field("Dimension 2 Filter"; "Dimension 2 Filter")
            {
            }
            field("Dimension 3 Filter"; "Dimension 3 Filter")
            {
            }
        }
    }
    actions
    {
        modify(Overview)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Print)
        {
            Promoted = true;
        }
    }
}

