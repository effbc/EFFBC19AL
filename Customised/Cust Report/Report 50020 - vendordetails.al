report 50020 vendordetails
{
    // version Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './vendordetails.rdlc';

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = SORTING(Entry No.) ORDER(Ascending) WHERE(Amount (LCY)=FILTER(>0));
            RequestFilterFields = "Posting Date";
            column(formataddress_ChangeCurrency__Amount__LCY___;formataddress.ChangeCurrency("Amount (LCY)"))
            {
            }
            column(vname;vname)
            {
            }
            column(Vendor_Ledger_Entry_Description;Description)
            {
            }
            column(formataddress_ChangeCurrency_totalpaymentsmade_;formataddress.ChangeCurrency(totalpaymentsmade))
            {
            }
            column(Total_Payment_DetailsCaption;Total_Payment_DetailsCaptionLbl)
            {
            }
            column(Vendor_NameCaption;Vendor_NameCaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(AmountCaption;AmountCaptionLbl)
            {
            }
            column(Total_PaymentsCaption;Total_PaymentsCaptionLbl)
            {
            }
            column(Vendor_Ledger_Entry_Entry_No_;"Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                "Vendor Ledger Entry".CALCFIELDS("Vendor Ledger Entry"."Amount (LCY)");
                totalpaymentsmade:=totalpaymentsmade+"Vendor Ledger Entry"."Amount (LCY)";
                vendor.SETRANGE(vendor."No.","Vendor Ledger Entry"."Vendor No.");
                IF vendor.FIND('-') THEN
                vname:=vendor.Name;
            end;

            trigger OnPreDataItem();
            begin
                totalpaymentsmade:=0;
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
        totalpaymentsmade : Decimal;
        vendor : Record Vendor;
        vname : Text[60];
        formataddress : Codeunit "Format Address";
        Total_Payment_DetailsCaptionLbl : Label 'Total Payment Details';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        DescriptionCaptionLbl : Label 'Description';
        AmountCaptionLbl : Label 'Amount';
        Total_PaymentsCaptionLbl : Label 'Total Payments';
}

