report 50046 "Sales Tax - EFF"
{
    // version EFF

    DefaultLayout = RDLC;
    RDLCLayout = './Sales Tax - EFF.rdlc';

    dataset
    {
        dataitem("Tax Entry"; "Tax Entry")
        {
            DataItemTableView = SORTING(Entry No.);
            RequestFilterFields = "Tax Group Code";
            column(Sales_Tax_Statement_for_the_Period_____FORMAT_FromDate________FORMAT_EndDate_; 'Sales Tax Statement for the Period ' + FORMAT(FromDate) + ' - ' + FORMAT(EndDate))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(percent_; percent)
            {
            }
            column(CustVendorNo; CustVendorNo)
            {
            }
            column(CustVendorName; CustVendorName)
            {
            }
            column(SlNo; SlNo)
            {
            }
            column(SalesInvoiceHeader__Sell_to_Customer_No___PurchaseInvoiceHeader__Buy_from_Vendor_No__; SalesInvoiceHeader."Sell-to Customer No." + PurchaseInvoiceHeader."Buy-from Vendor No.")
            {
            }
            column(Customer_Name_Vendor_Name; Customer.Name + Vendor.Name)
            {
            }
            column(SalesInvoiceHeader__External_Document_No__; SalesInvoiceHeader."External Document No.")
            {
            }
            column(Tax_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(ABS_Base_; ABS(Base))
            {
            }
            column(ABS_Amount_; ABS(Amount))
            {
            }
            column(ABS_Base_Amount_; ABS(Base + Amount))
            {
            }
            column(ABS_Base__Control1000000024; ABS(Base))
            {
            }
            column(ABS_Amount__Control1000000025; ABS(Amount))
            {
            }
            column(ABS_Base_Amount__Control1000000026; ABS(Base + Amount))
            {
            }
            column(ABS_Base__Control1000000021; ABS(Base))
            {
            }
            column(ABS_Amount__Control1000000022; ABS(Amount))
            {
            }
            column(ABS_Base_Amount__Control1000000023; ABS(Base + Amount))
            {
            }
            column(Sl_No_Caption; Sl_No_CaptionLbl)
            {
            }
            column(Invoice_No_Caption; Invoice_No_CaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Gross_AmtCaption; Gross_AmtCaptionLbl)
            {
            }
            column(Tax_AmtCaption; Tax_AmtCaptionLbl)
            {
            }
            column(Net_AmtCaption; Net_AmtCaptionLbl)
            {
            }
            column(Page_TotalCaption; Page_TotalCaptionLbl)
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }
            column(Tax_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF SalesInvoiceHeader.GET("Document No.") THEN
                    IF Customer.GET(SalesInvoiceHeader."Sell-to Customer No.") THEN;
                IF PurchaseInvoiceHeader.GET("Document No.") THEN
                    IF Vendor.GET(PurchaseInvoiceHeader."Buy-from Vendor No.") THEN;
                IF "Tax Entry".Base = 0 THEN
                    CurrReport.SKIP;
            end;

            trigger OnPreDataItem();
            begin
                IF SelectType = 0 THEN BEGIN
                    SETRANGE(Type, Type::Sale);
                    CustVendorNo := 'Customer No.';
                    CustVendorName := 'Customer Name';
                END ELSE BEGIN
                    SETRANGE(Type, Type::Purchase);
                    CustVendorNo := 'Vendor No.';
                    CustVendorName := 'Vendor Name';
                END;
                SETRANGE("Posting Date", FromDate, EndDate);
                IF CForm THEN
                    SETRANGE("Form Code", 'C')
                ELSE
                    SETFILTER("Form Code", '<>%1', 'C');
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

    trigger OnPreReport();
    begin
        percent := "Tax Entry".GETFILTER("Tax Entry"."Tax Group Code");
    end;

    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SlNo: Integer;
        Customer: Record Customer;
        FromDate: Date;
        EndDate: Date;
        SelectType: Option Sales,Purchases;
        PurchaseInvoiceHeader: Record "Purch. Inv. Header";
        Vendor: Record Vendor;
        CustVendorNo: Text[30];
        CustVendorName: Text[50];
        CForm: Boolean;
        CompanyInfo: Record "Company Information";
        Total: Decimal;
        percent: Code[20];
        Sl_No_CaptionLbl: Label 'Sl No.';
        Invoice_No_CaptionLbl: Label 'Invoice No.';
        DateCaptionLbl: Label 'Date';
        Gross_AmtCaptionLbl: Label 'Gross Amt';
        Tax_AmtCaptionLbl: Label 'Tax Amt';
        Net_AmtCaptionLbl: Label 'Net Amt';
        Page_TotalCaptionLbl: Label 'Page Total';
        Grand_TotalCaptionLbl: Label 'Grand Total';
}

