report 70001 "Delete Application Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Delete Application Entries.rdlc';

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord();
            begin
                DetVendLedgEntry.RESET;
                DetVendLedgEntry.SETRANGE("Vendor No.",Vendor."No.");
                DetVendLedgEntry.SETRANGE("Entry Type",DetVendLedgEntry."Entry Type"::Application);
                //MESSAGE('%1',DetVendLedgEntry.COUNT);
                DetVendLedgEntry.DELETEALL;


                VendorLedgEntry.RESET;
                VendorLedgEntry.SETRANGE("Vendor No.",Vendor."No.");
                IF VendorLedgEntry.FINDSET THEN
                  REPEAT
                    VendorLedgEntry."Closed by Entry No." := 0;
                    VendorLedgEntry."Closed at Date" := 0D;
                    VendorLedgEntry."Closed by Amount" := 0;
                    VendorLedgEntry."Closed by Amount (LCY)" :=0;
                    VendorLedgEntry."Closed by Currency Amount":=0;
                    VendorLedgEntry."Applies-to ID":='';
                    VendorLedgEntry."Applying Entry" := FALSE;
                    VendorLedgEntry.Open := TRUE;
                    VendorLedgEntry.MODIFY;
                  UNTIL VendorLedgEntry.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                IF Type = Type::Customer THEN
                  CurrReport.BREAK;
            end;
        }
        dataitem(Customer;Customer)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord();
            begin
                DetCustLedgEntry.RESET;
                DetCustLedgEntry.SETRANGE("Customer No.",Customer."No.");
                DetCustLedgEntry.SETRANGE("Entry Type",DetCustLedgEntry."Entry Type"::Application);
                DetCustLedgEntry.DELETEALL;

                CustLedgEntry.RESET;
                CustLedgEntry.SETRANGE("Customer No.",Customer."No.");
                IF CustLedgEntry.FINDSET THEN
                  REPEAT
                    CustLedgEntry."Closed by Entry No." := 0;
                    CustLedgEntry."Closed at Date" := 0D;
                    CustLedgEntry."Closed by Amount" := 0;
                    CustLedgEntry."Applying Entry" := FALSE;
                    CustLedgEntry.Open := TRUE;
                    CustLedgEntry.MODIFY;
                  UNTIL CustLedgEntry.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                IF Type = Type::Vendor THEN
                  CurrReport.BREAK;
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
        MESSAGE('Completed.');
    end;

    var
        VendorLedgEntry : Record "Vendor Ledger Entry";
        DetVendLedgEntry : Record "Detailed Vendor Ledg. Entry";
        Type : Option Vendor,Customer;
        CustLedgEntry : Record "Cust. Ledger Entry";
        DetCustLedgEntry : Record "Detailed Cust. Ledg. Entry";
}

