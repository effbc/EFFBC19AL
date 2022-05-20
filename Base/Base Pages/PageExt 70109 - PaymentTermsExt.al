pageextension 70109 PaymentTermsExt extends "Payment Terms"
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


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 15". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 15". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 2")
        {
            field("Stage 1"; "Stage 1")
            {
            }
            field("Percentage 1"; "Percentage 1")
            {

                trigger OnValidate();
                begin
                    "Percentage 2" := 0;
                    "Percentage 3" := 0;
                    "Percentage 2" := 100 - "Percentage 1";         //old
                    "Percentage 3" := 100 - ("Percentage 1" + "Percentage 2");
                    IF "Percentage 1" + "Percentage 2" + "Percentage 3" > 100 THEN BEGIN
                        "Percentage 2" := xRec."Percentage 2";
                        "Percentage 3" := xRec."Percentage 3";
                        ERROR('Total Sum of Percentage 1,Percentage 2,Percentage 3 should not be greater than 100!');
                    END;
                end;
            }
            field("Stage 2"; "Stage 2")
            {
            }
            field("Percentage 2"; "Percentage 2")
            {

                trigger OnValidate();
                begin
                    //"Percentage 1":=100-"Percentage 2"; //commented by Pranavi
                    //Added By Pranavi
                    "Percentage 3" := 0;
                    IF "Percentage 1" + "Percentage 2" + "Percentage 3" > 100 THEN BEGIN
                        "Percentage 3" := xRec."Percentage 3";
                        ERROR('Total Sum of Percentage 1,Percentage 2,Percentage 3 should not be greater than 100!');
                    END;
                    "Percentage 3" := 100 - ("Percentage 1" + "Percentage 2");
                    //End By Pranavi
                end;
            }
            field("Stage 3"; "Stage 3")
            {
            }
            field("Percentage 3"; "Percentage 3")
            {

                trigger OnValidate();
                begin
                    //Added By Pranavi
                    IF "Percentage 1" + "Percentage 2" + "Percentage 3" > 100 THEN
                        ERROR('Total Sum of Percentage 1,Percentage 2,Percentage 3 should not be greater than 100!');
                    "Percentage 2" := 100 - ("Percentage 1" + "Percentage 3");
                    //End By Pranavi
                end;
            }
        }
        addafter("Control 10")
        {
            field("Update In Cashflow"; "Update In Cashflow")
            {
            }
            field(Sales; Sales)
            {
            }
            field(Purchase; Purchase)
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 19")
        {

            //Unsupported feature: Change RunObject on "Action 19". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 19". Please convert manually.

        }
    }

    var
        "Purchase Header": Record "Purchase Header";


    //Unsupported feature: CodeInsertion on "OnModifyRecord". Please convert manually.

    //trigger OnModifyRecord() : Boolean;
    //begin
    /*
    //Added By Pranavi

    IF ("Percentage 1" <> 0) AND (FORMAT("Stage 1") = ' ') THEN
      ERROR('Enter Stage1!');
    IF ("Percentage 2" <> 0) AND (FORMAT("Stage 2") = ' ') THEN
      ERROR('Enter Stage2!');
    IF ("Percentage 3" <> 0) AND (FORMAT("Stage 3") = ' ') THEN
      ERROR('Enter Stage3!');
    IF ("Percentage 1" = 0) AND (FORMAT("Stage 1") <> ' ') THEN
      ERROR('Enter Percentage1!');
    IF ("Percentage 2" = 0) AND (FORMAT("Stage 2") <> ' ') THEN
      ERROR('Enter Percentage2!');
    IF ("Percentage 3" = 0) AND (FORMAT("Stage 3") <> ' ') THEN
      ERROR('Enter Percentage3!');

    IF ("Stage 1"="Stage 1"::Credit) OR ("Stage 2"="Stage 2"::Credit) OR ("Stage 3"="Stage 3"::Credit) THEN
    BEGIN
      IF FORMAT("Due Date Calculation")='' THEN
        ERROR('PLEASE ENTER THE CREDIT PERIOD');
    END;

    //End By Pranavi
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

