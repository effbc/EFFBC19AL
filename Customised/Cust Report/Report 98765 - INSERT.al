report 98765 INSERT
{
    DefaultLayout = RDLC;
    RDLCLayout = './INSERT.rdlc';

    dataset
    {
        dataitem(Item;Item)
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                UPGItem.INIT;
                UPGItem."No.":=Item."No.";
                UPGItem.INSERT;
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

    trigger OnPostReport();
    begin
        MESSAGE('Complete');
    end;

    var
        UPGItem : Record Table104067;
}

