page 60081 "Bank Guarntee List"
{
    // version B2B1.0

    CardPageID = "Bank Guarntee";
    Editable = false;
    PageType = List;
    SourceTable = "Bank Guarantee";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("BG No."; "BG No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Issuing Bank"; "Issuing Bank")
                {
                }
                field(Extended; Extended)
                {
                }
                field("Customer Order No."; "Customer Order No.")
                {
                }
                field(Closed; Closed)
                {
                }
                field(Status; Status)
                {
                }
                field(Branch; Branch)
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Issued to/Received from"; "Issued to/Received from")
                {
                }
                field("Customer Name"; "Customer Name")
                {
                }
                field("Doc No."; "Doc No.")
                {
                }
                field("Date of Issue"; "Date of Issue")
                {
                }
                field("Expiry Date"; "Expiry Date")
                {
                }
                field("Claim Date"; "Claim Date")
                {
                }
                field("Type of BG"; "Type of BG")
                {
                }
                field("BG Value"; "BG Value")
                {
                }
                field("Tender No."; "Tender No.")
                {
                }
                field("Confirmed BY"; "Confirmed BY")
                {
                }
                field("Confirmed BY Name"; "Confirmed BY Name")
                {
                }
                field("Security Deposit No."; "Security Deposit No.")
                {
                }
                field("Final Railway Bill Date"; "Final Railway Bill Date")
                {
                }
                field("Warranty Period"; "Warranty Period")
                {
                }
                field("BG Warranty Completion Date"; "BG Warranty Completion Date")
                {
                }
                field(Remarks; Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }
}

