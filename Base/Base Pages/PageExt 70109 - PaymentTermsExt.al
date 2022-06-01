pageextension 70109 PaymentTermsExt extends "Payment Terms"
{
    layout
    {
        addafter(Code)
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
        addafter(Description)
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

        modify("T&ranslation")
        {
            Promoted = true;
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
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

        IF ("Stage 1" = "Stage 1"::Credit) OR ("Stage 2" = "Stage 2"::Credit) OR ("Stage 3" = "Stage 3"::Credit) THEN BEGIN
            IF FORMAT("Due Date Calculation") = '' THEN
                ERROR('PLEASE ENTER THE CREDIT PERIOD');
        END;

        //End By Pranavi
    end;

    var
        "Purchase Header": Record "Purchase Header";




}

