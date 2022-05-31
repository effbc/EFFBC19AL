page 60002 "TDS Certificate Card"
{
    // version B2B1.0,Rev01

    CardPageID = "TDS Certificate Details";
    PageType = Card;
    SourceTable = "TDS Certificate Details";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Document No."; "Document No.")
                {
                }
                field("Document Type"; "Document Type")
                {
                }
                field("Customer Acc.No."; "Customer Acc.No.")
                {
                }
                field("Invoice No."; "Invoice No.")
                {
                }
                field("TDS / Work Tax Amount"; "TDS / Work Tax Amount")
                {
                }
                field(Type; Type)
                {
                }
                field("TDS Certificate No."; "TDS Certificate No.")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Certificate Date"; "Certificate Date")
                {
                }
                field("Receipt Date"; "Receipt Date")
                {
                }
                field(Status; Status)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&TDS")
            {
                Caption = '&TDS';
                separator(Action1102152026)
                {
                }
                action(Release)
                {
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    var
                        TDSCertificate: Record "TDS Certificate Details";
                    begin
                        TESTFIELD("Document No.");
                        TESTFIELD("TDS Certificate No.");
                        TDSCertificate.SETRANGE("Document No.", "Document No.");
                        IF TDSCertificate.FINDFIRST THEN BEGIN
                            TDSCertificate.Status := TDSCertificate.Status::Released;
                            TDSCertificate.MODIFY;
                        END;
                        CurrPage.UPDATE;
                    end;
                }
            }
        }
    }
}

