report 50208 "dsir itmes modification"
{
    DefaultLayout = RDLC;
    RDLCLayout = './dsir itmes modification.rdlc';

    dataset
    {
        dataitem("Posted Material Issues Header";"Posted Material Issues Header")
        {
            RequestFilterFields = "Material Issue No.";
            column(Posted_Material_Issues_Header_No_;"No.")
            {
            }
            dataitem("Posted Material Issues Line";"Posted Material Issues Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = WHERE(Quantity=FILTER(>0));
                column(Posted_Material_Issues_Line_Document_No_;"Document No.")
                {
                }
                column(Posted_Material_Issues_Line_Line_No_;"Line No.")
                {
                }
                column(Posted_Material_Issues_Line_Item_No_;"Item No.")
                {
                }
                column(Posted_Material_Issues_Line_Material_Issue_No_;"Material Issue No.")
                {
                }
                dataitem("Item Ledger Entry";"Item Ledger Entry")
                {
                    DataItemLink = Document No.=FIELD(Document No.),Item No.=FIELD(Item No.),Order No.=FIELD(Material Issue No.);
                    DataItemTableView = SORTING(Document No.,Posting Date) WHERE(Entry Type=FILTER(Transfer));
                    column(Item_Ledger_Entry__Item_No__;"Item No.")
                    {
                    }
                    column(Item_Ledger_Entry__Document_No__;"Document No.")
                    {
                    }
                    column(Item_Ledger_Entry__ITL_Doc_No__;"ITL Doc No.")
                    {
                    }
                    column(Item_Ledger_Entry_Entry_No_;"Entry No.")
                    {
                    }
                    column(Item_Ledger_Entry_Order_No_;"Order No.")
                    {
                    }
                }
            }
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
        productionorderno : Code[20];
}

