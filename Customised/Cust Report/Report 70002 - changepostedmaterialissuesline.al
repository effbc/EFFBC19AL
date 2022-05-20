report 70002 changepostedmaterialissuesline
{
    DefaultLayout = RDLC;
    RDLCLayout = './changepostedmaterialissuesline.rdlc';

    dataset
    {
        dataitem("Posted Material Issues Header";"Posted Material Issues Header")
        {
            RequestFilterFields = "Prod. Order No.";
            column(Posted_Material_Issues_Header__Prod__Order_No__;"Prod. Order No.")
            {
            }
            column(Posted_Material_Issues_Header__Prod__Order_No__Caption;FIELDCAPTION("Prod. Order No."))
            {
            }
            column(Posted_Material_Issues_Header_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                /*"Posted Material Issues Line"."Receipt Date":=;
                "Posted Material Issues Line".MODIFY;
                 */

            end;

            trigger OnPreDataItem();
            begin
                 IF  "Posted Material Issues Header"."Prod. Order No."='' THEN
                  EXIT;
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
        requdate : Date;
        issueddatetime : DateTime;
}

