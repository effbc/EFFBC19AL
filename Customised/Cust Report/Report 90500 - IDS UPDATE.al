report 90500 "IDS UPDATE"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Posted Inspect DatasheetHeader";"Posted Inspect DatasheetHeader")
        {

            trigger OnAfterGetRecord();
            begin
                IF "Posted Inspect DatasheetHeader".FIND('-') THEN
                  REPEAT
                    Item.GET("Posted Inspect DatasheetHeader"."Item No.");
                    "Posted Inspect DatasheetHeader".VALIDATE("Posted Inspect DatasheetHeader"."Item Category Code",Item."Item Category Code");
                    "Posted Inspect DatasheetHeader".VALIDATE("Posted Inspect DatasheetHeader"."Product Group Code",Item."Product Group Code");
                    "Posted Inspect DatasheetHeader".VALIDATE("Posted Inspect DatasheetHeader"."Item Sub Group Code",Item."Item Sub Group Code");
                    "Posted Inspect DatasheetHeader".VALIDATE("Posted Inspect DatasheetHeader"."Item Sub Sub Group Code",
                    Item."Item Sub Sub Group Code");
                    "Posted Inspect DatasheetHeader".VALIDATE("Posted Inspect DatasheetHeader"."No. of Soldering Points",
                    Item."No. of Soldering Points");
                    "Posted Inspect DatasheetHeader".VALIDATE("Posted Inspect DatasheetHeader"."No. of Pins",
                    Item."No. of Pins");
                    "Posted Inspect DatasheetHeader".VALIDATE("Posted Inspect DatasheetHeader"."No. of Opportunities",
                    Item."No. of Opportunities");
                    "Posted Inspect DatasheetHeader".VALIDATE("Posted Inspect DatasheetHeader"."No.of Fixing Holes",
                    Item."No.of Fixing Holes");
                    "Posted Inspect DatasheetHeader".MODIFY;
                  UNTIL "Posted Inspect DatasheetHeader".NEXT = 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Item : Record Item;
}

