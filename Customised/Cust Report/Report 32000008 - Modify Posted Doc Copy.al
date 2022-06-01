report 32000008 "Modify Posted Doc Copy"
{
    Permissions = TableData "G/L Entry" = rm,
                  TableData "Vendor Ledger Entry" = rm,
                  TableData "Purch. Inv. Header" = rm,
                  TableData "Detailed Vendor Ledg. Entry" = rm,
                  TableData "Value Entry" = rm,
                  TableData "GST Ledger Entry" = rm,
                  TableData "Detailed GST Ledger Entry" = rm;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            MaxIteration = 1;

            trigger OnPreDataItem();
            begin
                IF DocNo <> '' THEN BEGIN
                    /* GLEntry.RESET;
                     GLEntry.SETRANGE("Document No.",DocNo);
                     IF GLEntry.FINDSET THEN
                       REPEAT
                         GLEntry."Posting Date" := ModifyDate;
                         GLEntry.MODIFY;
                       UNTIL GLEntry.NEXT = 0;

                     VendorLedgerEntry.RESET;
                     VendorLedgerEntry.SETRANGE("Document No.",DocNo);
                     IF VendorLedgerEntry.FINDSET THEN
                       REPEAT
                         VendorLedgerEntry."Posting Date" := ModifyDate;
                         VendorLedgerEntry.MODIFY;
                       UNTIL VendorLedgerEntry.NEXT = 0;

                     DetailedVendorLedgEntry.RESET;
                     DetailedVendorLedgEntry.SETRANGE("Document No.",DocNo);
                     IF DetailedVendorLedgEntry.FINDSET THEN
                       REPEAT
                         DetailedVendorLedgEntry."Posting Date" := ModifyDate;
                         DetailedVendorLedgEntry.MODIFY;
                       UNTIL DetailedVendorLedgEntry.NEXT = 0;

                     ValueEntry.RESET;
                     ValueEntry.SETRANGE("Document No.",DocNo);
                     IF ValueEntry.FINDSET THEN
                       REPEAT
                       ValueEntry."Posting Date" := ModifyDate;
                       ValueEntry.MODIFY;
                       UNTIL ValueEntry.NEXT = 0;

                     GSTLedgerEntry.RESET;
                     GSTLedgerEntry.SETRANGE("Document No.",DocNo);
                     IF GSTLedgerEntry.FINDSET THEN
                       REPEAT
                         GSTLedgerEntry."Posting Date" := ModifyDate;
                         GSTLedgerEntry.MODIFY;
                       UNTIL GSTLedgerEntry.NEXT = 0;

                     DetailedGSTLedgerEntry.RESET;
                     DetailedGSTLedgerEntry.SETRANGE("Document No.",DocNo);
                     IF DetailedGSTLedgerEntry.FINDSET THEN
                       REPEAT
                         DetailedGSTLedgerEntry."Posting Date" := ModifyDate;
                         DetailedGSTLedgerEntry.MODIFY;
                       UNTIL DetailedGSTLedgerEntry.NEXT= 0;
                   */
                    PurchInvHeader.RESET;
                    PurchInvHeader.SETRANGE("No.", DocNo);
                    IF PurchInvHeader.FINDFIRST THEN BEGIN
                        PurchInvHeader."Posting Date" := ModifyDate;
                        PurchInvHeader.MODIFY;
                    END;
                END;
                MESSAGE('record modify for Document %1', DocNo);

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Document No"; DocNo)
                {
                }
                field(ModifyDate; ModifyDate)
                {
                    Caption = 'Modify Date';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        GLEntry: Record "G/L Entry";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        ValueEntry: Record "Value Entry";
        GSTLedgerEntry: Record "GST Ledger Entry";
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        PurchInvHeader: Record "Purch. Inv. Header";
        DocNo: Code[30];
        ModifyDate: Date;
}

