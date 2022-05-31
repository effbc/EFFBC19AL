page 60120 "Tender - Design"
{
    // version B2B1.0,SH1.0,Rev01

    PageType = Document;
    SourceTable = "Tender Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field("Tender No."; "Tender No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(Rec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Tender Description"; "Tender Description")
                {
                }
                field("Customer No."; "Customer No.")
                {
                }
                field("Customer Name"; "Customer Name")
                {
                }
                field("Customer Tender No."; "Customer Tender No.")
                {
                }
                field("Tender Source"; "Tender Source")
                {
                }
                field("Tender Source Name"; "Tender Source Name")
                {
                }
                field("Tender Source Date"; "Tender Source Date")
                {
                }
                field("Tender Dated"; "Tender Dated")
                {
                }
                field("Tender Application No."; "Tender Application No.")
                {
                }
                field("Tender Document Cost"; "Tender Document Cost")
                {
                }
                field("Tender doc Issue From"; "Tender doc Issue From")
                {
                }
                field("Tender doc Issue To"; "Tender doc Issue To")
                {
                }
                field("Supporting Tender"; "Supporting Tender")
                {
                }
                field("Released to Sales User ID"; "Released to Sales User ID")
                {
                }
                field("Released to Sales Date"; "Released to Sales Date")
                {
                }
            }
            part(TenderLines; "Tender Subform - Design")
            {
                SubPageLink = Document No.=FIELD(Tender No.);
            }
            group(Customer)
            {
                Caption = 'Customer';
                Editable = false;
                field("<Customer Name2>"; "Customer Name")
                {
                }
                field("Customer Name 2"; "Customer Name 2")
                {
                }
                field("Customer Address"; "Customer Address")
                {
                }
                field("Customer Address 2"; "Customer Address 2")
                {
                }
                field(City; City)
                {
                }
                field("Post Code"; "Post Code")
                {
                }
                field(Country; Country)
                {
                }
                field("Country Code"; "Country Code")
                {
                }
                field(State; State)
                {
                }
                field("Phone No."; "Phone No.")
                {
                }
                field("Telex No."; "Telex No.")
                {
                }
                field("Fax No."; "Fax No.")
                {
                }
                field("E-Mail"; "E-Mail")
                {
                }
                field("Home Page"; "Home Page")
                {
                }
                field("Customer Contact"; "Customer Contact")
                {
                }
                field(Territory; Territory)
                {
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                }
            }
            group("Bid Details")
            {
                Caption = 'Bid Details';
                Editable = false;
                field("Tender Quote Value"; "Tender Quote Value")
                {
                }
                field("Minimum Bid Amount"; "Minimum Bid Amount")
                {
                }
                field("Submission Due Date"; "Submission Due Date")
                {
                }
                field("Submission Due Time"; "Submission Due Time")
                {
                }
                field("Tech. Bid Opening Date"; "Tech. Bid Opening Date")
                {
                }
                field("Tech. Bid Opening Time"; "Tech. Bid Opening Time")
                {
                }
                field("Commercial Bid Opening Date"; "Commercial Bid Opening Date")
                {
                }
                field("Commercial Bid Opening Time"; "Commercial Bid Opening Time")
                {
                }
                field("Tender Posting Group"; "Tender Posting Group")
                {
                }
                field("Not Participated"; "Not Participated")
                {
                }
                field("Tender Submitted Date"; "Tender Submitted Date")
                {
                }
                field("Tender Dispatch Details"; "Tender Dispatch Details")
                {
                }
            }
            group(EMD)
            {
                Caption = 'EMD';
                Editable = false;
                field("EMD Amount"; "EMD Amount")
                {
                }
                field("EMD Payment Date"; "EMD Payment Date")
                {
                }
                field("EMD Received Date"; "EMD Received Date")
                {
                }
                field("EMD Status"; "EMD Status")
                {
                }
                field("EMD Requested Date"; "EMD Requested Date")
                {
                }
                field("EMD Required Date"; "EMD Required Date")
                {
                }
                field("EMD DD No."; "EMD DD No.")
                {
                }
                field("EMD Paid Amount"; "EMD Paid Amount")
                {
                }
                field("EMD Received Amount"; "EMD Received Amount")
                {
                }
                field("EMD Adjusted Amount"; "EMD Adjusted Amount")
                {
                }
            }
            group("Security Deposit")
            {
                Caption = 'Security Deposit';
                Editable = false;
                field("Security Deposit Amount"; "Security Deposit Amount")
                {
                }
                field("Deposit Payment Due Date"; "Deposit Payment Due Date")
                {
                }
                field("Deposit Payment Date"; "Deposit Payment Date")
                {
                }
                field("Security Deposit Status"; "Security Deposit Status")
                {
                }
                field("SD Requested Date"; "SD Requested Date")
                {
                }
                field("SD Required Date"; "SD Required Date")
                {
                }
                field("SecurityDeposit Exp. Rcpt Date"; "SecurityDeposit Exp. Rcpt Date")
                {
                }
                field("SD Net Pay"; "SD Net Pay")
                {
                }
                field("Received Amount"; "Received Amount")
                {
                }
                field("Balance Receivable"; "Balance Receivable")
                {
                }
                field("Adjusted from EMD"; "Adjusted from EMD")
                {
                }
                field("Adjusted from Running Bills"; "Adjusted from Running Bills")
                {
                }
                field("SD Paid Amount"; "SD Paid Amount")
                {
                }
                field("SD Received Amount"; "SD Received Amount")
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';
                Editable = false;
                field(Status; Status)
                {
                }
                field("Standard/Customize"; "Standard/Customize")
                {
                }
                field("Doc. No. Occurrence"; "Doc. No. Occurrence")
                {
                }
                field("No. of Archived Versions"; "No. of Archived Versions")
                {
                }
                field("Product Type"; "Product Type")
                {
                }
                field("No. of Sales Order"; "No. of Sales Order")
                {
                }
                field("No. of Posted Sales Order"; "No. of Posted Sales Order")
                {
                }
                field("Document Position"; "Document Position")
                {
                }
                field("Tender Status"; "Tender Status")
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
                action("Design Worksheet")
                {
                    Caption = 'Design Worksheet';
                    Image = Worksheet;

                    trigger OnAction();
                    begin
                        CurrPage.TenderLines.PAGE.ShowSalesOrderWorkSheet2;
                        /*
                        CurrForm.SalesLines.FORM.ShowSalesOrderWorkSheet;
                        CurrForm.SalesLines.ACTIVATE;
                        */

                    end;
                }
            }
        }
        area(processing)
        {
            Caption = '<Action1900000004>';
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Release to Sales")
                {
                    Caption = 'Release to Sales';
                    Image = SalesTax;

                    trigger OnAction();
                    var
                        Text01: Label 'Do You want to Send the Document to Sale?';
                    begin
                        IF NOT CONFIRM(Text01, FALSE) THEN
                            EXIT;
                        newline := 10;
                        TESTFIELD("Document Position", "Document Position"::Finance);
                        "Document Position" := "Document Position"::Design;
                        "Released to Design User ID" := USERID;
                        "Released to Design Date" := TODAY;
                        Mail_Subject := 'ERP- Tender Released back to Sales';
                        Mail_Body := 'Tender No     :' + "Tender No.";
                        Mail_Body += FORMAT(newline);
                        Mail_Body += 'Customer Name : ' + "Customer Name";
                        Mail_Body += FORMAT(newline);
                        Mail_Body += FORMAT(newline);
                        Mail_Body += '***** Auto Mail Generated From ERP *****';
                        "Mail-Id".SETRANGE("Mail-Id"."User Security ID", USERID);
                        IF "Mail-Id".FINDFIRST THEN
                            "from Mail" := "Mail-Id".MailID;
                        "to mail" := 'sal@efftronics.net,cvmohan@efftronics.net,erp@efftronics.net';
                        MODIFY;
                        IF ("from Mail" <> '') AND ("to mail" <> '') THEN
                            mail.NewCDOMessage("from Mail", "to mail", Mail_Subject, Mail_Body, '');
                        MESSAGE(Text012);
                    end;
                }
            }
            action(Comment)
            {
                Caption = 'Comment';
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Tender Comments";
                RunPageLink = No.=FIELD(Tender No.);
                ToolTip = 'Comment';
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
        Text012 : Label 'Document has been converted to Sales';
        "Mail-Id" : Record User;
        "from Mail" : Text[100];
        "to mail" : Text[1000];
        Mail_Subject : Text[1000];
        Mail_Body : Text[1000];
        mail : Codeunit Mail;
        newline : Char;
}

