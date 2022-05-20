report 60005 "Indent To Quote"
{
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("Indent Consolidation";"Indent Consolidation")
        {
            DataItemTableView = SORTING(ICN No.,Vendor No.,Item No.);
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
        PurchaseHeader : Record "Purchase Header";
        PurchaseLine : Record "Purchase Line";
        PPSetup : Record "Purchases & Payables Setup";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        IndentConsolidation : Record Products;
}

