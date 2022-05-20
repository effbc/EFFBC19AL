report 80027 "Item Wise Requirement3"
{
    // version NAVIN3.70

    DefaultLayout = RDLC;
    RDLCLayout = './Item Wise Requirement3.rdlc';

    dataset
    {
        dataitem("Prod. Order Component";"Prod. Order Component")
        {
            CalcFields = Qty. in Posted Material Issues;
            DataItemTableView = SORTING(Production Plan Date,Item No.,Prod. Order No.) ORDER(Ascending) WHERE(Production Plan Date=FILTER(>05/26/09));
            RequestFilterFields = "Item No.";
            column(Prod__Order_Component___Expected_Quantity___Qty__in_Posted_Material_Issues_;"Prod. Order Component"."Expected Quantity"-"Qty. in Posted Material Issues")
            {
            }
            column(Prod__Order_Component__Qty__in_Posted_Material_Issues_;"Qty. in Posted Material Issues")
            {
            }
            column(Prod__Order_Component__Prod__Order_Component___Expected_Quantity_;"Prod. Order Component"."Expected Quantity")
            {
            }
            column(Prod__Order_Component_Status;Status)
            {
            }
            column(Prod__Order_Component_Prod__Order_No_;"Prod. Order No.")
            {
            }
            column(Prod__Order_Component_Prod__Order_Line_No_;"Prod. Order Line No.")
            {
            }
            column(Prod__Order_Component_Line_No_;"Line No.")
            {
            }
            column(Prod__Order_Component_Item_No_;"Item No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF NOT( ("Prod. Order Component"."Expected Quantity"-"Prod. Order Component"."Qty. in Posted Material Issues")>0 )THEN
                   CurrReport.SKIP;
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
        LastFieldNo : Integer;
        FooterPrinted : Boolean;
}

