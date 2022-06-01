report 60098 testmanu
{
    DefaultLayout = RDLC;
    RDLCLayout = './testmanu.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = WHERE(Product Group Code=FILTER(FPRODUCT));
            column(Manf_Cost_;"Manf.Cost")
            {
            }
            column(Routing_Line__Work_Center_No__Caption;"Routing Line".FIELDCAPTION("Work Center No."))
            {
            }
            column(Production_BOM_Line__QuantityCaption;"Production BOM Line".FIELDCAPTION(Quantity))
            {
            }
            column(Routing_Line__Routing_No__Caption;"Routing Line".FIELDCAPTION("Routing No."))
            {
            }
            column(Item_No_;"No.")
            {
            }
            column(Item_Production_BOM_No_;"Production BOM No.")
            {
            }
            dataitem("Production BOM Line";"Production BOM Line")
            {
                DataItemLink = Production BOM No.=FIELD(Production BOM No.);
                column(Production_BOM_Line_Production_BOM_No_;"Production BOM No.")
                {
                }
                column(Production_BOM_Line_Version_Code;"Version Code")
                {
                }
                column(Production_BOM_Line_Line_No_;"Line No.")
                {
                }
                column(Production_BOM_Line_No_;"No.")
                {
                }
                dataitem("Routing Line";"Routing Line")
                {
                    DataItemLink = Routing No.=FIELD(No.);
                    column(Routing_Line__Routing_No__;"Routing No.")
                    {
                    }
                    column(Production_BOM_Line__Quantity;"Production BOM Line".Quantity)
                    {
                    }
                    column(Routing_Line__Work_Center_No__;"Work Center No.")
                    {
                    }
                    column(Routing_Line_Version_Code;"Version Code")
                    {
                    }
                    column(Routing_Line_Operation_No_;"Operation No.")
                    {
                    }
                }
            }

            trigger OnPreDataItem();
            begin
                   work_center.SETFILTER(work_center."No.",'P1');
                   IF work_center.FIND('-') THEN
                   Hour_Cost[1] :=work_center."Unit Cost";
                   work_center.RESET;

                   work_center.SETFILTER(work_center."No.",'MPR');
                   IF work_center.FIND('-') THEN
                   Hour_Cost[2] :=work_center."Unit Cost";
                   work_center.RESET;

                   work_center.SETRANGE(work_center."No.",'QAS');
                   IF work_center.FIND('-') THEN
                   Hour_Cost[3] :=work_center."Unit Cost";
                   work_center.RESET;

                   work_center.SETRANGE(work_center."No.",'SHF');
                   IF work_center.FIND('-') THEN
                   Hour_Cost[4] :=work_center."Unit Cost";
                   work_center.RESET;

                   work_center.SETRANGE(work_center."No.",'MCH');
                   IF work_center.FIND('-') THEN
                   Hour_Cost[5] :=work_center."Unit Cost";
                   work_center.RESET;
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
        "Manf.Cost" : Decimal;
        work_center : Record "Work Center";
        Hour_Cost : array [5] of Decimal;
        Manf_Time : Decimal;
}

