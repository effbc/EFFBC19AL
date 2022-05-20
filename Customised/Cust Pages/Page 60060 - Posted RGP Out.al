page 60060 "Posted RGP Out"
{
    // version B2B1.0,Cal1.0

    Editable = false;
    PageType = Document;
    SourceTable = "RGP Out Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("RGP Out No.";"RGP Out No.")
                {
                }
                field(Consignee;Consignee)
                {
                }
                field("Consignee No.";"Consignee No.")
                {
                }
                field("Consignee Name";"Consignee Name")
                {
                }
                field(Address;Address)
                {
                }
                field("Consignee City";"Consignee City")
                {
                }
                field("Consignee Contact";"Consignee Contact")
                {
                }
                field("FD Remarks";"FD Remarks")
                {
                }
                field("RGP Date";"RGP Date")
                {
                }
                field("RGP Posting Date";"RGP Posting Date")
                {
                }
                field(Status;Status)
                {
                    Editable = false;
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Telex No.";"Telex No.")
                {
                }
                field("Purchase Order No.";"Purchase Order No.")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Released By";"Released By")
                {
                }
            }
            part(Control1000000022;"RGP Out Lines")
            {
                SubPageLink = Document No.=FIELD(RGP Out No.);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("R&GP")
            {
                Caption = 'R&GP';
                action("RGP Ledger Entries")
                {
                    Caption = 'RGP Ledger Entries';

                    trigger OnAction();
                    begin
                        CLEAR(RGPLedgerEntryForm);
                        RGPLedgerEntry.SETRANGE("Document No.","RGP Out No.");
                        RGPLedgerEntry.SETRANGE("Document Type",RGPLedgerEntry."Document Type"::Out);
                        RGPLedgerEntryForm.SETTABLEVIEW(RGPLedgerEntry);
                        RGPLedgerEntryForm.RUNMODAL;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    RGPOutHead.SETRANGE(RGPOutHead."RGP Out No.","RGP Out No.");
                    REPORT.RUN(50053,TRUE,FALSE,RGPOutHead);
                    RGPOutHead.SETRANGE("RGP Out No.");
                end;
            }
        }
    }

    var
        RGPLedgerEntry : Record "RGP Ledger Entries";
        RGPOutHead : Record "RGP Out Header";
        RGPLedgerEntryForm : Page "RGP Type Ledger Entries";
}

