page 60091 "Archived Tender"
{
    // version B2B1.0,SH1.0,Rev01

    Editable = false;
    PageType = Document;
    SourceTable = "Tender Header Archive";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Tender No.";"Tender No.")
                {
                }
                field("Tender Description";"Tender Description")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Customer Name";"Customer Name")
                {
                }
                field("Customer Tender No.";"Customer Tender No.")
                {
                }
                field("Tender Source";"Tender Source")
                {
                }
                field("Tender Source Name";"Tender Source Name")
                {
                }
                field("Tender Source Date";"Tender Source Date")
                {
                }
                field("Tender Dated";"Tender Dated")
                {
                }
                field("Tender Application No.";"Tender Application No.")
                {
                }
                field("Tender Application Amount";"Tender Application Amount")
                {
                }
                field("Tender doc Issue From";"Tender doc Issue From")
                {
                }
                field("Tender doc Issue To";"Tender doc Issue To")
                {
                }
                field("Supporting Tender";"Supporting Tender")
                {
                }
                field("Tender Position";"Tender Position")
                {
                }
            }
            part(TenderLines;"Archived Tender Subform")
            {
                SubPageLink = Document No.=FIELD(Tender No.);
            }
            group(Customer)
            {
                Caption = 'Customer';
                field("<Customer Name2>";"Customer Name")
                {
                }
                field("Customer Name 2";"Customer Name 2")
                {
                }
                field("Customer Address";"Customer Address")
                {
                }
                field("Customer Address 2";"Customer Address 2")
                {
                }
                field(City;City)
                {
                }
                field("Post Code";"Post Code")
                {
                }
                field(Country;Country)
                {
                }
                field("Country Code";"Country Code")
                {
                }
                field(State;State)
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Telex No.";"Telex No.")
                {
                }
                field("Fax No.";"Fax No.")
                {
                }
                field("E-Mail";"E-Mail")
                {
                }
                field("Home Page";"Home Page")
                {
                }
                field("Customer Contact";"Customer Contact")
                {
                }
                field(Territory;Territory)
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
            }
            group("Bid Details")
            {
                Caption = 'Bid Details';
                field("Tender Quote Value";"Tender Quote Value")
                {
                }
                field("Minimum Bid Amount";"Minimum Bid Amount")
                {
                }
                field("Submission Due Date";"Submission Due Date")
                {
                }
                field("Submission Due Time";"Submission Due Time")
                {
                }
                field("Tech. Bid Opening Date";"Tech. Bid Opening Date")
                {
                }
                field("Tech. Bid Opening Time";"Tech. Bid Opening Time")
                {
                }
                field("Tender Status";"Tender Status")
                {
                }
                field("Tender Posting Group";"Tender Posting Group")
                {
                }
                field("Not Participated";"Not Participated")
                {
                }
                field("Tender Submitted Date";"Tender Submitted Date")
                {
                }
                field("Tender Dispatch Details";"Tender Dispatch Details")
                {
                }
                field("Document Position";"Document Position")
                {
                }
            }
            group(EMD)
            {
                Caption = 'EMD';
                field("EMD Amount";"EMD Amount")
                {
                }
                field("EMD Payment Date";"EMD Payment Date")
                {
                }
                field("EMD Received Date";"EMD Received Date")
                {
                }
                field("EMD Status";"EMD Status")
                {
                }
                field("EMD Requested Date";"EMD Requested Date")
                {
                }
                field("EMD Required Date";"EMD Required Date")
                {
                }
                field("EMD DD No.";"EMD DD No.")
                {
                }
                field("EMD Paid Amount";"EMD Paid Amount")
                {
                }
                field("EMD Received Amount";"EMD Received Amount")
                {
                }
                field("EMD Adjusted Amount";"EMD Adjusted Amount")
                {
                }
            }
            group("Security Deposit")
            {
                Caption = 'Security Deposit';
                field("Security Deposit Amount";"Security Deposit Amount")
                {
                }
                field("Deposit Payment Due Date";"Deposit Payment Due Date")
                {
                }
                field("Deposit Payment Date";"Deposit Payment Date")
                {
                }
                field("Security Deposit Status";"Security Deposit Status")
                {
                }
                field("SD Requested Date";"SD Requested Date")
                {
                }
                field("SD Required Date";"SD Required Date")
                {
                }
                field("SecurityDeposit Exp. Rcpt Date";"SecurityDeposit Exp. Rcpt Date")
                {
                }
                field("SD Net Pay";"SD Net Pay")
                {
                }
                field("Received Amount";"Received Amount")
                {
                }
                field("Balance Receivable";"Balance Receivable")
                {
                }
                field("Adjusted from EMD";"Adjusted from EMD")
                {
                }
                field("Adjusted from Running Bills";"Adjusted from Running Bills")
                {
                }
                field("SD Paid Amount";"SD Paid Amount")
                {
                }
                field("SD Received Amount";"SD Received Amount")
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field(Status;Status)
                {
                }
                field("Standard/Customize";"Standard/Customize")
                {
                }
                field("Doc. No. Occurrence";"Doc. No. Occurrence")
                {
                }
                field("Version No.";"Version No.")
                {
                }
                field("No. of Archived Versions";"No. of Archived Versions")
                {
                }
                field("Product Type";"Product Type")
                {
                }
                field("No. of Sales Order";"No. of Sales Order")
                {
                }
                field("No. of Posted Sales Order";"No. of Posted Sales Order")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("&List")
                {
                    Caption = '&List';
                    Image = List;
                    RunObject = Page "Archived Tender list";
                    ShortCutKey = 'F5';
                }
                separator(Action1102152026)
                {
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;
                    RunObject = Page "ESPL Attachments Archive";
                    RunPageLink = Document No.=FIELD(Tender No.);
                }
            }
        }
    }

    var
        NoSeriesMgt : Codeunit NoSeriesManagement;
        SRSetup : Record "Sales & Receivables Setup";
        Tender : Codeunit "Specification-Copy";
        DesignWorksheetHeader : Record "Design Worksheet Header";
        DesignWorksheetLine : Record "Design Worksheet Line";
        DesignWorksheetTender : Record "Design Worksheet Header";
        DesignWorksheetLineTender : Record "Design Worksheet Line";
        TenderPostingLines : Record "Tender Posting Lines";
}

