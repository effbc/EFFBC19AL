page 56760 "Test Vendor List"
{
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Balance (LCY)";"Balance (LCY)")
                {

                    trigger OnDrillDown();
                    var
                        VendLedgEntry : Record "Vendor Ledger Entry";
                        DtldVendLedgEntry : Record "Detailed Vendor Ledg. Entry";
                    begin
                        DtldVendLedgEntry.SETRANGE("Vendor No.","No.");
                        COPYFILTER("Global Dimension 1 Filter",DtldVendLedgEntry."Initial Entry Global Dim. 1");
                        COPYFILTER("Global Dimension 2 Filter",DtldVendLedgEntry."Initial Entry Global Dim. 2");
                        COPYFILTER("Currency Filter",DtldVendLedgEntry."Currency Code");
                        VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
                    end;
                }
            }
            part(Control1102152007;"Vendor Details FactBox")
            {
                SubPageLink = No.=FIELD(No.),Currency Filter=FIELD(Currency Filter),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(Control1102152006;"Vendor Statistics FactBox")
            {
                SubPageLink = No.=FIELD(No.),Currency Filter=FIELD(Currency Filter),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(Control1102152005;"Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = No.=FIELD(No.),Currency Filter=FIELD(Currency Filter),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(Control1102152004;"Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = No.=FIELD(No.),Currency Filter=FIELD(Currency Filter),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

