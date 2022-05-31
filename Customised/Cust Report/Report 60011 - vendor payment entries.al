report 60011 "vendor payment entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './vendor payment entries.rdlc';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            column(G_L_Entry__Document_No__; "Document No.")
            {
            }
            column(G_L_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(G_L_Entry_Amount; Amount)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo__Address_2_; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo_City; CompanyInfo.City)
            {
            }
            column(CompanyInfo__E_Mail_; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo__Home_Page_; CompanyInfo."Home Page")
            {
            }
            column(Our_Document_No_Caption; Our_Document_No_CaptionLbl)
            {
            }
            column(BPV__NoCaption; BPV__NoCaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(towards_payment_of_the_following_billsCaption; towards_payment_of_the_following_billsCaptionLbl)
            {
            }
            column(Amount_Rs_Caption; Amount_Rs_CaptionLbl)
            {
            }
            column(TURBO_JET_ENGINEERING___INDIA___PVT__LTD_Caption; TURBO_JET_ENGINEERING___INDIA___PVT__LTD_CaptionLbl)
            {
            }
            column(Bill_No____Dt_Caption; Bill_No____Dt_CaptionLbl)
            {
            }
            column(for_Rs__Caption; for_Rs__CaptionLbl)
            {
            }
            column(Sl____No_Caption; Sl____No_CaptionLbl)
            {
            }
            column(Ph__Caption; Ph__CaptionLbl)
            {
            }
            column(E___Mail__Caption; E___Mail__CaptionLbl)
            {
            }
            column(FAX__Caption; FAX__CaptionLbl)
            {
            }
            column(Visit_us_Caption; Visit_us_CaptionLbl)
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = Entry No.=FIELD(Entry No.);
                DataItemTableView = SORTING(Entry No.);
                column(Vendor_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                dataitem("<Vendor Ledger Entry2>"; "Vendor Ledger Entry")
                {
                    DataItemLink = Closed by Entry No.=FIELD(Entry No.);
                    DataItemTableView = SORTING(Entry No.);
                    column(Vendor_Ledger_Entry2__Amount; Amount)
                    {
                    }
                    column(Slno; Slno)
                    {
                    }
                    column(Vendor_Ledger_Entry2___External_Document_No__; "External Document No.")
                    {
                    }
                    column(Vendor_Ledger_Entry2___Document_No__; "Document No.")
                    {
                    }
                    column(Vendor_Ledger_Entry2__Entry_No_; "Entry No.")
                    {
                    }
                    column(Vendor_Ledger_Entry2__Closed_by_Entry_No_; "Closed by Entry No.")
                    {
                    }
                }
            }

            trigger OnPreDataItem();
            begin
                IF CompanyInfo.FIND('-') THEN
                    CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
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

    trigger OnInitReport();
    begin
        Ctr := 0;
        CompanyInfo.GET;
    end;

    var
        Ctr: Integer;
        CompanyInfo: Record "Company Information";
        Slno: Integer;
        Our_Document_No_CaptionLbl: Label 'Our Document No.';
        BPV__NoCaptionLbl: Label 'BPV. No';
        Date_CaptionLbl: Label '"Date "';
        towards_payment_of_the_following_billsCaptionLbl: Label 'towards payment of the following bills';
        Amount_Rs_CaptionLbl: Label 'Amount Rs.';
        TURBO_JET_ENGINEERING___INDIA___PVT__LTD_CaptionLbl: Label 'TURBO JET ENGINEERING ( INDIA ) PVT. LTD.';
        Bill_No____Dt_CaptionLbl: Label 'Bill No. / Dt.';
        for_Rs__CaptionLbl: Label '"for Rs. "';
        Sl____No_CaptionLbl: Label 'Sl.   No.';
        Ph__CaptionLbl: Label 'Ph :';
        E___Mail__CaptionLbl: Label 'E - Mail :';
        FAX__CaptionLbl: Label 'FAX :';
        Visit_us_CaptionLbl: Label 'Visit us:';
}

